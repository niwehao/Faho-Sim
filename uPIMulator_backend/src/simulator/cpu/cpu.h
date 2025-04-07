#ifndef UPMEM_SIM_SIMULATOR_CPU_CPU_H_
#define UPMEM_SIM_SIMULATOR_CPU_CPU_H_

#include "simulator/cpu/fini_thread.h"
#include "simulator/cpu/init_thread.h"
#include "simulator/cpu/sched_thread.h"
#include "simulator/rank/rank.h"

namespace upmem_sim::simulator::cpu {

class CPU {
 public:
  explicit CPU(util::ArgumentParser *argument_parser)
      : init_thread_(new InitThread(argument_parser)),//初始化线程
      /***
       * 初始化DPU系统环境
加载程序到DPU
设置初始参数
准备数据传输
建立CPU和DPU之间的连接
       **/
        sched_thread_(new SchedThread(argument_parser)),//调度线程
        /***
         * 调度线程
         * 负责管理DPU的调度
         * 分配任务给DPU
         * 协调DPU之间的数据传输
         * 监控DPU的执行状态
         * **/
        fini_thread_(new FiniThread(argument_parser)) {}//结束线程
        /***
         * 结束线程
         * 负责清理DPU系统环境
         * 释放资源
         * 保存执行结果
         * **/
  ~CPU();

  void connect_rank(rank::Rank *rank);

  int num_executions() { return fini_thread_->num_executions(); }

  void init() { init_thread_->init(); }
  void launch() { init_thread_->launch(); }
  void sched(int execution) { sched_thread_->sched(execution); }
  void check(int execution) { sched_thread_->check(execution); }
  void fini() {}
  void cycle() { fini_thread_->cycle(); }

 private:
  InitThread *init_thread_;
  SchedThread *sched_thread_;
  FiniThread *fini_thread_;
};

}  // namespace upmem_sim::simulator::cpu

#endif
