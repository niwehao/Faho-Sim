#include "host.h"
#include <assert.h>
#include <getopt.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
// Pointer declaration
#define T uint64_t
#define DIV 2 // Shift right to divide by sizeof(T)
#define divceil(n, m) (((n) - 1) / (m) + 1)
#define roundup(n, m) ((n / m) * m + m)
static T *A;
static T *C3;
static T *C;
static T *C2;
#define REGS 128
#define NR_DPUS 1
#define NR_FTHREAD 16
static uint32_t accum = 0;
static uint32_t total_count = 0;
static unsigned int p_input_size;
static const unsigned int p_exp = 0;
unsigned int input_size;
static uint32_t *results_scan;
typedef struct
{
    uint32_t t_count;
    uint32_t __8align;
} dpu_results_t;
typedef struct
{
    uint32_t size;
    enum kernels
    {
        kernel1 = 0,
        nr_kernels = 1,
    } kernel;
} dpu_arguments_t;

// Create input arrays
static dpu_results_t results[NR_DPUS];
static dpu_results_t *results_retrieve[NR_DPUS];
static T *bufferA;
static T *bufferC;
static T *bufferC_continious;
char pred(const T x)
{
    return (x % 2) == 0;
}
static unsigned int select_host(T *C, T *A, unsigned int nr_elements)
{
    unsigned int pos = 0;
    for (unsigned int i = 0; i < nr_elements; i++)
    {
        if (!pred(A[i]))
        {
            C[pos] = A[i];
            pos++;
        }
    }
    return pos;
}
static void read_input(T *A, unsigned int nr_elements,
                       unsigned int nr_elements_round)
{

    for (unsigned int i = 0; i < nr_elements; i++)
    {
        // A[i] = (T) (rand());
        A[i] = i + 1;
    }
    for (unsigned int i = nr_elements; i < nr_elements_round;
         i++)
    { // Complete with removable elements
        A[i] = 0;
    }
}
namespace upmem_sim::simulator::faho::def
{
    def::Event *SEL::benchmark(int time_)
    {

        if (events_.empty())
        {
            if (end_flag == 1)
            {
                exit(0); // 退出程序
            }
            end_flag = 1; // 设置结束标志
            return nullptr;
            // 退出代码
        }
        def::Event *event_ = get_event(time_);
        if (event_ == nullptr)
        {
            return nullptr; // 没有事件
        }
        else
        {
            return event_; // 返回事件
        }
    }
    void SEL::check(int pid)
    {
        for (unsigned int i = 0; i < NR_DPUS; i++)
        {
            // Retrieve tasklet timings
            for (unsigned int each_tasklet = 0; each_tasklet < NR_FTHREAD;
                 each_tasklet++)
            {
                // Count of this DPU
                if (each_tasklet == NR_FTHREAD - 1)
                {
                    results[i].t_count = results_retrieve[i][each_tasklet].t_count;
                }
            }
            // Sequential scan
            uint32_t temp = results[i].t_count;
            results_scan[i] = accum;
            accum += temp;
            free(results_retrieve[i]);
        }

        for (unsigned int i = 0; i < NR_DPUS;
             i++) // create the bufferC_continious from
                  // buffer wich are not conntiniuous
            memcpy(bufferC_continious + results_scan[i],
                   bufferC + input_size * sizeof(T) * i,
                   results[i].t_count * sizeof(T));

        bool status = true;
        if (accum != total_count)
        {
            printf("%i %i\n", accum, total_count);
            status = false;
        }
        for (unsigned int i = 0; i < accum; i++)
        {
            if (C[i] != C2[i])
            {
                printf("%d: %lu -- %lu\n", i, C[i], C2[i]);
                status = false;
            }
        }
        free(A);
        free(C);
        free(C2);
        free(C3);
        free(results_scan);
        if (status)
        {
            exit(0);
            return;
        }
        else
        {
            assert(0);
        }
    }
    void SEL::benchmark_init(std::string bindir,int data_prep)
    {
        def::Event *event;
        char ok;
        bindir_ = bindir;
        p_input_size=data_prep;
        unsigned nb_role = NR_DPUS, nr_of_dpus = NR_DPUS;
        int first_role = 1;

        input_size =
            p_exp == 0 ? p_input_size * nr_of_dpus
                       : p_input_size; // Total input size (weak or strong scaling)
        const unsigned int input_size_dpu_ =
            divceil(input_size, nr_of_dpus); // Input size per DPU (max.)
        const unsigned int input_size_dpu_round =
            (input_size_dpu_ % (NR_FTHREAD * REGS) != 0)
                ? roundup(input_size_dpu_, (NR_FTHREAD * REGS))
                : input_size_dpu_; // Input size per DPU (max.), 8-byte aligned
                                   // Input/output allocation
                                   // Input/output allocation
        A = (T *)malloc(input_size_dpu_round * nr_of_dpus * sizeof(T));
        C = (T *)malloc(input_size_dpu_round * nr_of_dpus * sizeof(T));
        C2 = (T *)malloc(input_size_dpu_round * nr_of_dpus * sizeof(T));
        C3 = (T *)malloc(input_size_dpu_round * nr_of_dpus * sizeof(T));

        bufferA = A;
        bufferC = C3;
        bufferC_continious = C2;
        results_scan = (uint32_t *)malloc(nr_of_dpus * sizeof(uint32_t));

        // Create an input file with arbitrary data
        read_input(A, input_size, input_size_dpu_round * nr_of_dpus);
        event = init_NewProcess(1, 1000, NR_DPUS, "SEL.16"); // 只有new和lanuch指定role_id=1
        events_.push_back(event);
        event = init_LanuchProcess(1, 1000);
        events_.push_back(event);
        const unsigned int input_size_dpu = input_size_dpu_round;
        unsigned int kernel = 0;
        int base_offset;
        for (uint32_t i = 0; i < nr_of_dpus; i++)
        {
            event = init_ReadSocket(first_role + i); // dpu已经启动
            events_.push_back(event);
        }
        dpu_arguments_t input_arguments = {input_size_dpu * sizeof(T), static_cast<enum dpu_arguments_t::kernels>(kernel)};
        for (unsigned int i = 0; i < nb_role; i++)
        {
            unsigned int offset = 0;
            int role = i + first_role;
            event = init_InodeWrite(role, 1000, offset, transfer_buf_bytes(&input_arguments, sizeof(input_arguments)));
            events_.push_back(event);
            // write_inode(&api, role, &input_arguments, sizeof(input_arguments),
            //             offset);
            offset += sizeof(input_arguments);
            event = init_InodeWrite(role, 1000, offset,
                                    transfer_buf_bytes(bufferA + input_size_dpu * i,
                                                       input_size_dpu * sizeof(T)));
            events_.push_back(event);

            // write_inode(&api, role, bufferA + input_size_dpu * i,
            //             input_size_dpu * sizeof(T), offset);
            offset += input_size_dpu * sizeof(T);
            base_offset = offset;
            results_retrieve[i] =
                (dpu_results_t *)malloc(NR_FTHREAD * sizeof(dpu_results_t));
            // retrive_inode_at_end(&api, role, results_retrieve[i],
            //                      NR_FTHREAD * sizeof(dpu_results_t), offset);

            // offset += NR_FTHREAD * sizeof(dpu_results_t);
            // printf("offset C %i\n", offset);

            // retrive_inode_at_end(&api, role, bufferC + input_size_dpu * sizeof(T) * i,
            //                      input_size_dpu * sizeof(T), offset);
        }
        for (uint32_t i = 0; i < nr_of_dpus; i++)
        {
            char ok;
            event = init_WriteSockets(first_role + i, 1000, 1,
                                      transfer_buf_bytes(&ok, 1)); // 告诉dpu_code写入已经完成
            events_.push_back(event);
        }
        for (uint32_t i = 0; i < nr_of_dpus; i++)
        {
            event = init_ReadSocket(first_role + i); // dpu已经启动
            events_.push_back(event);
        }

        for (unsigned int i = 0; i < nb_role; i++)
        {
            event = init_InodeRead(i + first_role, 1000,
                                   (uint8_t *)results_retrieve[i],
                                   base_offset, NR_FTHREAD * sizeof(dpu_results_t));
            events_.push_back(event);
            event = init_InodeRead(i + first_role, 1000,
                                   (uint8_t *)(bufferC + input_size_dpu * sizeof(T) * i),
                                   base_offset + NR_FTHREAD * sizeof(dpu_results_t), input_size_dpu * sizeof(T));
            events_.push_back(event);
            event = init_Check(i + first_role);
            events_.push_back(event);
        }
         total_count = select_host(C, A, input_size);
    }

}