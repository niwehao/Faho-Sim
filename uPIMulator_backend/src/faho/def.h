#ifndef PMEM_SIM_SIMULATOR__FAHO_DEF_H_
#define PMEM_SIM_SIMULATOR__FAHO_DEF_H_
#include <stdint.h> //uint_*_t
#include "faho/k1.h"
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

#include <fcntl.h>
#include <unistd.h>
#include <unistd.h>    // 用于read, close
#include <sys/types.h> // 用于基本系统类型
#include <sys/stat.h>  // 用于文件状态

namespace upmem_sim::simulator::faho::def
{
  int dpu_id_address;
  int processs_address;
  int inode_table_address;

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
    NONE = 0,
    NewProcess = 1,
    LaunchProcess = 2,
    WriteSocket = 3, // socket_write_handle_evt
    InodeWrite = 4,
    InodeRead = 5,
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
    encoder::ByteStream *buf;
    int size;
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
  };

  class DpuManager
  {

  public:
    DpuManager(int id, dpu::DPU *dpu);
    ~DpuManager();
    dpu::DPU *dpu;
    DpuFlag *dpu_flag;
    struct def::kernel_info ki;  
    uint32_t dpu_id;
    u_int16_t inode_table[MAX_PRG][4][2];
    u_int8_t process_table[MAX_PRG] = {0};
    std::vector<struct process_host *> processes;
    std::vector<struct ProcessEvent *> unload_processes;
    std::vector<struct ProcessEvent *> load_processes;
    std::vector<struct ProcessEvent *> unlaunch_processes;
    std::vector<struct ProcessEvent *> launch_processes;//启动和结束
    socket::WriteSocket *write_socket;
    inode::WriteInode *write_inode;
    inode::ReadInode *read_inode;
    int num_process = 0;
    int inode_num = 3; // 留下一个节点去储存process
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
    uint32_t off_set_prg;
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
    int index; // 进程在dpu_manager中的索引
    ProcessEvent(process_host *process, Event *event, int index);
  };

  uint32_t init_process(struct process_host *pi,
                        uint8_t instant_launched, int pid, int role_id, int app_id,std::string path);
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