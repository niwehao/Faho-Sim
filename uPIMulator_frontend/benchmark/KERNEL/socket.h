#ifndef SOCKET
#define SOCKET


#include "def.h"
#include "kernel.h"
#include "sync.h"
#include "inode.h"

#include <stdint.h>
#define SIZE_SOCKET_EXT 1 << 12

#define BUF_SOCKET_SIZE                                                        \
  (256 + 8) // plus 8 because must be 8 align and some time this buffer need to
            // read/write more byte

struct socket {
  uint8_t buf[SOCKET_SIZE_BUFFER]; // where the data si shared
  uint8_t w;                       // write offset (module SOCKET_SIZE_BUFFER )
  uint8_t r;                       // read offset (module SOCKET_SIZE_BUFFER )
  uint8_t flag;
  struct lock l;
  union {
    struct socket *s; // if it is not extern socket, the socket of the penpal
                      // (directly write on it)
    uint32_t inode;   // if it is extern socket, the inode where the data is
                      // writing to be manage by K1 (also permit to write more
                      // than SOCKET_SIZE_BUFFER)
  } penpal;
  uint32_t align_8byte; // this structure need to be 8byte aligned
};





extern uint8_t sync_extern_socket;

/**
 * @brief Open a new socket for the process
 *
 * @param penpal, the penpal role id, if 0 a socket to the HOST will be created
 * @return int, return the id of the socket
 */
int socket_open(unsigned int penpal);

/**
 * @brief Close the socket
 *
 * @param sd
 * @return int
 */
int socket_close(unsigned int sd);

/**
 * @brief Read from a socket
 *
 * @param sd
 * @param buf
 * @param len
 * @return int
 */
int socket_read(unsigned int sd, unsigned int buf, unsigned int len);

/**
 * @brief Write into a socket
 *
 * @param sd
 * @param buf
 * @param len
 * @return int
 */
int socket_write(unsigned int sd, unsigned int buf, unsigned int len);

/**
 * @brief Init the socket struct. Call during the first boot of K2
 *
 */
void init_sockets(void);

/**
 * @brief Use in K2 reboot. For each socket, if new event wakeup each socket
 * which are waiting on it.
 *
 * @param newin, if set check SOCKET_UPDATE and SOCKET_NEWIN, if not juste
 * SOCKET_UPDATE
 * @return int
 */
int wakeup_sleepy_socket(void);
extern unsigned char * mutex_sockets;//修改 删除const标志

uint8_t sync_extern_socket __attribute__((section(".data"))) =
    0; // When an exertn socket is in creation the process sleep on this addr
       // (wakeup when the K1 will create the socket)

__dma_aligned uint8_t buf_socket[BUF_SOCKET_SIZE]
    __attribute__((section(".data"))) = {};

// #pragma GCC diagnostic ignored "-Wsection"
/* __dma_aligned struct socket sockets[MAX_SOCKET]
    __attribute__((section(".dpu_host"))) = {}; */
// #pragma GCC diagnostic warning "-Wsection"

extern uint8_t sync_extern_socket __attribute__((section(".data")));

// usefull ? because in data part ?
/* void init_sockets() {
  for (int i = 0; i < MAX_SOCKET; i++)
    sockets[i].flag = 0;
}
 */
int wakeup_sleepy_socket(void) {
  for (unsigned int i = 0; i < MAX_PRG; i++)
    for (unsigned int s = 0; s < MAX_SD; s++)
      if (processs[i].sd[s].flags & SOCKET_UPDATE) {        //????
        processs[i].sd[s].flags &= ~SOCKET_UPDATE;

        wakeup(&processs[i].sd[s], 0, 0);
      }
  return 0;
}

/**
 * @brief Fin free socket in socket list, return -1 if not found
 *
 * @return int16_t
 */
/* int16_t find_free_socket() {
  for (uint8_t i = 0; i < MAX_SOCKET; i++) {
    if (!sockets[i].flag)
      return i;
  }
  return -1;
} */

/* int create_extern_socket(uint8_t penpal_role) {
  int16_t s_index = find_free_socket();
  if (s_index == -1)
    return SD_SOCKETFULL;

  sockets[s_index].flag = SOCKET_USED | SOCKET_EXTERN | SOCKET_NOINIT;
  uint32_t inode = alloc_inode();
  if (inode == 0) {
    sockets[s_index].flag = 0;
    return MRAM_FULL;
  }
  struct socket *s = &sockets[s_index];
  s->penpal.inode = inode;
  s->r = 0;
  s->w = 0;
  s->l.owner = 0;

  __dma_aligned struct socket_extern_info sei;
  sei.penpal_role = penpal_role;
  sei.pid = processs[cur_process_index].pid;
  sei.s_index = s_index;
  sei.w = 0;
  sei.rr = 0;
  sei.rw = 0;

  sei.SIZE_BUFFERS = SIZE_SOCKET_EXT;

  // write_inode(inode, &sei, sizeof(sei), 0);
  inode_operation(inode, &sei, sizeof(sei), 0, INODE_WRITE);

  set_flag(NEW_SOCKET);

  while (s->flag & SOCKET_NOINIT) {
    if (s->flag & SOCKET_FAIL) {
      // free
      free_inode(s->penpal.inode);
      s->flag = 0;
      return ERROR_SOCKET_K1;
    }
    sleep(&sync_extern_socket, NULL, NULL);
  }

  for (unsigned int i = 0; i < MAX_SD; i++) {
    if (processs[cur_process_index].sd[i].id < 0) {
      processs[cur_process_index].sd[i].id = i;
      processs[cur_process_index].sd[i].penpal_role = penpal_role;
      processs[cur_process_index].sd[i].s = s;

      return i;
    }
  }

  s->flag = 0;

  return SD_FULL;
} */
#include "kernel.h"
extern void set_flag(unsigned int flag1);
int socket_open(unsigned int penpal) {
  mutex_lock(mutex_sockets);
  struct process *p = &processs[cur_process_index];
  for (unsigned int i = 0; i < MAX_SD; i++) {
    if (p->sd[i].inode == 0) {
      uint32_t inode = alloc_inode();
      if (inode <= 1) {
        mutex_unlock(mutex_sockets);
        return MRAM_FULL;
      }
      p->sd[i].inode = inode;

      p->sd[i].flags = SOCKET_NEW | SOCKET_USED;

      set_flag(NEW_SOCKET);
      __dma_aligned struct socket_info si = {
          .rr = 0,
          .rw = 0,
          .w = 0,
      };
      __dma_aligned uint32_t penpal_aligned[2] = {penpal, 0};

      if (inode_operation(inode, &si, sizeof(si), 0, INODE_WRITE) != 0)
        halt();
      if (inode_operation(inode, &penpal_aligned, sizeof(penpal_aligned),
                          sizeof(si), INODE_WRITE) != 0)
        halt();

      mutex_unlock(mutex_sockets);
      return i;
    }
  }

  mutex_unlock(mutex_sockets);
  return SD_FULL;
}

int check_sd(unsigned int sd) {
  if (sd > MAX_SD || processs[cur_process_index].sd[sd].inode == 0)
    return SD_UNKNOW;
  return 0;
}

int socket_close(unsigned int sd) {
  mutex_lock(mutex_sockets);
  int ret = check_sd(sd);
  if (ret != 0)
    goto end;

  free_inode(processs[cur_process_index].sd[sd].inode);

  processs[cur_process_index].sd[sd].inode = 0;

end:
  mutex_unlock(mutex_sockets);
  return ret;
}

int socket_read(unsigned int sd, unsigned int _buf, unsigned int len) {
  uint8_t *buf = (uint8_t *)_buf;
  /*   if (len > BUF_SOCKET_SIZE) // keep it simple
      return BUFFER_TOO_BIG; */

  mutex_lock(mutex_sockets);
  int ret = check_sd(sd);
  if (ret != 0)
    goto end;
  int inode = processs[cur_process_index].sd[sd].inode;
  struct socket_info si;

  if (inode_operation(inode, &si, sizeof(si), 0, INODE_READ) != 0)
    halt();

  while (((si.rw >= si.rr) && ((si.rw - si.rr) < len)) ||
         ((si.rw < si.rr) && (SIZE_SOCKET - si.rr + si.rw < len))) {
    sleep(&processs[cur_process_index].sd[sd], NULL, mutex_sockets);
    if (inode_operation(inode, &si, sizeof(si), 0, INODE_READ) != 0)
      halt();
  }

  uint32_t size = ((si.rr + len) / 8 + 1) * 8; // the begin of te=he

  // read the into the buffer of socket
  uint32_t begin_read_buf_socket = sizeof(si) + (si.rr - si.rr % 8);
  if (begin_read_buf_socket + size <= SIZE_SOCKET) {
    inode_operation(inode, buf_socket, size, begin_read_buf_socket, INODE_READ);
  } else { // SIZE_SOCKET >>> BUF_SOCKET_SIZE
    uint32_t first_size = SIZE_SOCKET - begin_read_buf_socket;
    uint32_t second_size = size - first_size;
    inode_operation(inode, buf_socket, first_size, begin_read_buf_socket,
                    INODE_READ);
    inode_operation(inode, buf_socket + first_size, second_size, sizeof(si),
                    INODE_READ);
  }

  uint8_t off = (si.rr % 8);
  for (unsigned int i = 0; i < len; i++)
    buf[i] = buf_socket[i + off];
  si.rr = (si.rr + len) % SIZE_SOCKET;

  inode_operation(inode, &si, sizeof(si), 0, INODE_WRITE);
end:
  mutex_unlock(mutex_sockets);
  return ret;
}

int socket_write(unsigned int sd, unsigned int _buf, unsigned int len) {

  uint8_t *buf = (uint8_t *)_buf;
  if (len > BUF_SOCKET_SIZE) // keep it simple
    return BUFFER_TOO_BIG;

  mutex_lock(mutex_sockets);
  int ret = check_sd(sd);
  if (ret != 0)
    goto end;
  int inode = processs[cur_process_index].sd[sd].inode;
  struct socket_info si;

  // peut être concatener

  if (inode_operation(inode, &si, sizeof(si), 0, INODE_READ) != 0)
    halt();

  while (si.w + len >= SIZE_SOCKET) {
    sleep(&processs[cur_process_index].sd[sd], NULL, mutex_sockets);
    if (inode_operation(inode, &si, sizeof(si), 0, INODE_READ) != 0)
      halt();
  }

  if (si.w % 8) // read previous byte
    inode_operation(inode, buf_socket, 8,
                    sizeof(si) + SIZE_SOCKET + (si.w / 8) * 8, INODE_READ);
  uint8_t off_buf_socket = (si.w % 8);
  for (unsigned int i = 0; i < len; i++)
    buf_socket[i + off_buf_socket] = buf[i];

  uint32_t size = ((si.w + len) / 8 + 1) * 8;

  inode_operation(inode, buf_socket, size,
                  sizeof(si) + SIZE_SOCKET + (si.w / 8) * 8, INODE_WRITE);

  si.w += len;
  inode_operation(inode, &si, sizeof(si), 0, INODE_WRITE);
  processs[cur_process_index].sd[sd].flags |= SOCKET_W;
  set_flag(SOCKET_OUT);
end:
  mutex_unlock(mutex_sockets);
  return ret;
}
#endif