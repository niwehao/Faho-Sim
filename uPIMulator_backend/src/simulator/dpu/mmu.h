#ifndef UPMEM_SIM_SIMULATOR_DPU_MMU_H_
#define UPMEM_SIM_SIMULATOR_DPU_MMU_H_
#include "dma_command.h"
#include "simulator/dpu/operand_collector.h"
#include "simulator/dram/memory_controller.h"
#include "simulator/sram/atomic.h"
#include "simulator/sram/iram.h"
#include "simulator/sram/wram.h"
#include <stdint.h>
#include "simulator/dpu/performance_counter.h"

namespace upmem_sim::simulator::dpu
{
    class MMU
    {
        public:
        explicit MMU();
        ~MMU()
        {
            delete input_q_;
            delete ready_q_;
        }
        bool can_push() { return input_q_->can_push(); }
        void push(DMACommand *dma_command)
        {
            input_q_->push(dma_command);
        }

        bool can_pop() { return ready_q_->can_pop(); }
        DMACommand *pop() { return ready_q_->pop(); }
        void connect_performance_counter(PerformanceCounter *performance_counter)
        {
            assert(performance_counter != nullptr);
            performance_counter_ = performance_counter;
        }
        void cycle();
        int alloc_inode();
        int alloc_first_inode(int proc_id);
        void free_inode(int inode);
        void free_chained_inode(int proc_id);
        int find_inode(int cur_process_index,int offset);
        
    protected:
        int chained_inode_operation(int proc_id,int size,int offset,DMACommand* dma_command,int buf);
    
        void update_bit_map(uint32_t inode_maxe);
       

    private:
    
        int fProc = -1;
        int flush = 0;
        basic::Queue<DMACommand> *input_q_;
        basic::Queue<DMACommand> *ready_q_;
        uint16_t inode_table[10][4][2];
        uint8_t bit_map[10][400];
        PerformanceCounter *performance_counter_ = nullptr;
    };

}

#endif