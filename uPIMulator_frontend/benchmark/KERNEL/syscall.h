#ifndef SYSCALL_H
#define SYSCALL_H
#include "kernel.h"
#include "inode.h"
#include "socket.h"
#include "def.h"
#include "jobs.h"
#include "sync.h"
#include <stdint.h>
#include <stdlib.h>

char beg[4] __attribute__((section(".data"))) = "{{{";
char end[4] __attribute__((section(".data"))) = "}}}";

/**
 * @brief Give back to the scheduler_job
 *
 * @return int
 */
/* int yield(void) {
  // check if the timer of job is finnish  ?
  swap_scheduler();
  return 0;
} */

int global __attribute__((section(".data"))) = 0;

/**
 * @brief When a process (user's part) do a syscall, it jumps here. Process do a
 jump 0, and at the addr 0 in IRAM there is a jump syscall setup by the kernel.
 The argument is setup by the user (ABI convention) When a DPU is rebotting is
 also jump here (because it start a 0 addr where there is a jump syscall), but
 in this case the value is set to 0.
 *
 * @param arg1
 * @param arg2
 * @param arg3
 * @param arg4
 * @param value the syscall number
 * @return int
 */
int syscall(unsigned int arg1, unsigned int arg2, unsigned int arg3,
            unsigned int arg4, unsigned int value) {
  (void)arg4;
  if (value == 0)
    return 0;
  unsigned int time = 0;
  uint8_t jobidx = cur_jobs[me()];
  __builtin_time_r(time);

  if (time - jobs[jobidx].time > QUANTOM_JOB) {
    jobs[jobidx].state = PAUSED;
    swap_scheduler();
  }

  /* switch (value) {       switch not possible witout specific linker -> switch
  use memory to jump at the correct location case 1: return yield(); case 2:
    return sbrk(arg1);
  case 3:#endif

    return processs[cur_process_index].pid;
  case 4:
    return processs[cur_process_index].role;
  case 5:
    return processs[cur_process_index].app_id;

  case 6:
    return jobs[cur_jobs[me()]].jid;

  case 10:
    return socket_open(arg1); // lock necessary

  case 11:
    return socket_read(arg1, arg2, arg3); // lock necessary

  case 12:
    return socket_write(arg1, arg2, arg3); // lock necessary

  case 13:
    return socket_close(arg1); // lock necessary O

  case 14:
    // test the addr pass ?
    l = (struct lock *)arg1;
    l->owner = 0;
    return 0;

  case 15:
    // test the addr pass ?
    return lock((struct lock *)arg1);

  case 16:
    // test the addr pass ?
    return unlock((struct lock *)arg1);

  case 17:
    // test the addr pass ?
    return sleep((void *)arg1, (struct lock *)arg2, NULL);

  case 18:
    // test the addr pass ?
    return wakeup((void *)arg1, 1);

  case 20:
    return create_job(arg1);

  case 21:
    return join_job();
  default:
    return UNKNOW_SYSCALL;
  } */

  if (value == 24) {
    return try_lock((struct lock *)arg1);
  }

  if (value == 22 || value == 23) { // place here beacause more often call
    if (arg1 == 0)
      return 0;
    if (((arg2 & 7) != 0))
      return SIZE_LESS_8_OR_NOT_8_MULT;
    if ((arg3 & 7) != 0)
      return OFFSET_NOT_8_ALIGN;

    return chained_inode_operation((void *)arg1, arg2, arg3,
                                   (value == 22) ? INODE_READ : INODE_WRITE);
  }

  if (value == 15) {
    // test the addr pass ?
    return lock((struct lock *)arg1);
  }

  if (value == 16) {
    // test the addr pass ?
    return unlock((struct lock *)arg1);
  }

  if (value == 17) {
    // test the addr pass ?
    return sleep((void *)arg1, (struct lock *)arg2, NULL);
  }
  if (value == 18) {
    // test the addr pass ?
    return wakeup((void *)arg1, 1, 1);
  }

  if (value == 14) {
    // test the addr pass ?
    struct lock *l = (struct lock *)arg1;
    l->owner = -1;
    return 0;
  }

  if (value == 1) // the yield was made before
    return 0;

  // yield(); // schedule back the scheduler if necessary.

  if (value == 2)
    return sbrk(arg1);
  if (value == 3)
    return processs[cur_process_index].pid;

  if (value == 4)
    return processs[cur_process_index].role;
  if (value == 5)
    return processs[cur_process_index].app_id;

  if (value == 6)
    return jobs[jobidx].jid;
  if (value == 7)
    __end_process(arg1);

  if (value == 8) {
    printk(beg);
    printk((char *)arg1);
    printk(end);
    return 0;
  }

  if (value == 9) {
    printk(beg);
    printk_int(arg1);
    // printk_int(global);
    printk(end);
    return 0;
    if (value == 24) {
      return try_lock((struct lock *)arg1);
    }
  }

#ifndef DISABLE_SOCKET
  if (value == 10)
    return socket_open(arg1); // lock necessary

  if (value == 11) {
    return socket_read(arg1, arg2, arg3); // lock necessary
  }
  if (value == 12) {
    return socket_write(arg1, arg2, arg3); // lock necessary
  }
  if (value == 13) {
    return socket_close(arg1); // lock necessary O
  }
#endif

  if (value == 20)
    return create_job(arg1);

  if (value == 21)
    return join_job();

  return UNKNOW_SYSCALL;
}
#endif