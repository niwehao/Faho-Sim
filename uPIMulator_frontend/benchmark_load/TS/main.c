
#include "stdsync.h"
#include "support/common.h"
#include <stdint.h>

#define DOTPIP BLOCK_SIZE / sizeof(DTYPE)

__buffer_aligned dpu_arguments_t DPU_INPUT_ARGUMENTS;
__buffer_aligned dpu_result_t DPU_RESULTS[NR_FTHREAD];
struct barrier b;
int sd_host;
// Dot product
static void dot_product(DTYPE *vectorA, DTYPE *vectorA_aux, DTYPE *vectorB,
                        DTYPE *result, int res, int query_length)
{

  for (uint32_t i = 0; i < query_length; i++)
  {
    for (uint32_t j = 0; j < res; j++)
    {
    
      if ((j + i) > BLOCK_SIZE / sizeof(DTYPE) - 1) // 127
      {
        result[j] +=
            vectorA_aux[(j + i) - BLOCK_SIZE / sizeof(DTYPE)] * vectorB[i];
      }
      else
      {
        result[j] += vectorA[j + i] * vectorB[i];
      }
    }
  }
}

struct barrier b;

// main_kernel1
void main1()
{
  int fthread_id = get_jid();
  DTYPE *cache_TS = (DTYPE *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);
  DTYPE *cache_TS_aux = (DTYPE *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);
  DTYPE *cache_query = (DTYPE *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);
  DTYPE *cache_TSMean = (DTYPE *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);
  DTYPE *cache_TSSigma = (DTYPE *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);
  DTYPE *cache_dotprods = (DTYPE *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);
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
  for (int i = 0; i < NR_FTHREAD - 1; i++)
    create_job(main1);

  main1();

  for (int i = 0; i < NR_FTHREAD - 1; i++)
    join_job();

  // debug_int(11);
  return 0;
}