#ifndef PMEM_SIM_SIMULATOR__FAHO_INODE_H_
#define PMEM_SIM_SIMULATOR__FAHO_INODE_H_

#include <stdint.h>              // uint*_t
#include "simulator/rank/rank.h" // 如果需要的话
#include "faho/k1.h"             // 如果需要的话
#include "faho/def.h"


// 如果确实需要std命名空间
using namespace std;

namespace upmem_sim::simulator::faho::inode
{
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
            std::string path;
        } ;
    class WriteInode
    {
    public:
        unsigned int nb_data=0;
        std::vector<inode_data*> data;
        
    };
    class ReadInode
    {
    public:
        unsigned int nb_data=0;
        std::vector<inode_data*> data;
    };
    // 假设di是某种类型，p是指向某结构的指针
    int write_content_inode(encoder::ByteStream *buf, int size,
                            dpu::DPU *dpu);
    int alloc_inode(dpu::DPU *dpu);
    void read_inode(def::DpuManager *dpu_manager, int inode, void *buf, int size, int offset);
    void write_inode(def::DpuManager *dpu_manager, int node, encoder::ByteStream *buf, int size, int offset);
    void write_inode(def::DpuManager *dpu_manager, int node, void *buf, int size, int offset);
    void add_write_data_inode(def::DpuManager *dpu_manager,def::Event* event , def::process_host *process,int prc_ix);
    int write_chained_inode(def::DpuManager *dpu_manager, int prc_idx, void *buf,
                        uint32_t size, uint32_t offset) ;
    void add_read_request(def::DpuManager *dpu_manager, def::Event* event,
                      uint32_t pid);
    
    int find_inode(int proc_idx, def::DpuManager *dpu_manager, uint32_t offset);
    int read_chained_inode(def::DpuManager *dpu_manager, int prc_ix,void* buf,uint32_t size, uint32_t offset) ;
    int free_inode(def::DpuManager *dpu_manager, uint32_t inode);
    void free_chained_inode(def::DpuManager *dpu_manager, int prc_idx);
    uint8_t bit_map[BUFFER_BIT_MAP];

}
#endif // PMEM_SIM_SIMULATOR__FAHO_INODE_H_