#include "host.h"

// Data type
#define DTYPE int64_t
#define NR_DPUS 1
#define NR_FTHREAD 4
DTYPE *input;
DTYPE *querys;
typedef struct
{
    uint64_t input_size;
    uint64_t slice_per_dpu;
    enum kernels
    {
        kernel1 = 0,
        nr_kernels = 1,
    } kernel;
} dpu_arguments_t;
static DTYPE result_host = -1;
static DTYPE result_dpu = -1;

// Structures used by both the host and the dpu to communicate information
typedef struct
{
    DTYPE found;
} dpu_results_t;
static dpu_results_t *results_retrieve[NR_DPUS];
void create_test_file(DTYPE *input, DTYPE *querys, uint64_t nr_elements,
                      uint64_t nr_querys)
{

    input[0] = 1;
    for (uint64_t i = 1; i < nr_elements; i++)
    {
        input[i] = input[i - 1] + 1;
    }
    for (uint64_t i = 0; i < nr_querys; i++)
    {
        querys[i] = i;
    }
}
int64_t binarySearch(DTYPE *input, DTYPE *querys, DTYPE input_size,
                     uint64_t num_querys)
{
    uint64_t result = -1;
    DTYPE r;
    for (uint64_t q = 0; q < num_querys; q++)
    {
        DTYPE l = 0;
        r = input_size;
        while (l <= r)
        {
            DTYPE m = l + (r - l) / 2;

            // Check if x is present at mid
            if (input[m] == querys[q])
                result = m;

            // If x greater, ignore left half
            if (input[m] < querys[q])
                l = m + 1;

            // If x is smaller, ignore right half
            else
                r = m - 1;
        }
    }
    return result;
}

namespace upmem_sim::simulator::faho::def
{
    def::Event *BS::benchmark(int time_)
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
    void BS::check(int pid)
    {

        for (uint32_t i = 0; i < NR_DPUS; i++)
        {
            for (unsigned int each_tasklet = 0; each_tasklet < NR_FTHREAD;
                 each_tasklet++)
            {
                if (results_retrieve[i][each_tasklet].found > result_dpu)
                {
                    result_dpu = results_retrieve[i][each_tasklet].found;
                }
            }
            free(results_retrieve[i]);
        }
        free(input);
        free(querys);
        int status = (result_dpu == result_host);
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
    void BS::benchmark_init(std::string bindir,int data_prep)
    {
        bindir_ = bindir;
        Event *event;

        uint32_t nr_of_dpus = NR_DPUS; // Number of DPUs to use
        uint64_t input_size = data_prep;
        uint64_t num_querys = 16;
        // Create an input file with arbitrary data
        input = (DTYPE *)malloc((input_size) * sizeof(DTYPE));
        querys = (DTYPE *)malloc((num_querys) * sizeof(DTYPE));
        create_test_file(input, querys, input_size, num_querys);
        assert(num_querys % ( nr_of_dpus *NR_FTHREAD) == 0);

        // Compute host solution
        result_host = binarySearch(input, querys, input_size - 1, num_querys);

        // Create kernel arguments
        uint64_t slice_per_dpu = num_querys / nr_of_dpus;
        dpu_arguments_t input_arguments = {input_size, slice_per_dpu, static_cast<enum dpu_arguments_t::kernels>(0)};
        int first_role_id = 1;
        event = init_NewProcess(1, 1000, NR_DPUS, "BS.16"); // 只有new和lanuch指定role_id=1
        events_.push_back(event);
        event = init_LanuchProcess(1, 1000);
        events_.push_back(event);
        for (int i = 0; i < nr_of_dpus; i++)
        {
            int role_id = i + first_role_id;
            event = init_ReadSocket(role_id);
            events_.push_back(event); // DPU已经启动
        }
        for (uint32_t i = 0; i < nr_of_dpus; i++)
        {
            int role_id = i + first_role_id;
            //   write_inode(&api, role_id, &input_arguments, sizeof(input_arguments), 0);
            event = init_InodeWrite(role_id, 1000, 0,
                                    transfer_buf_bytes(&input_arguments, sizeof(input_arguments)));
            events_.push_back(event);

            //   write_inode(&api, role_id, input, input_size * sizeof(DTYPE),
            //               sizeof(input_arguments));
            event = init_InodeWrite(role_id, 1000, sizeof(input_arguments),
                                    transfer_buf_bytes(input, input_size * sizeof(DTYPE)));
            events_.push_back(event);

            //   write_inode(&api, role_id, querys + slice_per_dpu * i,
            //               slice_per_dpu * sizeof(DTYPE),
            //               sizeof(input_arguments) + input_size * sizeof(DTYPE));
            event = init_InodeWrite(role_id, 1000, sizeof(input_arguments) + input_size * sizeof(DTYPE),
                                    transfer_buf_bytes(querys + slice_per_dpu * i,
                                                       slice_per_dpu * sizeof(DTYPE)));
            events_.push_back(event);

            results_retrieve[i] =
                (dpu_results_t *)malloc(NR_FTHREAD * sizeof(dpu_results_t));
            // retrive_inode_at_end(&api, role_id, results_retrieve[i],
            //                      NR_FTHREAD * sizeof(dpu_results_t),
            //                      input_size * sizeof(DTYPE) +
            //                          sizeof(input_arguments) +
            //                          input_size * sizeof(DTYPE));
        }
        for (uint32_t i = 0; i < nr_of_dpus; i++)
        {
            char ok;
            event = init_WriteSockets(first_role_id + i, 1000, 1,
                                      transfer_buf_bytes(&ok, 1));
            events_.push_back(event); // send and launch the process
        }
        for (uint32_t i = 0; i < nr_of_dpus; i++)
        {
            event = init_ReadSocket(i + first_role_id);
            events_.push_back(event);
            event = init_InodeRead(i + first_role_id, 1000,
                                   (uint8_t *)results_retrieve[i],
                                   input_size * sizeof(DTYPE) + 
                               sizeof(input_arguments) +
                               input_size * sizeof(DTYPE),
                                   NR_FTHREAD * sizeof(dpu_results_t));
            events_.push_back(event);
        }

        event = init_Check(1);
        events_.push_back(event);
    }

}