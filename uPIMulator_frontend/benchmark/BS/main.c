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
  DTYPE found = -2;
  if (bufferA[0] <= searching_for)
  {
    found = -1;
    for (uint32_t i = 0; i < search_size / sizeof(DTYPE); i++)
    {
     
      
      if (bufferA[i] == searching_for)
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
  int tasklet_id=get_jid();
  if (tasklet_id == 0)
  {
    char ok;
    socket_write(sd_host, &ok, 1);
    socket_read(sd_host, &ok, 1);
    if (umram_read(&DPU_INPUT_ARGUMENTS, sizeof(DPU_INPUT_ARGUMENTS), 0) < 0)
      fault_notif();
  }
  print_debug(tasklet_id,1);//rc,ra
    wait_barrier(&b);
    print_debug(tasklet_id,2);

  DTYPE searching_for, found;
  uint64_t input_size = DPU_INPUT_ARGUMENTS.input_size;

  // Address of the current processing block in MRAM
  uint32_t start_mram_block_addr_A = (uint32_t)sizeof(DPU_INPUT_ARGUMENTS);
  uint32_t start_mram_block_addr_aux = start_mram_block_addr_A;
  uint32_t end_mram_block_addr_A =
      start_mram_block_addr_A + sizeof(DTYPE) * input_size;
  uint32_t current_mram_block_addr_query =
      end_mram_block_addr_A +
      tasklet_id * (DPU_INPUT_ARGUMENTS.slice_per_dpu / NR_FTHREAD) *
          sizeof(DTYPE);

  // Initialize a local cache to store the MRAM block
  DTYPE *cache_A = (DTYPE *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);
  DTYPE *cache_aux_A = (DTYPE *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);
  DTYPE *cache_aux_B = (DTYPE *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);
  //print_debug(DPU_INPUT_ARGUMENTS.slice_per_dpu, 0);

  dpu_results_t *result = &DPU_RESULTS[tasklet_id];
 // int cycle=DPU_INPUT_ARGUMENTS.slice_per_dpu / NR_FTHREAD;

  for (int targets = 0;targets < (DPU_INPUT_ARGUMENTS.slice_per_dpu / NR_FTHREAD); targets++)//循环不要用64位
  {
    found = -1;
    
    r = umram_read(&searching_for, 8, current_mram_block_addr_query);
   

    if (r != 0)
    {

      fault_notif();
    }
    current_mram_block_addr_query += 8;

    // Initialize input vector boundaries
    start_mram_block_addr_A = (uint32_t)sizeof(DPU_INPUT_ARGUMENTS);
    start_mram_block_addr_aux = start_mram_block_addr_A;
    end_mram_block_addr_A =
        start_mram_block_addr_A + sizeof(DTYPE) * input_size;

    uint32_t current_mram_block_addr_A = start_mram_block_addr_A;

    // Bring first and last values to WRAM

    r = umram_read(cache_aux_A, BLOCK_SIZE, current_mram_block_addr_A);
    if (r != 0)
    {
   
      fault_notif();
    }
    r = umram_read(cache_aux_B, BLOCK_SIZE,
                   (end_mram_block_addr_A - BLOCK_SIZE * sizeof(DTYPE)));
    if (r != 0)
    {
    
      fault_notif();
    }

    while (1)
    {
      // Locate the address of the mid mram block
      current_mram_block_addr_A =
          (start_mram_block_addr_A + end_mram_block_addr_A) / 2;
      current_mram_block_addr_A &= WORD_MASK;

      // Boundary check
      if (current_mram_block_addr_A < (start_mram_block_addr_A + BLOCK_SIZE))
      {
        // Search inside (start_mram_block_addr_A, start_mram_block_addr_A +
        // BLOCK_SIZE)
        r=umram_read(cache_A, BLOCK_SIZE, start_mram_block_addr_A);
        found = search(cache_A, searching_for, BLOCK_SIZE);
        
      

        if (found > -1)
        {
          result->found =
              found + (start_mram_block_addr_A - start_mram_block_addr_aux) /
                          sizeof(DTYPE);
             
        }
        // Search inside (start_mram_block_addr_A + BLOCK_SIZE,
        // end_mram_block_addr_A)
        else
        {
          uint32_t remain_bytes_to_search =
              end_mram_block_addr_A - (start_mram_block_addr_A + BLOCK_SIZE);
          r = umram_read(cache_A, remain_bytes_to_search,
                         start_mram_block_addr_A + BLOCK_SIZE);
          if (r != 0)
          {
         
            fault_notif();
          }
          found = search(cache_A, searching_for, remain_bytes_to_search);

          if (found > -1)
          {
            result->found = found + (start_mram_block_addr_A + BLOCK_SIZE -
                                     start_mram_block_addr_aux) /
                                        sizeof(DTYPE);
          }
          else
          {
            //fault_notif();
          }
        }
        break;
      }

      // Load cache with current MRAM block
      r = umram_read(cache_A, BLOCK_SIZE, current_mram_block_addr_A);
      if (r != 0)
      {
  
        fault_notif();
      }

      // Search inside block
      found = search(cache_A, searching_for, BLOCK_SIZE);

      // If found > -1, we found the searching_for query
      if (found > -1)
      {
        result->found =
            found + (current_mram_block_addr_A - start_mram_block_addr_aux) /
                        sizeof(DTYPE);
        break;
      }

      // If found == -2, we need to discard right part of the input vector
      if (found == -2)
      {
        end_mram_block_addr_A = current_mram_block_addr_A;
      }

      // If found == -1, we need to discard left part of the input vector
      else if (found == -1)
      {
        start_mram_block_addr_A = current_mram_block_addr_A;
      }
    }
   
  }
  print_debug(tasklet_id,1);//rc,ra
    wait_barrier(&b);
    print_debug(tasklet_id,2);
  if (tasklet_id == 0)
  {
    r = umram_write(DPU_RESULTS, sizeof(DPU_RESULTS),
                    input_size * sizeof(DTYPE) + sizeof(DPU_INPUT_ARGUMENTS) +
                        input_size * sizeof(DTYPE));
    if (r != 0)
    {

      fault_notif();
    }
    char ok;
    socket_write(sd_host, &ok, 1);
    socket_read(sd_host, &ok, 1);
  }
  wait_barrier(&b);
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