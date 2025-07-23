#include "faho/inode.h"

namespace upmem_sim::simulator::faho::def
{

    void read_inode(def::DpuManager *dpu_manager, int inode, void *buf, int size, int offset)
    {
        // 函数实现
        dpu::DPU *dpu = dpu_manager->dpu;
        dpu_copy_from_mram(dpu, buf, inode * SIZE_BLOCK + offset, size);
        // dpu_copy_from_mram
    }
    void write_inode(def::DpuManager *dpu_manager, int inode, void *buf, int size, int offset)
    {
        // 函数实现
        dpu::DPU *dpu = dpu_manager->dpu;
        dpu_copy_to_mram(dpu, inode * SIZE_BLOCK + offset, buf, size);
        // dpu_copy_to_mram
    }
    int write_content_inode(encoder::ByteStream *buf, int size,
                            dpu::DPU *dpu)
    {

        int inode = alloc_inode(dpu);
        // 函数实现
        assert(inode >= 2);
        dpu_copy_to_mram_bytes(dpu, inode * SIZE_BLOCK, buf, size);
        // dpu_copy_to_mram
        return inode; // 返回一个int值
    }
    int alloc_inode(dpu::DPU *dpu)
    {
       return dpu->mmu()->alloc_inode();
      
    }
    void add_write_data_inode(faho::def::DpuManager *DpuManager, faho::def::Event *event, faho::def::process_host *process, int prc_ix)

    {
        // 函数实现
        for (unsigned int i = 0; i < DpuManager->write_inode->nb_data; i++)
        {
            if (DpuManager->write_inode->data[i]->pid == 0)
            {
                DpuManager->write_inode->data[i]->pid = process->pid;
                DpuManager->write_inode->data[i]->buf = event->buf;
                DpuManager->write_inode->data[i]->prc_ix = prc_ix;

                DpuManager->write_inode->data[i]->size = event->buf->size();
                DpuManager->write_inode->data[i]->offset = event->offset;
                return;
            }
        }
        DpuManager->write_inode->nb_data++;
        inode_data *id = new inode_data(process->pid);
        id->buf = event->buf;
        id->size = event->buf->size();
        id->offset = event->offset;
        id->prc_ix = prc_ix;
        DpuManager->write_inode->data.push_back(id);
        return;
    }
    int write_chained_inode(def::DpuManager *dpu_manager, int prc_idx, void *buf,
                            uint32_t size, uint32_t offset)
    {
        uint32_t inodes_wirte;
        uint32_t place_inode_left = SIZE_BLOCK - (offset % SIZE_BLOCK);

        uint32_t cur_size = (place_inode_left > size) ? size : place_inode_left;
        int ret;
        if ((ret = dpu_manager->dpu->mmu()->find_inode(prc_idx, offset)) < 0)
            return ret;
        inodes_wirte = ret;
        write_inode(dpu_manager, inodes_wirte, buf, cur_size, offset % SIZE_BLOCK);

        size -= cur_size;
        offset += cur_size;
        buf += cur_size;

        while (size)
        {

            cur_size = (size > SIZE_BLOCK) ? SIZE_BLOCK : size;
            int ret =
                dpu_manager->dpu->mmu()->find_inode(prc_idx, offset); // in the future put inodes[1] instead
                                                          // of first_inode (modify the offset)
            if (ret < 0)
                return ret;

            inodes_wirte = ret;
            write_inode(dpu_manager, inodes_wirte, buf, cur_size, 0);
            size -= cur_size;
            offset += cur_size;
            buf += cur_size;
        }

        return 0;
    }
   
    int free_inode(def::DpuManager *dpu_manager, uint32_t inode)
    {
        if (inode < 2)
            return -1;
        dpu_manager->dpu->mmu()->free_inode(inode);

        return 0;
    }
    void free_chained_inode(faho::def::DpuManager *dpu_manager, int prc_idx)
    {

        dpu_manager->dpu->mmu()->free_chained_inode(prc_idx);
    }

    void add_read_request(faho::def::DpuManager *dpu_manager, faho::def::Event *event,
                          uint32_t pid)
    {
        dpu_manager->dpu_flag->read_inode = 1;
        for (unsigned int i = 0; i < dpu_manager->read_inode->nb_data; i++)
        {
            if (dpu_manager->read_inode->data[i]->pid == 0)
            {
                dpu_manager->read_inode->data[i]->pid = pid;
                dpu_manager->read_inode->data[i]->pointer = event->pointer;
                dpu_manager->read_inode->data[i]->size = event->size;
                dpu_manager->read_inode->data[i]->offset = event->offset;
                return;
            }
        }
        dpu_manager->read_inode->nb_data++;
        inode_data *id = new inode_data(pid);
        id->pointer = event->pointer;
        id->size = event->size;
        id->offset = event->offset;
        dpu_manager->read_inode->data.push_back(id);
        return;
    }
    inode_data::inode_data(int pid)
    {
        this->pid = pid;
        this->size = 0;
        this->buf = nullptr;
        this->offset = 0;
    }
    inode_data::~inode_data()
    {
        if (this->buf != nullptr)
        {
            delete this->buf;
            this->buf = nullptr;
        }
    }
    int read_chained_inode(def::DpuManager *dpu_manager, int prc_ix, void *buf, uint32_t size, uint32_t offset)
    {
        uint32_t inode;
        uint32_t place_inode_left = SIZE_BLOCK - (offset % SIZE_BLOCK);

        uint32_t cur_size = (place_inode_left > size) ? size : place_inode_left;
        int ret;
        if ((ret = dpu_manager->dpu->mmu()->find_inode(prc_ix, offset)) < 0)
            return ret;
        inode = ret;

        //printf("Inode : %i (%x) at offset %i\n", inode, inode * SIZE_BLOCK, offset);
        read_inode(dpu_manager, inode, buf, cur_size, offset % SIZE_BLOCK);
        size -= cur_size;
        offset += cur_size;
        buf += cur_size;

        while (size)
        {
            cur_size = (size > SIZE_BLOCK) ? SIZE_BLOCK : size;
            int ret =
                dpu_manager->dpu->mmu()->find_inode(prc_ix, offset); // in the future put inodes[1] instead
                                                // of first_inode (modify the offset)
            if (ret < 0)
                assert(0);
            inode = ret;
            read_inode(dpu_manager, inode, buf, cur_size, 0);
            size -= cur_size;
            offset += cur_size;
            buf += cur_size;
        }

        return 0;
    }

}