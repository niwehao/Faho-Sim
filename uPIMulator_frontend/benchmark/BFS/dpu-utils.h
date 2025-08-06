
#ifndef _DPU_UTILS_H_
#define _DPU_UTILS_H_


// #include <mram.h>
#include "../stdsys.h"
#include "support/common.h"



uint32_t nbl8, nbs8, nbl4, nbs4;

static uint64_t load8B(uint32_t ptr_m, uint32_t idx, uint64_t *cache_w) {
  //   mram_read((__mram_ptr void const *)(ptr_m + idx * sizeof(uint64_t)),
  //   cache_w,
  //             8);
  nbl8++;
  if (umram_read(cache_w, 8, ptr_m + idx * sizeof(uint64_t)) != 0) {
    debug("umram_read");
    exit_proc(ptr_m);
  };
  return cache_w[0];
}

static void store8B(uint64_t val, uint32_t ptr_m, uint32_t idx,
                    uint64_t *cache_w) {
  nbs8++;
  cache_w[0] = val;

  //   mram_write(cache_w, (__mram_ptr void *)(ptr_m + idx * sizeof(uint64_t)),
  //   8);
  umram_write(cache_w, 8, ptr_m + idx * sizeof(uint64_t));
}

static uint32_t load4B(uint32_t ptr_m, uint32_t idx, uint64_t *cache_w) {
  // Load 8B
  nbl4++;
  int sign=idx%2;//如果是偶数就是1
  uint32_t ptr_idx_m = ptr_m + (idx-sign) * sizeof(uint32_t);
  umram_read(cache_w, 8, ptr_idx_m);
  // Extract 4B
  uint32_t *cache_32_w = (uint32_t *)cache_w;
  return cache_32_w[sign];
    
  
}

static void store4B(uint32_t val, uint32_t ptr_m, uint32_t idx,
                    uint64_t *cache_w) {
  // Load 8B
  nbs4++;
  int sign=idx%2;//如果是偶数就是1
  uint32_t ptr_idx_m = ptr_m + (idx-sign) * sizeof(uint32_t);
  // uint32_t offset = ((uint32_t)ptr_idx_m) % 8;
  // uint32_t ptr_block_m = ptr_idx_m - offset;
  //   mram_read((__mram_ptr void const *)ptr_block_m, cache_w, 8);
  // Modify 4B
  umram_read(cache_w, 8, ptr_idx_m);
  uint32_t *cache_32_w = (uint32_t *)cache_w;
  cache_32_w[sign] = val;
  // Write back 8B
  //   mram_write(cache_w, (__mram_ptr void *)ptr_block_m, 8);
  umram_write(cache_w, 8, ptr_idx_m);
}

void aa(void)
{
  debug_int(nbl8);
  debug_int(nbs8);
  debug_int(nbl4);
  debug_int(nbs4);
}

#endif
