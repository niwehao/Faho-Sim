/*
 * Vector addition with multiple tasklets
 *
 */
#include "stdsync.h"
#include "support/common.h"

#define CHK(op)         \
  do                    \
  {                     \
    int ret;            \
    if ((ret = op) < 0) \
      exit_proc(ret);   \
  } while (0)

dpu_arguments_t DPU_INPUT_ARGUMENTS;

struct barrier b;
int sd_host;

// vector_addition: Computes the vector addition of a cached block
static void vector_addition(T *bufferB, T *bufferA, unsigned int l_size)
{

  for (unsigned int i = 0; i < l_size; i++)
  {
    bufferB[i] += bufferA[i];
    // print_debug(bufferB[i],1);
    // if(bufferB[i]==0){
    //   int tasklet_id = get_jid();
    //   print_debug(1,tasklet_id);
    // }
  }
}

// main_kernel1
void main1()
{
  // Initialize a local cache to store the MRAM block
  __buffer_aligned T *cache_A = (T *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);
  __buffer_aligned T *cache_B = (T *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);
  int tasklet_id = get_jid(); // apres utiliser get_jid()
  if (tasklet_id == 0)
  {
    char ok;
    socket_write(sd_host, &ok, 1);
    socket_read(sd_host, &ok, 1);
    if (umram_read(&DPU_INPUT_ARGUMENTS, sizeof(DPU_INPUT_ARGUMENTS), 0) < 0)
      exit_proc(3);
  }
 

    wait_barrier(&b);
    fault_notif();
    print_debug(tasklet_id, 3);

    
}

int main(void)
{
  print_debug(7, 0); // end of switch context rc,ra
  sd_host = socket_open(0);
  init_barrier(&b, NR_FTHREAD);
  for (int i = 0; i < NR_FTHREAD - 1; i++)
    create_job(main1);

  main1();

  for (int i = 0; i < NR_FTHREAD - 1; i++)
    join_job();

  return 0;
}
