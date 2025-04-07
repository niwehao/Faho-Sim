#include <mram.h>
#include <stdint.h>
#include <stdio.h>
#include <defs.h>
#include <mram.h>
#include <alloc.h>
#include <perfcounter.h>
#include <barrier.h>

#include "../support/common.h"
__mram uint8_t nb_loop[8] = {3};  //3 it is aproxymalty the number of sec to execute the program

int32_t loop(void) { // take 1 seconde to be done
    int a = 0;
    for (int i = 0; i < 10000; i++)
        for (int j = 0; j < 287; j++)
            a++;
    return 10;
}

int main(void) {
    uint32_t a;
    //while (nb_loop[0]--) {
    //    a=loop();
    //}
    uint8_t buffer[8];
    *(int32_t*)buffer = a;  // 写入int32_t
    // 2. read from mram
    mram_write(buffer, (__mram_ptr void*)( (uint32_t)DPU_MRAM_HEAP_POINTER),  8);

    return 0;
}