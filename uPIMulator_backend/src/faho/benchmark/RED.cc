#include "host.h"
#define T int32_t
#define NR_FTHREAD 16
#define NR_DPUS 1
// Pointer declaration
static T *A;
#define divceil(n, m) (((n) - 1) / (m) + 1)
#define roundup(n, m) ((n / m) * m + m)
static int p_exp = 0;              // 0 for weak scaling, 1 for strong scaling
static int p_input_size ; // Input size in elements
typedef struct {
    uint32_t size;
	enum kernels {
	    kernel1 = 0,
	    nr_kernels = 1,
	} kernel;
    T t_count;
} dpu_arguments_t;

typedef struct {
    uint64_t cycles;
    T t_count;
} dpu_results_t;
static dpu_results_t *results_retrieve[NR_DPUS];
static dpu_results_t results[NR_DPUS];
static T count = 0;
static T count_host = 0;

// Create input arrays
static void read_input(T *A, unsigned int nr_elements)
{
    srand(0);
    for (unsigned int i = 0; i < nr_elements; i++)
    {
        A[i] = (T)(rand());
    }
}

// Compute output in the host
static T reduction_host(T *A, unsigned int nr_elements)
{
    T count = 0;
    for (unsigned int i = 0; i < nr_elements; i++)
    {
        count += A[i];
    }

    return count;
}
//没有读到最后一个节点!!!
namespace upmem_sim::simulator::faho::def
{
    def::Event *RED::benchmark(int time_)
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
    void RED::check(int pid)
    {
        T count = 0;
        int nr_of_dpus = NR_DPUS; // Number of DPUs to use

        for (uint32_t i = 0; i < nr_of_dpus; i++)
        {
            // Retrieve tasklet timings
            for (unsigned int each_tasklet = 0; each_tasklet <NR_FTHREAD;
                 each_tasklet++)
            {
                if (each_tasklet == 0)
                    results[i].t_count = results_retrieve[i][each_tasklet].t_count;
            }
            free(results_retrieve[i]);

            // Sequential reduction
            count += results[i].t_count;
        }
        int status = true;
        if (count != count_host){
            status = false;
            std::cout<<"host:"<<count_host<<std::endl;
            std::cout<<"dpu:"<<count<<std::endl;
            

        }
            
         free(A);
        if (status)
        {
            std::cout << "sucess" << std::endl;
            exit(0);
            return;
        }
        else
        {
            assert(0);
        }
    }
    void RED::benchmark_init(std::string bindir,int data_prep)
    {
        bindir_ = bindir;
        p_input_size=data_prep;

        uint32_t nr_of_dpus = NR_DPUS; // Number of DPUs to use
         if(nr_of_dpus!=1){
            std::cout << "not support multiple dpus" << std::endl;
        }
        const unsigned int input_size =
            p_exp == 0 ? p_input_size * nr_of_dpus
                       : p_input_size; // Total input size (weak or strong scaling)
        const unsigned int input_size_8bytes =
            ((input_size * sizeof(T)) % 8) != 0
                ? roundup(input_size, 8)
                : input_size; // Input size per DPU (max.), 8-byte aligned
        const unsigned int input_size_dpu =
            divceil(input_size, nr_of_dpus); // Input size per DPU (max.)
        const unsigned int input_size_dpu_8bytes =
            ((input_size_dpu * sizeof(T)) % 8) != 0
                ? roundup(input_size_dpu, 8)
                : input_size_dpu; // Input size per DPU (max.), 8-byte aligned
        A = (T *)malloc(input_size_dpu_8bytes * nr_of_dpus * sizeof(T));
        T *bufferA = A;
        
        // Create an input file with arbitrary data
        read_input(A, input_size);
        int first_role_id = 1;
        def::Event *event;
        event = init_NewProcess(first_role_id, 1000, nr_of_dpus,
                                 "RED.16"); // Only new and launch specify role_id=1
        events_.push_back(event);
        event= init_LanuchProcess(first_role_id, 1000);
         events_.push_back(event);

        // Compute output on CPU (performance comparison and verification purposes)
        count_host = reduction_host(A, input_size);
        for (uint32_t i = 0; i < nr_of_dpus; i++)
        {
            event = init_ReadSocket(first_role_id + i); // dpu已经启动
            events_.push_back(event);
        }

        count = 0;
        // Input arguments
        unsigned int kernel = 0;
        int i;
        dpu_arguments_t input_arguments[NR_DPUS];
        for (i = 0; i < nr_of_dpus - 1; i++)
        {
            input_arguments[i].size = input_size_dpu_8bytes * sizeof(T);
            input_arguments[i].kernel = static_cast<enum dpu_arguments_t::kernels>(kernel);
        }
        input_arguments[nr_of_dpus - 1].size =
            (input_size_8bytes - input_size_dpu_8bytes * (NR_DPUS - 1)) * sizeof(T);
        input_arguments[nr_of_dpus - 1].kernel = static_cast<enum dpu_arguments_t::kernels>(kernel);

        for (uint32_t i = 0; i < nr_of_dpus; i++)
        {
            int role_id = first_role_id + i;

            //   write_inode(&api, role_id, &input_arguments[i],
            //               sizeof(input_arguments[0]), 0);
            event = init_InodeWrite(role_id, 1000, 0,
                                    transfer_buf_bytes(&input_arguments[i], sizeof(input_arguments[0])));
            events_.push_back(event);

            //   write_inode(&api, role_id, bufferA + input_size_dpu_8bytes * i,
            //               input_size_dpu_8bytes * sizeof(T),
            //               sizeof(input_arguments[0]));
            event = init_InodeWrite(role_id, 100, sizeof(input_arguments[0]),
                                    transfer_buf_bytes(bufferA + input_size_dpu_8bytes * i,
                                                       input_size_dpu_8bytes * sizeof(T)));
            events_.push_back(event);
            results_retrieve[i] =
                (dpu_results_t *)malloc(NR_FTHREAD * sizeof(dpu_results_t));
        }
        for (uint32_t i = 0; i < nr_of_dpus; i++)
        {
            char ok;
            event = init_WriteSockets(first_role_id + i, 1000, 1,
                                      transfer_buf_bytes(&ok, 1)); // 告诉dpu_code写入已经完成
            events_.push_back(event);
        }
        for (uint32_t i = 0; i < nr_of_dpus; i++)
        {
            event = init_ReadSocket(first_role_id + i); // dpu已经启动
            events_.push_back(event);
        }

        //   retrive_inode_at_end(&api, role_id, results_retrieve[i],
        //                        NR_TASKLETS * sizeof(dpu_results_t),
        //                        input_size_dpu_8bytes * sizeof(T) +
        //                            sizeof(input_arguments[0]));
         for (unsigned int i = 0; i < nr_of_dpus; i++)
        {
            event = init_InodeRead(first_role_id + i, 1000,
                                   (uint8_t *)results_retrieve[i],
                                   input_size_dpu_8bytes * sizeof(T) +
                                       sizeof(input_arguments[0]),
                                   NR_FTHREAD * sizeof(dpu_results_t));
            events_.push_back(event);

            event = init_Check(i + first_role_id);
            events_.push_back(event);
        }

    }
    }