#include "host.h"
#define T int32_t
#define NR_DPUS 1
static T *A;
static unsigned int *histo_host;
static unsigned int *histo;
static std::string file_name = "image_VanHateren.iml";
#define ByteSwap16(n) (((((unsigned int)n) << 8) & 0xFF00) | ((((unsigned int)n) >> 8) & 0x00FF))
// Create input arrays
static int p_input_size;
#define DEPTH 12
static int p_bins = 16;
#define divceil(n, m) (((n) - 1) / (m) + 1)
#define roundup(n, m) ((n / m) * m + m)
typedef struct
{
    uint32_t size;
    uint32_t transfer_size;
    uint32_t bins;
    enum kernels
    {
        kernel1 = 0,
        nr_kernels = 1,
    } kernel;
} dpu_arguments_t;
static void read_input(T *A)
{

    char dctFileName[100];
    FILE *File = NULL;

    // Open input file
    unsigned short temp;
    sprintf(dctFileName, file_name.c_str());
    if ((File = fopen(dctFileName, "rb")) != NULL)
    {
        for ( int y = 0; y < p_input_size; y++)
        {
            fread(&temp, sizeof(unsigned short), 1, File);
            int a = (int)ByteSwap16(temp);
            A[y]=a;
      
            if (A[y] >= (1<<DEPTH))
                A[y] = (1<<DEPTH)-1;
        }
        fclose(File);
    }

    else
    {
        printf("%s does not exist\n", dctFileName);
        exit(1);
    }
}
static void histogram_host(unsigned int *histo, T *A, unsigned int bins,
                           unsigned int nr_elements, int exp,
                           unsigned int nr_of_dpus)
{
    if (!exp)
    {
        for (unsigned int i = 0; i < nr_of_dpus; i++)
        {
            for (unsigned int j = 0; j < nr_elements; j++)
            {
                T d = A[j];
                histo[i * bins + ((d * bins) >> DEPTH)] += 1;
            }
        }
    }
    else
    {
        for (unsigned int j = 0; j < nr_elements; j++)
        {
            T d = A[j];
            histo[(d * bins) >> DEPTH] += 1;
        }
    }
}
namespace upmem_sim::simulator::faho::def
{
    def::Event *HSTS::benchmark(int time_)
    {

        if (events_.empty())
        {
            if (end_flag == 1)
            {
                exit(0);
            }
            end_flag = 1;
            return nullptr;
        }
        def::Event *event_ = get_event(time_);
        if (event_ == nullptr)
        {
            return nullptr;
        }
        else
        {
            return event_;
        }
    }
    void HSTS::check(int pid)
    {
        int i;

        // Final histogram merging
        for (i = 1; i < NR_DPUS; i++)
        {
            for (unsigned int j = 0; j < p_bins; j++)
            {
                histo[j] += histo[j + i * p_bins];
            }
        }

        // Check output
        bool status = true;

        for (unsigned int j = 0; j < p_bins; j++)
        {
            if (NR_DPUS * histo_host[j] != histo[j])
            {
                status = false;
                std::cout << j << " - " << j << ": " << NR_DPUS * histo_host[j] << " -- " << histo[j] << std::endl;
            }
        }
        free(A);
        free(histo_host);
        free(histo);
        if (status)
        {
            std::cout << "sucess" << std::endl;
       
            return;
        }
        else
        {
            assert(0);
        }
    }
    void HSTS::benchmark_init(std::string bindir,int data_prep)
    {
        bindir_ = bindir;
        file_name = bindir_ + file_name;
        p_input_size=data_prep;

        uint32_t nr_of_dpus = NR_DPUS;          // Number of DPUs to use
         if(nr_of_dpus!=1){
            std::cout << "not support multiple dpus" << std::endl;
        }
        unsigned int input_size;                // Size of input image
        input_size = p_input_size * nr_of_dpus; // Size of input image
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
        T *bufferA = A;
        histo_host = (unsigned int *)malloc(p_bins * sizeof(unsigned int));
        histo = (unsigned int *)malloc(nr_of_dpus * p_bins * sizeof(unsigned int));

        // Create an input file with arbitrary data
        read_input(A);

        for (unsigned int j = 1; j < nr_of_dpus; j++)
        {
            memcpy(&A[j * input_size_dpu_8bytes], &A[0],
                   input_size_dpu_8bytes * sizeof(T));
        }

        memset(histo_host, 0, p_bins * sizeof(unsigned int));
        memset(histo, 0, nr_of_dpus * p_bins * sizeof(unsigned int));

        int first_role_id = 1;
        def::Event *event;
        event = init_NewProcess(first_role_id, 1000, nr_of_dpus, "HST-S.16");
        events_.push_back(event);
        event = init_LanuchProcess(first_role_id, 1000);
        events_.push_back(event);
        for (unsigned int i = 0; i < nr_of_dpus; i++)
        {
            char ok;
            event = init_ReadSocket(first_role_id + i);
            events_.push_back(event);
        }

        // Compute output on CPU (performance comparison and verification purposes)
        histogram_host(histo_host, A, p_bins, p_input_size, 1, nr_of_dpus);

        // Input arguments
        unsigned int kernel = 0;
        int i = 0;
        dpu_arguments_t input_arguments[NR_DPUS];
        for (i = 0; i < nr_of_dpus - 1; i++)
        {
            input_arguments[i].size = input_size_dpu_8bytes * sizeof(T);
            input_arguments[i].transfer_size = input_size_dpu_8bytes * sizeof(T);
            input_arguments[i].bins = p_bins;
            input_arguments[i].kernel = static_cast<enum dpu_arguments_t::kernels>(kernel);
        }
        input_arguments[nr_of_dpus - 1].size =
            (input_size_8bytes - input_size_dpu_8bytes * (NR_DPUS - 1)) * sizeof(T);
        input_arguments[nr_of_dpus - 1].transfer_size =
            input_size_dpu_8bytes * sizeof(T);
        input_arguments[nr_of_dpus - 1].bins = p_bins;
        input_arguments[nr_of_dpus - 1].kernel = static_cast<enum dpu_arguments_t::kernels>(kernel);

        for (uint32_t i = 0; i < nr_of_dpus; i++)
        {
            int role_id = first_role_id + i;

            // write_inode(&api, role_id, &input_arguments[i],
            //             sizeof(input_arguments[0]), 0);
            event = init_InodeWrite(role_id, 1000, 0,
                                    transfer_buf_bytes(&input_arguments[i], sizeof(input_arguments[0])));
            events_.push_back(event);

            // write_inode(&api, role_id, bufferA + input_size_dpu_8bytes * i,
            //             input_size_dpu_8bytes * sizeof(T),
            //             sizeof(input_arguments[0]));
            event = init_InodeWrite(role_id, 2000, sizeof(input_arguments[0]),
                                    transfer_buf_bytes(bufferA + input_size_dpu_8bytes * i,
                                                       input_size_dpu_8bytes * sizeof(T)));
            events_.push_back(event);

            // retrive_inode_at_end(
            //     &api, role_id, histo + p.bins * i, p.bins * sizeof(unsigned int),
            //     input_size_dpu_8bytes * sizeof(T) + sizeof(input_arguments[0]));
        }
        for (i = 0; i < nr_of_dpus; i++)
        {
            char ok;
            event = init_WriteSockets(first_role_id + i, 1000, 1,
                                      transfer_buf_bytes(&ok, 1));
            events_.push_back(event); // send and launch the process
        }
        for (i = 0; i < nr_of_dpus; i++)
        {
            event = init_ReadSocket(first_role_id + i);

            events_.push_back(event);
        }

        for (uint32_t i = 0; i < nr_of_dpus; i++)
        {
            event = init_InodeRead(i + first_role_id, 1000,
                                   (uint8_t *)(histo + p_bins * i),
                                   sizeof(input_arguments[0]) + input_size_dpu_8bytes * sizeof(T) + i * p_bins * sizeof(unsigned int),
                                   p_bins * sizeof(unsigned int));
            events_.push_back(event);
        }
        event = init_Check(1);
        events_.push_back(event);

        // Deallocation

        return;
    }

}