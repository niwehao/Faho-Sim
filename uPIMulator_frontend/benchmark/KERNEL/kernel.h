#ifndef KERNEL
#define KERNEL
#include "def.h"


struct flow_context { // the flow context of a process (or the scheduler)
  // invert by 2, probaly for little endien or somethings like this
  int r15;
  int r14;
  int r17;
  int r16;
  int r19;
  int r18;
  int r21;
  int r20;
  int r23;
  int r22;
};

struct prg {           // the content of the program of a process
  uint32_t inode_data; // where the data (WRAM) is store in MRAM
  uint32_t size_data;
  uint32_t inode_text; // where the instruction (IRMA) is store in MRAM
  uint32_t size_text;
  uint32_t off_stack; // where the stack begin (to create the process)
  uint32_t extra_inode;
  uint32_t page_table_entry;
};

struct socket_descriptor;
struct process {
  uint8_t app_id;
  uint8_t role; // the role inside the application
  uint8_t nb_jobs;
  uint32_t pid; // process id
  uint32_t state;
  uint32_t end_value;   // it end value
  uint32_t off_set_prg; // the offset in mram where the prg was found
  uint32_t timer;
  uint32_t begin_stack; // the pointer into it context flow
  struct prg prg;

#ifndef DISABLE_SOCKET
  struct socket_descriptor sd[MAX_SD];
#endif
};


extern struct process processs[MAX_PRG];
extern volatile unsigned int cur_process_index;
// extern __attribute__((aligned(8))) struct job jobs[JOB_PER_PROCESS];
extern uint8_t cur_jobs[NR_TASKLETS];

/**
 * @brief Extend the instruction mram_read for size > 2048
 *
 * @param mram_place
 * @param wram_place
 * @param size
 */
void load_big_blocks(__mram_ptr void const *mram_place, void *wram_place,
                     size_t size);

/**
 * @brief Extend the instruction mram_write for size > 2048
 *
 * @param wram_place
 * @param mram_place
 * @param size
 */
void store_big_blocks(void *wram_place, __mram_ptr void *mram_place,
                      size_t size);

/**
 * @brief Read the flag of the DPU
 *
 * @return int
 */
int read_flags();

/**
 * @brief Write the flag of DPU pass in argument, overwrite previous one
 *
 * @param flags
 */
void write_flags(unsigned int flags);

/**
 * @brief Set the flag of DPU, do a or with the current flag
 *
 * @param flag1
 */
void set_flag(unsigned int flag1);

/**
 * @brief Print in the DPU log the buf, (must terminated with '\0')
 *
 * @param buf
 */
//void printk(char *buf);

/**
 * @brief Print i in the DPU log
 *
 * @param i
 */
//void printk_int(int i);

/**
 * @brief Find the index in process tab of the process which has the role id and
 * the same app id than the caller,
 *
 * @param role
 * @return int
 */
int index_from_roleid(unsigned char role);

/**
 * @brief Increases or decreases the size of the WRAM place of the process and
 * return the new size of the process.In reallity the process can access any
 * WRAM but when it gives back, the correct amount of wramu is save (amount
 * refer by prg.size_data). This function adjust the wram size value of the
 * process, and alloc more inode for data if it is needed. It is return the new
 * size of wram
 *
 * @param n
 * @return int
 */
int sbrk(int n);

// kernelS.S

/**
 * @brief Swap the current context with the new. The current context is save in
 * old. At the end do a 'jump r23' (aka return)
 *
 * @param old
 * @param new
 */
extern void swap_context(struct flow_context **old, struct flow_context *new);

/**
 * @brief Swap the current context with the new. The current context is save in
 * old. At the end do a 'jump first_pc'. Used for the first swap context of new
 * process
 *
 * @param old
 * @param new
 * @param first_pc
 */
extern void first_swap_context(struct flow_context **old,
                               struct flow_context *new, int first_pc);

/**
 * @brief save the current context of the TASKLETS and stop the DPUs -> the
 * resume (made by K1) is  sometimes a boot sometimes restarts after stop
 *
 * @param saved
 */
extern void stop_me(struct flow_context **saved);
//extern void resume(struct flow_context *saved);

extern void resume_me(struct flow_context *saved);

/**
 * @brief End the fProc
 * 
 * @param ret 
 * @return int  
 */

extern uint32_t alloc_mram();
int __end_process(int ret);
#include "socket.h"

#endif