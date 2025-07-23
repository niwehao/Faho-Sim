#include "host.h"
#define T uint32_t
static T *A;
static T *B;
static T *C;
static T *C_dpu;
static int m_size; // Number of rows in matrix A
static int n_size;
static int NR_DPUS = 1; // Number of DPUs to use
typedef struct
{
    uint32_t n_size;
    uint32_t n_size_pad;
    uint32_t nr_rows;
    uint32_t max_rows;
} dpu_arguments_t;
static uint32_t max_rows_per_dpu = 0;
// Specific information for each DPU
struct dpu_info_t
{
    uint32_t rows_per_dpu;
    uint32_t rows_per_dpu_pad;
    uint32_t prev_rows_dpu;
};
dpu_arguments_t *input_args;
static struct dpu_info_t *dpu_info;
// Create input arrays
static void init_data(T *A, T *B, unsigned int m_size, unsigned int n_size)
{
    srand(0);

    for (unsigned int i = 0; i < m_size * n_size; i++)
    {
        A[i] = (unsigned int)(rand() % 50);
    }

    for (unsigned int i = 0; i < n_size; i++)
    {
        B[i] = (unsigned int)(rand() % 50);
    }
}

// Compute output in the host
static void gemv_host(T *C, T *A, T *B, unsigned int m_size,
                      unsigned int n_size)
{
    for (unsigned int i = 0; i < m_size; i++)
    {
        C[i] = 0;
    }

    for (unsigned int m = 0; m < m_size; m++)
    {
        for (unsigned int n = 0; n < n_size; n++)
        {
            C[m] += A[m * n_size + n] * B[n];
        }
    }
}
namespace upmem_sim::simulator::faho::def
{
    def::Event *GEMV::benchmark(int time_)
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
    void GEMV::check(int pid)
    {
        bool status = true;
        unsigned int n, j;
        int i = 0;
        for (n = 0; n < NR_DPUS; n++)
        {
            for (j = 0; j < dpu_info[n].rows_per_dpu; j++)
            {
                if (C[i] != C_dpu[n * max_rows_per_dpu + j])
                {
                    std::cout << "(" << i << "," << j << ") " << C[i] << " " << C_dpu[n * max_rows_per_dpu + j] << std::endl;
                    status = false;
                }
                i++;
            }
        }
        free(A);
        free(B);
        free(C);
        free(C_dpu);
        if (status)
        {
            std::cout << "sucess" << std::endl;
            exit(0);
            return;
            /* code */
        }
        else
        {

            assert(0);
        }
    }
    void GEMV::benchmark_init(std::string bindir, int data_prep)
    {
        bindir_ = bindir;
        def::Event *event;
        m_size = data_prep;
        n_size = data_prep;

        uint32_t nr_of_dpus = NR_DPUS; // Number of DPUs to use
                                       // Initialize help data
        if (nr_of_dpus != 1)
        {
            std::cout << "not support multiple dpus" << std::endl;
        }
        dpu_info =
            (struct dpu_info_t *)malloc(nr_of_dpus * sizeof(struct dpu_info_t));
        input_args =
            (dpu_arguments_t *)malloc(nr_of_dpus * sizeof(dpu_arguments_t));
        max_rows_per_dpu = 0;
        uint32_t n_size_pad = n_size;
        if (n_size % 2 == 1)
        {
            n_size_pad++;
        }
        int i;

        for (i = 0; i < nr_of_dpus; i++)
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

        A = (T *)malloc(max_rows_per_dpu * nr_of_dpus * n_size_pad * sizeof(T));
        B = (T *)malloc(n_size_pad * sizeof(T));
        C = (T *)malloc(max_rows_per_dpu * nr_of_dpus * sizeof(T));

        // Initialize data with arbitrary data
        init_data(A, B, m_size, n_size);

        // Compute output on CPU (performance comparison and verification purposes)
        gemv_host(C, A, B, m_size, n_size);
        // print_data(A, B, C, m_size, n_size);

        int first_role_id = 1;
        event = init_NewProcess(1, 1000, 1, "GEMV.16");

        events_.push_back(event);
        event = init_LanuchProcess(1, 1000);
        events_.push_back(event);
        for (unsigned int i = 0; i < nr_of_dpus; i++)
        {
            char ok;
            event = init_ReadSocket(first_role_id + i);
            events_.push_back(event);
        }

        i = 0;
        int offset_real = 0;
        for (; i < nr_of_dpus; i++)
        {
            // Copy input arguments to DPU
            int role_id = i + first_role_id;
            unsigned int offset = 0;

            input_args[i].max_rows = max_rows_per_dpu;
            // write_inode(&api, role_id, input_args + i, sizeof(dpu_arguments_t),
            //       offset);
            event = init_InodeWrite(role_id, 1000, offset,
                                    transfer_buf_bytes(input_args + i, sizeof(dpu_arguments_t)));
            events_.push_back(event);

            offset += sizeof(dpu_arguments_t);
            // write_inode(&api, role_id, A + dpu_info[i].prev_rows_dpu * n_size,
            //             max_rows_per_dpu * n_size_pad * sizeof(T), offset);
            event = init_InodeWrite(role_id, 1000, offset,
                                    transfer_buf_bytes(A + dpu_info[i].prev_rows_dpu * n_size,
                                                       max_rows_per_dpu * n_size_pad * sizeof(T)));
            events_.push_back(event);

            offset += max_rows_per_dpu * n_size_pad * sizeof(T);
            // write_inode(&api, role_id, B, n_size_pad * sizeof(T), offset);
            event = init_InodeWrite(role_id, 1000, offset,
                                    transfer_buf_bytes(B, n_size_pad * sizeof(T)));
            events_.push_back(event);

            offset += n_size_pad * sizeof(T);
            // Retrieve results
            C_dpu = (T *)malloc(max_rows_per_dpu * nr_of_dpus * sizeof(T));
            offset_real = offset;
            // retrive_inode_at_end(&api, role_id, C_dpu + i * max_rows_per_dpu,
            //                      max_rows_per_dpu * sizeof(T), offset);
        }
        for (i = 0; i < nr_of_dpus; i++)
        {
            char ok;
            event = init_WriteSockets(first_role_id + i, 1000, 1,
                                      transfer_buf_bytes(&ok, 1));
            events_.push_back(event); // send and launch the process
        }
        for (int i = 0; i < nr_of_dpus; i++)
        {
            int role_id = i + first_role_id;
            event = init_ReadSocket(role_id);
            events_.push_back(event); // DPU已经启动
        }
        for (int i = 0; i < nr_of_dpus; i++)
        {
            int role_id = i + first_role_id;
            event = init_InodeRead(role_id, 1000,
                                   C_dpu + i * max_rows_per_dpu,
                                   offset_real, max_rows_per_dpu * sizeof(T));
            events_.push_back(event); // DPU已经启动
        }
        event = init_Check(1);
        events_.push_back(event);
    }

}