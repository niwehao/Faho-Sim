#include "simulator/dpu/revolver_scheduler.h"

namespace upmem_sim::simulator::dpu {

RevolverScheduler::RevolverScheduler(util::ArgumentParser *argument_parser,
                                     std::vector<Thread *> threads)//线程
    : thread_q_(new basic::Queue<Thread>(threads.size())),//线程队列
      stat_factory_(new util::StatFactory("RevolverScheduler")) { 
  num_revolver_scheduling_cycles_ = static_cast<int>(
      argument_parser->get_int_parameter("num_revolver_scheduling_cycles"));//每一个线程必须要等待的周期数

  assert(num_revolver_scheduling_cycles_ > 0);

  threads_ = threads;

  for (auto &thread : threads) {
    thread_q_->push(thread);
  }
}

RevolverScheduler::~RevolverScheduler() {
  while (thread_q_->can_pop()) {
    thread_q_->pop();
  }

  delete stat_factory_;
}

util::StatFactory *RevolverScheduler::stat_factory() { 
  auto stat_factory = new util::StatFactory("");
  stat_factory->merge(stat_factory_);
  return stat_factory;
}

Thread *RevolverScheduler::schedule() {
  bool is_blocked = false;
  for (int i = 0; i < thread_q_->size(); i++) {
    Thread *thread = thread_q_->pop();//从队列中弹出一个线程
    thread_q_->push(thread);//将线程放回队列,来调整顺序

    if (thread->issue_cycle() >= num_revolver_scheduling_cycles_) {//如果线程的指令周期大于等于每一个线程必须要等待的周期数
      if (thread->state() == Thread::RUNNABLE) {//如果线程处于可运行状态
        thread->reset_issue_cycle();//重置指令周期,指令周期是在被调度的时候重新被设置

        stat_factory_->increment("breakdown_run");

        return thread;
      } else if (thread->state() == Thread::BLOCK) {
        is_blocked = true;//记录堵塞以便统计
      }
    }
  }

  if (is_blocked) {
    stat_factory_->increment("breakdown_dma");//为什么发生了堵塞
  } else {
    stat_factory_->increment("breakdown_etc");
  }

  return nullptr;
}

bool RevolverScheduler::boot(ThreadID id) {
  Thread *thread = threads_[id];
  assert(thread->id() == id);

  if (thread->state() == Thread::EMBRYO) {//启动线程
    thread->set_state(Thread::RUNNABLE);
    return true;
  } else if (thread->state() == Thread::ZOMBIE) {
    thread->set_state(Thread::RUNNABLE);
    return true;
  } else {
    throw std::invalid_argument("");
  }
}

bool RevolverScheduler::sleep(ThreadID id) {//休眠线程
  Thread *thread = threads_[id];
  assert(thread->id() == id);

  if (thread->state() == Thread::RUNNABLE) {
    thread->set_state(Thread::SLEEP);
    return true;
  } else {
    throw std::invalid_argument("");
  }
}

bool RevolverScheduler::block(ThreadID id) {//阻塞线程
  Thread *thread = threads_[id];
  assert(thread->id() == id);

  if (thread->state() == Thread::RUNNABLE) {
    thread->set_state(Thread::BLOCK);
    return true;
  } else {
    throw std::invalid_argument("");
  }
}

bool RevolverScheduler::awake(ThreadID id) {//唤醒线程
  Thread *thread = threads_[id];
  assert(thread->id() == id);

  if (thread->state() == Thread::EMBRYO) {
    thread->set_state(Thread::RUNNABLE);
    return true;
  } else if (thread->state() == Thread::SLEEP) {
    thread->set_state(Thread::RUNNABLE);
    return true;
  } else if (thread->state() == Thread::BLOCK) {
    thread->set_state(Thread::RUNNABLE);
    return true;
  } else {
    throw std::invalid_argument("");
  }
}

bool RevolverScheduler::shutdown(ThreadID id) {//关闭线程
  Thread *thread = threads_[id];
  assert(thread->id() == id);

  if (thread->state() == Thread::SLEEP) {
    thread->set_state(Thread::ZOMBIE);
    return true;
  } else {
    throw std::invalid_argument("");
  }
}

void RevolverScheduler::cycle() {
  int num_active_tasklets = 0, num_embryo = 0, num_sleep = 0, num_block = 0,
      num_zombie = 0;/**
      int num_active_tasklets = 0,  // 活动线程数
    num_embryo = 0,          // 初始状态线程数
    num_sleep = 0,           // 休眠线程数
    num_block = 0,           // 阻塞线程数
    num_zombie = 0;          // 僵尸线程数 */

  for (auto &thread : threads_) {
    if (thread->state() == Thread::RUNNABLE and
        thread->issue_cycle() < num_revolver_scheduling_cycles_) {//可以运行但是由于没有到达等待周期而等待
      stat_factory_->increment("revolver_wait");                 
      stat_factory_->increment(std::to_string(thread->id()) +
                               "_revolver_wait");
    }

    thread->increment_issue_cycle();

    if (thread->state() == Thread::RUNNABLE)
      num_active_tasklets++;
    else if (thread->state() == Thread::EMBRYO)
      num_embryo++;
    else if (thread->state() == Thread::SLEEP)
      num_sleep++;
    else if (thread->state() == Thread::BLOCK)
      num_block++;
    else if (thread->state() == Thread::ZOMBIE)
      num_zombie++;
    else
      assert(0);
  }
  // 更新统计信息
  std::string info_new="num_active_tasklets: "+std::to_string(num_active_tasklets)+
        ", num_embryo: "+std::to_string(num_embryo)+
        ", num_sleep: "+std::to_string(num_sleep)+
        ", num_block: "+std::to_string(num_block)+
        ", num_zombie: "+std::to_string(num_zombie);
  if (info_ != info_new) {
    std::cout << info_ << std::endl;
  }
  info_ = info_new;
  assert(num_active_tasklets <= 16);//活动线程数不能超过16,这是dpu的限制
  stat_factory_->overwrite("current_active_tasklets",
                           num_active_tasklets); //更新当前活动线程数

  stat_factory_->increment("active_tasklets_" +
                           std::to_string(num_active_tasklets));

  stat_factory_->increment("total_EMBRYO", num_embryo);
  stat_factory_->increment("total_RUNNABLE", num_active_tasklets);
  stat_factory_->increment("total_SLEEP", num_sleep);
  stat_factory_->increment("total_BLOCK", num_block);
  stat_factory_->increment("total_ZOMBIE", num_zombie);
//`breakdown_dma`
  issuable_threads_ = num_active_tasklets;
}

}  // namespace upmem_sim::simulator::dpu