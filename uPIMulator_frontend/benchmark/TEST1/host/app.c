#include <dpu.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "dpu_elf.h"
#include "dpu_memory.h"


#define DPU_BINARY "./bin/ldmai"
#define SECOND_DPU_BINARY "./bin/__new_ldmai"

int main(int argc, char **argv) {
  struct dpu_set_t set, dpu;
  DPU_ASSERT(dpu_alloc(1, NULL, &set));
  DPU_ASSERT(dpu_load(set, DPU_BINARY, NULL));

  dpu_error_t err;
  dpu_elf_file_t file;
  unsigned char *buf;
  unsigned int size;

  DPU_ASSERT(dpu_elf_open(SECOND_DPU_BINARY, &file));
  DPU_ASSERT(dpu_elf_load_section(file, ".text", &size,
   &buf));

  printf("ELF IRAM size : %i\n",size);

DPU_FOREACH(set,dpu){
  DPU_ASSERT(dpu_copy_to_mram(dpu.dpu, 0, buf, size));
}

  DPU_ASSERT(dpu_launch(set, DPU_SYNCHRONOUS));
  DPU_FOREACH(set,dpu){
    DPU_ASSERT(dpu_copy_from_mram(dpu.dpu, buf,1<<16, 8));//dpu_copy_from_mram(struct dpu_t *dpu, uint8_t *destination, mram_addr_t mram_byte_offset, mram_size_t nb_of_bytes)
  }
  printf("%i %i\n",((int *)buf)[0],((int *)buf)[1]);


  DPU_ASSERT(dpu_free(set));
  return 0;
}
