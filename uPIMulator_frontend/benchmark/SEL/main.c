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
  if (fthread_id == 0)
  {
    char ok;
    socket_write(sd_host, &ok, 1);
    socket_read(sd_host, &ok, 1);
    if (umram_read(&DPU_INPUT_ARGUMENTS, sizeof(DPU_INPUT_ARGUMENTS), 0) < 0)
      fault_notif();
    
  }

  wait_barrier(&b);
  print_debug(fthread_id, 3);


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
  fthread_id = get_jid();

  // Initialize shared variable
  if (fthread_id == NR_FTHREAD - 1)
    message_partial_count = 0;
  // Barrier
  print_debug(fthread_id, 1);
  wait_barrier(&b);
  print_debug(fthread_id, 2);
  int i = 0;

  for (unsigned int byte_index = base_tasklet;
       byte_index < input_size_dpu_bytes;
       byte_index += BLOCK_SIZE * NR_FTHREAD)
  {
    print_debug(fthread_id, 5);

    // Load cache with current MRAM block
    r = umram_read(cache_A, BLOCK_SIZE, mram_base_addr_A + byte_index);
    print_debug(fthread_id, 6);
    if (r != 0)
    {
      fault_notif();
    }

    // SELECT in each tasklet
    uint32_t l_count = select(cache_B, cache_A); // In-place or out-of-place?

    // Sync with adjacent tasklets
    print_debug(fthread_id, 1);
    uint32_t p_count = handshake_sync(l_count, fthread_id);
    print_debug(fthread_id, 2);

    // Barrier
    // wait_barrier(&b);
    print_debug(fthread_id, 1);
    active_wait_barrier(&a);
    print_debug(fthread_id, 2);

    // Write cache to current MRAM block
    print_debug(fthread_id, 5);
    r = umram_write(cache_B, l_count * sizeof(T),
                    mram_base_addr_B +
                        (message_partial_count + p_count) * sizeof(T));
    print_debug(fthread_id, 6);

    if (r != 0)
    {
      fault_notif();
    }

    // wait_barrier(&b);
    print_debug(fthread_id, 1);
    active_wait_barrier(&a);
    print_debug(fthread_id, 2);

    // Total count in this DPU
    if (fthread_id == NR_FTHREAD - 1)
    {
      result->t_count = message_partial_count + p_count + l_count;
      message_partial_count = result->t_count;
    }
    i++;
  }
  print_debug(fthread_id, 1);
    wait_barrier(&b);
    print_debug(fthread_id, 2);
 

  if (fthread_id == 0)
  {
    print_debug(fthread_id, 5);
    r = umram_write(DPU_RESULTS, sizeof(dpu_results_t) * NR_FTHREAD,
                    sizeof(dpu_arguments_t) + DPU_INPUT_ARGUMENTS.size);
    print_debug(fthread_id, 6);

    if (r != 0)
    {
      fault_notif();
    }
    print_debug(fthread_id, 4);
    char ok;
    socket_write(sd_host, &ok, 1);
    socket_read(sd_host, &ok, 1);
    
  }
  print_debug(fthread_id, 4);
  wait_barrier(&b);
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