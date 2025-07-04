#ifndef INODE
#define INODE


#include "def.h"
#include "kernel.h"
#include "inode.h"

#include <stdint.h>

enum inode_operation {
  INODE_READ,
  INODE_WRITE,
};

struct chained_inode_info {
  uint32_t nb_inode_continuous; 
  uint32_t next_inode;
};

// int write_inode(uint32_t inode, void *buf, size_t size, uint32_t offset);
// int read_inode(uint32_t inode, void *buf, size_t size, uint32_t offset);

/**
 * @brief Read/write from/to MRAM to/from buf(WRAM)
 *
 * @param inode
 * @param buf
 * @param size
 * @param offset
 * @param op
 * @return int
 */
int inode_operation(uint32_t inode, void *buf, size_t size, uint32_t offset,
                    enum inode_operation op);

/**
 * @brief Find int the bit map a inode free, mark it at used and return it.
 * A unique to save IRAM place
 *
 * @return int
 */

void free_inode(int inode);

int virtual_access( void *buf, unsigned int size,
                            unsigned int offset, enum inode_operation op);
extern mutex_id_t mutex_mram;
extern mutex_id_t mutex_inode;

__dma_aligned char newline2[8] __attribute__((section(".data"))) = "      \n";
// __host uint16_t inode_table[MAX_PRG][4][2]
//     __attribute__((section(".dpu_host"))) = {}; // put the 4 in a define
extern void store_big_blocks(void *wram_place, __mram_ptr void *mram_place,
                      size_t size);
void load_big_blocks(__mram_ptr void const *mram_place, void *wram_place,
                     size_t size);
int inode_operation(uint32_t inode, void *buf, size_t size, uint32_t offset,
                    enum inode_operation op) {
  /*   if ((offset & 7) != 0)
      return PTR_MUST8BIYTEALIGN;
    if (((int)buf & 7) != 0)
      return PTR_MUST8BIYTEALIGN; */
  __mram_ptr void *mram_place =
      (__mram_ptr void *)((inode << 16) + offset)+MRAM_OFFSET; //>16 -> * SIZE_BLOCK

  /*   if (offset + size > SIZE_BLOCK) {
      return INODE_FULL;
    } */
  // mutex_lock(mutex_mram);

  if (op == INODE_READ)
    load_big_blocks(mram_place, buf, size);
  else
    store_big_blocks(buf, mram_place, size);
  // mutex_unlock(mutex_mram);

  return 0;
}







int virtual_access(void *buf, unsigned int size, unsigned int offset,
                            enum inode_operation op) {

  if (size > SIZE_BLOCK)
    return BUFFER_TOO_BIG;
  if (op == INODE_READ)
    load_big_blocks((__mram_ptr void *)(offset+(1<<31)), buf, size);
  else
    store_big_blocks(buf, (__mram_ptr void *)(offset+(1<<31)), size);
  
  return 0;

  
}

/*
Free the inode : mark it a unsed in bit map.
*/
void free_inode(int inode) {
  (void)inode;
  // TODO, maybe never do because it is unecessary and take place for nothing in
  // IRAM
  //printk_int(75698);
  halt();
}
#endif