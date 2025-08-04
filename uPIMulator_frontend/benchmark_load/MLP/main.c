/*
 * Matrix vector multiplication with multiple tasklet
 *
 */
#include <stdint.h>
#include <stdio.h>
// #include <defs.h>
// #include <mram.h>
// #include <alloc.h>
// #include <barrier.h>
// #include <seqread.h>

#include "stdsync.h"
#include "stdsys.h"
#include "support/common.h"

dpu_arguments_t DPU_INPUT_ARGUMENTS;

// GEMV
static void gemv(T *bufferC, T *bufferA, T *bufferB, int pos)
{
  unsigned int tasklet_id = get_jid();
  for (unsigned int i = 0; i < BLOCK_SIZE / sizeof(T); i++)
  {

    bufferC[pos] += bufferA[i] * bufferB[i];

    // print_debug(bufferC[pos], 3);
  }
  return;
}

char should_break;

void main1(void);

int sd_host;
struct barrier my_barrier;
int main(void)
{
  print_debug(7, 0);
  should_break = 0;
  init_barrier(&my_barrier, NR_FTHREAD);
  sd_host = socket_open(0);

  for (int i = 1; i < NR_FTHREAD; i++)
    create_job(main1);
  main1();
  for (int i = 1; i < NR_FTHREAD; i++)
    join_job();

  char ok = 1;
  socket_write(sd_host, &ok, 1);

  return 0;
}

// main
void main1()
{
  int r;

  // Inititalize a local cache to store the MRAM block
  T *cache_A = (T *)(sbrk(BLOCK_SIZE + 8) - (BLOCK_SIZE + 8));
  T *cache_A_aux = (T *)(sbrk(8) - 8);
  T *cache_B = (T *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);
  T *cache_C = (T *)(sbrk(8) - 8);
  unsigned int tasklet_id = get_jid();
  char new_processing;
  if (tasklet_id == 0)
  {
    char ok = 1;
    r = socket_write(sd_host, &ok, 1);
    if (r != 0)
    {

      fault_notif();
    }
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
