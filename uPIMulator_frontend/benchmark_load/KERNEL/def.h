
/**
 * @brief This file is share bewteen HOST and DPU part of pimOS. It define all
 * value of pimOS and also some share struct
 *
 */

#ifndef DEF
#define DEF

#include <stdint.h> //uint_*_t
#ifndef HOST
#include <built_ins.h>
#include <defs.h>
#include <mram.h>
#include <mutex.h>

#endif

#define SIZE_BIT_MAP 4000

// offset in MRAM of different info
#define KERNEL_INFO 0
#define PRG_INFO 1024
#define BIT_MAP (INODE_BLOCK - SIZE_BIT_MAP)
#define INODE_BLOCK (1 << 16) // the inode start at this offset
#define SIZE_BLOCK_CHAINED_INODE (SIZE_BLOCK - 8)

//

#define SIZE_BLOCK INODE_BLOCK // size of inode block
#define SIZE_STACK 512

#define SIZE_SOCKET (INODE_BLOCK >> 2)

#define SOCKET_SIZE_BUFFER 256

#define MAX_PRG 10
#define JOB_PER_PROCESS 100
#define MAX_SOCKET 5
#define NB_INODE_PRO 5
#define MAX_SD 3 // max socket descriptor

#define WRAM_MAX_PROCESS 128*1024 // The (maximum) size of the wram of a user
#define WRAM_OFFSET 512
#define MRAM_OFFSET 636 * 1024

#define QUANTOM_STOP_DPU 5000000
#define PROCESS_QUANTOM QUANTOM_STOP_DPU / 100
#define QUANTOM_JOB PROCESS_QUANTOM / 20

// Kernel flag for K1-K2 communication. [Ki] means setup by Ki
#define NEW_PROCESS 1 // a new process was added [K1]
#define PROCESS_END 2 // a a process in end [K2]
// #define SOCKET_UP 4   // a extern socket has new in value [K1]
#define SOCKET_OUT                                                             \
  8 // a socket write something in output (need to be parse by K1)[K2]
#define NEW_SOCKET 16 // a new extern socket is setup [K2]
// #define SOCKET_UPDATE 32 // a new extern socket is setup [K2]
#define NEW_LOG 64

// flag of socket. [Ki] means setup by Ki
#define SOCKET_USED 1    //[K1]
#define SOCKET_EXTERN 2  // it is a extern socket (manage by K1), [K2]
#define SOCKET_NEW 4     // no yet init by K1 [K2]
#define SOCKET_FAIL 8    // socket is in fault (e.g. penpal not exist) [K2]
#define SOCKET_UPDATE 32 // the socket is update by K1. [K1]
// #define SOCKET_NEWIN 32  // there are new in data (setup by K1) [K1]
#define SOCKET_W 64 // there are new in data write [K1]

#ifndef HOST
#define NULL 0
typedef unsigned int size_t;
#endif

//-------------------------------------

// syscall return error
#define UNKNOW_SYSCALL -1
#define WRAM_FULL -2
#define WRAM_EMPTY -3
#define BUFFER_ERROR -4
#define ERROR_SIZE -5
#define ERROR_ID -6
#define SD_FULL -7
#define SD_UNKNOW -8
#define SD_ANYPENPAL -9
#define SD_SOCKETFULL -10
#define MRAM_FULL -11
#define SD_SELFSOCKET -12
#define PTR_MUST8BIYTEALIGN -13
#define ERROR_SOCKET_K1 -14
#define CHILD_JOB -15
#define JOB_NO_SPACE_LEFT -16
#define INODE_FULL -17
#define INVALID_INODE -18
#define SIZE_LESS_8_OR_NOT_8_MULT -19
#define BUFFER_TOO_BIG -20
#define OFFSET_NOT_8_ALIGN -21


//-------------------------------------

enum STATE { // state of a process
  NONE = 0,
  READY = 1,    // Ready to be launch
  RUNNING = 2,  // Currently running
  PAUSED = 3,   // Has run, now paused until scheduler run it
  FINISHED = 4, // ended
  WAITING = 5,  // wait a lock
  SLEEPING = 6, // sleep until another wakeup it.
  FAILED = 7,
  FINISHED_NO_FREE = 8, // the stack is available for another thread
  LOADED = 9,           // The

};
struct socket_descriptor {
  uint32_t inode;
  uint32_t flags;
};

struct socket_extern_info {
  uint32_t penpal_role;
  uint32_t pid;     // pid of the owner
  uint32_t s_index; // index of the struct socket in sockets
  uint32_t w;       // the offset to write out (send data to another DPU)
  uint32_t rw;      // the offset to write in (data write from another DPU)
  uint32_t rr;      // the offset to read in   (read data read by another DPU)
  uint32_t r_last_action; // one if write zero if read (permet de faire un
                          // buffer ciruclaire 8 aligner sur 8 octets (sans
                          // faire un trou de8 octet))
  uint32_t SIZE_BUFFERS;
};

struct kernel_info {
  uint32_t _syscall_jump[2];
  uint32_t flag1;
  uint32_t Bit8_align;
};

struct socket_info {
  uint32_t w, rr, rw;
  uint32_t __8byte_align;
  // uint32_t __8byte_align;
};
extern int me_new(void); // return the tasklet id




#endif
