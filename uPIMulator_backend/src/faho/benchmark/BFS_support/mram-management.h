
#ifndef _MRAM_MANAGEMENT_H_
#define _MRAM_MANAGEMENT_H_

#include "common.h"
#include "utils.h"
#include <stdint.h>
#include <stdlib.h>
#include <unistd.h>

// #define DPU_CAPACITY (64 << 20) // A DPU's capacity is 64 MiB
#define DPU_CAPACITY                                                           \
  ((64 << 20) -                                                                \
   4) // Faho use thre first 2 block and the program binary also use 2 blocks.

struct mram_heap_allocator_t {
  uint32_t totalAllocated;
};

static void init_allocator(struct mram_heap_allocator_t *allocator) {
  allocator->totalAllocated = 0;
}

static uint32_t mram_heap_alloc(struct mram_heap_allocator_t *allocator,
                                uint32_t size) {
  uint32_t ret = allocator->totalAllocated;
  allocator->totalAllocated += ROUND_UP_TO_MULTIPLE_OF_8(size);
  if (allocator->totalAllocated > DPU_CAPACITY) {
    PRINT_ERROR("        Total memory allocated is %d bytes which exceeds the "
                "DPU capacity (%d bytes)!",
                allocator->totalAllocated, DPU_CAPACITY);
    exit(0);
  }
  return ret;
}


#endif
