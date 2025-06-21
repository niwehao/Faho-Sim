#ifndef PMEM_SIM_SIMULATOR__FAHO_SOCKET_H_
#define PMEM_SIM_SIMULATOR__FAHO_SOCKET_H_
#define SOCKET_USED 1    //[K1]
#define SOCKET_EXTERN 2  // it is a extern socket (manage by K1), [K2]
#define SOCKET_NEW 4     // no yet init by K1 [K2]
#define SOCKET_FAIL 8    // socket is in fault (e.g. penpal not exist) [K2]
#define SOCKET_UPDATE 32 // the socket is update by K1. [K1]
// #define SOCKET_NEWIN 32  // there are new in data (setup by K1) [K1]
#define SOCKET_W 64 // there are new in data write [K1]
#include "encoder/byte_stream.h" // ByteStream
#include <vector> 
#include "faho/def.h"
namespace upmem_sim::simulator::faho::def
{
    
    struct socket_info
    {
        uint32_t w, rr, rw;
        uint32_t __8byte_align;
        // uint32_t __8byte_align;
    };

    struct socket_connection
    {
        uint32_t pid, dpu_id, sd, inode, penpal_pid;
        uint8_t penpal_is_host;
        int32_t penpal_sc_idx, idx; // not a ptr because there are realloc
    };
    class DpuManager; // 前向声明，避免循环依赖
    class process_host; // 前向声明，避免循环依赖
    class Event; // 前向声明，避免循环依赖
    
 
    void add_write_data_socket(DpuManager *DpuManager, Event *event, process_host *process);
    void transfert_from_api(DpuManager *DpuManager,int nb_so,struct socket_connection *sockets_connection);
    int write_in_socket(DpuManager *dpu_manager, int node,  encoder::ByteStream *buf,int size);
    void add_check(faho::def::DpuManager *DpuManager, faho::def::Event *event);
}
#endif