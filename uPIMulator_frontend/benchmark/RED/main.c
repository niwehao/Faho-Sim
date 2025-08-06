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
static T __attribute__((noinline)) reduction(T *input, unsigned int l_size)
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
  wait_barrier(&b);
  print_debug(fthread_id, 3);
 

 
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

#if !PERF_SYNC // COMMENT OUT TO COMPARE SYNC PRIMITIVES (Experiment in
               // Appendix)
  for (unsigned int byte_index = base_tasklet;
       byte_index < input_size_dpu_bytes;
       byte_index += BLOCK_SIZE * NR_FTHREAD)
  {

    // Bound checking
    uint32_t l_size_bytes = (byte_index + BLOCK_SIZE >= input_size_dpu_bytes)
                                ? (input_size_dpu_bytes - byte_index)
                                : BLOCK_SIZE;

    // Load cache with current MRAM block
     print_debug(fthread_id, 5);

    umram_read(cache_A, l_size_bytes, (mram_base_addr_A + byte_index));
    print_debug(fthread_id, 6);


    // Reduction in each tasklet
    l_count += reduction(cache_A, l_size_bytes >> DIV);
  }

#endif

  // Reduce local counts
  message[fthread_id] = l_count;

  // #if PERF && PERF_SYNC // TIMER FOR SYNC PRIMITIVES
  //   result->cycles = 0;
  //   perfcounter_cycles cycles;
  //   timer_start(&cycles); // START TIMER
  // #endif
  // #ifdef TREE // Tree-based reduction

  // #ifdef BARRIER
  //   // Barrier
  //   wait_barrier(&b);

  // #endif

  // #pragma unroll
  //   for (unsigned int offset = 1; offset < NR_TASKLETS; offset <<= 1) {

  //     if ((fthread_id & (2 * offset - 1)) == 0) {
  // // #ifndef BARRIER
  // //       // Wait

  // //       handshake_wait_for(fthread_id + offset);
  // // #endif
  //       message[fthread_id] += message[fthread_id + offset];
  //     }

  // #ifdef BARRIER
  //     // Barrier
  //     wait_barrier(&b);

  // #else
  //     else if ((fthread_id & (offset - 1)) ==
  //              0) { // Ensure that wait and notify are in pair
  //       // Notify

  //       handshake_notify();
  //     }
  // #endif
  //   }

  // #else // Single-thread reduction
  // Barrier
  print_debug(fthread_id, 1);
  wait_barrier(&b);
  print_debug(fthread_id, 2);

  if (fthread_id == 0){
#pragma unroll
    for (unsigned int each_tasklet = 1; each_tasklet < NR_FTHREAD;
         each_tasklet++)
    {
      message[0] += message[each_tasklet];
    }
    result->t_count = message[fthread_id];
    print_debug(fthread_id, 5);
    umram_write(DPU_RESULTS, sizeof(DPU_RESULTS),
                    input_size_dpu_bytes +
                        sizeof(dpu_arguments_t)); // comment tranformer la var
                                                   // input_size_dpu_8bytes
    print_debug(fthread_id, 6);

    char ok;
    print_debug(fthread_id, 4);
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
  // CHK(umram_read(&DPU_INPUT_ARGUMENTS, sizeof(DPU_INPUT_ARGUMENTS), 0));
  init_barrier(&b, NR_FTHREAD);
  for (int i = 0; i < NR_FTHREAD - 1; i++)
    create_job(main1);
  main1();

  for (int i = 0; i < NR_FTHREAD - 1; i++)
    join_job();

  return 0;
}