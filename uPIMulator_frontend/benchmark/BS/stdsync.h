#include "stdsys.h"

struct barrier {
  struct lock __lock; 
  unsigned int __nb_waiting; 
  unsigned int __nb_expected;
  volatile unsigned int __nb_exit;
};


struct handshake {
  unsigned char value;
  struct lock l;  
};

void init_barrier(struct barrier *,int nb);

void wait_barrier(struct barrier *);
void active_wait_barrier(struct barrier *);


int init_handshake(struct handshake *h);
int handshake_wait(struct handshake *h);
int handshake_notify(struct handshake *h);


// int init_semaphore(struct semaphore *);

// int P_semaphore(struct semaphore *);

// int V_semaphore(struct semaphore *); 
void init_barrier(struct barrier *barrier, int nb) {
  init_lock(&(barrier->__lock));
  barrier->__nb_waiting = 0;
  barrier->__nb_expected = nb;
  barrier->__nb_exit = 0;
}

void wait_barrier(struct barrier *barrier) {
  lock(&(barrier->__lock));
  barrier->__nb_waiting += 1;
  if (barrier->__nb_waiting == barrier->__nb_expected) {
    wakeup(barrier);
    barrier->__nb_waiting = 0;
  } else {
    sleep(barrier, &(barrier->__lock));
  }
  unlock(&(barrier->__lock));
}

void wait(int a) {
  for (int i = 0; i < a; i++)
    ;
}

void active_wait_barrier(struct barrier *barrier) {
  int nb = 100;
  while (barrier->__nb_exit != 0)
    if (--nb == 0) {
      yield();
      nb = 100;
    }
  while (try_lock(&(barrier->__lock)) != 0)
    ;

  barrier->__nb_waiting += 1;
  if (barrier->__nb_waiting == barrier->__nb_expected) {
    barrier->__nb_waiting = 0;
  } else {
    unlock(&(barrier->__lock));
    nb = 100;
    while (barrier->__nb_waiting != 0) {
      // unlock(&(barrier->__lock)); // Not totaly sure -> they can have very
      //                             // tricky scenario where in theory the
      //                             // barrier
      //                             // will be never cross. (If this thread has

      //                             // always the lock : impossible in
      if (--nb == 0) {
        yield();
        nb = 100;
      }
      //                             // practice)
      // wait(400);
      // while (try_lock(&(barrier->__lock)) != 0)
      ;
    }
    while (try_lock(&(barrier->__lock)) != 0)
      ;
  }
  barrier->__nb_exit++;
  if (barrier->__nb_exit == barrier->__nb_expected)
    barrier->__nb_exit = 0;
  unlock(&(barrier->__lock));
}


/* void active_wait_barrier(struct barrier *barrier) {
  while (try_lock(&(barrier->__lock)) != 0)
    ;

   barrier->__nb_waiting += 1;
  if (barrier->__nb_waiting == barrier->__nb_expected) {
    wakeup(barrier);
    barrier->__nb_waiting = 0;
  } else {
    sleep(barrier, &(barrier->__lock));
  }
  unlock(&(barrier->__lock));
} */

// void active_wait_barrier(struct barrier *barrier) {
// start:
//   lock(&(barrier->__lock));
//   if (barrier->__nb_exit != 0) {
//     unlock(&(barrier->__lock));
//     wait(1000);
//     goto start;
//   }

//   barrier->__nb_waiting += 1;
//   if (barrier->__nb_waiting == barrier->__nb_expected) {
//     barrier->__nb_waiting = 0;
//   } else {
//     while (barrier->__nb_waiting != 0) {
//       unlock(&(barrier->__lock)); // Not totaly sure -> they can have very
//       // tricky scenario where in theory the
//       // barrier
//       // will be never cross. (If this thread has
//       // always the lock : impossible in
//       // practice)
//       wait(1000);
//       lock(&(barrier->__lock));
//     }
//   }
//   barrier->__nb_exit++;
//   if (barrier->__nb_exit == barrier->__nb_expected)
//     barrier->__nb_exit = 0;
//   unlock(&(barrier->__lock));
// }

int init_handshake(struct handshake *h) {
  init_lock(&h->l);
  h->value = 0;
  return 0;
}

int handshake_wait(struct handshake *h) {
  lock(&h->l);
  while (h->value == 0) {
    sleep(h, &h->l);
  }
  h->value = 0;
  unlock(&h->l);
  return 0;
}

int handshake_notify(struct handshake *h) {
  lock(&h->l);
  h->value = 1;
  wakeup(h);
  unlock(&h->l);
  return 0;
}