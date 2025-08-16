/*
 * Matrix vector multiplication with multiple tasklet
 *
 */
#include <stdint.h>
#include <stdio.h>
// #include <defs.h>
// #include <mram.h>
// #include <alloc.h>
// #include <barrier.h>
// #include <seqread.h>

#include "stdsync.h"
#include "stdsys.h"
#include "support/common.h"

dpu_arguments_t DPU_INPUT_ARGUMENTS;

// GEMV
static void __attribute__((noinline)) gemv(T *bufferC, T *bufferA, T *bufferB, int pos)
{
  unsigned int tasklet_id = get_jid();
  for (unsigned int i = 0; i < BLOCK_SIZE / sizeof(T); i++)
  {

    bufferC[pos] += bufferA[i] * bufferB[i];

    //print_debug(bufferC[pos], 3);
            
  }
  return;
}

char should_break;

void main1(void);

int sd_host;
struct barrier my_barrier;
int main(void)
{
  print_debug(7, 0);
  should_break = 0;
  init_barrier(&my_barrier, NR_FTHREAD);
  sd_host = socket_open(0);

  for (int i = 1; i < NR_FTHREAD; i++)
    create_job(main1);
  main1();
  for (int i = 1; i < NR_FTHREAD; i++)
    join_job();

  char ok = 1;
  socket_write(sd_host, &ok, 1);

  return 0;
}

// main
void main1()
{
  int r;

  // Inititalize a local cache to store the MRAM block
  T *cache_A = (T *)(sbrk(BLOCK_SIZE + 8) - (BLOCK_SIZE + 8));
  T *cache_A_aux = (T *)(sbrk(8) - 8);
  T *cache_B = (T *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);
  T *cache_C = (T *)(sbrk(8) - 8);
  unsigned int tasklet_id = get_jid();
  char new_processing;
  if (tasklet_id == 0)
    {
      char ok = 1;
      r = socket_write(sd_host, &ok, 1);
      
      r = socket_read(sd_host, &DPU_INPUT_ARGUMENTS, sizeof(dpu_arguments_t));
      
      
    }
  for (;;)
  {
    
    
    wait_barrier(&my_barrier); //!
    print_debug(tasklet_id, 3);


    int32_t n_size = DPU_INPUT_ARGUMENTS.n_size;
    int32_t n_size_pad = DPU_INPUT_ARGUMENTS.n_size_pad;
    uint32_t nr_rows = DPU_INPUT_ARGUMENTS.nr_rows;
    uint32_t max_rows = DPU_INPUT_ARGUMENTS.max_rows;

    unsigned int nrows = nr_rows;
    unsigned int rows_per_tasklet;
    unsigned int start_row;
    unsigned int chunks = nrows / (NR_FTHREAD + NR_FTHREAD);
    unsigned int dbl_chunks = chunks + chunks;
    rows_per_tasklet = dbl_chunks;
    unsigned int rest_rows = nrows % (NR_FTHREAD + NR_FTHREAD);

    if ((tasklet_id + tasklet_id) < rest_rows)
      rows_per_tasklet += 2;
    if (rest_rows > 0)
    {
      if ((tasklet_id + tasklet_id) >= rest_rows)
      {
        unsigned int hlf_rest_rows = rest_rows >> 1;
        if ((rest_rows & 1) == 1)
          start_row = (hlf_rest_rows + 1) * (dbl_chunks + 2) +
                      (tasklet_id - 1 - hlf_rest_rows) * dbl_chunks;
        else
          start_row = (hlf_rest_rows) * (dbl_chunks + 2) +
                      (tasklet_id - hlf_rest_rows) * dbl_chunks;
      }
      else
        start_row = tasklet_id * (dbl_chunks + 2);
    }
    else
    {
      start_row = tasklet_id * (dbl_chunks);
    }
    // debug_int(start_row);

    for (int lay = 0;; lay++)
    { // ifinit
      // Address of the current row in MRAM
      uint32_t mram_base_addr_A =
          (uint32_t)(0 + start_row * n_size * sizeof(T));
      uint32_t mram_base_addr_B =
          (uint32_t)(0 + max_rows * n_size_pad * sizeof(T));
      uint32_t mram_base_addr_C =
          (uint32_t)(0 + max_rows * n_size_pad * sizeof(T) +
                     n_size_pad * sizeof(T) + start_row * sizeof(T));
      //print_debug(max_rows,5);
      // print_debug(n_size_pad,5);
      // debug_int(mram_base_addr_C);

      uint32_t mram_temp_addr_A = mram_base_addr_A;
      uint32_t mram_temp_addr_B = mram_base_addr_B;
      if (lay)
      {
        print_debug(tasklet_id, 4);
        wait_barrier(&my_barrier); //!
        if (tasklet_id == 0)
        {
          should_break = 0;
          char ok = 1, new_processing;

          r = socket_write(sd_host, &ok, 1);
          
          

          r = socket_read(sd_host, &new_processing,
                          1); // wait to start 2
          
          
          if (new_processing)
          {
            should_break = 1;
            //print_debug(tasklet_id, 1);
            wait_barrier(&my_barrier); //!
            print_debug(tasklet_id, 3);
            //print_debug(tasklet_id, 2);
            break;
          }
        }
        //print_debug(tasklet_id, 1);
        wait_barrier(&my_barrier); //!
        print_debug(tasklet_id, 3);
        //print_debug(tasklet_id, 2);
        if (should_break)
          break;
      }
      int offset = 0;

      // Iterate over nr_rows
      for (unsigned int i = start_row; i < start_row + rows_per_tasklet;
           i += 2)
      {

        mram_temp_addr_A = (uint32_t)(0 + i * n_size * sizeof(T));
        mram_temp_addr_B = mram_base_addr_B;

        cache_C[0] = 0;
        cache_C[1] = 0;
        for (unsigned int pos = 0; pos < 2 && i + pos < nr_rows; pos++)
        {
          int n = 0, j;
          for (n = 0; n < (int32_t)(n_size - (BLOCK_SIZE / sizeof(T)));
               n += (BLOCK_SIZE / sizeof(T)))
          {
            //print_debug(101,7);

            //   mram_read((__mram_ptr void const *)(mram_temp_addr_A), cache_A,
            // BLOCK_SIZE);
            //   mram_read((__mram_ptr void const *)(mram_temp_addr_B), cache_B,
            // BLOCK_SIZE);
            print_debug(tasklet_id, 5);

            r = umram_read(cache_A, BLOCK_SIZE, mram_temp_addr_A);
            print_debug(tasklet_id, 6);
          
            print_debug(tasklet_id, 5);
            r = umram_read(cache_B, BLOCK_SIZE, mram_temp_addr_B);
            print_debug(tasklet_id, 6);
            

            if (offset)
            {

              for (unsigned int off = 0; off < (BLOCK_SIZE / sizeof(T)) - 1;
                   off++)
              {
                cache_A[off] = cache_A[off + 1];

              }

              // mram_read((__mram_ptr void const *)(mram_temp_addr_A +
              // BLOCK_SIZE),
              //   cache_A_aux, 8);
              print_debug(tasklet_id, 5);
              r = umram_read(cache_A_aux, 8, mram_temp_addr_A + BLOCK_SIZE);
              print_debug(tasklet_id, 6);
              

              cache_A[BLOCK_SIZE / sizeof(T) - 1] = cache_A_aux[0];
            }

            // Compute GEMV
            gemv(cache_C, cache_A, cache_B, pos);

            // Update memory addresses
            mram_temp_addr_A += BLOCK_SIZE;
            mram_temp_addr_B += BLOCK_SIZE;
          }

          // mram_read((__mram_ptr void const *)(mram_temp_addr_A), cache_A,
          //   BLOCK_SIZE);
          print_debug(tasklet_id, 5);

          r = umram_read(cache_A, BLOCK_SIZE, mram_temp_addr_A);
          print_debug(tasklet_id, 6);
          

          if (offset)
          {
            for (unsigned int off = 0; off < (BLOCK_SIZE / sizeof(T)) - 1;
                 off++)
            {
              cache_A[off] = cache_A[off + 1];
            }

            //   mram_read((__mram_ptr void const *)(mram_temp_addr_A +
            //   BLOCK_SIZE),
            // cache_A_aux, 8);
            print_debug(tasklet_id, 5);
            r = umram_read(cache_A_aux, 8, mram_temp_addr_A + BLOCK_SIZE);
            print_debug(tasklet_id, 6);
            if (r != 0)
            

            cache_A[BLOCK_SIZE / sizeof(T) - 1] = cache_A_aux[0];
          }

          // mram_read((__mram_ptr void const *)(mram_temp_addr_B), cache_B,
          //   BLOCK_SIZE);
          print_debug(tasklet_id, 5);
          r = (umram_read(cache_B, BLOCK_SIZE, mram_temp_addr_B));
          print_debug(tasklet_id, 6);
         

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

          mram_temp_addr_A +=
              (BLOCK_SIZE -
               ((BLOCK_SIZE / sizeof(T)) - (n_size - n)) * sizeof(T));
          mram_temp_addr_B = mram_base_addr_B;

          if (mram_temp_addr_A % 8 != 0)
          {
            offset = 1;
            mram_temp_addr_A = mram_temp_addr_A - (mram_temp_addr_A % 8);
          }
          else
          {
            offset = 0;
          }
        }
        // Write cache to current MRAM block
        //   mram_write(cache_C, (__mram_ptr void *)(mram_base_addr_C), 8);

        // for (int c = 0; c < 8; c++)
        //   if (cache_C[c])
        //     debug_int(cache_C[c]);
        // if (tasklet_id == 0 && mram_base_addr_C == 0x100810 && cache_C[0]) {
        //   // debug_int(cache_C[0]);
        //   // debug_int(mram_temp_addr_B);
        //   // debug_int(cache_B[0]);
        // }
        // if(i==0){
        //    print_debug(cache_C[0],3);
        //   print_debug(mram_base_addr_C,4);//max_rows * n_size_pad * sizeof(T) +n_size_pad * sizeof(T)
        // }
        print_debug(tasklet_id, 5);
        r = (umram_write(cache_C, 8, mram_base_addr_C));
        print_debug(tasklet_id, 6);
       

        // Update memory address
        mram_base_addr_C += 2 * sizeof(T);
      }
    }
    print_debug(tasklet_id, 4);
    wait_barrier(&my_barrier); //!
    if (tasklet_id == 0)
    {
      char ok = 1;
      r = socket_write(sd_host, &ok, 1);
      
      r = socket_read(sd_host, &DPU_INPUT_ARGUMENTS, sizeof(dpu_arguments_t));
      
    }
  }
  return;
}
