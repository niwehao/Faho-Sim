#ifndef STDSYS
#define STDSYS

// int syscall(int type,int arg1, int arg2, int arg3, int arg4);

struct lock {
  unsigned int __owner;
};
#include <mram.h>
#define __buffer_aligned __attribute__((aligned(8)))
#define SIZE_LESS_8_OR_NOT_8_MULT -19
#define BUFFER_TOO_BIG -20
#define OFFSET_NOT_8_ALIGN -21
typedef unsigned int size_t;
/*
Give back to another process.
Be nice give back ;)
*/
int yield();

/*
Increase or decrease your memory (WRAM) of n
*/
int sbrk(int n);

int get_pid(void);
int get_role(void);
int get_appid(void);
int get_jid(void);
int exit_proc(int value);
int debug(char *str);
int debug_int(int value);

int socket_read(unsigned int d, void *buf, unsigned int len);
int socket_write(unsigned int d, void *buf, unsigned int len);

/*
Open a socket with the process who has penpal_role role. You must be in the same
application
*/
int socket_open(unsigned char penpal_role);

int socket_close(unsigned char sd);

int init_lock(struct lock *l);
int try_lock(struct lock *l);
int lock(struct lock *l);
int unlock(struct lock *l);
int sleep(void *sync_addr, struct lock *l);
int wakeup(void *sync_addr);

int create_job(void (*fun)(void));
int join_job(void);

int umram_read(void *buf, unsigned int size, unsigned int offset);
int umram_write(void *buf, unsigned int size, unsigned int offset);
extern int syscall(unsigned int value, unsigned int arg1, unsigned int arg2,
            unsigned int arg3, unsigned int arg4);
int socket_read(unsigned int d, void *buf, unsigned int len) {
  return syscall(d, (int)buf, len, 0, 11);
}

int socket_write(unsigned int d, void *buf, unsigned int len) {
  return syscall(d, (int)buf, len, 0, 12);
}

int socket_open(unsigned char penpal_role) {
  return syscall(penpal_role, 0, 0, 0, 10);
}

int socket_close(unsigned char sd) { return syscall(sd, 0, 0, 0, 13); }

int get_jid(void) { return syscall(0, 0, 0, 0, 6); }
int exit_proc(int value) { return syscall(value, 0, 0, 0, 7); }
int debug(char *str) { return syscall((int)str, 0, 0, 0, 8); }
int debug_int(int value) { return syscall(value, 0, 0, 0, 9); }

int init_lock(struct lock *l) { return syscall((unsigned int)l, 0, 0, 0, 14); }

int lock(struct lock *l) { return syscall((unsigned int)l, 0, 0, 0, 15); }
int try_lock(struct lock *l) { return syscall((unsigned int)l, 0, 0, 0, 24); }

int unlock(struct lock *l) { return syscall((unsigned int)l, 0, 0, 0, 16); }

int sleep(void *sync_addr, struct lock *l) {
  return syscall((unsigned int)sync_addr, (unsigned int)l, 0, 0, 17);
}

int wakeup(void *sync_addr) {
  return syscall((unsigned int)sync_addr, 0, 0, 0, 18);
}

int create_job(void (*fun)(void)) {
  return syscall((unsigned int)fun, 0, 0, 0, 20);
}
int join_job(void) { return syscall(0, 0, 0, 0, 21); }

int yield() { return syscall(0, 0, 0, 0, 1); }

int sbrk(int n) { return syscall(n, 0, 0, 0, 2); }

int get_pid(void) { return syscall(0, 0, 0, 0, 3); }

int get_role(void) { return syscall(0, 0, 0, 0, 4); }

int get_appid(void) { return syscall(0, 0, 0, 0, 5); }
void load_big_blocks(__mram_ptr void const *mram_place, void *wram_place,
                     size_t size);
void store_big_blocks(void *wram_place, __mram_ptr void *mram_place,
                      size_t size);
int umram_read(void *buf, unsigned int size, unsigned int offset) {
  if (buf == 0)
      return 0;
    if (((size & 7) != 0))
      return SIZE_LESS_8_OR_NOT_8_MULT;
    if ((offset & 7) != 0){
      return OFFSET_NOT_8_ALIGN;
    }
  if (size > (1<<16))
    return BUFFER_TOO_BIG;
  
  load_big_blocks((__mram_ptr void *)(offset+(1<<31)), buf, size);
  return 0;
  
    //store_big_blocks(buf, (__mram_ptr void *)(offset+(1<<31)), size);
  
}

int umram_write(void *buf, unsigned int size, unsigned int offset) {
  if (buf == 0)
      return 0;
    if (((size & 7) != 0))
      return SIZE_LESS_8_OR_NOT_8_MULT;
    if ((offset & 7) != 0)
      return OFFSET_NOT_8_ALIGN;
  if (size > (1<<16))
    return BUFFER_TOO_BIG;
  store_big_blocks(buf, (__mram_ptr void *)(offset+(1<<31)), size);
   return 0;
}
extern void fault_notif();
extern void print_debug(int value,int align);
/*
mram_read cannot read more than 2048, this function permit to outperform this.
Do not check mram alignement
*/

void load_big_blocks(__mram_ptr void const *mram_place, void *wram_place,
                     size_t size) // mram_read cannot write more than 2048
{
  unsigned int i = 0;
  for (; i < size >> 11; i++) {                                      // / 2048
    mram_read(mram_place + (i << 11), wram_place + (i << 11), 2048); // *2048
  }
  if (size & 2047) // %% 2048
    mram_read(mram_place + (i << 11), wram_place + (i << 11), size & 2047);
}

/*
mram_read cannot write more than 2048, this function permit to outperform this.
Do not check mram alignement
*/
void store_big_blocks(void *wram_place, __mram_ptr void *mram_place,
                      size_t size) {
 
  unsigned int i = 0;
  for (; i < size >> 11; i++) {
    mram_write(wram_place + (i << 11), mram_place + (i << 11), 2048);
  }
  if (size & 2047)
    mram_write(wram_place + (i << 11), mram_place + (i << 11), size & 2047);
}

#endif