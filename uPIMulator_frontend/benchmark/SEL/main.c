/*
 * Select with multiple tasklets
 *
 */
#include "stdsync.h"
#include <defs.h>
#include <stdint.h>
#include <stdbool.h>
#include "support/common.h"

// #define CHK(op)                                                                \
//   do {                                                                         \
//     if (op != 0)                                                               \
//       exit_proc(op);                                                           \
//   } while (0)
// #define CHK(op) op
int sd_host;

__buffer_aligned dpu_arguments_t DPU_INPUT_ARGUMENTS;
__buffer_aligned dpu_results_t DPU_RESULTS[NR_FTHREAD];

// Array for communication between adjacent tasklets
uint32_t message[NR_FTHREAD];
uint32_t message_partial_count;

// SEL in each tasklet
static unsigned int select(T *output, T *input) {
  unsigned int pos = 0;
// #pragma unroll
  for (unsigned int j = 0; j < REGS; j++) {
    if (!pred(input[j])) {

      output[pos] = input[j];
      pos++;
    }
  }
  return pos;
}

struct handshake handshakes[NR_FTHREAD];


// Handshake with adjacent tasklets
static unsigned int handshake_sync(unsigned int l_count,
                                   unsigned int fthread_id) {
  unsigned int p_count;
  // Wait and read message
  if (fthread_id != 0) {
    active_handshake_wait(&handshakes[fthread_id - 1]);
    p_count = message[fthread_id];
  } else
    p_count = 0;
  // Write message and notify
  if (fthread_id < NR_FTHREAD - 1) {
    message[fthread_id + 1] = p_count + l_count;
    active_handshake_notify(&handshakes[fthread_id]);
  }
  return p_count;
}

struct barrier b;

// main_kernel1
void main1() {
  int r;
  int tasklet_id = get_jid();
  wait_barrier(&b);
  if (tasklet_id == 0)
  {
    char ok;
    socket_write(sd_host, &ok, 1);
    socket_read(sd_host, &ok, 1);
    if (umram_read(&DPU_INPUT_ARGUMENTS, sizeof(DPU_INPUT_ARGUMENTS), 0) < 0)
      fault_notif();
  }
  wait_barrier(&b);
  unsigned int fthread_id = get_jid();

  dpu_results_t *result = &DPU_RESULTS[fthread_id];

  uint32_t input_size_dpu_bytes = DPU_INPUT_ARGUMENTS.size;

  // Address of the current processing block in MRAM
  uint32_t base_tasklet = fthread_id << BLOCK_SIZE_LOG2;
  uint32_t mram_base_addr_A = sizeof(dpu_arguments_t);
  uint32_t mram_base_addr_B = sizeof(dpu_arguments_t) + input_size_dpu_bytes +
                              sizeof(dpu_results_t) * NR_FTHREAD;

  // Initialize a local cache to store the MRAM block
  T *cache_A = (T *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);
  T *cache_B = (T *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);

  // Initialize shared variable
  if (fthread_id == NR_FTHREAD - 1)
    message_partial_count = 0;
  // Barrier
  wait_barrier(&b);
  int i = 0;

  for (unsigned int byte_index = base_tasklet;
       byte_index < input_size_dpu_bytes;
       byte_index += BLOCK_SIZE * NR_FTHREAD) {

    // Load cache with current MRAM block
    r=umram_read(cache_A, BLOCK_SIZE, mram_base_addr_A + byte_index);
    if(r!=0){
      print_debug(r,0);
      fault_notif();
    }
   

    // SELECT in each tasklet
    uint32_t l_count = select(cache_B, cache_A); // In-place or out-of-place?

    // Sync with adjacent tasklets
    uint32_t p_count = handshake_sync(l_count, fthread_id);

    // Barrier
    // wait_barrier(&b);
    active_wait_barrier(&b);
    

    // Write cache to current MRAM block
    r=umram_write(cache_B, l_count * sizeof(T),
                    mram_base_addr_B +
                        (message_partial_count + p_count) * sizeof(T));

    if(r!=0){
      print_debug(r,0);
      fault_notif();
    }
      

    // wait_barrier(&b);
    active_wait_barrier(&b);

    // Total count in this DPU
    if (fthread_id == NR_FTHREAD - 1) {
      result->t_count = message_partial_count + p_count + l_count;
      message_partial_count = result->t_count;
    }
    i++;
    
  }
  wait_barrier(&b);
  if (fthread_id == 0)
  {
    r=umram_write(DPU_RESULTS, sizeof(dpu_results_t) * NR_FTHREAD,
                  sizeof(dpu_arguments_t) + DPU_INPUT_ARGUMENTS.size);

    if(r!=0){
      print_debug(r,0);//编译代码存在问题,会导致
      fault_notif();
    }
    char ok;
    socket_write(sd_host, &ok, 1);
    socket_read(sd_host, &ok, 1);
  }
  wait_barrier(&b);
}

int main(void) {
  sd_host = socket_open(0);
  //umram_read(&DPU_INPUT_ARGUMENTS, sizeof(DPU_INPUT_ARGUMENTS), 0);
  init_barrier(&b, NR_FTHREAD);
  for (int i = 0; i < NR_FTHREAD; i++)
    init_handshake(&handshakes[i]);
  // init handckecks
  for (int i = 0; i < NR_FTHREAD - 1; i++)
    create_job(main1);

  main1();

  for (int i = 0; i < NR_FTHREAD - 1; i++)
    join_job();
  
  return 0;
}