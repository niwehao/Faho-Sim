#include "simulator/dpu/dma.h"

namespace upmem_sim::simulator::dpu {
  int count=7;

DMA::~DMA() {
  delete input_q_;
  delete ready_q_;
}

void DMA::connect_atomic(sram::Atomic *atomic) {
  assert(atomic != nullptr);
  assert(atomic_ == nullptr);

  atomic_ = atomic;
}

void DMA::connect_iram(sram::IRAM *iram) {
  assert(iram != nullptr);
  assert(iram_ == nullptr);

  iram_ = iram;
}

void DMA::connect_operand_collector(OperandCollector *operand_collector) {
  assert(operand_collector != nullptr);
  assert(operand_collector_ == nullptr);

  operand_collector_ = operand_collector;
}

void DMA::connect_memory_controller(dram::MemoryController *memory_controller) {
  assert(memory_controller != nullptr);
  assert(memory_controller_ == nullptr);

  memory_controller_ = memory_controller;
}

void DMA::transfer_to_atomic(Address address,
                             encoder::ByteStream *byte_stream) {
  for (int i = 0; i < byte_stream->size(); i++) {
    assert(byte_stream->byte(i) == 0);
  }
}

void DMA::transfer_to_iram(Address address, encoder::ByteStream *byte_stream) {
  assert(address == iram_->address()+util::ConfigLoader::iram_kernel_offset());
  assert(byte_stream->size() % abi::word::InstructionWord().size() == 0);

  int num_instructions = static_cast<int>(byte_stream->size() /
                                          abi::word::InstructionWord().size());
  std::cout<<"num of instructions: "<<num_instructions<<std::endl;
  for (int i = 0; i < num_instructions; i++) {
    Address begin = i * abi::word::InstructionWord().size();
    Address end = (i + 1) * abi::word::InstructionWord().size();
    encoder::ByteStream *instruction_byte_stream =
        byte_stream->slice(static_cast<int>(begin), static_cast<int>(end));
    iram_->write(util::ConfigLoader::iram_offset() +util::ConfigLoader::iram_kernel_offset()+ begin,
                 instruction_byte_stream);
    delete instruction_byte_stream;
  }
}
  void DMA::transfer_to_iram_from_mram(Address address, encoder::ByteStream *byte_stream) {
  int size__=byte_stream->size();

  assert(byte_stream->size() % (util::ConfigLoader::iram_data_width_align_bytes())==0);
  int num_instructions = static_cast<int>(byte_stream->size() /
                                             (util::ConfigLoader::iram_data_width_align_bytes()));
  assert(((address-util::ConfigLoader::iram_offset())%util::ConfigLoader::iram_data_width_align_bytes())==0);//393232 393216
  Address addr= ((address-util::ConfigLoader::iram_offset())/util::ConfigLoader::iram_data_width_align_bytes()*abi::word::InstructionWord().size())+ util::ConfigLoader::iram_offset();
  for (int i = 0; i < num_instructions; i++) {
    Address begin = i * util::ConfigLoader::iram_data_width_align_bytes();
    Address end = begin+abi::word::InstructionWord().size();//16
    Address begin_iram = i * abi::word::InstructionWord().size();

    encoder::ByteStream *instruction_byte_stream =
        byte_stream->slice(static_cast<int>(begin), static_cast<int>(end));
    iram_->write(addr+begin_iram,
                 instruction_byte_stream);
    delete instruction_byte_stream;
  }
}

encoder::ByteStream *DMA::transfer_from_wram(Address address, Address size) {
  auto byte_stream = new encoder::ByteStream();
  for (int i = 0; i < size; i++) {
    byte_stream->append(static_cast<int>(operand_collector_->lbu(address + i)));
  }
  return byte_stream;
}

void DMA::transfer_to_wram(Address address, encoder::ByteStream *byte_stream) {
  for (int i = 0; i < byte_stream->size(); i++) {
    operand_collector_->sb(address + i, byte_stream->byte(i));
  }
}


encoder::ByteStream *DMA::transfer_from_mram(Address address, Address size) {
  std::vector<int> bytes = memory_controller_->read(address, size);
  return new encoder::ByteStream(bytes);
}

void DMA::transfer_to_mram(Address address, encoder::ByteStream *byte_stream) {
  memory_controller_->write(address, byte_stream->size(), byte_stream);
}

void DMA::transfer_from_wram_to_mram(
    Address wram_address, Address mram_address, Address size,
    abi::instruction::Instruction *instruction) {
  assert(can_push());
  //std::cout<<"DMA::transfer_from_wram to mram "<<std::endl;


  encoder::ByteStream *byte_stream = transfer_from_wram(wram_address, size);

  std::vector<int> bytes = byte_stream->bytes();

  delete byte_stream;

  auto dma_command = new DMACommand(DMACommand::WRITE, wram_address,
                                    mram_address, size, bytes, instruction);
  input_q_->push(dma_command);
}

  void DMA::transfer_from_mram_to_iram(
    Address iram_address, Address mram_address, Address size,
    abi::instruction::Instruction *instruction){
  assert(can_push());
  //std::cout<<"DMA::transfer_from_mram to iram "<<std::endl;

  auto dma_command = new DMACommand(DMACommand::READ_I, iram_address,
                                    mram_address, size, instruction);
  input_q_->push(dma_command);

}

void DMA::transfer_from_mram_to_wram(
    Address wram_address, Address mram_address, Address size,
    abi::instruction::Instruction *instruction) {
  assert(can_push());
  //std::cout<<"DMA::transfer_from_mram to wram "<<std::endl;
  
  

  auto dma_command = new DMACommand(DMACommand::READ, wram_address,
                                    mram_address, size, instruction);
  input_q_->push(dma_command);
}

void DMA::cycle() {
  service_input_q();
  service_ready_q();
}

void DMA::service_input_q() {
  if (input_q_->can_pop() and memory_controller_->can_push()) {
    DMACommand *dma_command = input_q_->pop();
    memory_controller_->push(dma_command);
  }
}

void DMA::service_ready_q() {
  if (memory_controller_->can_pop() and ready_q_->can_push()) {
    DMACommand *dma_command = memory_controller_->pop();
    ready_q_->push(dma_command);

    if (dma_command->operation() == DMACommand::READ ) {
      auto byte_stream = new encoder::ByteStream(dma_command->bytes());

      transfer_to_wram(dma_command->notmram_address(), byte_stream);

      delete byte_stream;
    }
    else if ( dma_command->operation() == DMACommand::READ_I)
    {
      auto byte_stream = new encoder::ByteStream(dma_command->bytes());
      transfer_to_iram_from_mram(dma_command->notmram_address(), byte_stream);


      delete byte_stream;
    }
  }
}
  void DMA::init_sys_used_mram_end_pointer(Address address) {
  sys_used_mram_end_pointer=address;

}

}  // namespace upmem_sim::simulator::dpu
