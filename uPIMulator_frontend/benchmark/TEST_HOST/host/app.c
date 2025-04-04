/* Communication with a DPU via the MRAM. */
/* Populate the MRAM with a collection of bytes and request the DPU to */
/* compute the checksum. */

#include <dpu.h>
#include <stdio.h>
#include <string.h>

#ifndef DPU_BINARY
#define DPU_BINARY "./dpu"
#endif

int main(int argc, char **argv) {
    struct dpu_set_t set, dpu;
    DPU_ASSERT(dpu_alloc(1, NULL, &set));
    DPU_ASSERT(dpu_load(set, DPU_BINARY, NULL));
    DPU_ASSERT(dpu_launch(set, DPU_SYNCHRONOUS));
    DPU_ASSERT(dpu_free(set));
    return 0;
}