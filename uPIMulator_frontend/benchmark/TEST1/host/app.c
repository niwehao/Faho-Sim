/* Communication with a DPU via the MRAM. */
/* Populate the MRAM with a collection of bytes and request the DPU to */
/* compute the checksum. */

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <dpu.h>
#include <dpu_log.h>
#include <unistd.h>
#include <getopt.h>
#include <assert.h>

#include "../support/common.h"
#include "../support/timer.h"
#include "../support/params.h"

// Define the DPU Binary path as DPU_BINARY here
#ifndef DPU_BINARY
#define DPU_BINARY "./bin/dpu_code"
#endif

#if ENERGY
#include <dpu_probe.h>
#endif

int main(int argc, char **argv) {
    struct dpu_set_t dpu_set, dpu;
    int a;
    int i=0;


    DPU_ASSERT(dpu_alloc(1, NULL, &dpu_set));
    DPU_ASSERT(dpu_load(dpu_set, DPU_BINARY, NULL));
    DPU_FOREACH(dpu_set, dpu, i) {
        DPU_ASSERT(dpu_prepare_xfer(dpu,&a));
    }
    DPU_ASSERT(dpu_push_xfer(dpu_set, DPU_XFER_TO_DPU, DPU_MRAM_HEAP_POINTER_NAME, 0, sizeof(int), DPU_XFER_DEFAULT));

    DPU_ASSERT(dpu_launch(dpu_set, DPU_SYNCHRONOUS));//启动
    DPU_FOREACH(dpu_set, dpu, i) {
        DPU_ASSERT(dpu_prepare_xfer(dpu, &a));//bufferC的拷贝位置
    }
    DPU_ASSERT(dpu_push_xfer(dpu_set, DPU_XFER_FROM_DPU, DPU_MRAM_HEAP_POINTER_NAME, 0, sizeof(int), DPU_XFER_DEFAULT));
    DPU_ASSERT(dpu_free(dpu_set));
    printf("a=%d\n",a);

    return 0;
}