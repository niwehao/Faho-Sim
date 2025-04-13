#include "simulator/sram/wram.h"
#include <iostream>
namespace upmem_sim::simulator::sram {

WRAM::WRAM() {
  address_ = new abi::word::DataAddressWord();
  address_->set_value(util::ConfigLoader::wram_offset());//设置wram的初始偏移量

  size_ = util::ConfigLoader::wram_size();

  assert(address() % abi::word::DataWord().size() == 0);//检查wram的地址是否是数据字大小的倍数
  assert(size_ % abi::word::DataWord().size() == 0);//检查wram的大小是否是数据字大小的倍数

  cells_.resize(num_data_words());//初始化wram的单元格
  for (int i = 0; i < num_data_words(); i++) {
    cells_[i] = new abi::word::DataWord();//初始化wram的单元格
  }
}

WRAM::~WRAM() {
  delete address_;

  for (int i = 0; i < num_data_words(); i++) {
    delete cells_[i];
  }
}

int64_t WRAM::read(Address address) {
  std::cout<<"WRAM::read from "<<address<<std::endl;
  int64_t value = cells_[index(address)]->value(abi::word::UNSIGNED);
  for (int i = 7; i >= 0; --i) {
    // 每次提取8位
    uint8_t byte = (value >> (i * 8)) & 0xFF;
    std::cout << static_cast<int>(byte);

    if (i > 0) {
      std::cout << ",";
    }
  }
  std::cout << std::endl;
  return value;//读取数值
}

void WRAM::write(Address address, int64_t value) {
  std::cout<<"WRAM::write to "<<address<<std::endl;
  for (int i = 7; i >= 0; --i) {
    // 每次提取8位
    uint8_t byte = (value >> (i * 8)) & 0xFF;
    std::cout << static_cast<int>(byte);

    if (i > 0) {
      std::cout << ",";
    }
  }
  std::cout << std::endl;

  cells_[index(address)]->set_value(value);//写入数值
}

void WRAM::write(Address address, encoder::ByteStream *byte_stream) {
  cells_[index(address)]->from_byte_stream(byte_stream);//写入字节流
}

int WRAM::index(Address address) {//地址转换为索引
  assert(address >= this->address());
  assert(address + abi::word::DataWord().size() <= this->address() + size_);
  assert((address - this->address()) % abi::word::DataWord().size() == 0);

  return static_cast<int>((address - this->address()) /
                          abi::word::DataWord().size());
}

}  // namespace upmem_sim::simulator::sram