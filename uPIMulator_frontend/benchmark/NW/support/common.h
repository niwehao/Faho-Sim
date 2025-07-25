#ifndef _COMMON_H_
#define _COMMON_H_

// #define uint32_t unsigned int

// Structures used by both the host and the dpu to communicate information
typedef struct {
  uint32_t nblocks;
  uint32_t active_blocks;
  uint32_t penalty;
  uint32_t dummy;
} dpu_arguments_t;

#ifndef BL
#define BL 1024
#endif

// Data type
#define T int32_t

// MAX
int32_t maximum(int32_t a, int32_t b, int32_t c) {

  int32_t k;
  if (a <= b)
    k = b;
  else
    k = a;

  if (k <= c)
    return c;
  else
    return k;
}

#define DPU_CAPACITY (64 << 20) // A DPU's capacity is 64 MiB

#define ANSI_COLOR_RED "\x1b[31m"
#define ANSI_COLOR_GREEN "\x1b[32m"
#define ANSI_COLOR_RESET "\x1b[0m"

#define LIMIT -999

#define DYNAMIC 1
#define PRINT 0
#define PRINT_FILE 0
#ifndef ENERGY
#define ENERGY 0
#endif
#endif
