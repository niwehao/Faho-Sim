/*
 * Matrix vector multiplication with multiple tasklet
 *
 */

#include "stdsync.h"
// #include "../../lib_unsed/stdsync.h"
#include "support/common.h"

#define roundup(n, m) ((n / m) * m + m)
int sd_host;
dpu_arguments_t DPU_INPUT_ARGUMENTS;

// GEMV
static void gemv(T *bufferC, T *bufferA, T *bufferB, int pos)
{
  for (unsigned int i = 0; i < BLOCK_SIZE / sizeof(T); i++)
  {
    bufferC[pos] += bufferA[i] * bufferB[i];
  }
  return;
}

// Barrier
struct barrier b;

// main
void main1()
{

  int fthread_id = get_jid();
  // Inititalize a local cache to store the MRAM block
  __buffer_aligned T *cache_A =
      (T *)(sbrk(BLOCK_SIZE + 8) -
            (BLOCK_SIZE + 8)); // comment on fait le sbrk()
  __buffer_aligned T *cache_A_aux = (T *)(sbrk(8) - 8);
  __buffer_aligned T *cache_B = (T *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);
  __buffer_aligned T *cache_C = (T *)(sbrk(8) - 8);
  if (fthread_id == 0)
  {
    char ok;
    socket_write(sd_host, &ok, 1);
    socket_read(sd_host, &ok, 1);
    if (umram_read(&DPU_INPUT_ARGUMENTS, sizeof(DPU_INPUT_ARGUMENTS), 0) < 0)
      exit_proc(3);
   
  }
  //print_debug(fthread_id, 1); // rc,ra
  wait_barrier(&b);
  fault_notif();
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

  return 0;
}
