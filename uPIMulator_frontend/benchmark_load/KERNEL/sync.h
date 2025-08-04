#ifndef SYNC
#define SYNC

#include "def.h"
#include "kernel.h"
#include "custom_barrier.h"



extern mutex_id_t mutex_jobs;
extern unsigned char *mutex_l;
extern char tab[];
extern  struct custom_barriere cp;

struct lock {
  int owner; // if !=-1 : it is owned by owner (job index)
};


/**
 * @brief Try to lock the lock, if sucess return 0 and the lock is lock else 1 ansd the lock isn't.
 * 
 * @param l Pointer to the lock structure.
 * @return int 0 if the lock is a sucess 1 else.
 */
int try_lock(struct lock *l);

/**
 * @brief Lock the lock if possible; otherwise, put the jobs in a WAITING state.
 *
 * @param l Pointer to the lock structure.
 * @return int 0 if the lock is successful.
 */
int lock(struct lock *l);

/**
 * @brief Unlock the lock and resume one waiting job.
 * Does not check if the job is the correct owner of the lock.
 *
 * @param l Pointer to the lock structure.
 * @return int 0 if the unlock is successful.
 */
int unlock(struct lock *l);

/**
 * @brief Put the job in SLEEPING mode until another job wakes it up.
 *
 * @param sync_addr The address that will be matched for the wakeup.
 * @param l Potential lock that will be unlocked.
 * @param hard_mutex Potential hardware lock that will be unlocked.
 * @return int Status code indicating the result of the operation.
 */
int sleep(void *sync_addr, struct lock *l, unsigned char *const hard_mutex);
#include "jobs.h"
/**
 * @brief Wake up jobs that are sleeping on sync_addr.
 * This function can be called by K2 during reboot.
 *
 * @param sync_addr The address used to match the jobs to wake up.
 * @param check_cur_only_cur_process If set, only wake up the jobs of the
 * current process.
 * @param resume_tasklet If set, resume all TASKLETS, after wakeup.
 * @return int Status code indicating the result of the operation.
 */
int wakeup(void *sync_addr, uint8_t check_cur_only_cur_process,
           uint8_t resume_tasklet);
int try_lock(struct lock *l) {
  uint8_t job_idx = cur_jobs[me_new()];

  mutex_lock(mutex_l); // use hardware lock to avoid race condition
  mutex_lock(mutex_jobs);

  if (l->owner != -1) { 
    mutex_unlock(mutex_jobs);
    mutex_unlock(mutex_l);
    return 1;
  } else {
    l->owner = job_idx;
    mutex_unlock(mutex_jobs);
    mutex_unlock(mutex_l);
    return 0;
  }
}

int lock(struct lock *l) {
  
  uint8_t job_idx = cur_jobs[me_new()];

  mutex_lock(mutex_l); // use hardware lock to avoid race condition
  mutex_lock(mutex_jobs);

  if (l->owner != -1) { // another job has the lock, put it self in WAITING
                        // state
    jobs[job_idx].state = WAITING;
    jobs[job_idx].sync_addr = (uint32_t)l;

    // unlock
    mutex_unlock(mutex_jobs);
    mutex_unlock(mutex_l);
    swap_scheduler();
    //__asm__ volatile("\tmove r16, id\n");
    return 0;
  } else {
    l->owner = job_idx;
    mutex_unlock(mutex_jobs);

    mutex_unlock(mutex_l);
    return 0;
  }
}

int unlock(struct lock *l) {
  mutex_lock(mutex_l);
  mutex_lock(mutex_jobs);

  l->owner = -1; // no check if he is the correct owner
  for (unsigned int i = 0; i < processs[cur_process_index].nb_jobs; i++) {
    if (jobs[i].state == WAITING && jobs[i].sync_addr == (uint32_t)l) {
      l->owner = i;
      jobs[i].state = PAUSED;
      mutex_unlock(mutex_l);
      mutex_unlock(mutex_jobs);
      abnormal_wakeup_one(&cp); // wakeup one tasketlet
      // WAKEUP TASKLET

      return 0;
    }
  }
  mutex_unlock(mutex_jobs);
  mutex_unlock(mutex_l);

  return 0;
}

int sleep(void *sync_addr, struct lock *l, unsigned char *const hard_mutex) {

  uint8_t job_idx = cur_jobs[me_new()];
  jobs[job_idx].state = SLEEPING;
  jobs[job_idx].sync_addr = (uint32_t)sync_addr;

  if (l)
    unlock(l);
  if (hard_mutex) {
    mutex_unlock(hard_mutex);
  }
  swap_scheduler();
  //__asm__ volatile("\tmove r16, id\n");
  if (l)
    lock(l);
  if (hard_mutex) {
    mutex_lock(hard_mutex);
  }

  return 0;
}

int wakeup(void *sync_addr, uint8_t check_cur_only_cur_process,
           uint8_t resume_tasklet) {
  for (unsigned int p = 0; p < MAX_PRG; p++) {
    mutex_lock(mutex_jobs);
    if (!check_cur_only_cur_process)
      mram_read((__mram_ptr void const *)sizeof(struct kernel_info) +
                    p * (JOB_PER_PROCESS * sizeof(struct job))+MRAM_OFFSET,
                jobs, sizeof(jobs));
    else if (p != cur_process_index)
      continue;
    for (unsigned int i = 0; i < processs[p].nb_jobs; i++) {
      if (jobs[i].state == SLEEPING &&
          jobs[i].sync_addr == (uint32_t)sync_addr) {
        jobs[i].state = PAUSED;

        if (!check_cur_only_cur_process && processs[p].state == WAITING) {
          processs[p].state =
              PAUSED; // also wakeup the process if it was mark as waiting}
        }
      }
    }
    mutex_unlock(mutex_jobs);
    if (check_cur_only_cur_process)
      goto end;
    mram_write(jobs,
               (__mram_ptr void *)sizeof(struct kernel_info) +
                   p * (JOB_PER_PROCESS * sizeof(struct job))+MRAM_OFFSET,
               sizeof(jobs));
  }

  mram_read((__mram_ptr void const *)sizeof(struct kernel_info) +
                cur_process_index * (JOB_PER_PROCESS * sizeof(struct job))+MRAM_OFFSET,
            jobs, sizeof(jobs));

end:
  if (resume_tasklet)
    abnormal_wakeup(&cp);
  return 0;
}

#endif