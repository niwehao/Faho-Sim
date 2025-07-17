#include "host.h" //问题->无法读到第二个socket
#define T int32_t
#define NR_DPUS 1
typedef struct
{
    uint32_t n_size;
    uint32_t n_size_pad;
    uint32_t nr_rows;
    uint32_t max_rows;
} dpu_arguments_t;
static T **A;
static T *B;
static T *B_host;
static T *B_tmp;
static T *C;
static T *C_dpu;
static dpu_arguments_t *input_args;
#define NUM_LAYERS 3
static uint32_t n_size_pad;
static uint32_t max_rows_per_dpu = 0;
#define max(x, y) (x > y ? x : y)
#define min(x, y) (x < y ? x : y)
struct dpu_info_t
{
    uint32_t rows_per_dpu;
    uint32_t rows_per_dpu_pad;
    uint32_t prev_rows_dpu;
};
static struct dpu_info_t *dpu_info;
// Create input arrays
static void init_data(T **A, T *B, T *B_host, unsigned int m_size,
                      unsigned int n_size)
{
    for (unsigned int l = 0; l < NUM_LAYERS; l++)
        for (unsigned int i = 0; i < m_size * n_size; i++)
        {
            if (i % 100 < 98)
            {
                A[l][i] = 0;
            }
            else
            {
                A[l][i] = (l + i) % 2;
            }
        }
    for (unsigned int i = 0; i < n_size; i++)
    {
        if (i % 50 < 48)
        {
            B[i] = 0;
        }
        else
        {
            B[i] = i % 2;
        }
        B_host[i] = B[i];
    }
}

// Compute output in the host
static void mlp_host(T *C, T **A, T *B, unsigned int m_size,
                     unsigned int n_size)
{

    for (unsigned int nl = 0; nl < NUM_LAYERS; nl++)
    {
        for (unsigned int m = 0; m < m_size; m++)
        {
            C[m] = 0;
        }
        for (unsigned int m = 0; m < m_size; m++)
        {
            for (unsigned int n = 0; n < n_size; n++)
            {
                C[m] += A[nl][m * n_size + n] * B[n];
            }
            C[m] = max(0, C[m]);
        }
        for (unsigned int n = 0; n < n_size; n++)
        {
            B[n] = C[n];
        }
    }
}

namespace upmem_sim::simulator::faho::def
{
    def::Event *MLP::benchmark(int time_)
    {

        if (events_.empty())
        {
            if (end_flag == 1)
            {
                 if(excution<layers){
                    excute_2();
                    excution++;
                    if(excution==layers){
                        add_check();
                    }
                    end_flag = 0;
                } 
                else{

                     exit(0); // 退出程序
                }        
            }
            else{
                end_flag = 1; // 设置结束标志
                return nullptr;
            }
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
    void MLP::check(int pid)
    {

        // Check output
        bool status = true;
        unsigned int n, j;
        int i = 0;
        for (n = 0; n < NR_DPUS; n++)
        {
            for (j = 0; j < dpu_info[n].rows_per_dpu; j++)
            {
                if (C[i] != C_dpu[n * max_rows_per_dpu + j])
                {
                    status = false;
                    //printf("%d: %d -- %d\n", i, C[i], C_dpu[n * max_rows_per_dpu + j]);
                }
                i++;
            }
        }
        // Deallocation
        for (i = 0; i < NUM_LAYERS; i++)
            free(A[i]);
        free(A);
        free(B);
        free(C);
        if (status)
        {
            free(C_dpu);
            return;
        }
        else
        {
            free(C_dpu);
            assert(0);
        }
    }
    void MLP::benchmark_init(std::string bindir, int data_prep)
    {
        bindir_ = bindir;
        Event *event;
        layers=NUM_LAYERS;

        uint32_t nr_of_dpus = NR_DPUS; // Number of DPUs to use
        int first_role = 1;
        unsigned int m_size = data_prep;
        unsigned int n_size = data_prep;

        dpu_info =
            (struct dpu_info_t *)malloc(nr_of_dpus * sizeof(struct dpu_info_t));
        input_args =
            (dpu_arguments_t *)malloc(nr_of_dpus * sizeof(dpu_arguments_t));

        n_size_pad = n_size;
        if (n_size % 2 == 1)
        {
            n_size_pad++;
        }
        int i = 0;
        for (; i < nr_of_dpus; i++)
        {
            uint32_t rows_per_dpu;
            uint32_t prev_rows_dpu = 0;
            uint32_t chunks = m_size / nr_of_dpus;
            rows_per_dpu = chunks;
            uint32_t rest_rows = m_size % nr_of_dpus;
            if (i < rest_rows)
                rows_per_dpu++;
            if (rest_rows > 0)
            {
                if (i >= rest_rows)
                    prev_rows_dpu = rest_rows * (chunks + 1) + (i - rest_rows) * chunks;
                else
                    prev_rows_dpu = i * (chunks + 1);
            }
            else
            {
                prev_rows_dpu = i * chunks;
            }

            // Keep max rows for parallel transfers
            uint32_t rows_per_dpu_pad = rows_per_dpu;
            if (rows_per_dpu_pad % 2 == 1) // 4-byte elements
                rows_per_dpu_pad++;
            if (rows_per_dpu_pad > max_rows_per_dpu)
                max_rows_per_dpu = rows_per_dpu_pad;

            dpu_info[i].rows_per_dpu = rows_per_dpu;
            dpu_info[i].rows_per_dpu_pad = rows_per_dpu_pad;
            dpu_info[i].prev_rows_dpu = prev_rows_dpu;

            // Copy input arguments to DPU
            input_args[i].n_size = n_size;
            input_args[i].n_size_pad = n_size_pad;
            input_args[i].nr_rows = rows_per_dpu;
        }
        A = (T **)malloc(NUM_LAYERS * sizeof(T *));
        int l;
        for (l = 0; l < NUM_LAYERS; l++)
            A[l] = (T *)malloc(max_rows_per_dpu * nr_of_dpus * n_size_pad * sizeof(T));

        B = (T *)malloc(n_size * sizeof(T));
        B_host = (T *)malloc(n_size * sizeof(T));
        C = (T *)malloc(m_size * sizeof(T));
        C_dpu = (T *)malloc(max_rows_per_dpu * nr_of_dpus * sizeof(T));
        B_tmp = (T *)malloc(max_rows_per_dpu * nr_of_dpus * sizeof(T));

        init_data(A, B, B_host, m_size, n_size);

        // Compute output on CPU (performance comparison and verification purposes)

        mlp_host(C, A, B_host, m_size, n_size);

        event = init_NewProcess(first_role, 1000, NR_DPUS, "MLP.16");
        events_.push_back(event);
        event = init_LanuchProcess(first_role, 1000);
        events_.push_back(event);
        char ok;
        for (unsigned int i = 0; i < nr_of_dpus; i++)
        {
            event = init_ReadSocket(first_role + i);
            events_.push_back(event);
            if (ok != 0)
            {
                fprintf(stderr, "Error recieved ok (%i) from process %i\n ", ok, i);
            }
        }

        

        i = 0;
        for (; i < nr_of_dpus; i++)
        {
            //   DPU_ASSERT(
            //       dpu_prepare_xfer(dpu, A[0] + dpu_info[i].prev_rows_dpu *
            //       n_size));

            // write_inode(&api, first_role + i,
            //             A[0] + dpu_info[i].prev_rows_dpu * n_size,
            //             max_rows_per_dpu * n_size_pad * sizeof(T), 0);
            
            event = init_InodeWrite(first_role + i, 1000,
                                    0,
                                    transfer_buf_bytes(A[0] + dpu_info[i].prev_rows_dpu * n_size_pad, max_rows_per_dpu * n_size_pad * sizeof(T)));
            events_.push_back(event);
            // //   DPU_ASSERT(dpu_prepare_xfer(dpu, B));
            // write_inode(&api, first_role + i, B, n_size_pad * sizeof(T),
            //             max_rows_per_dpu * n_size_pad * sizeof(T));
            event = init_InodeWrite(first_role + i, 1000,
                                    max_rows_per_dpu * n_size_pad * sizeof(T),
                                    transfer_buf_bytes(B, n_size_pad * sizeof(T)));
            events_.push_back(event);
        }

        // DPU_ASSERT(dpu_launch(dpu_set, DPU_SYNCHRONOUS));
        for (i = 0; i < nr_of_dpus; i++)
        {
            event = init_WriteSockets(first_role + i, 1000, sizeof(dpu_arguments_t),
                                      transfer_buf_bytes(input_args + i, sizeof(dpu_arguments_t)));
            events_.push_back(event); // send and launch the process
        }

        for (i = 0; i < nr_of_dpus; i++)
        {
            event = init_ReadSocket(first_role + i);
            events_.push_back(event); // send and launch the process
        }
        for (; i < nr_of_dpus; i++)
        {
            // DPU_ASSERT(dpu_prepare_xfer(dpu, C_dpu + i * max_rows_per_dpu));
            // ari[i] = ask_read_inode(
            //     &api, first_role + i, max_rows_per_dpu * sizeof(T),
            //     max_rows_per_dpu * n_size_pad * sizeof(T) + n_size_pad * sizeof(T));
            event = init_InodeRead(first_role + i, 1000,
                                    C_dpu + i * max_rows_per_dpu,
                                    max_rows_per_dpu * n_size_pad * sizeof(T) + n_size_pad * sizeof(T),
                                    max_rows_per_dpu * sizeof(T));
            events_.push_back(event);
        }

        
        return;
    }
    void MLP::excute_2()
    {
        unsigned int n, j;
        Event *event;
        int first_role = 1;
        uint32_t nr_of_dpus = NR_DPUS; // Number of DPUs to use
        int i = 0;
        for (n = 0; n < nr_of_dpus; n++)
        {
            for (j = 0; j < dpu_info[n].rows_per_dpu; j++)
            {
                B_tmp[i] = C_dpu[n * max_rows_per_dpu + j];
                i++;
            }
        }
        i = 0;
        // Copy C_dpu
        for (; i < nr_of_dpus; i++)
        {
            // // DPU_ASSERT(dpu_prepare_xfer(dpu, B_tmp));
            // write_inode(&api, first_role + i, B_tmp, n_size_pad * sizeof(T),
            //             max_rows_per_dpu * n_size_pad * sizeof(T));
            event = init_InodeWrite(first_role + i, 1000,
                                    max_rows_per_dpu * n_size_pad * sizeof(T),
                                    transfer_buf_bytes(B_tmp, n_size_pad * sizeof(T)));
            events_.push_back(event);
        }

        i = 0;
        for (; i < nr_of_dpus; i++)
        {
            // // DPU_ASSERT(
            // //     dpu_prepare_xfer(dpu, A[lay] + dpu_info[i].prev_rows_dpu *
            // //     n_size));
            // write_inode(&api, first_role + i, A[lay],
            //             max_rows_per_dpu * n_size_pad * sizeof(T), 0);
            event = init_InodeWrite(first_role + i, 1000, 0,
                                    transfer_buf_bytes(A[excution],
                                                       max_rows_per_dpu * n_size_pad * sizeof(T)));
            events_.push_back(event);
        }
         char new_processing = 0;

        for (i = 0; i < nr_of_dpus; i++)
        {
            event = init_WriteSockets(first_role + i, 1000, 1,
                                      transfer_buf_bytes(&new_processing, 1));
            events_.push_back(event); // send and launch the process
        }
        for (i = 0; i < nr_of_dpus; i++)
        {
            event = init_ReadSocket(first_role + i);

            events_.push_back(event); // DPU已经启动
        }
        i = 0;
        // Copy C_dpu
        for (; i < nr_of_dpus; i++)
        {
            // DPU_ASSERT(dpu_prepare_xfer(dpu, C_dpu + i * max_rows_per_dpu));
            // ari[i] = ask_read_inode(
            //     &api, first_role + i, max_rows_per_dpu * sizeof(T),
            //     max_rows_per_dpu * n_size_pad * sizeof(T) + n_size_pad * sizeof(T));
            event = init_InodeRead(first_role + i, 1000,
                                   C_dpu + i * max_rows_per_dpu,
                                   max_rows_per_dpu * n_size_pad * sizeof(T) + n_size_pad * sizeof(T),
                                   max_rows_per_dpu * sizeof(T));
            events_.push_back(event);
            event = init_Check(first_role + i);
            events_.push_back(event);
        }
    }
    void MLP::add_check(){
        def::Event* event = init_Check(1);
        events_.push_back(event);
    }

}