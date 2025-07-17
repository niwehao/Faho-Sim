/*
 * STREAMP implementation of Matrix Profile with multiple tasklets
 *修改了query较小情况下的逻辑
 */

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
                        DTYPE *result,int res,int query_length)
{

  for (uint32_t i = 0; i < query_length; i++)
  {
    for (uint32_t j = 0; j < res; j++)
    {
      if ((j + i) > BLOCK_SIZE / sizeof(DTYPE) - 1)
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
  int tasklet_id = get_jid();
  wait_barrier(&b);
  if (tasklet_id == 0)
  {
    char ok;
    socket_write(sd_host, &ok, 1);
    socket_read(sd_host, &ok, 1);
    if (umram_read(&DPU_INPUT_ARGUMENTS, sizeof(DPU_INPUT_ARGUMENTS), 0) < 0)
      fault_notif();
  }
  wait_barrier(&b);
  int ret;

  int fthread_id = get_jid();

  // Input arguments
  uint32_t query_length = DPU_INPUT_ARGUMENTS.query_length;
  DTYPE query_mean = DPU_INPUT_ARGUMENTS.query_mean;
  DTYPE query_std = DPU_INPUT_ARGUMENTS.query_std;
  uint32_t slice_per_dpu = DPU_INPUT_ARGUMENTS.slice_per_dpu;
  // debug_int(query_std);

  // Boundaries for current tasklet
  uint32_t myStartElem = fthread_id * (slice_per_dpu / (NR_FTHREAD));
  uint32_t myEndElem;
  if(fthread_id== NR_FTHREAD - 1){
    myEndElem = slice_per_dpu - query_length-1;
  }
  else {myEndElem = myStartElem + (slice_per_dpu / (NR_FTHREAD)) ;}

  // // Check time series limit
  // if (myEndElem > slice_per_dpu - query_length)
  //   myEndElem = slice_per_dpu - query_length;

  // Starting address of the current processing block in MRAM
  uint32_t mem_offset = (uint32_t)sizeof(DPU_INPUT_ARGUMENTS);

  // Starting address of the query subsequence
  uint32_t current_mram_block_addr_query = (uint32_t)(mem_offset);
  mem_offset += query_length * sizeof(DTYPE);

  // Starting address of the time series slice
  mem_offset += myStartElem * sizeof(DTYPE);
  uint32_t starting_offset_ts = mem_offset;
  uint32_t current_mram_block_addr_TS = (uint32_t)mem_offset;

  // Starting address of the time series means
  mem_offset += (slice_per_dpu + query_length) * sizeof(DTYPE);
  uint32_t current_mram_block_addr_TSMean = (uint32_t)(mem_offset);

  // Starting address of the time series standard deviations
  mem_offset += (slice_per_dpu + query_length) * sizeof(DTYPE);
  uint32_t current_mram_block_addr_TSSigma = (uint32_t)(mem_offset);

  // Initialize local caches to store the MRAM blocks
  DTYPE *cache_TS = (DTYPE *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);
  DTYPE *cache_TS_aux = (DTYPE *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);
  DTYPE *cache_query = (DTYPE *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);
  DTYPE *cache_TSMean = (DTYPE *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);
  DTYPE *cache_TSSigma = (DTYPE *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);
  DTYPE *cache_dotprods = (DTYPE *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);

  // Create result structure pointer
  dpu_result_t *result = &DPU_RESULTS[fthread_id];

  // Auxiliary variables
  DTYPE distance;
  DTYPE min_distance = DTYPE_MAX;
  uint32_t min_index = 0;
  for (uint32_t i = myStartElem; i < myEndElem;
       i += (BLOCK_SIZE / sizeof(DTYPE)))
  {
    int res=myEndElem-i;//不确定大小
    if (res > BLOCK_SIZE / sizeof(DTYPE)){
      res= BLOCK_SIZE / sizeof(DTYPE) ;
    }
    

    for (uint32_t d = 0; d < DOTPIP; d++)
      cache_dotprods[d] = 0;

    current_mram_block_addr_TS =
        (uint32_t)starting_offset_ts + (i - myStartElem) * sizeof(DTYPE);
    current_mram_block_addr_query = (uint32_t)sizeof(DPU_INPUT_ARGUMENTS);
    int cycle=(query_length-1) / (BLOCK_SIZE / sizeof(DTYPE));

    for (uint32_t j = 0; j < cycle+1;//一个不理解的修改
         j++)
    {
      umram_read(cache_TS, BLOCK_SIZE, current_mram_block_addr_TS);
      umram_read(cache_TS_aux, BLOCK_SIZE,
                 current_mram_block_addr_TS + BLOCK_SIZE);
      umram_read(cache_query, BLOCK_SIZE, current_mram_block_addr_query);

      current_mram_block_addr_TS += BLOCK_SIZE;
      current_mram_block_addr_query += BLOCK_SIZE;
    
        // print_debug( cache_TS[1]);
        // print_debug( cache_TS_aux[1]);
        // print_debug( cache_query[1]);
      int query_length_;
      if((j == cycle)){
        query_length_ = query_length;
      }
      else{
        query_length_ = BLOCK_SIZE / sizeof(DTYPE);
      }
    
      dot_product(cache_TS, cache_TS_aux, cache_query, cache_dotprods,res,query_length_);
    }

    if ((ret = umram_read(cache_TSMean, BLOCK_SIZE,
                          current_mram_block_addr_TSMean)) < 0)
      fault_notif();
    if ((ret = umram_read(cache_TSSigma, BLOCK_SIZE,
                          current_mram_block_addr_TSSigma)) < 0)
      fault_notif();
    current_mram_block_addr_TSMean += BLOCK_SIZE;
    current_mram_block_addr_TSSigma += BLOCK_SIZE;

    for (uint32_t k = 0; k < res; k++)
    {

      // if(i + k == 0){
      //   print_debug( query_length);
      //   print_debug( cache_dotprods[k]);
      //   print_debug( (DTYPE)query_length * cache_TSMean[k] * query_mean);
      //   print_debug( (cache_TSSigma[k] * query_std));
      // }
      distance = 2 * ((DTYPE)query_length -
                      (cache_dotprods[k] -
                       (DTYPE)query_length * cache_TSMean[k] * query_mean) /
                          (cache_TSSigma[k] * query_std));
       //print_debug( distance);
        

      if (distance < min_distance)
      {
        print_debug( distance);
        min_distance = distance;
        min_index = i + k;
        
 
      }
   
    }
  }
  // Save the result
  result->minValue = min_distance;
  result->minIndex = min_index;
  //   return min_distance;

  wait_barrier(&b);
  if (fthread_id == 0)
  {
    if ((ret = umram_write(DPU_RESULTS, sizeof(DPU_RESULTS),
                           3 * (slice_per_dpu + query_length) * sizeof(DTYPE) +
                               query_length * sizeof(DTYPE) +
                               sizeof(DPU_INPUT_ARGUMENTS))) < 0)
      fault_notif();
    char ok;
    socket_write(sd_host, &ok, 1);
    socket_read(sd_host, &ok, 1);
  }
  wait_barrier(&b);
}

int main(void)
{
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