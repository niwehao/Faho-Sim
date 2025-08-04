#include "simulator/dpu/mmu.h"
#define INODE_BLOCK (1 << 16) // the inode start at this offset
#define SIZE_BLOCK_CHAINED_INODE (SIZE_BLOCK - 8)

#define SIZE_BLOCK INODE_BLOCK // size of inode block
#define MRAM_OFFSET 636 * 1024
namespace upmem_sim::simulator::dpu
{
    MMU::MMU()
            : input_q_(new basic::Queue<DMACommand>(
                  util::ConfigLoader::max_num_tasklets())), // 输入队列
              ready_q_(new basic::Queue<DMACommand>(
                  util::ConfigLoader::max_num_tasklets() * 2))
        {
            update_bit_map(2); // Initialize the bit map with a size of 400


        } // 准备队列
    void MMU::cycle()
    {

        if (input_q_->can_pop())
        {
            DMACommand *dma_command = input_q_->pop();
            int offset = dma_command->mram_address();
            int buf=dma_command->notmram_address();
            int cur_process_index = performance_counter_->get_fProc();
            int size = dma_command->size();
            chained_inode_operation(cur_process_index, size, offset, dma_command,buf);
        }
    }
    void MMU::free_chained_inode(int proc_id)
    {
        for (int i = 0; i < 4; i++)
        {
            if (inode_table[i][1] == 0)
                break;
            for (u_int16_t j = 0; j < inode_table[proc_id][i][1]; j++)
                free_inode(inode_table[proc_id][i][0] + j);
        }
    }
    int MMU::find_inode(int proc_idx, int offset)
    {
        int nb_travel = offset >> 16;
        for (int i = 0; i < 4; i++)
        {
            if (inode_table[proc_idx][i][0] != 0)
            {
                if (nb_travel < inode_table[proc_idx][i][1])
                {
                    return inode_table[proc_idx][i][0] + nb_travel;
                }
                else
                {
                    nb_travel -= inode_table[proc_idx][i][1];
                }
            }
            else
            {
                int num=0;
                i--; // i can not be 0 beacuse inode_table[proc_idx][i][0] was always
                     // setup
                int new_inode;
                do
                {
                    new_inode = alloc_inode();
                    if (new_inode < 0)
                    {
                        return new_inode;
                    }
                    if (new_inode ==
                        inode_table[proc_idx][i][0] + inode_table[proc_idx][i][1])
                        inode_table[proc_idx][i][1]++;
                    else
                    {
                        i++;
                        if (i >= 4)
                        {
                            assert(0);
                        }
                        inode_table[proc_idx][i][0] = new_inode;
                        inode_table[proc_idx][i][1] = 1;
                    }
                } while (nb_travel--); // put a mutex

                return new_inode;
            }
        }

        return -54; // must not reacgh this part
    }
    int MMU::chained_inode_operation(int cur_process_index, int size, int offset, DMACommand *dma_command,int buf)
    {
        int physics_address;
        int rest_dic_offset = offset & (SIZE_BLOCK - 1);
        uint32_t place_inode_left = SIZE_BLOCK - (rest_dic_offset);
        uint32_t cur_size = (place_inode_left > size) ? size : place_inode_left;
        int ret;
        int nb_travel = offset >> 16;
        if (nb_travel < inode_table[cur_process_index][0][1])
        {
            ret = inode_table[cur_process_index][0][0] + nb_travel;
        }
        else
        {
            ret = find_inode(cur_process_index, offset);
        }
        if (ret >= 1024 || ret < 0)
            assert(0);
        physics_address = (ret << 16) + rest_dic_offset + MRAM_OFFSET;

        
        size -= cur_size;
        if (size == 0){
            dma_command->revise_commend(physics_address,buf, cur_size);
            ready_q_->push(dma_command);
            return 0;
        }
        std::vector<int> bytes_new(size);
        for(int i = cur_size; i < size+cur_size; i++)
        {
            bytes_new[i-cur_size] = dma_command->bytes_read(i);
        }
        dma_command->revise_commend(physics_address,buf, cur_size);

        offset += cur_size;
        buf += cur_size;
        if ((ret = find_inode(cur_process_index, offset)) < 0)
            assert(0);

        if (ret >= 1024 || ret < 0)
            assert(0);
        physics_address = (ret << 16) + 0 + MRAM_OFFSET;
        DMACommand *new_dmacommend;
        if (dma_command->operation()== DMACommand::READ_I || dma_command->operation() == DMACommand::READ)
        {
            new_dmacommend=new DMACommand(dma_command->operation(), buf,
                                      physics_address, size, dma_command->instruction());
        }
        else
        {
            
            new_dmacommend=new DMACommand(dma_command->operation(), buf,
                                      physics_address, size,bytes_new, dma_command->instruction());
        }

        ready_q_->push(new_dmacommend);
        ready_q_->push(dma_command);
        return 0;
        
    }

    void MMU::update_bit_map(uint32_t inode_maxe)
    {
        uint8_t inode_info = 3;
        uint8_t count=0;
        for (unsigned int i = 1; i < inode_maxe + 1; i++)
        {
            if (i % 8 == 0)
            {
                bit_map[0][i] = inode_info;
                inode_info = 0;
                count++;
            }
            inode_info |= (1 << (i % 8));
        }
        bit_map[0][count] = inode_info;
         return;
    }
    void MMU::alloc_first_inode(int Proc_id){
        int first_inode=alloc_inode();
        inode_table[Proc_id][0][0] = first_inode;
        inode_table[Proc_id][0][1] = 1;
    
        
    }
    int MMU::alloc_inode()
    {
        for (int i = 0; i < 10; i++)
        {
            uint8_t *bit_map_ptr = bit_map[i];
            for (int j = 0; j < 400; j++)
            {
                if (bit_map_ptr[j] != 0xff)
                {
                    for (int k = 0; k < 8; k++)
                    {
                        if (((bit_map_ptr[j] >> k) & 1) == 0)
                        {
                            // found a place
                            int inode = (i * 400 + j) * 8 + k;
                            if (inode == 0 || inode == 1)
                                continue;
                            bit_map_ptr[j] |= (1 << k);
                            std::cout<<"alloc inode:"<<inode<<std::endl;
                            assert(inode>0);
                            return inode;
                        }
                    }
                }
            }
        }
    }
    void MMU::free_inode(int inode)
    {
        if (inode < 2)
            return;
        uint32_t k = inode % 8;
        uint32_t i = inode / 3200;
        uint32_t j = ((inode - k) / 8) % 400;
        // uint32_t off_buf = j / 8;
        bit_map[i][j] = bit_map[i][j] & (~(1 << k));
        return;

    }
    
}
