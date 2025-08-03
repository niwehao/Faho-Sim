/*
 * Histogram (HST-S) with multiple tasklets
 *
 */

#include <stdint.h>
#include "stdsync.h"
#include "support/common.h"

__buffer_aligned dpu_arguments_t DPU_INPUT_ARGUMENTS;
int sd_host;
// Array for communication between adjacent tasklets
uint32_t *message[NR_FTHREAD];
// DPU histogram
uint32_t *histo_dpu;

// Histogram in each tasklet
static void histogram(uint32_t *histo, uint32_t bins, T *input,
                      unsigned int l_size)
{
  for (unsigned int j = 0; j < l_size; j++)
  {
    T d = input[j];
    histo[(d * bins) >> DEPTH] += 1;
  }
}

struct barrier b;
// main_kernel1
void main1()
{
  int tasklet_id = get_jid();
  if (tasklet_id == 0)
  {
    char ok;
    socket_write(sd_host, &ok, 1);
    socket_read(sd_host, &ok, 1);
    if (umram_read(&DPU_INPUT_ARGUMENTS, sizeof(DPU_INPUT_ARGUMENTS), 0) < 0)
      exit_proc(3);
  }
  wait_barrier(&b); //!
  print_debug(tasklet_id, 3);

  unsigned int fthread_id = get_jid();

  uint32_t input_size_dpu_bytes = DPU_INPUT_ARGUMENTS.size;
  uint32_t input_size_dpu_bytes_transfer =
      DPU_INPUT_ARGUMENTS.transfer_size; // Transfer input size per DPU in bytes
  uint32_t bins = DPU_INPUT_ARGUMENTS.bins;

  // Address of the current processing block in MRAM
  uint32_t base_tasklet = fthread_id << BLOCK_SIZE_LOG2;
  uint32_t mram_base_addr_A = (uint32_t)sizeof(DPU_INPUT_ARGUMENTS);
  uint32_t mram_base_addr_histo =
      (uint32_t)(sizeof(DPU_INPUT_ARGUMENTS) + input_size_dpu_bytes_transfer);

  // Initialize a local cache to store the MRAM block
  T *cache_A = (T *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);

  // Local histogram
  uint32_t *histo =
      (uint32_t *)(sbrk(bins * sizeof(uint32_t)) - (bins * sizeof(uint32_t)));

  // Initialize local histogram
  for (unsigned int i = 0; i < bins; i++)
  {
    histo[i] = 0;
  }

  // Compute histogram
  for (unsigned int byte_index = base_tasklet;
       byte_index < input_size_dpu_bytes;
       byte_index += BLOCK_SIZE * NR_FTHREAD)
  {

    // Bound checking
    uint32_t l_size_bytes = (byte_index + BLOCK_SIZE >= input_size_dpu_bytes)
                                ? (input_size_dpu_bytes - byte_index)
                                : BLOCK_SIZE;
    print_debug(fthread_id, 5);
    // Load cache with current MRAM block
    umram_read(cache_A, l_size_bytes, (mram_base_addr_A + byte_index));
    print_debug(fthread_id, 6);

    // Histogram in each tasklet
    histogram(histo, bins, cache_A, l_size_bytes >> DIV);
  }
  message[fthread_id] = histo;

  // Barrier
  print_debug(tasklet_id, 1);
  wait_barrier(&b); //!
  print_debug(tasklet_id, 2);

  uint32_t *histo_dpu = message[0];

  for (unsigned int i = fthread_id; i < bins; i += NR_FTHREAD)
  {
    uint32_t b = 0;
    for (unsigned int j = 0; j < NR_FTHREAD; j++)
    {
      b += *(message[j] + i);
    }
    histo_dpu[i] = b;
  }

  // Barrier
  print_debug(tasklet_id, 1);
  wait_barrier(&b); //!
  print_debug(tasklet_id, 2);

  // Write dpu histogram to current MRAM block
  if (fthread_id == 0)
  {
    if (bins * sizeof(uint32_t) <= 2048)
    {

      print_debug(fthread_id, 5);
      umram_write(histo_dpu, bins * sizeof(uint32_t), mram_base_addr_histo);
      print_debug(fthread_id, 6);
    }
    else
    {
      for (unsigned int offset = 0; offset < ((bins * sizeof(uint32_t)) >> 11);
           offset++)
      {
        print_debug(fthread_id, 5);
        umram_write(histo_dpu + (offset << 9), 2048,
                    mram_base_addr_histo + (offset << 11));
        print_debug(fthread_id, 6);
      }
    }
    char ok;
    print_debug(fthread_id, 4);
    socket_write(sd_host, &ok, 1);
    socket_read(sd_host, &ok, 1);
  }
  print_debug(fthread_id, 4);
  // print_debug(tasklet_id, 1);
  wait_barrier(&b); //!
  // print_debug(tasklet_id, 2);
}

int main(void)
{
  print_debug(7, 0);
  sd_host = socket_open(0);
  // umram_read(&DPU_INPUT_ARGUMENTS, sizeof(DPU_INPUT_ARGUMENTS), 0);
  init_barrier(&b, NR_FTHREAD);
  for (int i = 0; i < NR_FTHREAD - 1; i++)
    create_job(main1);

  main1();

  for (int i = 0; i < NR_FTHREAD - 1; i++)
    join_job();

  //   debug_int(1);
  return 0;
}
