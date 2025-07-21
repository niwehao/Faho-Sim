#include "host.h"
#include <assert.h>
#include <getopt.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "BFS_support/common.h"
#include "BFS_support/graph.h"
#include "BFS_support/utils.h"
#include "BFS_support/mram-management.h"
#define NR_DPUS 1
static uint32_t *nodeLevelReference;
static struct COOGraph cooGraph;
static struct CSRGraph csrGraph;
static uint32_t *nodeLevel;
static uint64_t *visited;
static uint64_t *currentFrontier;
static uint64_t *nextFrontier;
static uint32_t numNodes;
static int nextFrontierEmpty = 0;
static uint32_t level = 1;
static struct DPUParams dpuParams[NR_DPUS];
static uint32_t dpuParams_m[NR_DPUS];
static uint32_t *nodePtrs;
static uint32_t *neighborIdxs;
namespace upmem_sim::simulator::faho::def
{
    def::Event *BFS::benchmark(int time_)
    {

        if (events_.empty())
        {
            if (end_flag == 1)
            {
                if (!nextFrontierEmpty)
                {

                    excute_2();
                    end_flag = 0;
                }
                else
                {

                    exit(0); // 退出程序
                }
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
    void BFS::check(int pid)
    {
        int state = 1;
        for (uint32_t nodeIdx = 0; nodeIdx < numNodes; ++nodeIdx)
        {
            if (nodeLevel[nodeIdx] != nodeLevelReference[nodeIdx])
            {
                std::cout << "Mismatch at node " << nodeIdx << " (CPU result = level " << nodeLevelReference[nodeIdx] << ", DPU result = level " << nodeLevel[nodeIdx] << ")" << std::endl;
                state = 0;
            }
        }

        freeCOOGraph(cooGraph);
        freeCSRGraph(csrGraph);
        free(nodeLevel);
        free(visited);
        free(currentFrontier);
        free(nextFrontier);
        free(nodeLevelReference);
        if (state > 0)
        {
            std::cout << "sucess" << std::endl;
             exit(0);
        }
        else{
            assert(0);
        }


    }
    void BFS::benchmark_init(std::string bindir, int data_prep)
    {
        bindir_ = bindir;
        uint32_t numDPUs = NR_DPUS;
         if(numDPUs!=1){
            std::cout << "not support multiple dpus" << std::endl;
        }
        def::Event *event;
        cooGraph = readCOOGraph((bindir_ + "loc-gowalla_edges.txt").c_str());
        event = init_NewProcess(1, 1000, NR_DPUS, "BFS.16"); // 只有new和lanuch指定role_id=1
        events_.push_back(event);
        event = init_LanuchProcess(1, 1100);
        events_.push_back(event);

        csrGraph = coo2csr(cooGraph);
        numNodes = csrGraph.numNodes;
        nodePtrs = csrGraph.nodePtrs;
        neighborIdxs = csrGraph.neighborIdxs;
        nodeLevel =
            (uint32_t *)calloc(numNodes, sizeof(uint32_t));
        visited = (uint64_t *)calloc(
            numNodes / 64, sizeof(uint64_t)); // Bit vector with one bit per node
        currentFrontier = (uint64_t *)calloc(
            numNodes / 64, sizeof(uint64_t)); // Bit vector with one bit per node
        nextFrontier = (uint64_t *)calloc(
            numNodes / 64, sizeof(uint64_t)); // Bit vector with one bit per node
        setBit(nextFrontier[0], 0);           // Initialize frontier to first node
        uint32_t numNodesPerDPU =
            ROUND_UP_TO_MULTIPLE_OF_64((numNodes - 1) / numDPUs + 1);

        unsigned int dpuIdx = 0;
        int first_role_id = 1;
        for (int i = 0; i < numDPUs; i++)
        {
            int role_id = i + first_role_id;
            event = init_ReadSocket(role_id);
            events_.push_back(event); // DPU已经启动
        }
        for (uint32_t dpu_idx = 0; dpu_idx < numDPUs; dpu_idx++)
        {
            int role = first_role_id + dpu_idx;
            struct mram_heap_allocator_t allocator;
            init_allocator(&allocator);
            dpuParams_m[dpuIdx] = mram_heap_alloc(&allocator, sizeof(struct DPUParams));
            // Find DPU's nodes
            uint32_t dpuStartNodeIdx = dpuIdx * numNodesPerDPU;
            uint32_t dpuNumNodes;
            if (dpuStartNodeIdx > numNodes)
            {
                dpuNumNodes = 0;
            }
            else if (dpuStartNodeIdx + numNodesPerDPU > numNodes)
            {
                dpuNumNodes = numNodes - dpuStartNodeIdx;
            }
            else
            {
                dpuNumNodes = numNodesPerDPU;
            }
            dpuParams[dpuIdx].dpuNumNodes = dpuNumNodes;
            // Partition edges and copy data
            if (dpuNumNodes > 0)
            {

                // Find DPU's CSR graph partition
                uint32_t *dpuNodePtrs_h = &nodePtrs[dpuStartNodeIdx];
                uint32_t dpuNodePtrsOffset = dpuNodePtrs_h[0];
                uint32_t *dpuNeighborIdxs_h = neighborIdxs + dpuNodePtrsOffset;
                uint32_t dpuNumNeighbors = dpuNodePtrs_h[dpuNumNodes] - dpuNodePtrsOffset;
                uint32_t *dpuNodeLevel_h = &nodeLevel[dpuStartNodeIdx];

                // Allocate MRAM
                uint32_t dpuNodePtrs_m =
                    mram_heap_alloc(&allocator, (dpuNumNodes + 1) * sizeof(uint32_t));
                uint32_t dpuNeighborIdxs_m =
                    mram_heap_alloc(&allocator, dpuNumNeighbors * sizeof(uint32_t));
                uint32_t dpuNodeLevel_m =
                    mram_heap_alloc(&allocator, dpuNumNodes * sizeof(uint32_t));
                uint32_t dpuVisited_m =
                    mram_heap_alloc(&allocator, numNodes / 64 * sizeof(uint64_t));
                uint32_t dpuCurrentFrontier_m =
                    mram_heap_alloc(&allocator, dpuNumNodes / 64 * sizeof(uint64_t));
                uint32_t dpuNextFrontier_m =
                    mram_heap_alloc(&allocator, numNodes / 64 * sizeof(uint64_t));

                // Set up DPU parameters
                dpuParams[dpuIdx].numNodes = numNodes;
                dpuParams[dpuIdx].dpuStartNodeIdx = dpuStartNodeIdx;
                dpuParams[dpuIdx].dpuNodePtrsOffset = dpuNodePtrsOffset;
                dpuParams[dpuIdx].level = level;
                dpuParams[dpuIdx].dpuNodePtrs_m = dpuNodePtrs_m;
                dpuParams[dpuIdx].dpuNeighborIdxs_m = dpuNeighborIdxs_m;
                dpuParams[dpuIdx].dpuNodeLevel_m = dpuNodeLevel_m;
                dpuParams[dpuIdx].dpuVisited_m = dpuVisited_m;
                dpuParams[dpuIdx].dpuCurrentFrontier_m = dpuCurrentFrontier_m;
                dpuParams[dpuIdx].dpuNextFrontier_m = dpuNextFrontier_m;

                // copyToDPU(&api, role, (uint8_t *)dpuNodePtrs_h, dpuNodePtrs_m,
                //           (dpuNumNodes + 1) * sizeof(uint32_t));

                event = init_InodeWrite(role, 1400, dpuNodePtrs_m,
                                        transfer_buf_bytes((uint8_t *)dpuNodePtrs_h, ROUND_UP_TO_MULTIPLE_OF_8((dpuNumNodes + 1) * sizeof(uint32_t))));
                events_.push_back(event);
                // copyToDPU(&api, role, (uint8_t *)dpuNeighborIdxs_h, dpuNeighborIdxs_m,
                //           dpuNumNeighbors * sizeof(uint32_t));
                event = init_InodeWrite(role, 1401, dpuNeighborIdxs_m,
                                        transfer_buf_bytes((uint8_t *)dpuNeighborIdxs_h, ROUND_UP_TO_MULTIPLE_OF_8(dpuNumNeighbors * sizeof(uint32_t))));
                events_.push_back(event);
                // copyToDPU(&api, role, (uint8_t *)dpuNodeLevel_h, dpuNodeLevel_m,
                //           dpuNumNodes * sizeof(uint32_t));
                event = init_InodeWrite(role, 1402, dpuNodeLevel_m,
                                        transfer_buf_bytes((uint8_t *)dpuNodeLevel_h, ROUND_UP_TO_MULTIPLE_OF_8(dpuNumNodes * sizeof(uint32_t))));
                events_.push_back(event);
                // copyToDPU(&api, role, (uint8_t *)visited, dpuVisited_m,
                //           numNodes / 64 * sizeof(uint64_t));
                event = init_InodeWrite(role, 1403, dpuVisited_m,
                                        transfer_buf_bytes((uint8_t *)visited, ROUND_UP_TO_MULTIPLE_OF_8(numNodes / 64 * sizeof(uint64_t))));
                events_.push_back(event);
                // copyToDPU(&api, role, (uint8_t *)nextFrontier, dpuNextFrontier_m,
                //           numNodes / 64 * sizeof(uint64_t));
                event = init_InodeWrite(role, 1404, dpuNextFrontier_m,
                                        transfer_buf_bytes((uint8_t *)nextFrontier, ROUND_UP_TO_MULTIPLE_OF_8(numNodes / 64 * sizeof(uint64_t))));
                events_.push_back(event);
                // NOTE: No need to copy current frontier because it is written before
                // being read
                char ok = 1;
                // copyToDPU(&api, first_role_id + dpu_idx, (uint8_t *)&dpuParams[dpuIdx],
                //           dpuParams_m[dpuIdx], sizeof(struct DPUParams));
                event = init_InodeWrite(role, 1405, dpuParams_m[dpuIdx],
                                        transfer_buf_bytes((uint8_t *)&dpuParams[dpuIdx], ROUND_UP_TO_MULTIPLE_OF_8(sizeof(struct DPUParams))));
                events_.push_back(event);
                event = init_WriteSockets(dpu_idx + first_role_id, 2000, 1,
                                          transfer_buf_bytes(&ok, 1)); // 告诉dpu_code写入已经完成
                events_.push_back(event);

                event = init_ReadSocket(dpu_idx + first_role_id); // 告诉主机计算完成
                events_.push_back(event);
                if (dpuIdx == 0)
                {
                    // copyFromDPU(&api, role, dpuParams[dpuIdx].dpuNextFrontier_m,
                    //             (uint8_t *)currentFrontier,
                    //             numNodes / 64 * sizeof(uint64_t));
                    event = init_InodeRead(role, 3006,
                                           (uint8_t *)currentFrontier,
                                           dpuParams[dpuIdx].dpuNextFrontier_m,
                                           ROUND_UP_TO_MULTIPLE_OF_8((numNodes / 64 * sizeof(uint64_t))));
                    events_.push_back(event);
                }
                else
                {

                    // event = init_InodeRead(role, 3007,
                    //                         (uint8_t *)nextFrontier,
                    //                         dpuParams[dpuIdx].dpuNextFrontier_m,
                    //                         numNodes / 64 * sizeof(uint64_t));
                    // events_.push_back(event);

                    // for (uint32_t i = 0; i < numNodes / 64; ++i)
                    // {
                    //     currentFrontier[i] |= nextFrontier[i];
                    // }
                    assert(0); // 只支持一个DPU
                }
                ++dpuIdx;
            }
            else
            {
                assert(0);
            }
        }

        return;
    }
    void BFS::excute_2()
    {
        char ok = 1;
        int numDPUs = NR_DPUS;
        int first_role_id = 1;

        // Check if the next frontier is empty, and copy data to DPU if not empty
        nextFrontierEmpty = 1;
        for (uint32_t i = 0; i < numNodes / 64; ++i)
        {
            if (currentFrontier[i])
            {
                nextFrontierEmpty = 0;

                break;
            }
        }
        Event *event;
        if (!nextFrontierEmpty) // 如果为0
        {

            ++level;
            std::cout << "in level:" << level << std::endl;
            int dpuIdx = 0;
            for (uint32_t dpu_idx = 0; dpu_idx < numDPUs; dpu_idx++)
            {
                int role = first_role_id + dpu_idx;
                uint32_t dpuNumNodes = dpuParams[dpuIdx].dpuNumNodes;
                if (dpuNumNodes > 0)
                {
                    // Copy current frontier to all DPUs (place in next frontier and DPU
                    // will update visited and copy to current frontier)
                    // copyToDPU(&api, role, (uint8_t *)currentFrontier,
                    //           dpuParams[dpuIdx].dpuNextFrontier_m,
                    //           numNodes / 64 * sizeof(uint64_t));
                    event = init_InodeWrite(first_role_id + dpu_idx, 1406,
                                            dpuParams[dpuIdx].dpuNextFrontier_m,
                                            transfer_buf_bytes((uint8_t *)currentFrontier,
                                                               ROUND_UP_TO_MULTIPLE_OF_8(numNodes / 64 * sizeof(uint64_t))));
                    events_.push_back(event);
                    // Copy new level to DPU
                    dpuParams[dpuIdx].level = level;
                    // copyToDPU(&api, role, (uint8_t *)&dpuParams[dpuIdx],
                    //           dpuParams_m[dpuIdx], sizeof(struct DPUParams));
                    event = init_InodeWrite(first_role_id + dpu_idx, 1405, dpuParams_m[dpuIdx],
                                            transfer_buf_bytes((uint8_t *)&dpuParams[dpuIdx],
                                                               ROUND_UP_TO_MULTIPLE_OF_8(sizeof(struct DPUParams))));
                    events_.push_back(event);
                    event = init_WriteSockets(dpu_idx + first_role_id, 2000, 1,
                                              transfer_buf_bytes(&ok, 1)); // 告诉dpu_code写入已经完成
                    events_.push_back(event);

                    event = init_ReadSocket(dpu_idx + first_role_id); // 告诉主机计算完成
                    events_.push_back(event);
                    if (dpuIdx == 0)
                    {
                        // copyFromDPU(&api, role, dpuParams[dpuIdx].dpuNextFrontier_m,
                        //             (uint8_t *)currentFrontier,
                        //             numNodes / 64 * sizeof(uint64_t));
                        event = init_InodeRead(role, 3006,
                                               (uint8_t *)currentFrontier,
                                               dpuParams[dpuIdx].dpuNextFrontier_m,
                                               ROUND_UP_TO_MULTIPLE_OF_8(numNodes / 64 * sizeof(uint64_t)));
                        events_.push_back(event);
                    }
                    else
                    {

                        // event = init_InodeRead(role, 3007,
                        //                         (uint8_t *)nextFrontier,
                        //                         dpuParams[dpuIdx].dpuNextFrontier_m,
                        //                         numNodes / 64 * sizeof(uint64_t));
                        // events_.push_back(event);

                        // for (uint32_t i = 0; i < numNodes / 64; ++i)
                        // {
                        //     currentFrontier[i] |= nextFrontier[i];
                        // }
                        assert(0); // 只支持一个DPU
                    }
                    ++dpuIdx;
                }
                else
                {
                    assert(0);
                }
            }
        }
        else
        {
            add_check();
        }
    }
    void BFS::add_check()
    {
        nodeLevelReference =
            (uint32_t *)calloc(numNodes, sizeof(uint32_t)); // Node's BFS level (initially all 0
                                                            // meaning not reachable)
        memset(nextFrontier, 0, numNodes / 64 * sizeof(uint64_t));
        setBit(nextFrontier[0], 0); // Initialize frontier to first node
        nextFrontierEmpty = 0;
        level = 1;
        while (!nextFrontierEmpty)
        {
            // Update current frontier and visited list based on the next frontier from
            // the previous iteration
            for (uint32_t nodeTileIdx = 0; nodeTileIdx < numNodes / 64; ++nodeTileIdx)
            {
                uint64_t nextFrontierTile = nextFrontier[nodeTileIdx];
                currentFrontier[nodeTileIdx] = nextFrontierTile;
                if (nextFrontierTile)
                {
                    visited[nodeTileIdx] |= nextFrontierTile;
                    nextFrontier[nodeTileIdx] = 0;
                    for (uint32_t node = nodeTileIdx * 64; node < (nodeTileIdx + 1) * 64;
                         ++node)
                    {
                        if (isSet(nextFrontierTile, node % 64))
                        {
                            nodeLevelReference[node] = level;
                        }
                    }
                }
            }
            // Visit neighbors of the current frontier
            nextFrontierEmpty = 1;
            for (uint32_t nodeTileIdx = 0; nodeTileIdx < numNodes / 64; ++nodeTileIdx)
            {
                uint64_t currentFrontierTile = currentFrontier[nodeTileIdx];
                if (currentFrontierTile)
                {
                    for (uint32_t node = nodeTileIdx * 64; node < (nodeTileIdx + 1) * 64;
                         ++node)
                    {
                        if (isSet(currentFrontierTile,
                                  node % 64))
                        { // If the node is in the current frontier
                            // Visit its neighbors
                            uint32_t nodePtr = nodePtrs[node];
                            uint32_t nextNodePtr = nodePtrs[node + 1];
                            for (uint32_t i = nodePtr; i < nextNodePtr; ++i)
                            {
                                uint32_t neighbor = neighborIdxs[i];
                                if (!isSet(visited[neighbor / 64],
                                           neighbor % 64))
                                { // Neighbor not previously visited
                                    // Add neighbor to next frontier
                                    setBit(nextFrontier[neighbor / 64], neighbor % 64);
                                    nextFrontierEmpty = 0;
                                }
                            }
                        }
                    }
                }
            }
            ++level;
        }
        Event *event;
        uint32_t dpuNumNodes = dpuParams[0].dpuNumNodes;
        if (dpuNumNodes > 0)
        {
            uint32_t dpuStartNodeIdx = 0;
            event = init_InodeRead(1, 3006,
                                   (uint8_t *)(nodeLevel + dpuStartNodeIdx),
                                   dpuParams[0].dpuNodeLevel_m,
                                   ROUND_UP_TO_MULTIPLE_OF_8(dpuNumNodes * sizeof(float)));
            events_.push_back(event);
        }
        else
        {
            assert(0);
        }

        event = init_Check(1);
        events_.push_back(event);
    }
}