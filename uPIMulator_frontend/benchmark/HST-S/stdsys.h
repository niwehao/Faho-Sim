#ifndef STDSYS
#define STDSYS

// int syscall(int type,int arg1, int arg2, int arg3, int arg4);

struct lock {
  unsigned int __owner;
};

#define __buffer_aligned __attribute__((aligned(8)))

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
            unsigned int arg3, unsigned int arg4) ;
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

int umram_read(void *buf, unsigned int size, unsigned int offset) {
  return syscall((unsigned int)buf, (unsigned int)size, (unsigned int)offset, 0,
                 22);
}

int umram_write(void *buf, unsigned int size, unsigned int offset) {
  return syscall((unsigned int)buf, (unsigned int)size, (unsigned int)offset, 0,
                 23);
}

#endif