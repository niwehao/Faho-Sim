#include "simulator/dram/mram.h"
#include <iostream>
namespace upmem_sim::simulator::dram {

MRAM::MRAM(util::ArgumentParser *argument_parser)
    : address_(new abi::word::DataAddressWord()),
      size_(util::ConfigLoader::mram_size()) {
  address_->set_value(util::ConfigLoader::mram_offset());

  wordline_size_ = argument_parser->get_int_parameter("wordline_size");

  assert(wordline_size_ > 0);
  assert(wordline_size_ % util::ConfigLoader::min_access_granularity() == 0);
  assert(address() % wordline_size_ == 0);
  assert(size_ % wordline_size_ == 0);

  num_wordlines_ =
      static_cast<int>(util::ConfigLoader::mram_size() / wordline_size_);

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
  //std::cout<<"MRAM::read from "<<address<<std::endl;
  return std::move(wordlines_[index(address)]->read());
}

void MRAM::write(Address address, std::vector<int> bytes) {
  //std::cout<<"MRAM::write to "<<address<<std::endl;
  //std::cout << "Data bytes: ";
 // for (size_t i = 0; i < bytes.size(); ++i) {
 //   std::cout << bytes[i];
 //   if (i < bytes.size() - 1) {
//::cout << ", ";
  //  }
 // }
 // std::cout << std::endl;
  wordlines_[index(address)]->write(std::move(bytes));
}

void MRAM::write(Address address, encoder::ByteStream *byte_stream) {
  wordlines_[index(address)]->write(byte_stream);
}

int MRAM::index(Address address) {
  assert(address >= this->address());
  assert(address + abi::word::DataWord().size() <= this->address() + size_);
  assert(address % wordline_size_ == 0);

  return static_cast<int>((address - this->address()) / wordline_size_);
}

}  // namespace upmem_sim::simulator::dram
