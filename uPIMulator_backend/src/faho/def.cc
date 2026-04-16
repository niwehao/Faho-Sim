#include "def.h"
#include "simulator/rank/rank.h"
namespace upmem_sim::simulator::faho::def
{
  ProcessEvent::ProcessEvent(process_host *process, Event *event, int index)
  {
    this->index = index;
    this->process = process;
    this->event = event;
  }
  def::DpuManager::DpuManager(int id, dpu::DPU *dpu)
  {
    dpu_id = id;
    this->dpu = dpu;
    dpu_flag = new DpuFlag();
    write_socket = new WriteSocket();
    write_inode = new WriteInode();
    read_inode = new ReadInode();
    check_result= new CheckResult();
    processes.resize(MAX_PRG);
  }
  void dpu_copy_from_mram(dpu::DPU *dpu, void *buf, int offset, int size)
  {
    encoder::ByteStream *byte_stream = dpu->dma()->transfer_from_mram(offset + util::ConfigLoader::mram_offset(), size);
    for (int i = 0; i < size; i++)
    {
      ((uint8_t *)buf)[i] = byte_stream->byte(i);
    }
    delete byte_stream;
  }
  void dpu_copy_to_mram_bytes(dpu::DPU *dpu, int offset, encoder::ByteStream *buf, int size)
  {
    assert(buf->size() == size);
    dpu->dma()->transfer_to_mram(offset + util::ConfigLoader::mram_offset(), buf);
  }
  void dpu_copy_to_mram(dpu::DPU *dpu, int offset, void *buf, int size)
  {
    std::vector<int> bytes_;

    for (int i = 0; i < size; i++)
    {
      bytes_.push_back(((uint8_t *)buf)[i]);
    }
    encoder::ByteStream *byte_stream = new encoder::ByteStream(bytes_);
    dpu->dma()->transfer_to_mram(offset + util::ConfigLoader::mram_offset(), byte_stream);
    delete byte_stream;
  }
  void set_flags(DpuManager *dpu_manager, unsigned int flag1)
  {
    struct kernel_info ki;
    dpu_copy_from_mram(dpu_manager->dpu, &ki, 0, sizeof(struct kernel_info));
    ki.flag1 = ki.flag1 | flag1;
    dpu_copy_to_mram(dpu_manager->dpu, 0, &ki, sizeof(struct kernel_info));
  }
  int read_flag(DpuManager *dpu_manager)
  {
    struct kernel_info ki;
    dpu_copy_from_mram(dpu_manager->dpu, (uint8_t *)&ki, 0, sizeof(ki));
    return ki.flag1;
  }
  void write_flags(DpuManager *dpu_manager, unsigned int flag)
  {
    struct kernel_info ki;
    ki.flag1 = flag;
    dpu_copy_to_mram(dpu_manager->dpu, 0, (uint8_t *)&ki, sizeof(ki));
  }
  uint32_t init_process(struct process_host *p,
                        uint8_t instant_launched, int pid, int role_id, int app_id, std::string path)
  {
    p->prg.inode_data = 0;
    if (instant_launched)
      p->state = STATE::READY;
    else
      p->state = STATE::LOADED;
    p->pid = pid;
    p->app_id = app_id;
    p->role = role_id;
    for (int j = 0; j < MAX_SD; j++)
      p->sd[j].inode = 0;
    std::ifstream file(path + "/" + "pointer.bin");
    std::string Line;
    int address_main;
    int addr_stack;
    file >> address_main >> addr_stack;

    p->end_value = address_main;
    p->prg.off_stack = addr_stack;
    p->begin_stack = p->prg.off_stack+util::ConfigLoader::wram_offset(); // TODO
    // close the file
    file.close();
    return 2;
  }
  void dpu_copy_from_wram(dpu::DPU *dpu, void *buf, int offset, int size)
  {
    encoder::ByteStream *byte_stream = dpu->dma()->transfer_from_wram(offset + util::ConfigLoader::wram_offset(), size);
    for (int i = 0; i < size; i++)
    {
      ((uint8_t *)buf)[i] = byte_stream->byte(i);
    }
  }
  void dpu_copy_to_wram(dpu::DPU *dpu, int offset, void *buf, int size)
  {
    std::vector<int> bytes_;

    for (int i = 0; i < size; i++)
    {
      bytes_.push_back(((uint8_t *)buf)[i]);
    }
    encoder::ByteStream *byte_stream = new encoder::ByteStream(bytes_);
    dpu->dma()->transfer_to_wram(offset + util::ConfigLoader::wram_offset(), byte_stream);
    delete byte_stream;
  }
}