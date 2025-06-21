#include "host.h"
#define T int32_t
#define DIV 2 // Shift right to divide by sizeof(T)
#define divceil(n, m) (((n) - 1) / (m) + 1)
#define roundup(n, m) ((n / m) * m + m)
#define NR_DPUS 1
static void read_input(T *A, T *B, unsigned int nr_elements)
{
    srand(time(NULL));
    printf("nr_elements\t%u\t", nr_elements);
    for (unsigned int i = 0; i < nr_elements; i++)
    {
        A[i] = (T)(rand());
        B[i] = (T)(rand());
    }
}
static void vector_addition_host(T *C, T *A, T *B, unsigned int nr_elements)
{
    for (unsigned int i = 0; i < nr_elements; i++)
    {
        C[i] = A[i] + B[i];
    }
}
static T *A;
static T *B;
static T *C;
static T *C2;
const unsigned int input_size = 1024;
namespace upmem_sim::simulator::faho::def
{
    def::Event *VA::benchmark(int time_)
    {
   
        if (events_.empty())
        {
            if(end_flag == 1)
            {
                exit(0); // 退出程序
            }
            end_flag = 1; // 设置结束标志
            return nullptr;
            //退出代码
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
    void VA::check(int pid)
    {
 
        for (int i = 0; i < input_size; i++)
        {
            if (C[i] != C2[i])
            {
                printf("i =%i  %i %i %i %i\n", i, C[i], C2[i], A[i], B[i]);
                assert(0);
            }
        }
        return;
        
        assert(0);
    }
    void VA::benchmark_init(std::string bindir)
    {
        bindir_ = bindir;

        uint32_t nr_of_dpus = NR_DPUS; // Number of DPUs to use

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
                                  // Input/output allocation
        A = (T *)malloc(input_size_dpu_8bytes * nr_of_dpus * sizeof(T));
        B = (T *)malloc(input_size_dpu_8bytes * nr_of_dpus * sizeof(T));
        C = (T *)malloc(input_size_dpu_8bytes * nr_of_dpus * sizeof(T));
        C2 = (T *)malloc(input_size_dpu_8bytes * nr_of_dpus * sizeof(T));
        T *bufferA = A;
        T *bufferB = B;
        T *bufferC = C2;
        read_input(A, B, input_size);
        vector_addition_host(C, A, B, input_size);
        

        dpu_arguments_t input_arguments[NR_DPUS];
        for (int i = 0; i < NR_DPUS - 1; i++)
        {
            input_arguments[i].size = input_size_dpu_8bytes * sizeof(T);
            input_arguments[i].transfer_size = input_size_dpu_8bytes * sizeof(T);
        }
        input_arguments[nr_of_dpus - 1].size =
            (input_size_8bytes - input_size_dpu_8bytes * (NR_DPUS - 1)) * sizeof(T);
        input_arguments[nr_of_dpus - 1].transfer_size =
            input_size_dpu_8bytes * sizeof(T);

        // Copy input arrays
        bufferC[0] = 0;
        def::Event *event;
        char ok;
        event = init_NewProcess(1, 1000, NR_DPUS, "VA.16");//只有new和lanuch指定role_id=1
        events_.push_back(event);
        event = init_LanuchProcess(1, 1100);
        events_.push_back(event);
        event = init_ReadSocket(1);//dpu已经启动
        events_.push_back(event);

        event = init_InodeWrite(1, 1200, 0, transfer_buf_bytes(&input_arguments[0], sizeof(input_arguments[0])));
        events_.push_back(event);
        event = init_InodeWrite(1, 1300, sizeof(input_arguments[0]),
                                transfer_buf_bytes(bufferA + input_size_dpu_8bytes * 0, input_size_dpu_8bytes * sizeof(T)));
        events_.push_back(event);
        event = init_InodeWrite(1, 1400, sizeof(input_arguments[0]) + input_size_dpu_8bytes * sizeof(T),
                                transfer_buf_bytes(bufferB + input_size_dpu_8bytes * 0, input_size_dpu_8bytes * sizeof(T)));
        events_.push_back(event);


        event = init_WriteSockets(1, 2000, 1,
                                  transfer_buf_bytes(&ok, 1));//告诉dpu_code写入已经完成
        events_.push_back(event);

        event = init_ReadSocket(1);//告诉主机计算完成
        events_.push_back(event);

        event = init_InodeRead(1, 3000, bufferC, sizeof(input_arguments[0]) + input_size_dpu_8bytes * sizeof(T), input_size_dpu_8bytes * sizeof(T));
        events_.push_back(event);
        event = init_Check(1);
        events_.push_back(event);
    }

}