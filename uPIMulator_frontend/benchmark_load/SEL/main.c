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
static unsigned int select(T *output, T *input)
{
  unsigned int pos = 0;
  // #pragma unroll
  for (unsigned int j = 0; j < REGS; j++)
  {
    if (!pred(input[j]))
    {

      output[pos] = input[j];
      pos++;
    }
  }
  return pos;
}

struct handshake handshakes[NR_FTHREAD];

// Handshake with adjacent tasklets
static unsigned int handshake_sync(unsigned int l_count,
                                   unsigned int fthread_id)
{
  unsigned int p_count;
  // Wait and read message
  if (fthread_id != 0)
  {
    active_handshake_wait(&handshakes[fthread_id - 1]);
    p_count = message[fthread_id];
  }
  else
    p_count = 0;
  // Write message and notify
  if (fthread_id < NR_FTHREAD - 1)
  {
    message[fthread_id + 1] = p_count + l_count;
    active_handshake_notify(&handshakes[fthread_id]);
  }
  return p_count;
}

struct barrier b;
struct barrier a;

// main_kernel1
void main1()
{
  int r;
  unsigned int fthread_id = get_jid();
  T *cache_A = (T *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);
  T *cache_B = (T *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);
  if (fthread_id == 0)
  {
    char ok;
    socket_write(sd_host, &ok, 1);
    socket_read(sd_host, &ok, 1);
    if (umram_read(&DPU_INPUT_ARGUMENTS, sizeof(DPU_INPUT_ARGUMENTS), 0) < 0)
      fault_notif();
    
  }

  wait_barrier(&b);
  fault_notif();
  print_debug(fthread_id, 3);


  
}

int main(void)
{
  print_debug(7, 0); // end of switch context
  sd_host = socket_open(0);
  // umram_read(&DPU_INPUT_ARGUMENTS, sizeof(DPU_INPUT_ARGUMENTS), 0);
  init_barrier(&b, NR_FTHREAD);
  init_barrier(&a, NR_FTHREAD);
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