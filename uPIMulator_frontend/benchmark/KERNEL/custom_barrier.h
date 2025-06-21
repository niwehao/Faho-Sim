#ifndef SIMPLE_BARRIER
#define SIMPLE_BARRIER 

#include "def.h"


#define __resume(base, off, jmp)                                               \
  __asm__("resume %[ra_r32], " off ", "                                        \
          "nz"                                                                 \
          ", "                                                                 \
          ".+" jmp "" ::[ra_r32] "r"(base)                                     \
          :)
#define __stop()                                                               \
  __asm__("stop "                                                              \
          "false"                                                              \
          ", "                                                                 \
          "0"                                                                  \
          "" ::                                                                \
              :)

/**
 * @brief A TASKLETS barrier customized for our case, with the possibility to
 * wake up all TASKLETS even if the tasklet is not full, or to wake up just one.
 *
 */
struct custom_barriere {
  unsigned char nb;
  unsigned char pending;
  unsigned char ret_val;
  mutex_id_t mutex;
};
/**
 * @brief Classic wait on a barrier. If the barrier is full, all the TASKLETS
 * will be woken up.
 *
 * @param cp Pointer to the barrier control structure.
 * @return int If zero, a classic exit (the barrier was full); otherwise, an
 * abnormal exit.
 */
int sp_wait(struct custom_barriere *);

/**
 * @brief Wake up all TASKLETS that are in sp_wait, regardless of whether the
 * barrier is full or not, and set the return value of sp_wait to 1.
 *
 * @param cp Pointer to the barrier control structure.
 */
extern void wake_up_one(int i);
void abnormal_wakeup(struct custom_barriere *);

/**
 * @brief Wake up one of the TASKLETS that is in sp_wait(), and set its return
 * value to 1.
 *
 * @param cp Pointer to the barrier control structure.
 */

void abnormal_wakeup_one(struct custom_barriere *cp);
int sp_wait(struct custom_barriere *cp) {
  mutex_lock(cp->mutex);
  unsigned char tid = me_new(); // me()
  cp->pending++;
  if (cp->pending == cp->nb) {
    cp->ret_val = 0; // clasic exit
    for (int i = 0; i < cp->nb; i++)
      if (tid != i)
        __resume(i, "0", "0");
    cp->pending = 0;
    mutex_unlock(cp->mutex);
    return 0;
  } else {
    mutex_unlock(cp->mutex);
    
    // big big critical section (same in the SKD), solution ?
    __stop();
  }
  return cp
      ->ret_val; // A critical section can not occurs beceause the value is
                 // change only by the last so if the TASKLETS is steal in
                 // this scoop the value will not be changed. Exept for abnormal
                 // barrier exit just after a normal exit. But in our case it
                 // can not append : the problem can occurs in very specifique
                 // situation where return info will not treat. In conclusion it
                 // works here but this struct should not be reuse.
}

void abnormal_wakeup(struct custom_barriere *cp) {
  mutex_lock(cp->mutex);
  cp->ret_val = 1; // anormal exit
  for (int i = 0; i < cp->nb; i++)
    __resume(i, "0", "1");
  cp->pending = 0;

  mutex_unlock(cp->mutex);
}

void abnormal_wakeup_one(struct custom_barriere *cp) {
  mutex_lock(cp->mutex);
  if (cp->pending == 0)
    goto end;

  cp->ret_val = 1; // anormal exit
  cp->pending--;
  wake_up_one(cp->nb);
end:
  mutex_unlock(cp->mutex);
}

#endif