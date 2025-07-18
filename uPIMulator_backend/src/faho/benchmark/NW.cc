#include "host.h"
#include "NW_support/common.h"

#define NR_DPUS 1
uint64_t max_rows; // 一般data_prep是256
uint64_t max_cols;
static int32_t *input_itemsets_host;
static int32_t *input_itemsets;

static int32_t *traceback_output;
static int32_t *traceback_output_host;
static int32_t *reference;
static int32_t *dummy;
static dpu_arguments_t *input_args;
static unsigned int penalty = 1;
// Compute output in the host 问题在于没有
static void traceback(int *traceback_output, int32_t *input_itemsets,
                      int32_t *reference, unsigned int max_rows,
                      unsigned int max_cols, unsigned int penalty)
{

    int k = 0;
    for (int i = max_rows - 2, j = max_rows - 2; i >= 0 && j >= 0;)
    {
        int nw = 0, n = 0, w = 0, traceback = 0;
#if PRINT_FILE
        if (i == (int)max_rows - 2 && j == (int)max_rows - 2)
            fprintf(fpo, "%d ",
                    input_itemsets[i * max_cols + j]); // print the first element
#endif

        if (i == 0 && j == 0)
            break;
        if (i > 0 && j > 0)
        {
            nw = input_itemsets[(i - 1) * max_cols + j - 1];
            w = input_itemsets[i * max_cols + j - 1];
            n = input_itemsets[(i - 1) * max_cols + j];
        }
        else if (i == 0)
        {
            nw = n = LIMIT;
            w = input_itemsets[i * max_cols + j - 1];
        }
        else if (j == 0)
        {
            nw = w = LIMIT;
            n = input_itemsets[(i - 1) * max_cols + j];
        }
        else
        {
            ;
        }

        int new_nw, new_w, new_n;
        new_nw = nw + reference[i * max_cols + j];
        new_w = w - penalty;
        new_n = n - penalty;

        traceback = maximum(new_nw, new_w, new_n);
        if (traceback == new_nw)
            traceback = nw;
        if (traceback == new_w)
            traceback = w;
        if (traceback == new_n)
            traceback = n;

#if PRINT_FILE
        fprintf(fpo, "%d ", traceback);
#endif
        traceback_output[k++] = traceback;

        if (traceback == nw)
        {
            i--;
            j--;
            continue;
        }
        else if (traceback == w)
        {
            j--;
            continue;
        }
        else if (traceback == n)
        {
            i--;
            continue;
        }
        else
        {
            ;
        }
    }

    return;
}

static void nw_host(int32_t *input_itemsets, int32_t *reference,
                    uint64_t max_cols, unsigned int penalty)
{

    int32_t *input_itemsets_l =
        (int32_t *)malloc((BL + 1) * (BL + 1) * sizeof(int32_t));
    int32_t *reference_l = (int32_t *)malloc((BL * BL) * sizeof(int32_t));

    // top-left
    for (uint64_t blk = 1; blk <= (max_cols - 1) / BL; blk++)
    {
        for (uint64_t b_index_x = 0; b_index_x < blk; b_index_x++)
        {
            uint64_t b_index_y = blk - 1 - b_index_x;

            for (uint64_t i = 0; i < BL; i++)
            {
                for (uint64_t j = 0; j < BL; j++)
                {
                    reference_l[i * BL + j] =
                        reference[(max_cols - 1) * (b_index_y * BL + i) + b_index_x * BL +
                                  j];
                }
            }

            for (uint64_t i = 0; i < BL + 1; i++)
            {
                for (uint64_t j = 0; j < BL + 1; j++)
                {
                    input_itemsets_l[i * (BL + 1) + j] =
                        input_itemsets[max_cols * (b_index_y * BL + i) + b_index_x * BL +
                                       j];
                }
            }

            // Computation
            for (uint64_t i = 1; i < BL + 1; i++)
            {
                for (uint64_t j = 1; j < BL + 1; j++)
                {
                    input_itemsets_l[i * (BL + 1) + j] =
                        maximum(input_itemsets_l[(i - 1) * (BL + 1) + j - 1] +
                                    reference_l[(i - 1) * BL + j - 1],
                                input_itemsets_l[i * (BL + 1) + j - 1] - penalty,
                                input_itemsets_l[(i - 1) * (BL + 1) + j] - penalty);
                }
            }

            for (uint64_t i = 0; i < BL; i++)
            {
                for (uint64_t j = 0; j < BL; j++)
                {
                    input_itemsets[max_cols * (b_index_y * BL + i + 1) + b_index_x * BL +
                                   j + 1] = input_itemsets_l[(i + 1) * (BL + 1) + j + 1];
                }
            }
        }
    }

    // bottom-right
    for (uint64_t blk = 2; blk <= (max_cols - 1) / BL; blk++)
    {
        for (uint64_t b_index_x = blk - 1; b_index_x < (max_cols - 1) / BL;
             b_index_x++)
        {
            uint64_t b_index_y = (max_cols - 1) / BL + blk - 2 - b_index_x;

            for (uint64_t i = 0; i < BL; i++)
            {
                for (uint64_t j = 0; j < BL; j++)
                {
                    reference_l[i * BL + j] =
                        reference[(max_cols - 1) * (b_index_y * BL + i) + b_index_x * BL +
                                  j];
                }
            }

            for (uint64_t i = 0; i < BL + 1; i++)
            {
                for (uint64_t j = 0; j < BL + 1; j++)
                {
                    input_itemsets_l[i * (BL + 1) + j] =
                        input_itemsets[max_cols * (b_index_y * BL + i) + b_index_x * BL +
                                       j];
                }
            }

            // Computation
            for (uint64_t i = 1; i < BL + 1; i++)
            {
                for (uint64_t j = 1; j < BL + 1; j++)
                {
                    input_itemsets_l[i * (BL + 1) + j] =
                        maximum(input_itemsets_l[(i - 1) * (BL + 1) + j - 1] +
                                    reference_l[(i - 1) * BL + j - 1],
                                input_itemsets_l[i * (BL + 1) + j - 1] - penalty,
                                input_itemsets_l[(i - 1) * (BL + 1) + j] - penalty);
                }
            }

            for (uint64_t i = 0; i < BL; i++)
            {
                for (uint64_t j = 0; j < BL; j++)
                {
                    input_itemsets[max_cols * (b_index_y * BL + i + 1) + b_index_x * BL +
                                   j + 1] = input_itemsets_l[(i + 1) * (BL + 1) + j + 1];
                }
            }
        }
    }

    free(input_itemsets_l);
    free(reference_l);
    return;
}

namespace upmem_sim::simulator::faho::def
{
    def::Event *NW::benchmark(int time_)
    {

        if (events_.empty())
        {
            if (end_flag == 1)
            {
                if (excution == 1)
                {
                    excute_1(blk);
                    blk++;

                    if (blk > (max_cols - 1) / BL)//4
                    {
                        excution++;
                        blk = 2;
                    }
                    end_flag = 0;
                }
                else if (excution == 2)
                {
                    excute_2(blk);
                    blk++;
                    if (blk > (max_cols - 1) / BL)
                    {
                        excution++;
                        add_check();
                        blk = 3;
                    }
                    end_flag = 0;
                }
                else
                {
                    assert((blk == 3) && (excution == 3));
                    exit(0); // 退出程序
                }
                std::cout << "blk:" << blk << std::endl;
            }
            else
            {
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
    void NW::check(int pid)
    {

        bool status = true;
        for (uint64_t i = 1; i < max_rows; i++)
        {
            for (uint64_t j = 1; j < max_cols; j++)
            {
                if (input_itemsets_host[i * max_cols + j] !=
                    input_itemsets[i * (max_cols + 1) + j])
                {
                    status = false;
#if PRINT
                    printf("%ld (%ld, %ld): %d %d\n", i * max_cols + j, i, j,
                           input_itemsets_host[i * max_cols + j],
                           input_itemsets[i * (max_cols + 1) + j]);
#endif
                }
            }
        }
        free(reference);
        free(traceback_output);
        free(traceback_output_host);
        free(input_itemsets_host);
        free(input_itemsets);
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
    void NW::benchmark_init(std::string bindir, int data_prep)
    {
        Event *event;
        bindir_ = bindir;
        int first_role = 1;
        event = init_NewProcess(first_role, 1000, NR_DPUS, "NW.16");
        events_.push_back(event);
        event = init_LanuchProcess(first_role, 1000);
        events_.push_back(event);
        uint32_t nr_of_dpus = NR_DPUS; // Number of DPUs to use
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
        max_rows = data_prep + 1;
        max_cols = data_prep + 1;

        reference = (int32_t *)malloc(max_rows * max_cols * sizeof(int32_t));
        input_itemsets_host =
            (int32_t *)malloc(max_rows * max_cols * sizeof(int32_t));
        input_itemsets =
            (int32_t *)malloc((max_rows + 1) * (max_cols + 1) * sizeof(int32_t));
        input_args =
            (dpu_arguments_t *)malloc(nr_of_dpus * sizeof(dpu_arguments_t));

        // Traceback output
        traceback_output =
            (int32_t *)malloc((max_rows + max_cols) * sizeof(int32_t));
        traceback_output_host =
            (int32_t *)malloc((max_rows + max_cols) * sizeof(int32_t));
        memset(traceback_output, 0, (max_rows + max_cols) * sizeof(int32_t));
        memset(traceback_output_host, 0, (max_rows + max_cols) * sizeof(int32_t));

        // This array is used for dummy/stale CPU-DPU transfers
        dummy = (int32_t *)malloc(nr_of_dpus * (BL + 2) * sizeof(int32_t));
        unsigned int blocks_per_dpu;

        // Initializing inputs are needed at each iteration
        // Initialize input itemsets
        for (unsigned int i = 0; i < max_rows; i++)
        {
            for (unsigned int j = 0; j < max_cols; j++)
            {
                input_itemsets_host[i * max_cols + j] = 0;
            }
        }

        for (unsigned int i = 0; i <= max_rows; i++)
        {
            for (unsigned int j = 0; j <= max_cols; j++)
            {
                input_itemsets[i * (max_cols + 1) + j] = 0;
            }
        }

        // Define random sequences
        srand(7);
        for (unsigned int i = 1; i < max_rows; i++)
        {
            input_itemsets_host[i * max_cols] = rand() % 10 + 1;
        }

        for (unsigned int j = 1; j < max_cols; j++)
        {
            input_itemsets_host[j] = rand() % 10 + 1;
        }

        for (unsigned int i = 0; i < max_rows - 1; i++)
        {
            for (unsigned int j = 0; j < max_cols - 1; j++)
            {
                reference[i * (max_cols - 1) + j] =
                    blosum62[input_itemsets[(i + 1) * max_cols]][input_itemsets[j + 1]];
            }
        }

        for (unsigned int i = 1; i < max_rows; i++)
        {
            input_itemsets_host[i * max_cols] = -i * penalty;
            input_itemsets[i * (max_cols + 1)] = -i * penalty;
        }

        for (unsigned int j = 1; j < max_cols; j++)
        {
            input_itemsets_host[j] = -j * penalty;
            input_itemsets[j] = -j * penalty;
        }

        nw_host(input_itemsets_host, reference, max_cols, penalty);

        // Top-left computation on DPUs
        // for (unsigned int blk = 1; blk <= (max_cols - 1) / BL; blk++)
        // {
        // }
        // for (unsigned int blk = 2; blk <= (max_cols - 1) / BL; blk++)
        // {
        // }
        excute_1(blk);
        blk++;
    }
    void NW::excute_2(int blk)
    {
        def::Event *event;
        int first_role = 1;
        int nr_of_dpus = NR_DPUS;
        // Bottom-right computation on DPUs

        // Copy data to DPUs
        unsigned int i = 0;
        for (; i < nr_of_dpus; i++)
        {
            unsigned int blocks_per_dpu =
                (((max_cols - 1) / BL) - blk + 1) / nr_of_dpus;
            unsigned int active_blocks_per_dpu =
                (((max_cols - 1) / BL) - blk + 1) / nr_of_dpus;
            unsigned int rest_blocks =
                (((max_cols - 1) / BL) - blk + 1) % nr_of_dpus;
            if (i < rest_blocks)
                blocks_per_dpu++;

            if (rest_blocks != 0)
                active_blocks_per_dpu++;

            // Copy input arguments to dpu
            input_args[i].nblocks = blocks_per_dpu;
            input_args[i].active_blocks = active_blocks_per_dpu;
            input_args[i].penalty = penalty;
            // DPU_ASSERT(dpu_prepare_xfer(dpu, input_args + i));
            // write_inode(&api, first_role+i,input_args + i, size_t size,
            // unsigned int offset);
        }
        //   DPU_ASSERT(dpu_push_xfer(dpu_set, DPU_XFER_TO_DPU,
        //   "DPU_INPUT_ARGUMENTS",
        //    0, sizeof(dpu_arguments_t), DPU_XFER_DEFAULT));

        unsigned int blocks_per_dpu =
            (((max_cols - 1) / BL) - blk + 1) / nr_of_dpus;
        if ((((max_cols - 1) / BL) - blk + 1) % nr_of_dpus != 0)
            blocks_per_dpu++;
        unsigned int mram_offset = 0;
        for (unsigned int bl_indx = 0; bl_indx < blocks_per_dpu; bl_indx++)
        {
            for (unsigned int bl = 0; bl < BL + 1; bl++)
            {

                i = 0;
                for (; i < nr_of_dpus; i++)
                {
                    unsigned int chunks =
                        (((max_cols - 1) / BL) - blk + 1) / nr_of_dpus;
                    unsigned int prev_block_index = 0;
                    unsigned int rest_blocks =
                        (((max_cols - 1) / BL) - blk + 1) % nr_of_dpus;
                    if (rest_blocks > 0)
                    {
                        if (i >= rest_blocks)
                        {
                            prev_block_index =
                                rest_blocks * (chunks + 1) + (i - rest_blocks) * chunks;
                        }
                        else
                        {
                            prev_block_index = i * (chunks + 1);
                        }
                    }
                    else
                    {
                        prev_block_index = i * blocks_per_dpu;
                    }

                    uint64_t input_itemsets_offset = 0;
                    int32_t *dpu_pointer;
                    if (i + bl_indx * nr_of_dpus >= (((max_cols - 1) / BL) - blk + 1))
                    {
                        dpu_pointer = dummy;
                        input_itemsets_offset = 0;
                    }
                    else
                    {
                        uint64_t b_index_x = blk - 1 + prev_block_index + bl_indx;
                        uint64_t b_index_y = (max_cols - 1) / BL + blk - 2 - b_index_x;
                        dpu_pointer = input_itemsets;
                        input_itemsets_offset = b_index_y * (max_cols + 1) * BL +
                                                b_index_x * BL + bl * (max_cols + 1);
                    }

                    //   DPU_ASSERT(dpu_prepare_xfer(dpu, dpu_pointer +
                    //                                        input_itemsets_offset));
                    if (bl == 0)
                    //   write_inode(&api, first_role + i,
                    //               dpu_pointer + input_itemsets_offset,
                    //               (BL + 2) * sizeof(int32_t), mram_offset);
                    {
                        event = init_InodeWrite(first_role + i, 1000, mram_offset,
                                                transfer_buf_bytes(dpu_pointer + input_itemsets_offset,
                                                                   (BL + 2) * sizeof(int32_t)));
                        events_.push_back(event);
                    }
                    else
                    //   write_inode(&api, first_role + i,
                    //               dpu_pointer + input_itemsets_offset,
                    //               2 * sizeof(int32_t), mram_offset);
                    {
                        event = init_InodeWrite(first_role + i, 1000, mram_offset, transfer_buf_bytes(dpu_pointer + input_itemsets_offset, 2 * sizeof(int32_t)));
                        events_.push_back(event);
                    }
                }

                mram_offset += (BL + 2) * sizeof(int32_t);
            }
        }

        mram_offset = blocks_per_dpu * (BL + 1) * (BL + 2) * sizeof(int32_t);
        for (unsigned int bl_indx = 0; bl_indx < blocks_per_dpu; bl_indx++)
        {
            for (unsigned int bl = 0; bl < BL; bl++)
            {

                i = 0;
                for (; i < nr_of_dpus; i++)
                {
                    unsigned int chunks =
                        (((max_cols - 1) / BL) - blk + 1) / nr_of_dpus;
                    unsigned int prev_block_index = 0;
                    unsigned int rest_blocks =
                        (((max_cols - 1) / BL) - blk + 1) % nr_of_dpus;
                    if (rest_blocks > 0)
                    {
                        if (i >= rest_blocks)
                        {
                            prev_block_index =
                                rest_blocks * (chunks + 1) + (i - rest_blocks) * chunks;
                        }
                        else
                        {
                            prev_block_index = i * (chunks + 1);
                        }
                    }
                    else
                    {
                        prev_block_index = i * blocks_per_dpu;
                    }

                    uint64_t reference_offset = 0;
                    int32_t *dpu_pointer;
                    if (i + bl_indx * nr_of_dpus >= (((max_cols - 1) / BL) - blk + 1))
                    {
                        dpu_pointer = dummy;
                        reference_offset = 0;
                    }
                    else
                    {
                        uint64_t b_index_x = blk - 1 + prev_block_index + bl_indx;
                        uint64_t b_index_y = (max_cols - 1) / BL + blk - 2 - b_index_x;
                        dpu_pointer = reference;
                        reference_offset = b_index_y * (max_cols - 1) * BL +
                                           b_index_x * BL + bl * (max_cols - 1);
                    }

                    // write_inode(&api, first_role + i, dpu_pointer + reference_offset,
                    //             BL * sizeof(int32_t), mram_offset);
                    event = init_InodeWrite(first_role + i, 1000, mram_offset,
                                            transfer_buf_bytes(dpu_pointer + reference_offset,
                                                               BL * sizeof(int32_t)));
                    events_.push_back(event);
                }

                mram_offset += BL * sizeof(int32_t);
            }
        }

        // Launch kernel on DPUs
        // DPU_ASSERT(dpu_launch(dpu_set, DPU_SYNCHRONOUS));
        for (i = 0; i < nr_of_dpus; i++)
        {
            // CHK(write(inouts[i * 2 + 1], input_args + i, sizeof(dpu_arguments_t)));
            event = init_WriteSockets(first_role + i, 1000, sizeof(dpu_arguments_t), transfer_buf_bytes(input_args + i, sizeof(dpu_arguments_t)));
            events_.push_back(event);
        }
        char ok;
        for (unsigned int i = 0; i < nr_of_dpus; i++)
        {
            event = init_ReadSocket(first_role + i);
            events_.push_back(event);
        }

        mram_offset = 0;
        for (unsigned int bl_indx = 0; bl_indx < blocks_per_dpu; bl_indx++)
        {
            for (unsigned int bl = 0; bl < BL + 1; bl++)
            {

                i = 0;
                for (; i < nr_of_dpus; i++)
                {
                    unsigned int chunks =
                        (((max_cols - 1) / BL) - blk + 1) / nr_of_dpus;
                    unsigned int prev_block_index = 0;
                    unsigned int rest_blocks =
                        (((max_cols - 1) / BL) - blk + 1) % nr_of_dpus;
                    if (rest_blocks > 0)
                    {
                        if (i >= rest_blocks)
                        {
                            prev_block_index =
                                rest_blocks * (chunks + 1) + (i - rest_blocks) * chunks;
                        }
                        else
                        {
                            prev_block_index = i * (chunks + 1);
                        }
                    }
                    else
                    {
                        prev_block_index = i * blocks_per_dpu;
                    }

                    uint64_t input_itemsets_offset = 0;
                    int32_t *dpu_pointer;
                    if (i + bl_indx * nr_of_dpus >= (((max_cols - 1) / BL) - blk + 1))
                    {
                        dpu_pointer = dummy;
                        input_itemsets_offset = 0;
                    }
                    else
                    {
                        uint64_t b_index_x = blk - 1 + prev_block_index + bl_indx;
                        uint64_t b_index_y = (max_cols - 1) / BL + blk - 2 - b_index_x;
                        dpu_pointer = input_itemsets;
                        input_itemsets_offset = b_index_y * (max_cols + 1) * BL +
                                                b_index_x * BL + bl * (max_cols + 1);
                    }

                    if (bl == 0) // Skip the first row of the block
                        continue;
                    // DPU_ASSERT(dpu_prepare_xfer(dpu, dpu_pointer +
                    //                                      input_itemsets_offset));
                    // ari[i] = ask_read_inode(&api, first_role + i,
                    //                         (BL + 2) * sizeof(int32_t), mram_offset);
                    // char valid;
                    // CHK(read(ari[i], &valid, 1));
                    // if (valid)
                    //     exit(4);
                    // CHK(read(ari[i], dpu_pointer + input_itemsets_offset,
                    //          (BL + 2) * sizeof(int32_t)));
                    event = init_InodeRead(first_role + i, 1000, dpu_pointer + input_itemsets_offset, mram_offset, (BL + 2) * sizeof(int32_t));
                    events_.push_back(event);
                    // char valid;
                    // read(ari[i], &valid, 1);
                    // if (valid)
                    // {
                    //     fprintf(stderr, "Error reading data from DPU %i\n", i);
                    //     exit(4);
                    // }
                    // read(ari[i], dpu_pointer + input_itemsets_offset,
                    //      (BL + 2) * sizeof(int32_t));
                }

                if (bl == 0)
                {
                    mram_offset += (BL + 2) * sizeof(int32_t);
                    continue;
                }
                // DPU_ASSERT(dpu_push_xfer(
                //     dpu_set, DPU_XFER_FROM_DPU, DPU_MRAM_HEAP_POINTER_NAME,
                //     mram_offset, (BL + 2) * sizeof(int32_t),
                //     DPU_XFER_DEFAULT));
                mram_offset += (BL + 2) * sizeof(int32_t);
            }
        }
    }
    void NW::excute_1(int blk)
    {
        //   // Copy data to DPUs
        def::Event *event;
        int first_role = 1;
        int blocks_per_dpu;
        int nr_of_dpus = NR_DPUS;
        int ok;
        unsigned int i = 0;
        for (; i < nr_of_dpus; i++)
        {
            unsigned int blocks_per_dpu = blk / nr_of_dpus;
            unsigned int active_blocks_per_dpu = blk / nr_of_dpus;
            unsigned int rest_blocks = blk % nr_of_dpus;
            if (i < rest_blocks)
                blocks_per_dpu++;

            if (rest_blocks != 0)
                active_blocks_per_dpu++;

            // Copy input arguments to dpu
            input_args[i].nblocks = blocks_per_dpu;
            input_args[i].active_blocks = active_blocks_per_dpu;
            input_args[i].penalty = penalty;
            // DPU_ASSERT(dpu_prepare_xfer(dpu, input_args + i));     //do after via
            // socket
            //   int write_inode(&api,first_role+i, ,
            //                   size_t size, unsigned int offset);
        }
        // DPU_ASSERT(dpu_push_xfer(dpu_set, DPU_XFER_TO_DPU,
        // "DPU_INPUT_ARGUMENTS",
        //                          0, sizeof(dpu_arguments_t),
        //                          DPU_XFER_DEFAULT));

        // Copy itemsets to DPUs
        blocks_per_dpu = blk / nr_of_dpus;
        if (blk % nr_of_dpus != 0)
            blocks_per_dpu++;
        unsigned int mram_offset = 0;
        for (unsigned int bl_indx = 0; bl_indx < blocks_per_dpu; bl_indx++)
        {
            for (unsigned int bl = 0; bl < BL + 1; bl++)
            {

                i = 0;
                for (; i < nr_of_dpus; i++)
                {
                    unsigned int chunks = blk / nr_of_dpus;
                    unsigned int prev_block_index = 0;
                    unsigned int rest_blocks = blk % nr_of_dpus;
                    if (rest_blocks > 0)
                    {
                        if (i >= rest_blocks)
                        {
                            prev_block_index =
                                rest_blocks * (chunks + 1) + (i - rest_blocks) * chunks;
                        }
                        else
                        {
                            prev_block_index = i * (chunks + 1);
                        }
                    }
                    else
                    {
                        prev_block_index = i * blocks_per_dpu;
                    }

                    uint64_t input_itemsets_offset = 0;
                    int32_t *dpu_pointer;
                    if (i + bl_indx * nr_of_dpus >= blk)
                    {
                        dpu_pointer = dummy;
                        input_itemsets_offset = 0;
                    }
                    else
                    {
                        uint64_t b_index_x = prev_block_index + bl_indx;
                        uint64_t b_index_y = blk - 1 - b_index_x;
                        dpu_pointer = input_itemsets;
                        input_itemsets_offset = b_index_y * (max_cols + 1) * BL +
                                                b_index_x * BL + bl * (max_cols + 1);
                    }
                    if (bl == 0)
                    //   write_inode(&api, first_role + i,
                    //               dpu_pointer + input_itemsets_offset,
                    //               (BL + 2) * sizeof(int32_t), mram_offset);
                    {
                        event = init_InodeWrite(first_role + i, 1000, mram_offset,
                                                transfer_buf_bytes(dpu_pointer + input_itemsets_offset,
                                                                   (BL + 2) * sizeof(int32_t)));
                        events_.push_back(event);
                        // DPU_ASSERT(
                        //     dpu_prepare_xfer(dpu, dpu_pointer + input_itemsets_offset));
                    }
                    else
                    {
                        //   write_inode(&api, first_role + i,
                        //               dpu_pointer + input_itemsets_offset,
                        //               2 * sizeof(int32_t), mram_offset);
                        event = init_InodeWrite(first_role + i, 1000, mram_offset,
                                                transfer_buf_bytes(dpu_pointer + input_itemsets_offset,
                                                                   2 * sizeof(int32_t)));
                        events_.push_back(event);
                    }
                    //   DPU_ASSERT(
                    //       dpu_prepare_xfer(dpu, dpu_pointer + input_itemsets_offset));
                    // DPU_ASSERT(
                    //     dpu_prepare_xfer(dpu, dpu_pointer + input_itemsets_offset));
                }

                mram_offset += ((BL + 2) * sizeof(int32_t));
            }
        }

        // Copy reference to DPUs
        mram_offset = blocks_per_dpu * (BL + 1) * (BL + 2) * sizeof(int32_t);
        for (unsigned int bl_indx = 0; bl_indx < blocks_per_dpu; bl_indx++)
        {
            for (unsigned int bl = 0; bl < BL; bl++)
            {

                i = 0;
                for (; i < nr_of_dpus; i++)
                {
                    unsigned int chunks = blk / nr_of_dpus;
                    unsigned int prev_block_index = 0;
                    unsigned int rest_blocks = blk % nr_of_dpus;
                    if (rest_blocks > 0)
                    {
                        if (i >= rest_blocks)
                        {
                            prev_block_index =
                                rest_blocks * (chunks + 1) + (i - rest_blocks) * chunks;
                        }
                        else
                        {
                            prev_block_index = i * (chunks + 1);
                        }
                    }
                    else
                    {
                        prev_block_index = i * blocks_per_dpu;
                    }

                    uint64_t reference_offset = 0;
                    int32_t *dpu_pointer;
                    if (i + bl_indx * nr_of_dpus >= blk)
                    {
                        dpu_pointer = dummy;
                        reference_offset = 0;
                    }
                    else
                    {
                        uint64_t b_index_x = prev_block_index + bl_indx;
                        uint64_t b_index_y = blk - 1 - b_index_x;
                        dpu_pointer = reference;
                        reference_offset = b_index_y * (max_cols - 1) * BL +
                                           b_index_x * BL + bl * (max_cols - 1);
                    }

                    // DPU_ASSERT(dpu_prepare_xfer(dpu, dpu_pointer +
                    // reference_offset));
                    // write_inode(&api, first_role + i, dpu_pointer + reference_offset,
                    //             BL * sizeof(int32_t), mram_offset);
                    event = init_InodeWrite(first_role + i, 1000, mram_offset,
                                            transfer_buf_bytes(dpu_pointer + reference_offset,
                                                               BL * sizeof(int32_t)));
                    events_.push_back(event);
                }

                mram_offset += BL * sizeof(int32_t);
            }
        }

        // Launch kernel on DPUs
        //   DPU_ASSERT(dpu_launch(dpu_set, DPU_SYNCHRONOUS));

        for (i = 0; i < nr_of_dpus; i++)
        {
            // CHK(write(inouts[i * 2 + 1], input_args + i, sizeof(dpu_arguments_t)));
            event = init_WriteSockets(first_role + i, 1000, sizeof(dpu_arguments_t), transfer_buf_bytes(input_args + i, sizeof(dpu_arguments_t)));
            events_.push_back(event);
        }
        for (unsigned int i = 0; i < nr_of_dpus; i++)
        {
            event = init_ReadSocket(first_role + i);
            events_.push_back(event);
            if (ok != 0)
            {
                fprintf(stderr, "Error recieved ok (%i) from process %i\n ", ok, i);
            }
        }

        // Retrieve results
        // Copy output result to Host CPU
        mram_offset = 0;
        for (unsigned int bl_indx = 0; bl_indx < blocks_per_dpu; bl_indx++)
        {

            for (unsigned int bl = 0; bl < BL + 1; bl++)
            {
                if (bl == 0)
                {
                    mram_offset += (BL + 2) * sizeof(int32_t);
                    continue;
                }

                i = 0;
                for (; i < nr_of_dpus; i++)
                {
                    unsigned int chunks = blk / nr_of_dpus;
                    unsigned int prev_block_index = 0;
                    unsigned int rest_blocks = blk % nr_of_dpus;
                    if (rest_blocks > 0)
                    {
                        if (i >= rest_blocks)
                        {
                            prev_block_index =
                                rest_blocks * (chunks + 1) + (i - rest_blocks) * chunks;
                        }
                        else
                        {
                            prev_block_index = i * (chunks + 1);
                        }
                    }
                    else
                    {
                        prev_block_index = i * blocks_per_dpu;
                    }

                    uint64_t input_itemsets_offset = 0;
                    int32_t *dpu_pointer;
                    if (i + bl_indx * nr_of_dpus >= blk)
                    {
                        dpu_pointer = dummy;
                        input_itemsets_offset = 0;
                    }
                    else
                    {
                        uint64_t b_index_x = prev_block_index + bl_indx;
                        uint64_t b_index_y = blk - 1 - b_index_x;
                        dpu_pointer = input_itemsets;
                        input_itemsets_offset = b_index_y * (max_cols + 1) * BL +
                                                b_index_x * BL + bl * (max_cols + 1);
                    }

                    if (bl == 0) // Skip the first row of the block
                        continue;
                    // ari[i] = ask_read_inode(&api, first_role + i,
                    //                         (BL + 2) * sizeof(int32_t), mram_offset);
                    // char valid;
                    // CHK(read(ari[i], &valid, 1));
                    // if (valid)
                    //     exit(4);
                    // CHK(read(ari[i], dpu_pointer + input_itemsets_offset,
                    //          (BL + 2) * sizeof(int32_t)));
                    event = init_InodeRead(first_role + i, 1000, dpu_pointer + input_itemsets_offset, mram_offset, (BL + 2) * sizeof(int32_t));
                    events_.push_back(event);
                    // char valid;
                    // read(ari[i], &valid, 1);
                    // if (valid)
                    // {
                    //     fprintf(stderr, "Error reading data from DPU %i\n", i);
                    //     exit(4);
                    // }
                    // read(ari[i], dpu_pointer + input_itemsets_offset,
                    //      (BL + 2) * sizeof(int32_t));
                }
                mram_offset += (BL + 2) * sizeof(int32_t);
            }
        }
    }
    void NW::add_check()
    {
        traceback(traceback_output, input_itemsets, reference, max_rows + 1,
                  max_cols + 1, penalty);
        Event *event = init_Check(1);
        events_.push_back(event);
    }

}