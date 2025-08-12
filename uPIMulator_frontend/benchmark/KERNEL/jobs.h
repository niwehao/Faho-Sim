#ifndef JOB
#define JOB

#include "def.h"
#include "kernel.h"

#include "custom_barrier.h"
#include "sync.h"
#include <stdint.h>

struct job
{
  uint8_t state;
  uint8_t jid;
  uint32_t beginstack; // allow to reuse the stack
  uint32_t sync_addr;  // if the process is in state WAITING or SLEEPING, it is
                       // the addr to wakeup it
  uint32_t time;
  struct flow_context *fc;
};

struct job_mram
{
  struct job j[MAX_PRG][JOB_PER_PROCESS]; // a check
};

extern __dma_aligned struct job jobs[JOB_PER_PROCESS];
extern struct flow_context *fc_scheduler_job[NR_TASKLETS];
extern struct process processs[MAX_PRG];
extern volatile unsigned int cur_process_index;
/**
 * @brief Create a new job, this function must be called by the job 0.  The job
 * will be  start at begin_pc
 *
 * @param intarg1
 * @return int
 */
int create_job(unsigned begin_pc);

/**
 * @brief Wait the end of one job, this function must be called by the job 0.
 *
 * @return int, the jid of ended job
 */
int join_job(void);

/**
 * @brief The scheduler of jobs, called by th scheduler after setup the current process
 *
 * @return int, return if all job are finiished or in waiting state, 0 if not.
 */
int scheduler_jobs(void);

/**
 * @brief A function call by a job to return give back to the scheduler_job
 *
 */
void swap_scheduler(void);
extern mutex_id_t mutex_jobs;
extern struct custom_barriere cp;

struct flow_context *fc_scheduler_job[NR_TASKLETS]
    __attribute__((section(".data"))) = {}; // flow context of scheduler

__dma_aligned struct job jobs[JOB_PER_PROCESS]
    __attribute__((section(".data"))) // process info
    = {};

uint8_t cur_jobs[NR_TASKLETS] __attribute__((section(".data"))) = {};
extern void swap_context(struct flow_context **old, struct flow_context *new);
void swap_scheduler()
{
  swap_context(&jobs[cur_jobs[me_new()]].fc, fc_scheduler_job[me_new()]);
}
extern int wakeup(void *sync_addr, uint8_t check_cur_only_cur_process,
                  uint8_t resume_tasklet);
void __end_child_jobs(void)
{

  mutex_lock(mutex_jobs); // need to lock for join
  uint8_t job_idx = cur_jobs[me_new()];
  jobs[job_idx].state = FINISHED;
  mutex_unlock(mutex_jobs);
  wakeup(&jobs[0], 1, 1); // wakeup the join_job function

  swap_context(&jobs[cur_jobs[me_new()]].fc,
               fc_scheduler_job[me_new()]); // should never return
  // halt();
}

int create_job(unsigned int arg1)
{

  uint8_t job_idx = cur_jobs[me_new()];

  if (jobs[job_idx].jid != 0)
    return CHILD_JOB;

  mutex_lock(mutex_jobs);
  uint32_t begin_stack = 0;
  int found = -1;
  // if (REUSED_STACK_FTHREAD) {
  // printk_int(REUSED_STACK_FTHREAD);
  for (int i = 0; i < JOB_PER_PROCESS; i++)
  {
    if (jobs[i].state ==
        FINISHED_NO_FREE)
    { // try to find a stack already alloc by another
      // job which are finnished now
      found = i;
      begin_stack = jobs[i].beginstack;
      break;
    }
  } // 没有可以回收的
  // }
  if (!begin_stack)
  { // need to alloc a new stack
    if ((begin_stack =

             sbrk(SIZE_STACK)) < 0)
    {
      mutex_unlock(mutex_jobs);
      return begin_stack;
    }

    begin_stack -= SIZE_STACK; // 为什么要减去???
  }
  struct process *p = &processs[cur_process_index];

  uint8_t new_jid = p->nb_jobs;
  p->nb_jobs += 1;

  for (int i = 0; i < JOB_PER_PROCESS && (found == -1); i++)
  {
    if (jobs[i].state == NONE)
    {
      found = i;
    }
  }
  if (found != -1)
  {
    jobs[found].state = READY;
    jobs[found].jid = new_jid;
    jobs[found].fc = (struct flow_context *)begin_stack;
    jobs[found].beginstack = begin_stack;
    jobs[found].fc->r22 = (int)jobs[found].fc;
    jobs[found].fc->r23 = (int)__end_child_jobs;
    jobs[found].fc->r21 = arg1; // the beging of the job

    mutex_unlock(mutex_jobs);

    // abnormal_wakeup(&cp); // WAKEUP TASKLET
    abnormal_wakeup_one(&cp); // WAKEUP TASKLET
    return new_jid;
  }

  mutex_unlock(mutex_jobs);

  return JOB_NO_SPACE_LEFT;
}

int join_job(void)
{
  uint8_t all_end = 0;

  mutex_lock(mutex_jobs);
  while (!all_end)
  {
    all_end = 1;
    for (int i = 0; i < JOB_PER_PROCESS; i++)
    {
      if (jobs[i].state == FINISHED)
      {
        jobs[i].state = FINISHED_NO_FREE;
        uint8_t jid_finish = jobs[i].jid;

        mutex_unlock(mutex_jobs);

        return jid_finish;
      }
      else
        all_end = 0;
    }
    sleep(&jobs[0], NULL, mutex_jobs);
  }

  mutex_unlock(mutex_jobs);

  return 0;
}
extern void first_swap_context(struct flow_context **old,
                               struct flow_context *new, int first_pc);
void swap(unsigned int job_idx, uint8_t first)
{
  jobs[job_idx].state = RUNNING;
  mutex_unlock(mutex_jobs);
  cur_jobs[me_new()] = job_idx;
  unsigned int time = 0;
  //__builtin_time_r(time);
  __asm__ volatile("\ttime %[time]\n" : [time] "=r"(time));
  jobs[job_idx].time = time;

  if (first){
    print_debug(6,0);
    first_swap_context(&fc_scheduler_job[me_new()], jobs[job_idx].fc,
                       jobs[job_idx].fc->r21);
  }
  else
  {
    swap_context(&fc_scheduler_job[me_new()], jobs[job_idx].fc);
  }

  mutex_lock(mutex_jobs);
}

uint8_t check_time_process()
{
  unsigned int time = 0;
  //__builtin_time_r(time);
  __asm__ volatile("\ttime %[time]\n" : [time] "=r"(time));
  if (time - processs[cur_process_index].timer > PROCESS_QUANTOM){

    return 1;

  }
    
  return 0;
}

uint8_t all_end_or_waiting __attribute__((section(".data"))) = 0;
// uint32_t last __attribute__((section(".data"))) = 0;
int scheduler_jobs(void)
{

  unsigned int last = 0;
  uint8_t stop = 0, ready;

  // int a = 0; // remove this

  sp_wait(&cp);
  for (;;)
  {
    mutex_lock(mutex_jobs);
    for (; last < processs[cur_process_index].nb_jobs && !stop; last++)
    {

      if (jobs[last].state == PAUSED)
        ready = 0;
      else if (jobs[last].state == READY)
        ready = 1;
      else
      {
        continue;
      }

      swap(last, ready); // swap结束以后
      all_end_or_waiting =
          0; // the detection of all_end can be more fast but keep it simple
      stop = check_time_process();
    }
    stop = check_time_process();
    last = 0;
    mutex_unlock(mutex_jobs);
    if (all_end_or_waiting || stop)
    {

      // barrier_wait(&barrier_jobs); // wait the end of everyone before quit

      if (sp_wait(&cp) != 0)
        continue;
      //__asm__ volatile("\tmove r15, id\n");//r15记录的me可能会发生变化
      if (me_new() == 0){
        unsigned int time = 0;
        //__builtin_time_r(time);
        __asm__ volatile("\ttime %[time]\n" : [time] "=r"(time));
        int interval=time - processs[cur_process_index].timer ;
        if (interval> PROCESS_QUANTOM){
          print_debug(interval,7);
        }
        return all_end_or_waiting; // return the all_end_or_waiting if it is
                                   // 1 mark the process at waiting
      }
      // barrier_wait(&barrier_jobs);
      sp_wait(&cp); // wait before restart the loop
      // wait the me()==0 to return back to this function

      stop = 0;
    }

    all_end_or_waiting = 1;
  }
}

#endif