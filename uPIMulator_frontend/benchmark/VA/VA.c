/*
 * Vector addition with multiple tasklets
 *
 */
#include "stdsync.h"
#include "support/common.h"

#define CHK(op)                                                                \
  do {                                                                         \
    int ret;                                                                   \
    if ((ret = op) < 0)                                                        \
      exit_proc(ret);                                                          \
  } while (0)

dpu_arguments_t DPU_INPUT_ARGUMENTS;

struct barrier b;
int sd_host;

// vector_addition: Computes the vector addition of a cached block
static void vector_addition(T *bufferB, T *bufferA, unsigned int l_size) {
 
  for (unsigned int i = 0; i < l_size; i++) {
    bufferB[i] += bufferA[i];
     //print_debug(bufferB[i],1);
    // if(bufferB[i]==0){
    //   int tasklet_id = get_jid();
    //   print_debug(1,tasklet_id);
    // }
  }
}

// main_kernel1
void main1() {
  // Initialize a local cache to store the MRAM block
  __buffer_aligned T *cache_A = (T *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);
  __buffer_aligned T *cache_B = (T *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);
  int tasklet_id = get_jid();// apres utiliser get_jid()
  while (1) {
    if (tasklet_id == 0) {
      char ok;
      socket_write(sd_host, &ok, 1);
      socket_read(sd_host, &ok, 1);
      if (umram_read(&DPU_INPUT_ARGUMENTS, sizeof(DPU_INPUT_ARGUMENTS), 0) < 0)
        exit_proc(3);
    }
    print_debug(tasklet_id,1);//rc,ra
    wait_barrier(&b);
    print_debug(tasklet_id,2);
    uint32_t input_size_dpu_bytes =
        DPU_INPUT_ARGUMENTS.size; // Input size per DPU in bytes
    uint32_t input_size_dpu_bytes_transfer =
        DPU_INPUT_ARGUMENTS
            .transfer_size; // Transfer input size per DPU in bytes

    // Address of the current processing block in MRAM
    uint32_t base_tasklet = tasklet_id << BLOCK_SIZE_LOG2;
    uint32_t mram_base_addr_A = (uint32_t)sizeof(DPU_INPUT_ARGUMENTS);
    uint32_t mram_base_addr_B =
        (uint32_t)(sizeof(DPU_INPUT_ARGUMENTS) + input_size_dpu_bytes_transfer);

    // check reurrn value ?
    // return &cache_B[0];

    // exit_proc(input_size_dpu_bytes);
    for (unsigned int byte_index = base_tasklet;
         byte_index < input_size_dpu_bytes;
         byte_index += BLOCK_SIZE * NR_FTHREAD) {
      // debug_int(11);
      // Bound checking
      
      uint32_t l_size_bytes = (byte_index + BLOCK_SIZE >= input_size_dpu_bytes)
                                  ? (input_size_dpu_bytes - byte_index)
                                  : BLOCK_SIZE;
      //print_debug(1,l_size_bytes);
      // Load cache with current MRAM inode
      CHK(umram_read(cache_A, l_size_bytes, mram_base_addr_A + byte_index));
      CHK(umram_read(cache_B, l_size_bytes, mram_base_addr_B + byte_index));

      // Computer vector addition
      // debug_int(cache_A[0]);
      vector_addition(cache_B, cache_A, l_size_bytes >> DIV);

      // Write cache to current MRAM inode
      CHK(umram_write(cache_B, l_size_bytes, mram_base_addr_B + byte_index));
      //-1747751478 0 2090218572 456997246
    }
   print_debug(tasklet_id,1);
    wait_barrier(&b);
    print_debug(tasklet_id,2);
   
  }
}

int main(void) {
  print_debug(7,0);//end of switch context rc,ra
  //fault_notif();
  sd_host = socket_open(0);
  init_barrier(&b, NR_FTHREAD);
  for (int i = 0; i < NR_FTHREAD - 1; i++)
    create_job(main1);

  main1();

  for (int i = 0; i < NR_FTHREAD - 1; i++)
    join_job();

  return 0;
}
