#ifndef UPMEM_SIM_SIMULATOR_DPU_THREAD_H_
#define UPMEM_SIM_SIMULATOR_DPU_THREAD_H_

#include <cassert>
#include <map>

#include "simulator/reg/reg_file.h"
#include "util/config_loader.h"

namespace upmem_sim::simulator::dpu {

using ThreadStatus = std::string;

class Thread {
 public:
  enum State { EMBRYO = 0, RUNNABLE, SLEEP, BLOCK, ZOMBIE };//状态 
  /**
   *   EMBRYO = 0,  // 初始状态
    RUNNABLE,    // 可运行状态
    SLEEP,       // 休眠状态
    BLOCK,       // 阻塞状态
    ZOMBIE       // 僵尸状态
   */

  explicit Thread(ThreadID id,std::string benchmark,std::string bindir)
      : id_(id),
        state_(EMBRYO),
        reg_file_(new reg::RegFile(id_,benchmark,bindir)),
        issue_cycle_(0) {
    assert(0 <= id and id < upmem_sim::util::ConfigLoader::max_num_tasklets());
    status_tracker_.emplace("WAIT_DATA", 0);//等待数据
    status_tracker_.emplace("WAIT_SYNC", 0);//等待同步
    status_tracker_.emplace("ARITHMETIC", 0);//算术运算
    status_tracker_.emplace("SPM_ACCESS", 0);//spm访问
    status_tracker_.emplace("WAIT_SCHEDULE", 0);//等待调度
  }
  ~Thread();

  ThreadID id() { return id_; }
  State state() { return state_; }
  void set_state(State state) { state_ = state; }
  reg::RegFile *reg_file() { return reg_file_; }
  int issue_cycle() { return issue_cycle_; }
  void increment_issue_cycle() { issue_cycle_ += 1; }
  void reset_issue_cycle() { issue_cycle_ = 0; }

  void update_thread_status(ThreadStatus status, int64_t value) {
    status_tracker_[std::move(status)] += value;
  }
  std::map<ThreadStatus, int64_t> &status_tracker() { return status_tracker_; }

 private:
  ThreadID id_;//线程id
  State state_;//状态
  std::map<ThreadStatus, int64_t> status_tracker_;//状态跟踪器
  reg::RegFile *reg_file_;//寄存器文件
  int issue_cycle_;//指令周期
};

}  // namespace upmem_sim::simulator::dpu

#endif
