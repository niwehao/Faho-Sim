#include "simulator/dram/row_buffer.h"

namespace upmem_sim::simulator::dram {

RowBuffer::RowBuffer(util::ArgumentParser *argument_parser)
    : mram_(nullptr),
      row_address_(nullptr),
      input_q_(new basic::Queue<MemoryCommand>(1)),
      ready_q_(new basic::Queue<MemoryCommand>(-1)),
      stat_factory_(new util::StatFactory("row_buffer")) {
  timing_parameters_["t_ras"] =
      static_cast<int>(argument_parser->get_int_parameter("t_ras"));//行激活时间
  timing_parameters_["t_rcd"] =
      static_cast<int>(argument_parser->get_int_parameter("t_rcd"));//行到列延迟
  timing_parameters_["t_cl"] =
      static_cast<int>(argument_parser->get_int_parameter("t_cl"));//列读取时间
  timing_parameters_["t_bl"] =
      static_cast<int>(argument_parser->get_int_parameter("t_bl"));//突发长度
  timing_parameters_["t_rp"] =
      static_cast<int>(argument_parser->get_int_parameter("t_rp"));//预充电时间

  assert(timing_parameters_["t_ras"] > 0);
  assert(timing_parameters_["t_rcd"] > 0);
  assert(timing_parameters_["t_cl"] > 0);
  assert(timing_parameters_["t_bl"] > 0);
  assert(timing_parameters_["t_rp"] > 0);

  wordline_size_ = argument_parser->get_int_parameter("wordline_size");

  assert(wordline_size_ > 0);

  activation_q_ =
      new basic::TimerQueue<MemoryCommand>(1, timing_parameters_["t_ras"]);
  io_q_ = new basic::TimerQueue<MemoryCommand>(1, timing_parameters_["t_cl"]);
  bus_q_ = new basic::TimerQueue<MemoryCommand>(1, timing_parameters_["t_bl"]);
  precharge_q_ =
      new basic::TimerQueue<MemoryCommand>(1, timing_parameters_["t_rp"]);
}

RowBuffer::~RowBuffer() {
  delete row_address_;
  /**
   * 假设内存中：
行0: 1 2 3 4
行1: 5 6 7 8
行2: 9 A B C

当需要读取行1时：
1. 激活行1
2. 将 5 6 7 8 复制到行缓冲区
3. 从行缓冲区读取数据
4. 如果数据被修改，最后要写回MRAM
   */
  delete input_q_;
  delete ready_q_;
  delete activation_q_;
  delete io_q_;
  delete bus_q_;
  delete precharge_q_;

  delete stat_factory_;
}

util::StatFactory *RowBuffer::stat_factory() {
  auto stat_factory = new util::StatFactory("");

  stat_factory->merge(stat_factory_);

  return stat_factory;
}

void RowBuffer::connect_mram(MRAM *mram) {
  assert(mram != nullptr);
  assert(mram_ == nullptr);

  mram_ = mram;
}

void RowBuffer::push(MemoryCommand *memory_command) {
  assert(memory_command != nullptr);
  assert(can_push());
  input_q_->push(memory_command);
}

MemoryCommand *RowBuffer::pop() {
  assert(can_pop());
  return ready_q_->pop();
}

void RowBuffer::flush() {
  if (row_address_ != nullptr) {
    write_to_mram();
    delete row_address_;
    row_address_ = nullptr;
  }
}

void RowBuffer::cycle() {
  //1.处理各种队列
  service_input_q(); //服务输入队列
  /**
   * // 接收所有新的内存操作请求
- 读取命令
- 写入命令
- 行激活命令
- 预充电命令
   */
  service_activation_q();//服务行激活队列
  /**
   * // 处理DRAM行激活操作
- 将数据从MRAM读入行缓冲区
- 等待t_ras时间（行激活所需时间）
- 确保行被正确激活后才能访问
   *
   */
  service_io_q();//服务I/O队列
  /**
  // 处理实际的读写操作
- 等待t_cl时间（列访问延迟）
- 准备读取数据
- 准备写入数据
   */
  service_bus_q();//服务总线队列
  /*
  // 处理数据传输
- 等待t_bl时间（突发传输时间）
- 执行实际的数据传输
- 统计读写字节数
  */
  service_precharge_q();//服务预充电队列
  /*
  // 处理行关闭操作
- 将修改的数据写回MRAM
- 等待t_rp时间（预充电时间）
- 准备访问新的行
  */

  //2.更新各个定时队列的状态
  activation_q_->cycle();//更新行激活队列
  io_q_->cycle();//更新I/O队列
  bus_q_->cycle();//更新总线队列
  precharge_q_->cycle();//更新预充电队列
}

void RowBuffer::service_input_q() {
  if (input_q_->can_pop()) {
    MemoryCommand *memory_command = input_q_->front();

    if (memory_command->operation() == MemoryCommand::ACTIVATION) {//行激活
      if (activation_q_->empty() and row_address_ == nullptr) {
        activation_q_->push(memory_command); // 只有在激活队列为空且当前没有激活的行时才能激活新行
        input_q_->pop();//从输入队列中移除行激活命令
      }
    } else if (memory_command->operation() == MemoryCommand::READ) {
      if (io_q_->can_push() and row_address_ != nullptr) {//如果I/O队列可以接受新的命令且当前有激活的行
        io_q_->push(memory_command);
        input_q_->pop();
      }
    } else if (memory_command->operation() == MemoryCommand::WRITE) {
      if (io_q_->can_push() and row_address_ != nullptr) {//如果I/O队列可以接受新的命令且当前有激活的行
        io_q_->push(memory_command);
        input_q_->pop();
      }
    } else if (memory_command->operation() == MemoryCommand::PRECHARGE) {
      if (activation_q_->empty() and io_q_->empty() and bus_q_->empty() and
          precharge_q_->empty()) {//如果激活队列、I/O队列、总线队列和预充电队列都为空
          /**
           * 就像关闭图书馆：
要等所有人看完书（IO操作完成）
要等所有人离开阅览室（传输完成）
要等整理完所有书（其他操作完成）
最后才能关门（预充电）
这样设计的好处：
保证数据完整性
避免操作冲突
维护正确的操作顺序
防止数据丢失
确保系统稳定性
           */
        precharge_q_->push(memory_command);
        input_q_->pop();
      }
    } else {
      throw std::invalid_argument("");
    }
  }
}

void RowBuffer::service_activation_q() {
  auto [memory_command, cycle] = activation_q_->front();//距离上次激活的距离实际
  if (cycle == timing_parameters_["t_ras"] - timing_parameters_["t_rcd"]) {//如果行激活队列的计时器达到t_ras-t_rcd
    // t_ras: Row Active Time（行激活时间）
    // - 从行激活到预充电的最小时间间隔
    // - 确保行数据稳定

    // t_rcd: RAS to CAS Delay（行到列延迟）
    // - 从行激活到可以读取/写入数据的最小时间
    // - 确保行缓冲区数据准备就绪
    // 行激活后可以执行读写操作的时间窗口
    assert(row_address_ == nullptr);

    assert(memory_command->address() % wordline_size_ == 0);
    row_address_ = new abi::word::DataAddressWord();
    row_address_->set_value(memory_command->address());

    row_buffer_ = read_from_mram();//从MRAM读取数据到行缓冲区
  }

  if (activation_q_->can_pop() and ready_q_->can_push()) {
    activation_q_->pop();
    ready_q_->push(memory_command);

    stat_factory_->increment("num_activations");
    /**
     * - 激活队列有命令可以取出
- 就绪队列有空间可以接收 则统计num_activations+1
     */
  }
}

void RowBuffer::service_io_q() {
  if (io_q_->can_pop() and bus_q_->can_push()) {
    MemoryCommand *memory_command = io_q_->pop();
    bus_q_->push(memory_command);
  }
}

void RowBuffer::service_bus_q() {
  if (bus_q_->can_pop() and ready_q_->can_push()) {
    MemoryCommand *memory_command = bus_q_->pop();//是否可以总线命令
    ready_q_->push(memory_command);

    if (memory_command->operation() == MemoryCommand::READ) {
      std::vector<int> bytes = read_from_row_buffer(memory_command->address(),
                                                    memory_command->size());//从行缓冲区读取数据
      memory_command->set_bytes(bytes);//设置读取的数据

      stat_factory_->increment("num_reads");//统计读取次数
      if (memory_command->dma_command()->has_instruction()) {
        stat_factory_->increment(
            std::to_string(
                memory_command->dma_command()->instruction()->thread()->id()) +
            "_num_reads");//统计特定线程读取次数
      }

      stat_factory_->increment("read_bytes", memory_command->size());
      if (memory_command->dma_command()->has_instruction()) {
        stat_factory_->increment(
            std::to_string(
                memory_command->dma_command()->instruction()->thread()->id()) +
                "_read_bytes",
            memory_command->size());//统计特定线程读取字节数
      }
    } else if (memory_command->operation() == MemoryCommand::WRITE) {
      write_to_row_buffer(memory_command->address(), memory_command->size(),
                          memory_command->bytes());

      stat_factory_->increment("num_writes");
      if (memory_command->dma_command()->has_instruction()) {
        stat_factory_->increment(
            std::to_string(
                memory_command->dma_command()->instruction()->thread()->id()) +
            "_num_writes");
      }

      stat_factory_->increment("write_bytes", memory_command->size());
      if (memory_command->dma_command()->has_instruction()) {
        stat_factory_->increment(
            std::to_string(
                memory_command->dma_command()->instruction()->thread()->id()) +
                "_write_bytes",
            memory_command->size());
      }
    } else {
      throw std::invalid_argument("");
    }
  }
}

void RowBuffer::service_precharge_q() {
  if (precharge_q_->can_pop() and ready_q_->can_push()) {
    MemoryCommand *memory_command = precharge_q_->pop();

    assert(memory_command->address() % wordline_size_ == 0);
    assert(memory_command->address() == row_address_->address());

    write_to_mram();//把行缓冲区的数据写回MRAM
    delete row_address_;
    row_address_ = nullptr;
    ready_q_->push(memory_command);//把预充电命令加入就绪队列

    stat_factory_->increment("num_precharges");
  }
}

std::vector<int> RowBuffer::read_from_mram() {
  assert(row_address_ != nullptr);
  return std::move(mram_->read(row_address_->address()));
}

std::vector<int> RowBuffer::read_from_row_buffer(Address address,
                                                 Address size) {
  assert(row_address_ != nullptr);

  std::vector<int> bytes;
  bytes.resize(size);
  std::copy(row_buffer_.begin() + index(address),
            row_buffer_.begin() + index(address + size), bytes.begin());
  return std::move(bytes);
}

void RowBuffer::write_to_mram() {
  assert(row_address_ != nullptr);


  mram_->write(row_address_->address(), std::move(row_buffer_));
}

void RowBuffer::write_to_row_buffer(Address address, Address size,
                                    std::vector<int> bytes) {
  assert(size == bytes.size());

  std::copy(bytes.begin(), bytes.end(), row_buffer_.begin() + index(address));
}

int RowBuffer::index(Address address) {
  assert(row_address_->address() <= address and
         address <= row_address_->address() + wordline_size_);

  return static_cast<int>(address - row_address_->address());
}

}  // namespace upmem_sim::simulator::dram
