#include "faho/inode.h"

namespace upmem_sim::simulator::faho::def
{
    uint8_t bit_map[BUFFER_BIT_MAP];
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
        // 函数实现
        uint8_t bit_map[BUFFER_BIT_MAP];
        dpu_copy_from_mram(dpu, bit_map, BIT_MAP, BUFFER_BIT_MAP);
        for (int i = 0; i < 10; i++)
        {
            int off = BIT_MAP + i * BUFFER_BIT_MAP;
            // def::dpu_copy_from_mram(dpu, def::load_bytes(), off, BUFFER_BIT_MAP);
            for (int j = 0; j < BUFFER_BIT_MAP; j++)
            {
                if (bit_map[j] != 0xff)
                {
                    for (int k = 0; k < 8; k++)
                    {
                        if (((bit_map[j] >> k) & 1) == 0)
                        {
                            // found a place
                            int inode = (i * BUFFER_BIT_MAP + j) * 8 + k;
                            if (inode == 0 || inode == 1 || inode == 2) // 忽略系统占用的inode
                                continue;
                            bit_map[j] |= (1 << k);
                            dpu_copy_to_mram(dpu, off, bit_map, BUFFER_BIT_MAP);
                            return inode;
                        }
                    }
                }
            }
        }
        return -1; // 返回一个int值
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
                            uint32_t size, uint32_t offset,int inode_table_address)
    {
        uint32_t inodes_wirte;
        uint32_t place_inode_left = SIZE_BLOCK - (offset % SIZE_BLOCK);

        uint32_t cur_size = (place_inode_left > size) ? size : place_inode_left;
        int ret;
        if ((ret = find_inode(prc_idx, dpu_manager, offset,inode_table_address)) < 0)
            return ret;
        //std::cout<<"get_node"<<ret<<std::endl;
        inodes_wirte = ret;
        write_inode(dpu_manager, inodes_wirte, buf, cur_size, offset % SIZE_BLOCK);

        size -= cur_size;
        offset += cur_size;
        buf += cur_size;

        while (size)
        {

            cur_size = (size > SIZE_BLOCK) ? SIZE_BLOCK : size;
            int ret =
                find_inode(prc_idx, dpu_manager, offset,inode_table_address); // in the future put inodes[1] instead
                                                          // of first_inode (modify the offset)
            if (ret < 0)
                return ret;
            //std::cout<<"get_node"<<ret<<std::endl;

            inodes_wirte = ret;
            write_inode(dpu_manager, inodes_wirte, buf, cur_size, 0);
            size -= cur_size;
            offset += cur_size;
            buf += cur_size;
        }

        return 0;
    }
    int find_inode(int proc_idx, def::DpuManager *dpu_manager, uint32_t offset,int inode_table_address)
    {
        u_int16_t inode_table[4][2];
        faho::def::dpu_copy_from_wram(dpu_manager->dpu, inode_table, inode_table_address+proc_idx * sizeof(inode_table), sizeof(inode_table));
        int nb_travel = offset / SIZE_BLOCK; // >>
        for (int i = 0; i < 4; i++)
        {
            if (inode_table[i][0] != 0)
            {
                if (nb_travel < inode_table[i][1])
                {
                    return inode_table[i][0] + nb_travel;
                }
                else
                {
                    nb_travel -= inode_table[i][1];
                }
            }
            else
            {        // aloc
                i--; // i can not be 0 beacuse inode_table[i][0] was always setup
                int new_inode;
                do
                {
                    new_inode = alloc_inode(dpu_manager->dpu);
                    if (new_inode == inode_table[i][0] + inode_table[i][1])
                        inode_table[i][1]++;
                    else
                    {
                        i++;
                        if (i >= 4)
                            // TODO("Grab the error, inode_table full");
                            inode_table[i][0] = new_inode;
                        inode_table[i][1] = 1;
                    }
                } while (nb_travel--);
                faho::def::dpu_copy_to_wram(dpu_manager->dpu,inode_table_address+ proc_idx * sizeof(inode_table), inode_table, sizeof(inode_table));
                return new_inode;
            }
        }
        assert(0);

        return -54; // must not reacgh this part
    }
    int free_inode(def::DpuManager *dpu_manager, uint32_t inode)
    {
        if (inode < 2)
            return -1;
        uint32_t k = inode % 8;
        uint32_t i = inode / 3200;
        faho::def::dpu_copy_from_mram(dpu_manager->dpu, bit_map,
                                BIT_MAP + i * BUFFER_BIT_MAP, BUFFER_BIT_MAP);
        uint32_t j = ((inode - k) / 8) % 400;
        // uint32_t off_buf = j / 8;
        bit_map[j] = bit_map[j] & (~(1 << k));

        faho::def::dpu_copy_to_mram(dpu_manager->dpu, BIT_MAP + i * BUFFER_BIT_MAP,
                              bit_map, BUFFER_BIT_MAP);

        return 0;
    }
    void free_chained_inode(faho::def::DpuManager *dpu_manager, int prc_idx,int inode_table_address)
    {

        u_int16_t inode_table[4][2];
        faho::def::dpu_copy_from_wram(dpu_manager->dpu, inode_table, inode_table_address+prc_idx * sizeof(inode_table), sizeof(inode_table));

        for (int i = 0; i < 4; i++)
        {
            if (inode_table[i][1] == 0)
                break;
            for (u_int16_t j = 0; j < inode_table[i][1]; j++)
                free_inode(dpu_manager, inode_table[i][0] + j);
        }
        faho::def::dpu_copy_to_wram(dpu_manager->dpu,  inode_table_address+prc_idx * sizeof(inode_table),inode_table, sizeof(inode_table));
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
    int read_chained_inode(def::DpuManager *dpu_manager, int prc_ix, void *buf, uint32_t size, uint32_t offset,int inode_table_address)
    {
        uint32_t inode;
        uint32_t place_inode_left = SIZE_BLOCK - (offset % SIZE_BLOCK);

        uint32_t cur_size = (place_inode_left > size) ? size : place_inode_left;
        int ret;
        if ((ret = find_inode(prc_ix, dpu_manager, offset,inode_table_address)) < 0)
            return ret;
        inode = ret;
        //std::cout<<"get_node"<<ret<<std::endl;

        //printf("Inode : %i (%x) at offset %i\n", inode, inode * SIZE_BLOCK, offset);
        read_inode(dpu_manager, inode, buf, cur_size, offset % SIZE_BLOCK);
        size -= cur_size;
        offset += cur_size;
        buf += cur_size;

        while (size)
        {
            cur_size = (size > SIZE_BLOCK) ? SIZE_BLOCK : size;
            int ret =
                find_inode(prc_ix, dpu_manager, offset,inode_table_address); // in the future put inodes[1] instead
                                                // of first_inode (modify the offset)
            if (ret < 0)
                return ret;
            //std::cout<<"get_node"<<ret<<std::endl;

            inode = ret;
            read_inode(dpu_manager, inode, buf, cur_size, 0);
            size -= cur_size;
            offset += cur_size;
            buf += cur_size;
        }

        return 0;
    }

}