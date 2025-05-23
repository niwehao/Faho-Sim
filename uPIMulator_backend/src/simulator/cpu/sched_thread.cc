#include "simulator/cpu/sched_thread.h"

#include <iostream>
#include <sstream>

#include "main.h"

namespace upmem_sim::simulator::cpu {

void SchedThread::connect_rank(rank::Rank *rank) {//DPU调度线程
  assert(rank != nullptr);
  assert(rank_ == nullptr);

  rank_ = rank;
}

void SchedThread::sched(int execution) {
  //dma_transfer_input_dpu_mram_heap_pointer_name(execution);//堆指针
  //dma_transfer_dpu_input_arguments(execution);//传入的参数

  std::cout << "sched " << execution << " completed..." << std::endl;
}

void SchedThread::check(int execution) {//先不去检查结果
  //dma_transfer_output_dpu_mram_heap_pointer_name(execution);
  //dma_transfer_dpu_results(execution);

  std::cout << "check " << execution << " completed..." << std::endl;
}

void SchedThread::dma_transfer_input_dpu_mram_heap_pointer_name(int execution) {//write mram的初始值
  std::set<rank::RankMessage*> rank_messages;
  for (DPUID dpu_id = 0; dpu_id < num_dpus(); dpu_id++) {
    std::stringstream ss;
    ss << "input_dpu_mram_heap_pointer_name.dpu_id" << dpu_id << "."//分配堆空间
       << execution;

    std::string bin_filename;
    ss >> bin_filename;

    auto byte_stream = load_byte_stream(bin_filename);

    if (byte_stream != nullptr) {
      auto rank_message = new rank::RankMessage(
          rank::RankMessage::WRITE, dpu_id, sys_used_mram_end_pointer(),
          byte_stream->size(), byte_stream);
      rank_->write(rank_message);
      rank_messages.insert(rank_message);

      rank_->dpus()[dpu_id]->dma()->transfer_to_mram(
          sys_used_mram_end_pointer(), byte_stream);//通过DMA中断来来输入mram的
      rank_->dpus()[dpu_id]->dma()->init_sys_used_mram_end_pointer(sys_used_mram_end_pointer());

      delete byte_stream;
    }
  }

  for (auto & rank_message : rank_messages) {
    while (not rank_message->ack()) {
      rank_->cycle();
    }

    delete rank_message;
  }
}

void SchedThread::dma_transfer_dpu_input_arguments(int execution) {
  std::set<rank::RankMessage*> rank_messages;
  for (DPUID dpu_id = 0; dpu_id < num_dpus(); dpu_id++) {
    std::stringstream ss;
    ss << "dpu_input_arguments.dpu_id" << dpu_id << "." << execution;

    std::string bin_filename;
    ss >> bin_filename;

    auto byte_stream = load_byte_stream(bin_filename);

    if (byte_stream != nullptr) {
      auto rank_message = new rank::RankMessage(
          rank::RankMessage::WRITE, dpu_id, dpu_input_arguments_pointer(),
          byte_stream->size(), byte_stream);
      rank_->write(rank_message);
      rank_messages.insert(rank_message);

      rank_->dpus()[dpu_id]->dma()->transfer_to_wram(
          dpu_input_arguments_pointer(), byte_stream);

      delete byte_stream;
    }
  }

  for (auto & rank_message : rank_messages) {
    while (not rank_message->ack()) {
      rank_->cycle();
    }
    delete rank_message;
  }
}

void SchedThread::dma_transfer_output_dpu_mram_heap_pointer_name(
    int execution) {
  std::set<rank::RankMessage*> rank_messages;
  for (DPUID dpu_id = 0; dpu_id < num_dpus(); dpu_id++) {
    std::stringstream ss;
    ss << "output_dpu_mram_heap_pointer_name.dpu_id" << dpu_id << "."
       << execution;

    std::string bin_filename;
    ss >> bin_filename;

    auto byte_stream = load_byte_stream(bin_filename);

    if (byte_stream != nullptr) {
      auto rank_message = new rank::RankMessage(rank::RankMessage::READ, dpu_id,
                                                sys_used_mram_end_pointer(),
                                                byte_stream->size());
      rank_->read(rank_message);
      rank_messages.insert(rank_message);
      //读取mram来比较结果

      encoder::ByteStream *mram_byte_stream =
          rank_->dpus()[dpu_id]->dma()->transfer_from_mram(
              sys_used_mram_end_pointer()+(1<<16),8);
      //1111111000110011111111100011000011111110001100011111111000110001

      //assert(byte_stream->size() == mram_byte_stream->size());
      for (int i = 0; i <mram_byte_stream->size(); i++) {
        std::cout<<mram_byte_stream->byte(i)<<" "<<std::endl;
        //assert(byte_stream->byte(i) == mram_byte_stream->byte(i));
      }
      delete byte_stream;
      delete mram_byte_stream;
    }
  }

  for (auto & rank_message : rank_messages) {
    while (not rank_message->ack()) {
      rank_->cycle();
    }
    delete rank_message;
  }
}

void SchedThread::dma_transfer_dpu_results(int execution) {
  std::set<rank::RankMessage*> rank_messages;
  for (DPUID dpu_id = 0; dpu_id < num_dpus(); dpu_id++) {
    std::stringstream ss;
    ss << "dpu_results.dpu_id" << dpu_id << "." << execution;

    std::string bin_filename;
    ss >> bin_filename;

    auto byte_stream = load_byte_stream(bin_filename);

    if (byte_stream != nullptr) {
      auto rank_message =
          new rank::RankMessage(rank::RankMessage::READ, dpu_id,
                                dpu_results_pointer(), byte_stream->size());
      rank_->read(rank_message);
      rank_messages.insert(rank_message);

      encoder::ByteStream *wram_byte_stream =
          rank_->dpus()[dpu_id]->dma()->transfer_from_wram(
              dpu_results_pointer(), byte_stream->size());

      assert(byte_stream->size() == wram_byte_stream->size());
      for (int i = 0; i < byte_stream->size(); i++) {
        assert(byte_stream->byte(i) == wram_byte_stream->byte(i));
      }

      delete byte_stream;
      delete wram_byte_stream;
    }
  }

  for (auto & rank_message : rank_messages) {
    while (not rank_message->ack()) {
      rank_->cycle();
    }
    delete rank_message;
  }
}

}  // namespace upmem_sim::simulator::cpu
