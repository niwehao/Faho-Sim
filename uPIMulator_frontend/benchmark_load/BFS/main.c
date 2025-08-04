/*
 * BFS with multiple tasklets
 *
 */
#include "stdsync.h"
#include "stdsys.h"
#include "support/common.h"
#include "dpu-utils.h"

struct barrier my_barrier, bfsBarrier;
struct lock nextFrontierMutex;
int sd_host, nb_thread;
char ok;

struct DPUParams *params_w;

void main_prog(void);

// main
int main(void)
{
  print_debug(7, 0);
  nb_thread = NR_FTHREAD;
  init_barrier(&my_barrier, nb_thread);
  init_barrier(&bfsBarrier, nb_thread);
  init_lock(&nextFrontierMutex);

  (sd_host = socket_open(0));
  params_w =
      (struct DPUParams *)(sbrk(ROUND_UP_TO_MULTIPLE_OF_8(
                               sizeof(struct DPUParams))) -
                           ROUND_UP_TO_MULTIPLE_OF_8(sizeof(struct DPUParams)));

  for (int i = 1; i < nb_thread; i++)
    create_job(main_prog);

  main_prog();
}

void main_prog()
{
  int me = get_jid();
  int nb_loop = 0;
  int r;
  if (me == 0)
  {
    socket_write(sd_host, &ok, 1);
    socket_read(sd_host, &ok, 1);

    // Load parameters
    //   uint32_t params_m = (uint32_t)DPU_MRAM_HEAP_POINTER;
    uint32_t params_m = 0;
    r = umram_read(params_w,
                   ROUND_UP_TO_MULTIPLE_OF_8(sizeof(struct DPUParams)),
                   params_m);
    if (r != 0)
    {
      fault_notif();
    }
  }
 wait_barrier(&my_barrier); //!
 fault_notif();
    print_debug(me, 3);
 
  
  return;
}
