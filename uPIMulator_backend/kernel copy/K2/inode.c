#include "inode.h"
#include "kernel.h"
#include <stdint.h>

extern mutex_id_t mutex_mram;
extern mutex_id_t mutex_inode;

__dma_aligned char newline2[8] __attribute__((section(".data"))) = "      \n";
__host uint16_t inode_table[MAX_PRG][4][2]
    __attribute__((section(".dpu_host"))) = {}; // put the 4 in a define

int inode_operation(uint32_t inode, void *buf, size_t size, uint32_t offset,
                    enum inode_operation op) {
  /*   if ((offset & 7) != 0)
      return PTR_MUST8BIYTEALIGN;
    if (((int)buf & 7) != 0)
      return PTR_MUST8BIYTEALIGN; */
  __mram_ptr void *mram_place =
      (__mram_ptr void *)((inode << 16) + offset); //>16 -> * SIZE_BLOCK

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
    mram_read((__mram_ptr void const *)(off), &bit_map[0], 400);
    for (int j = 0; j < 400; j++) {
      if (bit_map[j] != 0xff) {
        for (int k = 0; k < 8; k++) {
          if (((bit_map[j] >> k) & 1) == 0) {
            // found a place
            int inode = (i * 400 + j) * 8 + k;
            if (inode == 0 || inode == 1)
              continue;
            bit_map[j] |= (1 << k);
            mram_write(bit_map, (__mram_ptr void *)(BIT_MAP + i * 400), 400);
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

/* // unsigned int max  __attribute__((section(".data"))) = 0;
int find_next_inode_or_alloc_it(uint32_t cur_inode) {
  __dma_aligned struct chained_inode_info ci_info;
  inode_operation(cur_inode, &ci_info, sizeof(ci_info),
                  SIZE_BLOCK_CHAINED_INODE, INODE_READ);
  if (ci_info.next_inode == 0) {
    uint32_t new_inode = alloc_inode();

    if (new_inode == 0 ||
        new_inode >=
            1024) // lite bit hard code, 1023 is the last inode possible.
    {
      // printk_int(new_inode);
      return MRAM_FULL;
    }
    inode_operation(new_inode, &ci_info, sizeof(ci_info),
                    SIZE_BLOCK_CHAINED_INODE,
                    INODE_WRITE); // mark that the new inode has no next inode
    ci_info.next_inode = new_inode;
    inode_operation(cur_inode, &ci_info, sizeof(ci_info),
                    SIZE_BLOCK_CHAINED_INODE, INODE_WRITE);
  }

  return ci_info.next_inode;
} *//* 
int found_inode(uint32_t first_inode, uint32_t offset, uint32_t *inodes) {
  // printf("FOUND inode %i %i \n", first_inode, offset);
  uint32_t cur_inode = first_inode, first_conituious_inode = first_inode;
  uint32_t nb_inode_travel = offset / SIZE_BLOCK_CHAINED_INODE;
  // uint32_t nb_inode_travel = (offset >> 3) * ;
  struct chained_inode_info ci_info_cur, ci_info_first;
  inode_operation(cur_inode, &ci_info_first, sizeof(ci_info_first),
                  SIZE_BLOCK_CHAINED_INODE, INODE_READ);
  ci_info_cur = ci_info_first;
  for (uint32_t i = nb_inode_travel; i > 0;) {
    if (ci_info_cur.nb_inode_continuous) {
      if (ci_info_cur.nb_inode_continuous >=
          i) { // the inode[0] is in the continus inodes
        // *inode = first_conituious_inode + i;
        cur_inode = first_conituious_inode + i;
        i = 0;
      } else {
        cur_inode = first_conituious_inode + ci_info_cur.nb_inode_continuous;
        i -= ci_info_cur.nb_inode_continuous;
        inode_operation(cur_inode, &ci_info_cur, sizeof(ci_info_cur),
                        SIZE_BLOCK_CHAINED_INODE, INODE_READ);
        if (ci_info_cur.nb_inode_continuous !=
            0) // just a check (not a problem in itself)
          halt();
        continue;
      }
    } else {
      if (ci_info_cur.next_inode) { // jump to another part of the inode list
        cur_inode = ci_info_cur.next_inode;
        first_conituious_inode = cur_inode;
        inode_operation(cur_inode, &ci_info_cur, sizeof(ci_info_cur),
                        SIZE_BLOCK_CHAINED_INODE, INODE_READ);
        ci_info_first = ci_info_cur;
        i--;
      } else { // need to alocate i new inodes;
        struct chained_inode_info ci_new = {
            .next_inode = 0,
            .nb_inode_continuous = 0,
        };
        for (; i > 0; i--) { // aaaa
          int new_inode = alloc_inode();
          if (new_inode < 0)
            return MRAM_FULL;
          inode_operation(new_inode, &ci_new, sizeof(ci_new),
                          SIZE_BLOCK_CHAINED_INODE, INODE_WRITE);
          ci_info_cur.next_inode = new_inode;
          if ((uint32_t)new_inode == cur_inode + 1) {
            ci_info_first.nb_inode_continuous += 1;
            if (ci_info_first.next_inode == 0)
              ci_info_first.next_inode = new_inode;
          } else {
            inode_operation(first_conituious_inode, &ci_info_first,
                            sizeof(ci_info_first), SIZE_BLOCK_CHAINED_INODE,
                            INODE_WRITE);
            first_conituious_inode = new_inode;
            ci_info_first = ci_new;
          }
          inode_operation(cur_inode, &ci_info_cur, sizeof(ci_info_cur),
                          SIZE_BLOCK_CHAINED_INODE, INODE_WRITE);
          cur_inode = new_inode;
          ci_info_cur = ci_new;
        }

        inode_operation(first_conituious_inode, &ci_info_first,
                        sizeof(ci_info_first), SIZE_BLOCK_CHAINED_INODE,
                        INODE_WRITE);
      }
    }
  }

  *inodes = cur_inode;
  return 0;
} */

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

unsigned max __attribute__((section(".data"))) = 0;
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