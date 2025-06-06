#include "simulator/system.h"

namespace upmem_sim::simulator {

System::System(util::ArgumentParser *argument_parser)
    : cpu_(new cpu::CPU(argument_parser)),
      rank_(new rank::Rank(argument_parser)),//DIMM的rank
      execuion_(0), 
      stat_factory_(new util::StatFactory("System")) {//统计数据
  benchmark = argument_parser->get_string_parameter("benchmark");

  cpu_->connect_rank(rank_);
  faho_k1_ = new faho::k1::K1(argument_parser->get_string_parameter("bindir"),
                             benchmark, argument_parser->get_int_parameter("num_tasklets"), rank_);
}

System::~System() {
  delete cpu_;
  delete rank_;

  delete stat_factory_;
}

util::StatFactory *System::stat_factory() {
  auto stat_factory = new util::StatFactory("");

  util::StatFactory *rank_stat_factory = rank_->stat_factory();

  stat_factory->merge(stat_factory_);
  stat_factory->merge(rank_stat_factory);

  delete rank_stat_factory;

  return stat_factory;
}

void System::init() {
  cpu_->init();//初始化各种ram(模拟系统占用
  //cpu_->sched(execuion_);//
  cpu_->launch();
}

void System::cycle() {
  faho_k1_->cycle(); //处理faho的事件
  cpu_->cycle();
  rank_->cycle();
  

  if (is_zombie()) {
    cpu_->check(execuion_);//程序的执行次数
    execuion_ += 1;

    if (not is_finished()) {
      if(benchmark == "TRNS"){
        cpu_->init();
      }
      cpu_->sched(execuion_);
      cpu_->launch();
    }
  }
}

}  // namespace upmem_sim::simulator
