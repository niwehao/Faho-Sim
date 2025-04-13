#include <mram.h>
#include <stdint.h>
#include <stdio.h>
#include <defs.h>
#include <mram.h>
#include <alloc.h>
#include <perfcounter.h>
#include <barrier.h>

#include "../support/common.h"
__mram uint8_t nb_loop[8] = {2,0, 1, 1, 0, 0, 0, 1};  //3 it is aproxymalty the number of sec to execute the program

// int32_t loop(void) { // take 1 seconde to be done
//     int a = 0;
//     for (int i = 0; i < 10000; i++)
//         for (int j = 0; j < 287; j++)
//             a++;
//     return 10;
// }
int main(void){
    uint8_t local_value[8] = {3,0, 0, 0, 0, 0, 0, 1};
    // uint8_t c=0;
    // while(local_value[0]>0){
    mram_read(nb_loop,local_value,8);
    //     local_value[0]--;
    //     //  local_value[1]++;//3
    //     c++;
    //     //  local_value[2]++;//3
    //mram_write(local_value,nb_loop,8);
    //  }
    // // local_value[1]=0;
    // local_value[0]=c;//1
    local_value[1]=1;//
    mram_write(local_value,(uint32_t)DPU_MRAM_HEAP_POINTER,8);//1341
}



