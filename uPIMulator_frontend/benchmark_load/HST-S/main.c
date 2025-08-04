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
  int bins=16;
  // Initialize a local cache to store the MRAM block
  T *cache_A = (T *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);

  // Local histogram
  uint32_t *histo =
      (uint32_t *)(sbrk(bins * sizeof(uint32_t)) - (bins * sizeof(uint32_t)));
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
  fault_notif();
  print_debug(tasklet_id, 3);


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
