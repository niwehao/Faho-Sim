#ifndef PMEM_SIM_SIMULATOR__FAHO_INODE_H_
#define PMEM_SIM_SIMULATOR__FAHO_INODE_H_

#include <stdint.h>              // 
#include "faho/def.h"
#include "encoder/byte_stream.h" // ByteStream
#include <vector> 






namespace upmem_sim::simulator::faho::def
{
    class DpuManager;
    class process_host;
    class Event;
  
    int write_content_inode(encoder::ByteStream *buf, int size,
                            dpu::DPU *dpu);
    int alloc_inode(dpu::DPU *dpu);
    void read_inode(DpuManager *dpu_manager, int inode, void *buf, int size, int offset);
    void write_inode(DpuManager *dpu_manager, int node, upmem_sim::encoder::ByteStream *buf, int size, int offset);
    void write_inode(DpuManager *dpu_manager, int node, void *buf, int size, int offset);
    void add_write_data_inode(DpuManager *dpu_manager,Event* event , process_host *process,int prc_ix);
    int write_chained_inode(DpuManager *dpu_manager, int prc_idx, void *buf,
                        uint32_t size, uint32_t offset,int inode_table_address) ;
    void add_read_request(DpuManager *dpu_manager, Event* event,
                      uint32_t pid);
    
    int find_inode(int proc_idx, DpuManager *dpu_manager, uint32_t offset,int inode_table_address);
    int read_chained_inode(DpuManager *dpu_manager, int prc_ix,void* buf,uint32_t size, uint32_t offset,
                        int inode_table_address); 
    int free_inode(DpuManager *dpu_manager, uint32_t inode);
    void free_chained_inode(DpuManager *dpu_manager, int prc_idx,int inode_table_address);
    

}
#endif // PMEM_SIM_SIMULATOR__FAHO_INODE_H_