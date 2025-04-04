/* Communication with a DPU via the MRAM. */
/* Populate the MRAM with a collection of bytes and request the DPU to */
/* compute the checksum. */

#include <dpu.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#ifndef DPU_BINARY
#define DPU_BINARY "./dpu"
#endif

int main(int argc, char **argv) {
    struct dpu_set_t set, dpu;
    char number_of_loop = 3;
    if (argc > 1)
        number_of_loop = atoi(argv[1]);
    DPU_ASSERT(dpu_alloc(1, NULL, &set));
    uint8_t buf[8] = {number_of_loop};
    DPU_ASSERT(dpu_load(set, DPU_BINARY, NULL));
    DPU_FOREACH(set, dpu) { DPU_ASSERT(dpu_copy_to(dpu, "nb_loop", 0, buf, 8)); }
    DPU_ASSERT(dpu_launch(set, DPU_SYNCHRONOUS));
    DPU_ASSERT(dpu_free(set));
    return 0;
}