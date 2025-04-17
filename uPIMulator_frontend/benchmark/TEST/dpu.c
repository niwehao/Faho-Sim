#include <mram.h>
#include <stdint.h>
#include <stdio.h>
#include <defs.h>
#include <mram.h>
#include <alloc.h>
#include <perfcounter.h>
#include <barrier.h>
// mram_write(&temp,(uint32_t)DPU_MRAM_HEAP_POINTER,8);//1341
int fun(int a) {
    int c = 1;
    while (a--) {
      c *= 6;
    }
    return c;
  }
  int main(void) {
    __asm__ volatile("\ttime_cfg r0, %[three]\n"
                     :
                     : [time] "r"(0), [three] "r"(3));
    fun(5);
    unsigned int time = 0;
    __asm__ volatile("\ttime %[time]\n" : [time] "=r"(time));
    // value of the cycle counter is load inside time at this time
    fun(5);
    __asm__ volatile("\ttime %[time]\n" : [time] "=r"(time));
    // value of the cycle counter is load inside time at this time
  }
