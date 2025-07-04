/*
 * Vector addition with multiple tasklets
 *
 */
#include "stdsync.h"
#include "support/common.h"

#define __buffer_aligned __attribute__((aligned(8)))
int main(void) {
  int sd_host = socket_open(0);
  __buffer_aligned T *cache_A = (T *)(sbrk(BLOCK_SIZE) - BLOCK_SIZE);
  umram_read(cache_A, 1024, 512);
  return 0;

}
