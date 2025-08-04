/**
 * Needleman-Wunsch with multiple tasklets
 *
 */
#include <alloc.h>
#include <barrier.h>
#include <defs.h>
#include <mram.h>
#include <perfcounter.h>
#include <stdint.h>
#include <stdio.h>

#include "stdsync.h"
#include "stdsys.h"
#include "support/common.h"

dpu_arguments_t DPU_INPUT_ARGUMENTS; //!

// Barrier
// BARRIER_INIT(my_barrier, NR_TASKLETS);          //!

struct barrier my_barrier;

int nr_tasklets, sd_host;

void main1(void);

int main(void)
{
  print_debug(7, 0);
  nr_tasklets = NR_FTHREAD;
  init_barrier(&my_barrier, nr_tasklets);
  sd_host = socket_open(0);

  for (int i = 1; i < nr_tasklets; i++)
    create_job(main1);
  main1();
}

// main
void main1()
{
  unsigned int tasklet_id = get_jid();
  int32_t *cache_input =
      (int32_t *)(sbrk((BL_IN + 1) * (BL_IN + 2) * sizeof(int32_t)) -
                  ((BL_IN + 1) * (BL_IN + 2) * sizeof(int32_t)));
  int32_t *cache_ref = (int32_t *)(sbrk(BL_IN * BL_IN * sizeof(int32_t)) -
                                   (BL_IN * BL_IN * sizeof(int32_t)));
  int r;

  // Barrier
  if (tasklet_id == 0)
  {
    char ok = 0;
    r = socket_write(sd_host, &ok, 1);
    if (r != 0)
    {

      fault_notif();
    }
    // print_debug(tasklet_id, 4);
    r = socket_read(sd_host, &DPU_INPUT_ARGUMENTS, sizeof(dpu_arguments_t));
    if (r != 0)
    {

      fault_notif();
    }
  }
  wait_barrier(&my_barrier); //!
  fault_notif();
  print_debug(tasklet_id, 3);

  return;
}
