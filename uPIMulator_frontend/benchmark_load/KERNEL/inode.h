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
int alloc_inode();

/**
 * @brief TODO
 *
 * @param inode
 */
void free_inode(int inode);

int chained_inode_operation( void *buf, unsigned int size,
                            unsigned int offset, enum inode_operation op);
extern mutex_id_t mutex_mram;
extern mutex_id_t mutex_inode;

__dma_aligned char newline2[8] __attribute__((section(".data"))) = "      \n";
__host uint16_t inode_table[MAX_PRG][4][2]
    __attribute__((section(".dpu_host"))) = {}; // put the 4 in a define
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

/*
Find a free inode and mark it at used
*/
int alloc_inode() {
  mutex_lock(mutex_mram);
  static __dma_aligned uint8_t bit_map[400] __attribute__((
      section(".data"))) = {}; // check 3200 blocks each times, must be static
                               // in the fun (but need alloc)
  for (int i = 0; i < 10; i++) {
    int off = BIT_MAP + i * 400;
    mram_read((__mram_ptr void const *)(off+MRAM_OFFSET), &bit_map[0], 400);
    for (int j = 0; j < 400; j++) {
      if (bit_map[j] != 0xff) {
        for (int k = 0; k < 8; k++) {
          if (((bit_map[j] >> k) & 1) == 0) {
            // found a place
            int inode = (i * 400 + j) * 8 + k;
            if (inode == 0 || inode == 1)
              continue;
            bit_map[j] |= (1 << k);
            mram_write(bit_map, (__mram_ptr void *)(BIT_MAP + i * 400+MRAM_OFFSET), 400);
            mutex_unlock(mutex_mram);
           
            return inode;
          }
        }
      }
    }
  }
  mutex_unlock(mutex_mram);

  return MRAM_FULL;
}


extern void printk_int(int i);

int find_inode(int proc_idx, uint32_t offset) { // put a mutex
  int nb_travel = offset >> 16;
  mutex_lock(mutex_inode);
  // return inode_table[proc_idx][0][0] + nb_travel; // /SIZEBLOCK

  /*   if (nb_travel < inode_table[proc_idx][0][1]) // here in major case
      return inode_table[proc_idx][0][0] + nb_travel; */
  for (int i = 0; i < 4; i++) {
    if (inode_table[proc_idx][i][0] != 0) {
      if (nb_travel < inode_table[proc_idx][i][1]) {
        mutex_unlock(mutex_inode);
        return inode_table[proc_idx][i][0] + nb_travel;
      } else {
        nb_travel -= inode_table[proc_idx][i][1];
      }
    } else { // aloc
      i--;   // i can not be 0 beacuse inode_table[proc_idx][i][0] was always
             // setup
      int new_inode;
      do {
        new_inode = alloc_inode();
        if (new_inode < 0) {
          mutex_unlock(mutex_inode);
          return new_inode;
        }
        if (new_inode ==
            inode_table[proc_idx][i][0] + inode_table[proc_idx][i][1])
          inode_table[proc_idx][i][1]++;
        else {
          i++;
          if (i >= 4) {
            printk_int(4444);
            mutex_unlock(mutex_inode);

            halt();
          }
          inode_table[proc_idx][i][0] = new_inode;
          inode_table[proc_idx][i][1] = 1;
        }
      } while (nb_travel--); // put a mutex

      mutex_unlock(mutex_inode);

      return new_inode;
    }
  }
  mutex_unlock(mutex_inode);
  return -54; // must not reacgh this part
}

int chained_inode_operation(void *buf, unsigned int size, unsigned int offset,
                            enum inode_operation op) {

  if (size > SIZE_BLOCK)
    return BUFFER_TOO_BIG;
  int ret;
  int rest_dic_offset = offset & (SIZE_BLOCK - 1);
  uint32_t place_inode_left = SIZE_BLOCK - (rest_dic_offset);

  uint32_t cur_size = (place_inode_left > size) ? size : place_inode_left;
  /* if ((ret = find_inode(cur_process_index, offset)) < 0)
    return ret; */
  int nb_travel = offset >> 16;
  if (nb_travel < inode_table[cur_process_index][0][1]) // here in major case
    ret = inode_table[cur_process_index][0][0] + nb_travel;
  else
    ret = find_inode(cur_process_index, offset);

  if (ret >= 1024 || ret < 0)
    return MRAM_FULL;

  if ((ret = inode_operation(ret, buf, cur_size, rest_dic_offset, op)) < 0)
    return ret;
  size -= cur_size;
  if (size == 0)
    return 0;

  offset += cur_size;
  buf += cur_size;

  if ((ret = find_inode(cur_process_index, offset)) < 0)
    return ret;

  if (ret >= 1024 || ret < 0)
    return MRAM_FULL;

  if ((ret = inode_operation(ret, buf, size, 0, op)) < 0)
    return ret;

  return 0;

  /* if (size > SIZE_BLOCK_CHAINED_INODE)
    return BUFFER_TOO_BIG;
  int32_t inode1 = first_inode, inode2;
  uint32_t size1 = 0, size2 = 0;
  while (offset > SIZE_BLOCK_CHAINED_INODE) {

    inode1 = find_next_inode_or_alloc_it(inode1);
    if (inode1 < 0) {
      return inode1;
    }
    offset -= SIZE_BLOCK_CHAINED_INODE;
  }

  if (offset + size > SIZE_BLOCK_CHAINED_INODE) {
    inode2 = find_next_inode_or_alloc_it(inode1);
    if (inode2 < 0) {
      return inode2;
    }
    size1 = SIZE_BLOCK_CHAINED_INODE - offset;
    size2 = size - size1;
    int ret;

    if ((ret = inode_operation(inode1, buf, size1, offset, op)) < 0)
      return ret;
    return inode_operation(inode2, buf + size1, size2, 0, op);

  } else {

    return inode_operation(inode1, buf, size, offset, op);
  } */
}

/*
Free the inode : mark it a unsed in bit map.
*/
void free_inode(int inode) {
  (void)inode;
  // TODO, maybe never do because it is unecessary and take place for nothing in
  // IRAM
  printk_int(75698);
  halt();
}
#endif