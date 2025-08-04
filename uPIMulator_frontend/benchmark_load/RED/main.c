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
  T *cache_A = (T *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);
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
  fault_notif();
  print_debug(fthread_id, 3);
 

 
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