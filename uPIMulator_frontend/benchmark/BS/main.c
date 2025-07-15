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
  wait_barrier(&b);
  if (get_jid() == 0)
  {
    char ok;
    socket_write(sd_host, &ok, 1);
    socket_read(sd_host, &ok, 1);
    if (umram_read(&DPU_INPUT_ARGUMENTS, sizeof(DPU_INPUT_ARGUMENTS), 0) < 0)
      exit_proc(3);
  }
  wait_barrier(&b);


  DTYPE searching_for, found;
  uint64_t input_size = DPU_INPUT_ARGUMENTS.input_size;

  // Address of the current processing block in MRAM
  uint32_t start_mram_block_addr_A = (uint32_t)sizeof(DPU_INPUT_ARGUMENTS);
  uint32_t start_mram_block_addr_aux = start_mram_block_addr_A;
  uint32_t end_mram_block_addr_A =
      start_mram_block_addr_A + sizeof(DTYPE) * input_size;
  uint32_t current_mram_block_addr_query =
      end_mram_block_addr_A +
      get_jid() * (DPU_INPUT_ARGUMENTS.slice_per_dpu / NR_FTHREAD) *
          sizeof(DTYPE);

  // Initialize a local cache to store the MRAM block
  DTYPE *cache_A = (DTYPE *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);
  DTYPE *cache_aux_A = (DTYPE *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);
  DTYPE *cache_aux_B = (DTYPE *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);

  dpu_results_t *result = &DPU_RESULTS[get_jid()];

  for (uint64_t targets = 0;
       targets < (DPU_INPUT_ARGUMENTS.slice_per_dpu / NR_FTHREAD); targets++)
  {
    found = -1;

    umram_read(&searching_for, 8, current_mram_block_addr_query);
    current_mram_block_addr_query += 8;

    // Initialize input vector boundaries
    start_mram_block_addr_A = (uint32_t)sizeof(DPU_INPUT_ARGUMENTS);
    start_mram_block_addr_aux = start_mram_block_addr_A;
    end_mram_block_addr_A =
        start_mram_block_addr_A + sizeof(DTYPE) * input_size;

    uint32_t current_mram_block_addr_A = start_mram_block_addr_A;

    // Bring first and last values to WRAM

    umram_read(cache_aux_A, BLOCK_SIZE, current_mram_block_addr_A);
    umram_read(cache_aux_B, BLOCK_SIZE,
               (end_mram_block_addr_A - BLOCK_SIZE * sizeof(DTYPE)));

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
        umram_read(cache_A, BLOCK_SIZE, start_mram_block_addr_A);
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
          umram_read(cache_A, remain_bytes_to_search,
                     start_mram_block_addr_A + BLOCK_SIZE);
          found = search(cache_A, searching_for, remain_bytes_to_search);

          if (found > -1)
          {
            result->found = found + (start_mram_block_addr_A + BLOCK_SIZE -
                                     start_mram_block_addr_aux) /
                                        sizeof(DTYPE);
          }
          else
          {
            //  printf("%lld NOT found\n", searching_for);
          }
        }
        break;
      }

      // Load cache with current MRAM block
      umram_read(cache_A, BLOCK_SIZE, current_mram_block_addr_A);

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
  wait_barrier(&b);
  if (get_jid() == 0){
    umram_write(DPU_RESULTS, sizeof(DPU_RESULTS),
                input_size * sizeof(DTYPE) + sizeof(DPU_INPUT_ARGUMENTS) +
                    input_size * sizeof(DTYPE));
    char ok;
    socket_write(sd_host, &ok, 1);
    socket_read(sd_host, &ok, 1);
  }
  wait_barrier(&b);
}

int main(void)
{
  sd_host = socket_open(0);
  //umram_read(&DPU_INPUT_ARGUMENTS, sizeof(DPU_INPUT_ARGUMENTS), 0);
  init_barrier(&b, NR_FTHREAD);
  for (int i = 0; i < NR_FTHREAD - 1; i++)
    create_job(main1);

  main1();

  // for (int i = 0; i < NR_FTHREAD - 1; i++)
  //   join_job();

  // debug_int(11);
  return 0;
}