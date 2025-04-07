#ifndef UPMEM_SIM_SIMULATOR_SRAM_IRAM_H_
#define UPMEM_SIM_SIMULATOR_SRAM_IRAM_H_

#include "abi/instruction/instruction.h"
#include "abi/word/instruction_address_word.h"
#include "abi/word/instruction_word.h"

namespace upmem_sim::simulator::sram {

class IRAM {
 public:
  explicit IRAM();
  ~IRAM();

  Address address() { return address_->address(); }//基地址
  Address size() { return size_; }//大小

  abi::instruction::Instruction *read(Address address);//指令解码
  void write(Address address, encoder::ByteStream *byte_stream);
  void cycle() = delete;

 protected:
  static int num_instruction_words() {
    return static_cast<int>(util::ConfigLoader::iram_size() /
                            abi::word::InstructionWord().size());
  }//计算可以储存多少条指令
  int index(Address address);//计算地址对应的索引

 private:
  abi::word::InstructionAddressWord *address_;
  Address size_;
  std::vector<abi::word::InstructionWord *> cells_;
};

}  // namespace upmem_sim::simulator::sram

#endif
