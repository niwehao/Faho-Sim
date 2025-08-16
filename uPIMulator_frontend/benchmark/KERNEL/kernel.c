// #include <mram.h>
#include "kernel.h"
#include "custom_barrier.h"
#include "jobs.h"
#include "sync.h"
#include "inode.h"
#include "syscall.h"
#include <perfcounter.h>
extern void preemption();
__mram_ptr struct kernel_info
    begin_mram; // At 0x0 addr in mram, used by the API K1-K2

extern void boot_me(void);

// char __user_space_wram[WRAM_MAX_PROCESS] __attribute__((section(".data"))) =
//     {}; // reserved for the user, data of kernel will be link after.

// unsigned int nb_process __attribute__((section(".data"))) = 0;

uint8_t __attribute__((section(".atomic"))) __atomic_bit_mutex_mutex_printk;
mutex_id_t mutex_printk __attribute__((section(".data"))) = 0;
uint8_t __attribute__((section(".atomic"))) __atomic_bit_mutex_sp;
uint8_t __attribute__((section(".atomic"))) __atomic_bit_mutex_mutex_flag;
mutex_id_t mutex_flag __attribute__((section(".data"))) = 0;
uint8_t __attribute__((section(".atomic"))) __atomic_bit_mutex_mutex_l;
mutex_id_t mutex_l __attribute__((section(".data"))) = 0;
uint8_t __attribute__((section(".atomic"))) __atomic_bit_mutex_mutex_jobs;
mutex_id_t mutex_jobs __attribute__((section(".data"))) = 0;
uint8_t __attribute__((section(".atomic"))) __atomic_bit_mutex_mutex_sockets;
mutex_id_t mutex_sockets __attribute__((section(".data"))) = 0;
uint8_t __attribute__((section(".atomic"))) __atomic_bit_mutex_mutex_mram;
mutex_id_t mutex_mram __attribute__((section(".data"))) = 0;
uint8_t __attribute__((section(".atomic"))) __atomic_bit_mutex_mutex_sbrk;
mutex_id_t mutex_sbrk __attribute__((section(".data"))) = 0;
uint8_t __attribute__((section(".atomic"))) __atomic_bit_mutex_mutex_inode;
mutex_id_t mutex_inode __attribute__((section(".data"))) = 0;


struct custom_barriere cp __attribute__((section(".data"))) = {};
struct custom_barriere cp_2 __attribute__((section(".data"))) = {};
__host struct process processs[MAX_PRG]
    __attribute__((section(".dpu_host"))) // process info
    = {};

volatile unsigned int cur_process_index __attribute__((section(".data"))) =
    0; // the index (in processs) of the running process
volatile unsigned int ifpreempt __attribute__((section(".data"))) =
    0;
struct flow_context *saved_fc_stop __attribute__((section(".data"))) =
    NULL; // flow context to stop/resume the dpu

// Info accecible by the host
__host unsigned int dpu_id = 0;
// __host unsigned int is_resume = 0; // during boot (Addr 0 in IRAM) check if
// the dpu need to resume it execution or not
__host unsigned int log_w = 0; // the offset to write the log

/*
Write int debug
*/
void printk_int(int i) {
  if (log_w + 8 > SIZE_BLOCK)
    return;
  mutex_lock(mutex_printk);
  __dma_aligned int buf[2] = {1, i};
  // write_inode(1, buf, 8, log_w);
  inode_operation(1, buf, 8, log_w, INODE_WRITE);
  log_w += 8;
  set_flag(NEW_LOG);
  mutex_unlock(mutex_printk);
}

__dma_aligned char buf_aligned[128] __attribute__((section(".data"))) = {};
/*
Write message debug str write in buf.
*/
void printk(char *buf) {

  int size = 0;
  char *buf_calc = buf;
  while ((*buf_calc) != '\0') {
    buf_calc++;
    size++;
  }
  if (log_w + size > SIZE_BLOCK)
    return;
  uint8_t i_aligned = 0;
  mutex_lock(mutex_printk);
  for (int i = 0; i < size; i++) {
    buf_aligned[i_aligned] = buf[i];
    i_aligned++;
    if (i_aligned == 128) {
      // write_inode(1, buf_aligned, 128, log_w);
      inode_operation(1, buf_aligned, 128, log_w, INODE_WRITE);
      log_w += 128;
      i_aligned = 0;
    }
  }
  while ((i_aligned % 8) != 0) {
    buf_aligned[i_aligned] = '\0';
    i_aligned++;
  }
  // write_inode(1, buf_aligned, i_aligned, log_w);
  inode_operation(1, buf_aligned, i_aligned, log_w, INODE_WRITE);
  log_w += i_aligned;

  set_flag(NEW_LOG);

  mutex_unlock(mutex_printk);
}

int read_flags() {
  mutex_lock(mutex_flag);
  struct kernel_info ki;
  mram_read((__mram_ptr void const *)(MRAM_OFFSET), &ki, sizeof(ki));
  mutex_unlock(mutex_flag);
  return ki.flag1;
}

/*
overwrite the flags
*/
void write_flags(unsigned int flag) {
  mutex_lock(mutex_flag);
  struct kernel_info ki;
  ki.flag1 = flag;
  mram_write(&ki, (__mram_ptr void *)(MRAM_OFFSET), sizeof(ki));
  mutex_unlock(mutex_flag);
}

void set_flag(unsigned int flag1) {
  mutex_lock(mutex_flag);
  struct kernel_info ki;
  mram_read((__mram_ptr void const *)(MRAM_OFFSET), &ki, sizeof(ki));
  ki.flag1 = ki.flag1 | flag1;

  mram_write(&ki, (__mram_ptr void *)(MRAM_OFFSET), sizeof(ki));
  mutex_unlock(mutex_flag);
}

int sbrk(int n) {
  int ret;
  mutex_lock(mutex_sbrk);
  if (n > 0) { // Increases
    ret = WRAM_FULL;
    if (processs[cur_process_index].prg.size_data + n >=
        WRAM_MAX_PROCESS - 0x100) // 0x100 for security ~~~ mouai
      goto err;                   // WARM FULL

    processs[cur_process_index].prg.size_data += n;
  } else if (n < 0) { // Decreases
    ret = WRAM_EMPTY;
    if (processs[cur_process_index].prg.size_data +
            n < // regarder peut être qi on a deja créer des jobs ou passi on en
                // a deja créer alors faire echouer ceci. -> donc pas de section
                // critique
        processs[cur_process_index].prg.off_stack)
      goto err;
    processs[cur_process_index].prg.size_data += n;//size_data本身就有栈
  }
  ret = processs[cur_process_index].prg.size_data+WRAM_OFFSET;//因为有偏移
  
err:
  if(ret<0){
    fault_notif();
  }
  mutex_unlock(mutex_sbrk);
  return ret;
}

/*
 Store the process info in the MRAM. In this way K1 can see the ending of the
 process.
*/
/* void write_process_mram(unsigned int index) {
  mram_write(&processs[index], (__mram_ptr void *)(processs[index].off_set_prg),
             sizeof(struct process));
} */

/*
When a process will execute it last own return statement, it will be jump here.
This function catch the end of the process.
Also catch the return value.
*/
int __end_process(int ret) {
  mutex_lock(mutex_jobs);
  processs[cur_process_index].state = FINISHED;
  processs[cur_process_index].end_value = ret;
  set_flag(PROCESS_END);
  // write_process_mram(cur_process_index);

  /* for (int i = 0; i < MAX_SD; i++) // close socket which is still open   -->
  do by K1
  {
    socket_close(i);
  } */

  for (int i = 0; i < processs[cur_process_index].nb_jobs;
       i++) // end all other jobs
    jobs[i].state = FINISHED;

  mutex_unlock(mutex_jobs);

  swap_context(&jobs[0].fc, fc_scheduler_job[me_new()]);
  // never reach
  halt();
}

/*
mram_read cannot read more than 2048, this function permit to outperform this.
Do not check mram alignement
*/
void load_big_blocks(__mram_ptr void const *mram_place, void *wram_place,
                     size_t size) // mram_read cannot write more than 2048
{
  unsigned int i = 0;
  for (; i < size >> 11; i++) {                                      // / 2048
    mram_read(mram_place + (i << 11), wram_place + (i << 11), 2048); // *2048
  }
  if (size & 2047) // %% 2048
    mram_read(mram_place + (i << 11), wram_place + (i << 11), size & 2047);
}

/*
mram_read cannot write more than 2048, this function permit to outperform this.
Do not check mram alignement
*/
void store_big_blocks(void *wram_place, __mram_ptr void *mram_place,
                      size_t size) {
 
  unsigned int i = 0;
  for (; i < size >> 11; i++) {
    mram_write(wram_place + (i << 11), mram_place + (i << 11), 2048);
  }
  if (size & 2047)
    mram_write(wram_place + (i << 11), mram_place + (i << 11), size & 2047);
}

/*
  Load the memories (IRAM and WRAM) of the process from the MRAM (refer by it
  inode (data/text))
*/
void load_prg_memory(unsigned int prc_ind) {
  struct prg *p = &processs[prc_ind].prg;
  print_debug(2,0);

  load_big_blocks((__mram_ptr void const *)((p->inode_data * SIZE_BLOCK)+MRAM_OFFSET),
                  (void *)(0X0+WRAM_OFFSET), p->size_data);
  print_debug(3,0);

  uint32_t temp = p->size_text;

  // printk_int(p->inode_data);

  uint32_t off = 16;
  print_debug(4,0);
  while (temp >= 0x800) { // write by slot of 255 1000 0000 0000 2048=256*8

    temp -= 0x800;
    uint32_t ra = off | (0xff << 24);//15*16+15=255 自带1个数据  255+1=256 256>>3=0x800

    __asm__ volatile( // there is no lib fun for IRAM data trasnfert so use the
                      // ldmai
        "\tldmai %[ra], %[mram_place], 0\n"
        :
        : [ra] "r"(ra), [mram_place] "r"(p->inode_text * SIZE_BLOCK + off));
    off += 0x800;
  }
  uint32_t ra = off | (((temp-8) >> 3) << 24);//高位存大小低位存偏移
  __asm__ volatile( // there is no lib fun forIRAM data trasnfert so use the
                    // ldmai
      "\tldmai %[ra], %[mram_place], 0\n"
      :
      : [ra] "r"(ra), [mram_place] "r"(p->inode_text * SIZE_BLOCK + off));
  print_debug(5,0);
}

/*
  Store the WRAM of the process in it inode data
*/
void save_wram_process(unsigned int prc_ind) {
  struct prg *p = &processs[prc_ind].prg;
  store_big_blocks((void *)(0x0+WRAM_OFFSET),
                   (__mram_ptr void *)((p->inode_data * SIZE_BLOCK)+
                       MRAM_OFFSET),
                   p->size_data);
}

/*
Initiate the program info. After this the process is ready to be launch, and
swap the context of scheduler and the new process
*/
void launch_proc(unsigned int prc_idx, uint8_t ready) {
  // load_prg_memory(prc_idx);
  // load jobs context
  processs[prc_idx].state = RUNNING;
  // printk_int(prc_idx);

  cur_process_index = prc_idx;

  if (ready) {
    for (int i = 0; i < JOB_PER_PROCESS; i++)
      jobs[i].state = NONE;
    processs[prc_idx].nb_jobs = 1;

    jobs[0].fc = (struct flow_context *)processs[prc_idx].begin_stack;
    jobs[0].fc->r22 = (int)jobs[0].fc;
    jobs[0].fc->r23 = (int)__end_process;
    jobs[0].fc->r21 =
        processs[prc_idx].end_value; // at this moment end_value contain the
                                     // entry point (main) of the process
    jobs[0].state = READY;
    jobs[0].fc->r24=(int)preemption;
    jobs[0].jid = 0;
  }
  unsigned int time = 0;
  //__builtin_time_r(time);
   __asm__ volatile("\ttime %[time]\n" : [time] "=r"(time));
  processs[prc_idx].timer = time;
  if(ifpreempt!=0){
    fault_notif();
  }
  int all_end_or_waiting = scheduler_jobs();
  if (all_end_or_waiting && processs[prc_idx].state != FINISHED) {
    processs[prc_idx].state = WAITING;
  }
  // all of its jobs is ended or waiting so

  // do not luanch it until the wakeup
  if (processs[prc_idx].state == RUNNING)
    processs[prc_idx].state = PAUSED;
  /*save_wram_process(cur_process_index);
  // mram_write(jobs, job_mram.j[prc_idx], sizeof(jobs));
  mram_write(jobs,
             (__mram_ptr void *)sizeof(struct kernel_info) +
                 prc_idx * (JOB_PER_PROCESS * sizeof(struct job)),
             sizeof(jobs)); */
}

/*
  Stop the DPU.
  When the DPU will be boot back it will continue the function (after stop)
*/
void stop_dpu() {
  // printk_int(-2);
  // printk_int((int)jobs[0].sync_addr);
  stop_me();
  //resume_me(saved_fc_stop); // save the context of the current process
  // printk_int(-1);
  // printk_int((int)jobs[0].sync_addr);
  // boot back
  unsigned int a = 15;
  __asm__ volatile("\ttime_cfg %[time], %[trois]\n"
                   :
                   : [time] "r"(a), [trois] "r"(3));

#ifndef DISABLE_SOCKET
  int flags = read_flags();
  write_flags(0);            // clear all the flags
                             /*   if (flags & NEW_SOCKET)
                                 wakeup(&sync_extern_socket, 0, 0); // wakeup all the process wich are
                                                                    // wainting for a extern_socket
                                creation */
   //print_debug(flags,0);

  if (flags & SOCKET_UPDATE) // The K1 just notify for writing (K1->K2)
                             // operation, not for reading (K2->K1).
    wakeup_sleepy_socket();
#endif
}

/*
Check if the DPU_QUANTOM is over
*/
void check_timer_stop() {
  unsigned int time = 0;
  //__builtin_time_r(time);
   __asm__ volatile("\ttime %[time]\n" : [time] "=r"(time));
  if (time > QUANTOM_STOP_DPU) {
    stop_dpu();
  }
}

/*
Find a runable process (state READY or PAUSED),
*/
int scheduler(void) {

  char all_end = 0;
  unsigned int idx = 0, loaded_idx = 0;
  unsigned int pid_loaded = 0,
               cur_pid; // the process id which is loaded in IRAM/MRAM
                        // (avoid to load unload at each time)
  for (;;) {
    for (; idx < MAX_PRG; idx++) {
      //check_timer_stop(); // uncomment
      char ready;
      if (processs[idx].state == READY) {
        ready = 1;
      } else if (processs[idx].state == PAUSED)
        ready = 0;
      else
        continue;
      all_end = 0;
      if (me_new() != 0)
        halt();

      cur_pid = processs[idx].pid;

      if (pid_loaded !=
          cur_pid) { // if ready load anyway the process (avoid the case that
                     // a process finish and diriectly a new one takes it
                     // place in process tab)
        if (processs[loaded_idx].pid == pid_loaded) {
          print_debug(0,0);
          save_wram_process(loaded_idx);//潜在的bug,如果分配的内存大于data
          print_debug(1,0);
          // mram_write(jobs, job_mram.j[prc_idx], sizeof(jobs));
        }

        load_prg_memory(idx);
        loaded_idx = idx;
        pid_loaded = cur_pid;
      }

      mram_read((__mram_ptr void const *)sizeof(struct kernel_info) +
                    idx * (JOB_PER_PROCESS * sizeof(struct job))+MRAM_OFFSET,
                jobs, sizeof(jobs)); // launch the jobs (each time because can
                                     // be modify by other process)

      launch_proc(idx, ready);
      mram_write(jobs,
                 (__mram_ptr void *)sizeof(struct kernel_info) +
                     idx * (JOB_PER_PROCESS * sizeof(struct job))+MRAM_OFFSET,
                 sizeof(jobs));
    }
    idx = 0;
    if (all_end) {
      stop_dpu(); // No process available to run -> stop the dpu (give back to
                  // K1)
    }
    all_end = 1;
  }
}

/*
Kernel start here after booting.
*/

// BARRIER_INIT(barrier_boot, NR_TASKLETS);
int main(void) {
  read_preemption();
  if (me_new() == 0) {
    cp.mutex = &__atomic_bit_mutex_sp;
    cp.nb = NR_TASKLETS;
    cp.pending = 0;
    cp.ret_val = 0;
    cp_2.mutex = &__atomic_bit_mutex_sp;
    cp_2.nb = NR_TASKLETS;
    cp_2.pending = 0;
    cp_2.ret_val = 0;

    mutex_flag = &__atomic_bit_mutex_mutex_flag;
    mutex_l = &__atomic_bit_mutex_mutex_l;
    mutex_printk = &__atomic_bit_mutex_mutex_printk;
    mutex_jobs = &__atomic_bit_mutex_mutex_jobs;
    mutex_sockets = &__atomic_bit_mutex_mutex_sockets;
    mutex_mram = &__atomic_bit_mutex_mutex_mram;
  } else {
    while (!cp.nb) { // should be volatile maybe
      ;              // wait until the barrier and mutexes are init
    }
    scheduler_jobs();
  }

  // barrier
  // printk_int((int)&barrier_boot);
  // printk(newline2);
  // barrier_wait(&barrier_boot);

  boot_me();
  perfcounter_config(COUNT_CYCLES, true);
  // init_sockets();
  scheduler(); // willl never return

  return 0;
}

/*
Save the context of the current process and swap to the context of the scheduler
*/

/*
Find the index in processs form a role in the same application that the current
process.
*/
int index_from_roleid(unsigned char role) {
  unsigned char my_app_id = processs[cur_process_index].app_id;
  for (unsigned int i = 0; i < MAX_PRG; i++)
    if (processs[i].pid != 0 && processs[i].app_id == my_app_id &&
        processs[i].role == role)
      return i;

  return -1;
}
