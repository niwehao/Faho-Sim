#ifndef UPMEM_SIM_SIMULATOR_DPU_REVOLVER_SCHEDULER_H_
#define UPMEM_SIM_SIMULATOR_DPU_REVOLVER_SCHEDULER_H_

#include <vector>

#include "simulator/basic/queue.h"
#include "simulator/dpu/thread.h"
#include "util/argument_parser.h"
#include "util/stat_factory.h"
#include "simulator/dpu/performance_counter.h"
namespace upmem_sim::simulator::dpu
{

  class RevolverScheduler
  {
  public:
    explicit RevolverScheduler(util::ArgumentParser *argument_parser,
                               std::vector<Thread *> threads);
    ~RevolverScheduler();

    util::StatFactory *stat_factory();
    void connect_performace_counter(PerformanceCounter *performance_counter)
    {
      assert(performance_counter_==nullptr);
      performance_counter_ = performance_counter;
    }
    std::vector<Thread *> threads() { return threads_; }

    Thread *schedule();


    bool boot(ThreadID id);
    bool sleep(ThreadID id);
    bool block(ThreadID id);
    bool awake_block(ThreadID id);
    bool awake(ThreadID id);
    bool shutdown(ThreadID id);
    void preemption();

    void cycle();

    int get_issuable_threads() { return issuable_threads_; };

  private:
    int num_revolver_scheduling_cycles_;
    int issuable_threads_;
    std::string info_ = "";
    int space_flag = util::ConfigLoader::iram_offset() + util::ConfigLoader::iram_kernel_offset();
    PerformanceCounter *performance_counter_=nullptr;
    std::vector<Thread *> threads_;
    basic::Queue<Thread> *thread_q_;
    uint8_t *preempt_broad;
    uint8_t preempt_fin=0;
    uint8_t ifpreempt=0;
     uint64_t preempt_start=0;

    util::StatFactory *stat_factory_;
  };

} // namespace upmem_sim::simulator::dpu

#endif
