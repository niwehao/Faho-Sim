/*
 * Reduction with multiple tasklets
 *
 */
#include "stdsync.h"
#include "support/common.h"
#include <stdint.h>

__buffer_aligned dpu_arguments_t DPU_INPUT_ARGUMENTS;
__buffer_aligned dpu_results_t DPU_RESULTS[NR_FTHREAD];
int sd_host;
#define CHK(op)      \
  do                 \
  {                  \
    if (op != 0)     \
    {                \
      debug(#op);    \
      exit_proc(-1); \
    }                \
  } while (0)

// Array for communication between adjacent tasklets
T message[NR_FTHREAD];

// Reduction in each tasklet
static T reduction(T *input, unsigned int l_size)
{
  T output = 0;
  for (unsigned int j = 0; j < l_size; j++)
  {
    output += input[j];
  }
  return output;
}

struct barrier b;
// main_kernel1
void main1()
{
  unsigned int fthread_id = get_jid();
  if (fthread_id == 0)
  {
    char ok;
    socket_write(sd_host, &ok, 1);
    socket_read(sd_host, &ok, 1);
    if (umram_read(&DPU_INPUT_ARGUMENTS, sizeof(DPU_INPUT_ARGUMENTS), 0) < 0)
      exit_proc(3);
  }
  print_debug(fthread_id, 1);
  wait_barrier(&b);
  print_debug(fthread_id, 2);

  // int i = 0;
  // Barrier

  dpu_results_t *result = &DPU_RESULTS[fthread_id];
  // #if PERF && !PERF_SYNC
  //   result->cycles = 0;
  //   perfcounter_cycles cycles;
  //   timer_start(&cycles); // START TIMER
  // #endif

  uint32_t input_size_dpu_bytes =
      DPU_INPUT_ARGUMENTS.size; // Input size per DPU in bytes

  // Address of the current processing block in MRAM
  uint32_t base_tasklet = fthread_id << BLOCK_SIZE_LOG2;
  uint32_t mram_base_addr_A = (uint32_t)sizeof(DPU_INPUT_ARGUMENTS);

  // Initialize a local cache to store the MRAM block
  T *cache_A = (T *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);

  // Local count
  T l_count = 0;

  for (unsigned int byte_index = base_tasklet;
       byte_index < input_size_dpu_bytes;
       byte_index += BLOCK_SIZE * NR_FTHREAD)
  {

    // Bound checking
    uint32_t l_size_bytes = (byte_index + BLOCK_SIZE >= input_size_dpu_bytes)
                                ? (input_size_dpu_bytes - byte_index)
                                : BLOCK_SIZE;

    // Load cache with current MRAM block

    CHK(umram_read(cache_A, l_size_bytes, (mram_base_addr_A + byte_index)));

    // Reduction in each tasklet
    l_count += reduction(cache_A, l_size_bytes >> DIV);
  }
  //print_debug(l_count,3);

  // Reduce local counts
  message[fthread_id] = l_count;


  print_debug(fthread_id, 1);
  wait_barrier(&b);
  print_debug(fthread_id, 2);

  if (fthread_id == 0)
  {
    print_debug(message[0],6);
    for (unsigned int each_tasklet = 1; each_tasklet < NR_FTHREAD;
         each_tasklet++)
    {
      message[0] += message[each_tasklet];
      print_debug(message[each_tasklet],3);
      print_debug(message[0],4);
    }
    result->t_count = message[fthread_id];
    print_debug(message[0],5);

    CHK(umram_write(DPU_RESULTS, sizeof(DPU_RESULTS),
                    input_size_dpu_bytes +
                        sizeof(dpu_arguments_t))); // comment tranformer la var
                                                   // input_size_dpu_8bytes

    char ok;
    socket_write(sd_host, &ok, 1);
    socket_read(sd_host, &ok, 1);
  }
  wait_barrier(&b);
}

int main(void)
{
  print_debug(7, 0); // end of switch context
  sd_host = socket_open(0);
  // CHK(umram_read(&DPU_INPUT_ARGUMENTS, sizeof(DPU_INPUT_ARGUMENTS), 0));
  init_barrier(&b, NR_FTHREAD);
  for (int i = 0; i < NR_FTHREAD - 1; i++)
    create_job(main1);
  main1();

  for (int i = 0; i < NR_FTHREAD - 1; i++)
    join_job();

  return 0;
}