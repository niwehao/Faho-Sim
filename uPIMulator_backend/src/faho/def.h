#ifndef PMEM_SIM_SIMULATOR__FAHO_DEF_H_
#define PMEM_SIM_SIMULATOR__FAHO_DEF_H_
#include <stdint.h>              //uint_*_t
#include "util/config_loader.h"  // util::ConfigLoader
#include "encoder/byte_stream.h" // ByteStream
#include "simulator/dpu/dpu.h"

#define MAX_PRG 10
#define BUFFER_BIT_MAP 400
#define JOB_PER_PROCESS 100
#define QUANTOM_STOP_DPU 50000000
#define PROCESS_QUANTOM QUANTOM_STOP_DPU / 100
#define QUANTOM_JOB PROCESS_QUANTOM / 20
#define SIZE_BIT_MAP 4000
#define BIT_MAP (INODE_BLOCK - SIZE_BIT_MAP)
#define INODE_BLOCK (1 << 16) // 64KB total_inode=64M/64KB=1024
#define NEW_PROCESS 1
#define PROCESS_END 2
#define SOCKET_OUT 8
#define NEW_SOCKET 16
#define MAX_SD 3
#define SIZE_STACK 512
#define SIZE_SOCKET (INODE_BLOCK >> 2)
#define SIZE_BLOCK INODE_BLOCK
#define JOB_PER_PROCESS 100
#define __aligned(a) __attribute__((aligned(a)))
#define __dma_aligned __aligned(8)
#include <fcntl.h>
#include <unistd.h>
#include <unistd.h>
#include <sys/types.h>
#include <fstream>    // std::ifstream, std::ofstream, std::fstream
#include <iostream>   // std::cin, std::cout, std::cerr
#include <sstream>  
#include <sys/stat.h>
#include "faho/inode.h"
#include "faho/socket.h"
#include "faho/benchmark/host.h"
namespace upmem_sim::simulator::faho::def
{
  typedef uint8_t *mutex_id_t;
  struct custom_barriere {
  unsigned char nb;
  unsigned char pending;
  unsigned char ret_val;
  mutex_id_t mutex;
};
  struct job {
    uint8_t state;
    uint8_t jid;
    uint32_t beginstack; // allow to reuse the stack
    uint32_t sync_addr;  // if the process is in state WAITING or SLEEPING, it is
                        // the addr to wakeup it
    uint32_t time;
    uint32_t fc;
  };
  enum STATE
  { // state of a process
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
  enum KIND
  { // state of a process
    NewProcess = 1,
    LaunchProcess = 2,
    WriteSockets = 3, // socket_write_handle_evt
    InodeWrite = 4,
    InodeRead = 5,
    ReadSocket = 6, 
    Check = 7, 
  };

  struct kernel_info
  {
    uint32_t _syscall_jump[2];
    uint32_t flag1;
    uint32_t Bit8_align;
  };
  class Event
  {
  public:
    int pid; // pid=role_id
    int time;
    int num_dpu;
    int kind;
    int offset;
    std::string path;
    void* pointer;
    encoder::ByteStream *buf;
    int size;
  };
  class inode_data
  {
  public:
    inode_data(int pid);
    ~inode_data();
    unsigned int size;
    unsigned int pid;
    unsigned int prc_ix;
    encoder::ByteStream *buf;
    int offset;
    void* pointer;
  };
  class WriteInode
  {
  public:
    unsigned int nb_data = 0;
    std::vector<inode_data *> data;
  };
  class ReadInode
  {
  public:
    unsigned int nb_data = 0;
    std::vector<inode_data *> data;
  };
  class socket_data
  {
  public:
    socket_data(int pid);
    ~socket_data();
    unsigned int size;
    unsigned int pid;
    encoder::ByteStream *buf;
  };
  class WriteSocket
  {
  public:
    unsigned int nb_data = 0;
    std::vector<socket_data *> data;
  };
  class CheckResult
  {
  public:
    unsigned int nb_data = 0;
    int rolepids[MAX_PRG] = {0};
  };
  class DpuFlag
  {
  public:
    int load_proc = 0;
    int launch_proc = 0;
    int write_inode = 0;
    int read_inode = 0;
    int write_socket = 0;
    int dpu_process_change = 0;
    int check=0;
  };

  class DpuManager
  {

  public:
    DpuManager(int id, dpu::DPU *dpu);
    dpu::DPU *dpu;
    DpuFlag *dpu_flag;

    struct def::kernel_info ki;
    uint32_t dpu_id;
    u_int16_t inode_table[MAX_PRG][4][2]={0};
    u_int8_t process_table[MAX_PRG] = {0};
    std::vector<struct process_host *> processes;
    std::vector<struct ProcessEvent *> unload_processes;
    std::vector<struct ProcessEvent *> load_processes;
    std::vector<struct ProcessEvent *> unlaunch_processes;
    std::vector<struct ProcessEvent *> launch_processes;
    //__dma_aligned struct def::job jobs[JOB_PER_PROCESS];
    WriteSocket *write_socket;
    CheckResult *check_result;
    WriteInode *write_inode;
    ReadInode *read_inode;
    int num_process = 0;
    int inode_num = 2;
  };
  struct socket_descriptor
  {
    uint32_t inode;
    uint32_t flags;
  };
  struct prg
  {                      // the content of the program of a process
    uint32_t inode_data; // where the data (WRAM) is store in MRAM
    // uint32_t chained_inode;
    uint32_t size_data;
    uint32_t inode_text; // where the instruction (IRMA) is store in MRAM
    uint32_t size_text;
    uint32_t off_stack; // where the stack begin (to create the process)
    uint32_t extra_inode;

    int multiple_8;
  };
  struct process_host // must be the same like process
  {
    uint8_t app_id;
    uint8_t role;
    uint8_t nb_jobs;
    uint32_t pid;
    uint32_t state;
    uint32_t end_value;
    uint32_t off_set_prg = 0;
    uint32_t timer;
    uint32_t begin_stack;
    struct prg prg;
    struct socket_descriptor sd[MAX_SD];
  };

  class ProcessEvent // must be the same like process
  {
  public:
    process_host *process;
    Event *event;
    int index;
    ProcessEvent(process_host *process, Event *event, int index);
  };

  uint32_t init_process(struct process_host *pi,
                        uint8_t instant_launched, int pid, int role_id, int app_id, std::string path);
  void dpu_copy_from_mram(dpu::DPU *dpu, void *buf, int offset, int size);
  void dpu_copy_to_mram(dpu::DPU *dpu, int offset, void *buf, int size);
  void dpu_copy_from_wram(dpu::DPU *dpu, void *buf, int offset, int size);
  void dpu_copy_to_wram(dpu::DPU *dpu, int offset, void *buf, int size);
  void set_flags(DpuManager *dpumanager, unsigned int flag1);
  int read_flag(DpuManager *dpumanager);
  void write_flags(DpuManager *dpumanager, unsigned int flag);
  void dpu_copy_to_mram_bytes(dpu::DPU *dpu, int offset, encoder::ByteStream *buf, int size);

}

#endif