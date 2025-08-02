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
  print_debug(fthread_id,3);
  

  int32_t n_size = DPU_INPUT_ARGUMENTS.n_size;
  int32_t n_size_pad = DPU_INPUT_ARGUMENTS.n_size_pad;
  uint32_t nr_rows = DPU_INPUT_ARGUMENTS.nr_rows;
  uint32_t max_rows = DPU_INPUT_ARGUMENTS.max_rows;

  unsigned int element_per_cacheC = 8 / sizeof(T);

  unsigned int nrows = nr_rows;
  unsigned int rows_per_tasklet;
  unsigned int start_row;
  unsigned int chunks = nrows / (NR_FTHREAD * element_per_cacheC);
  unsigned int dbl_chunks = chunks * element_per_cacheC; // chunks + chunks;
  rows_per_tasklet = dbl_chunks;
  unsigned int rest_rows =
      nrows % (NR_FTHREAD * element_per_cacheC); //(NR_FTHREAD + NR_FTHREAD);

  if ((fthread_id * element_per_cacheC) < rest_rows)
    rows_per_tasklet += element_per_cacheC;
  if (rest_rows > 0)
  {
    if ((fthread_id * element_per_cacheC) >= rest_rows)
    {
      // unsigned int hlf_rest_rows = rest_rows >> 1;
      if ((rest_rows % element_per_cacheC) != 0)
        start_row =
            roundup(rest_rows, element_per_cacheC) + fthread_id * dbl_chunks;
      // start_row = (hlf_rest_rows + 1) * (dbl_chunks + 2) + (fthread_id - 1 -
      // hlf_rest_rows) * dbl_chunks;
      else
        start_row = rest_rows + fthread_id * dbl_chunks;
      // start_row = (hlf_rest_rows) * (dbl_chunks + 2) + (fthread_id -
      // hlf_rest_rows) * dbl_chunks;
    }
    else
      start_row = fthread_id * (dbl_chunks + element_per_cacheC);
    // start_row = fthread_id * (dbl_chunks + 2);
  }
  else
  {
    start_row = fthread_id * (dbl_chunks);
  }

  // Address of the current row in MRAM
  uint32_t mram_base_addr_A =
      (uint32_t)(sizeof(DPU_INPUT_ARGUMENTS) + start_row * n_size * sizeof(T));
  uint32_t mram_base_addr_B = (uint32_t)(sizeof(DPU_INPUT_ARGUMENTS) +
                                         max_rows * n_size_pad * sizeof(T));
  uint32_t mram_base_addr_C =
      (uint32_t)(sizeof(DPU_INPUT_ARGUMENTS) +
                 max_rows * n_size_pad * sizeof(T) + n_size_pad * sizeof(T) +
                 start_row * sizeof(T));
  uint32_t mram_temp_addr_A = mram_base_addr_A;
  uint32_t extra_mram_base_addr_A = 0;
  uint32_t mram_temp_addr_B = mram_base_addr_B;

  // Inititalize a local cache to store the MRAM block
  __buffer_aligned T *cache_A =
      (T *)(sbrk(BLOCK_SIZE + 8) -
            (BLOCK_SIZE + 8)); // comment on fait le sbrk()
  __buffer_aligned T *cache_A_aux = (T *)(sbrk(8) - 8);
  __buffer_aligned T *cache_B = (T *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);
  __buffer_aligned T *cache_C = (T *)(sbrk(8) - 8);

  int offset = 0;

  for (unsigned int i = start_row; i < start_row + rows_per_tasklet;
       i += element_per_cacheC)
  {

    mram_temp_addr_A =
        (uint32_t)(sizeof(DPU_INPUT_ARGUMENTS) + i * n_size * sizeof(T));
    mram_temp_addr_B = mram_base_addr_B;

    // clear the cache
    for (unsigned int c = 0; c < element_per_cacheC; c++)
    {
      cache_C[c] = 0;
    }

    for (unsigned int pos = 0; pos < element_per_cacheC; pos++)
    {
      if (i + pos >= nr_rows)
      {
        // printf("id: %d, nrows: %d, error\n", fthread_id, nrows);
        break;
      }

      int n = 0, j;
      for (n = 0; n < (int32_t)(n_size - (BLOCK_SIZE / sizeof(T)));
           n += (BLOCK_SIZE / sizeof(T)))
      {

        umram_read(cache_A, BLOCK_SIZE, mram_temp_addr_A);
        umram_read(cache_B, BLOCK_SIZE, mram_temp_addr_B);

        if (offset)
        {

          for (unsigned int off = 0; off < (BLOCK_SIZE / sizeof(T)) - 1;
               off++)
          {
            cache_A[off] = cache_A[off + 1];
          }

          umram_read(cache_A_aux, 8, mram_temp_addr_A + BLOCK_SIZE);

          cache_A[BLOCK_SIZE / sizeof(T) - 1] = cache_A_aux[0];
        }

        // Compute GEMV
        gemv(cache_C, cache_A, cache_B, pos);

        // Update memory addresses
        mram_temp_addr_A += BLOCK_SIZE;
        mram_temp_addr_B += BLOCK_SIZE;
      }
      int ret;
      if ((ret = umram_read(cache_A, BLOCK_SIZE, mram_temp_addr_A)) < 0)
        exit_proc(ret);

      if (offset)
      {

        for (unsigned int off = 0; off < (BLOCK_SIZE / sizeof(T)) - 1; off++)
        {

          cache_A[off] = cache_A[off + 1];
        }

        if (umram_read(cache_A_aux, 8, mram_temp_addr_A + BLOCK_SIZE) < 0)
          exit_proc(-2);

        cache_A[BLOCK_SIZE / sizeof(T) - 1] = cache_A_aux[0];
      }

      umram_read(cache_B, BLOCK_SIZE, mram_temp_addr_B);

      for (j = 0; j < (int)(n_size - n); j++)
      {
        // Compute GEMV
        if (j >= (int)(BLOCK_SIZE / sizeof(T)))
        {
          // printf("error\n");
          break;
        }
        cache_C[pos] += cache_A[j] * cache_B[j];
      }
      mram_temp_addr_A += extra_mram_base_addr_A;
      mram_temp_addr_A +=
          (BLOCK_SIZE - ((BLOCK_SIZE / sizeof(T)) - (n_size - n)) * sizeof(T));
      mram_temp_addr_B = mram_base_addr_B;

      if (mram_temp_addr_A % 8 != 0)
      {
        extra_mram_base_addr_A = mram_temp_addr_A % 8;
        mram_temp_addr_A -=
            extra_mram_base_addr_A; // the SDK permit to acces MRAM with no
                                    // align mram_ptr, the mram_read will
                                    // automaticly allign it, umram_read
                                    // does not allow this. So we need to
                                    // align it ourself
        offset = 1;
      }
      else
      {
        extra_mram_base_addr_A = 0;
        offset = 0;
      }
    }

    // Write cache to current MRAM block
    umram_write(cache_C, 8, mram_base_addr_C);

    // Update memory address
    mram_base_addr_C += 8;
  }
  print_debug(fthread_id,4);
  wait_barrier(&b);
  if (fthread_id == 0)
  {
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

  for (int i = 0; i < NR_FTHREAD - 1; i++)
    join_job();

  return 0;
}
