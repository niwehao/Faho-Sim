#ifndef PMEM_SIM_SIMULATOR__FAHO_SOCKET_H_
#define PMEM_SIM_SIMULATOR__FAHO_SOCKET_H_
#include "faho/k1.h"
#define SOCKET_USED 1    //[K1]
#define SOCKET_EXTERN 2  // it is a extern socket (manage by K1), [K2]
#define SOCKET_NEW 4     // no yet init by K1 [K2]
#define SOCKET_FAIL 8    // socket is in fault (e.g. penpal not exist) [K2]
#define SOCKET_UPDATE 32 // the socket is update by K1. [K1]
// #define SOCKET_NEWIN 32  // there are new in data (setup by K1) [K1]
#define SOCKET_W 64 // there are new in data write [K1]
namespace upmem_sim::simulator::faho::socket
{
    class socket_data
        {
            public:
            socket_data(int pid);
            ~socket_data();           
            unsigned int size;
            unsigned int pid;
            encoder::ByteStream *buf;
        } ;
    class WriteSocket
    {
    public:
        unsigned int nb_data=0;
        std::vector<socket_data*> data;
        
    };
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
    struct socket_connection *find_free_socket_connection_or_alloc(int nb_so,
                                                                   struct socket_connection *sockets_connection);
    void add_write_data_socket(def::DpuManager *DpuManager, def::Event *event, def::process_host *process);
    void transfert_from_api(def::DpuManager *DpuManager,int nb_so,struct socket_connection *sockets_connection);
    int write_in_socket(def::DpuManager *dpu_manager, int node,  encoder::ByteStream *buf,int size);
}
#endif