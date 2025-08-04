/*
 * Binary Search with multiple tasklets
 *
 */
#include "stdsync.h"
#include "support/common.h"

#define WORD_MASK 0xfffffff8
dpu_arguments_t DPU_INPUT_ARGUMENTS;
dpu_results_t DPU_RESULTS[NR_FTHREAD];
int sd_host;
// Search
static DTYPE search(DTYPE *bufferA, DTYPE searching_for, uint32_t search_size)
{

  // if(get_jid()==0){
  //     print_debug(bufferA[0],0);
  //     print_debug(searching_for,0);
  //   }
  int tasklet_id = get_jid();
  DTYPE found = -2;
  // if (tasklet_id == 15)
  // {
  //   print_debug(bufferA[0], 10);
  // }
  if ((int)bufferA[0] <= (int)searching_for)
  {
    found = -1;
    for (uint32_t i = 0; i < search_size / sizeof(DTYPE); i++)
    {

      if ((int)bufferA[i] == (int)searching_for)
      {

        found = i;
        break;
      }
    }
  }
  return found;
}

struct barrier b;

// main_kernel1
void main1()
{
  int r;
  int tasklet_id = get_jid();
  // Initialize a local cache to store the MRAM block
  DTYPE *cache_A = (DTYPE *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);
  DTYPE *cache_aux_A = (DTYPE *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);
  DTYPE *cache_aux_B = (DTYPE *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);
  if (tasklet_id == 0)
  {
    char ok;
    socket_write(sd_host, &ok, 1);
    socket_read(sd_host, &ok, 1);
    if (umram_read(&DPU_INPUT_ARGUMENTS, sizeof(DPU_INPUT_ARGUMENTS), 0) < 0)
      fault_notif();
  }
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

  // for (int i = 0; i < NR_FTHREAD - 1; i++)
  //   join_job();

  // debug_int(11);
  return 0;
}