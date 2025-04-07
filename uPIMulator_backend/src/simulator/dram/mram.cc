#include "simulator/dram/mram.h"

namespace upmem_sim::simulator::dram {

MRAM::MRAM(util::ArgumentParser *argument_parser)//类似wram和iram
    : address_(new abi::word::DataAddressWord()),
      size_(util::ConfigLoader::mram_size()) {
  address_->set_value(util::ConfigLoader::mram_offset());

  wordline_size_ = argument_parser->get_int_parameter("wordline_size");
  /**[wordline 0] -> [Cell][Cell][Cell][Cell]...
[wordline 1] -> [Cell][Cell][Cell][Cell]...
[wordline 2] -> [Cell][Cell][Cell][Cell]...
更大的wordline_size意味着：
更高的并行度
更大的数据吞吐量
更高的访问效率
 */

  assert(wordline_size_ > 0);
  assert(wordline_size_ % util::ConfigLoader::min_access_granularity() == 0);//检查wordline_size是否是min_access_granularity的倍数
  assert(address() % wordline_size_ == 0);//检查地址是否是wordline_size的倍数
  assert(size_ % wordline_size_ == 0);//检查大小是否是wordline_size的倍数,大小是给的参数

  num_wordlines_ =
      static_cast<int>(util::ConfigLoader::mram_size() / wordline_size_);//计算能有几行

  wordlines_.resize(num_wordlines_);
  for (int i = 0; i < num_wordlines_; i++) {
    wordlines_[i] =
        new Wordline(argument_parser, address() + i * wordline_size_);
  }
}

MRAM::~MRAM() {
  delete address_;

  for (int i = 0; i < num_wordlines_; i++) {
    delete wordlines_[i];
  }
}

std::vector<int> MRAM::read(Address address) {
  return std::move(wordlines_[index(address)]->read());//不明白,可能是多此一举
}

void MRAM::write(Address address, std::vector<int> bytes) {
  wordlines_[index(address)]->write(std::move(bytes));
}

void MRAM::write(Address address, encoder::ByteStream *byte_stream) {
  wordlines_[index(address)]->write(byte_stream);
}

int MRAM::index(Address address) {//计算wordline的索引
  assert(address >= this->address());
  assert(address + abi::word::DataWord().size() <= this->address() + size_);
  assert(address % wordline_size_ == 0);

  return static_cast<int>((address - this->address()) / wordline_size_);
}

}  // namespace upmem_sim::simulator::dram
