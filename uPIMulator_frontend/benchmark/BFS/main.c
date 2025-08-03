/*
 * BFS with multiple tasklets
 *
 */
#include "stdsync.h"
#include "stdsys.h"
#include "support/common.h"
#include "dpu-utils.h"

struct barrier my_barrier, bfsBarrier;
struct lock nextFrontierMutex;
int sd_host, nb_thread;
char ok;

struct DPUParams *params_w;

void main_prog(void);

// main
int main(void)
{
  print_debug(7, 0);
  nb_thread = NR_FTHREAD;
  init_barrier(&my_barrier, nb_thread);
  init_barrier(&bfsBarrier, nb_thread);
  init_lock(&nextFrontierMutex);

  (sd_host = socket_open(0));
  params_w =
      (struct DPUParams *)(sbrk(ROUND_UP_TO_MULTIPLE_OF_8(
                               sizeof(struct DPUParams))) -
                           ROUND_UP_TO_MULTIPLE_OF_8(sizeof(struct DPUParams)));

  for (int i = 1; i < nb_thread; i++)
    create_job(main_prog);

  main_prog();
}

void main_prog()
{
  int me = get_jid();
  int nb_loop = 0;
  int r;
  if (me == 0)
  {
    socket_write(sd_host, &ok, 1);
    socket_read(sd_host, &ok, 1);

    // Load parameters
    //   uint32_t params_m = (uint32_t)DPU_MRAM_HEAP_POINTER;
    uint32_t params_m = 0;
    r = umram_read(params_w,
                   ROUND_UP_TO_MULTIPLE_OF_8(sizeof(struct DPUParams)),
                   params_m);
    if (r != 0)
    {
      fault_notif();
    }
  }

  while (1)
  {

    wait_barrier(&my_barrier); //!
    print_debug(me, 3);

    // Extract parameters
    uint32_t numGlobalNodes = params_w->numNodes;
    uint32_t startNodeIdx = params_w->dpuStartNodeIdx;

    uint32_t numNodes = params_w->dpuNumNodes;
    uint32_t nodePtrsOffset = params_w->dpuNodePtrsOffset;
    uint32_t level = params_w->level;
    uint32_t nodePtrs_m = params_w->dpuNodePtrs_m;

    uint32_t nodeLevel_m = params_w->dpuNodeLevel_m;
    uint32_t neighborIdxs_m = params_w->dpuNeighborIdxs_m;
    uint32_t visited_m = params_w->dpuVisited_m;
    uint32_t currentFrontier_m = params_w->dpuCurrentFrontier_m;
    uint32_t nextFrontier_m = params_w->dpuNextFrontier_m;

    if (numNodes > 0)
    {

      // Sanity check
      if (me == 0)
      {
        if (numGlobalNodes % 64 != 0)
        {
          // PRINT_ERROR("The number of nodes in the graph is not a multiple of
          // 64!");
        }
        if (startNodeIdx % 64 != 0 || numNodes % 64 != 0)
        {
          // PRINT_ERROR("The number of nodes assigned to the DPU is not aligned
          // to or a multiple of 64!");
        }
      }

      // Allocate WRAM cache for each tasklet to use throughout
      __buffer_aligned uint64_t cache_value;
      uint64_t *cache_w = &cache_value;

      // Update current frontier and visited list based on the next frontier
      // from the previous iteration
      for (uint32_t nodeTileIdx = me; nodeTileIdx < numGlobalNodes / 64;
           nodeTileIdx += nb_thread)
      {

        // Get the next frontier tile from MRAM
        print_debug(me, 5);
        uint64_t nextFrontierTile =
            load8B(nextFrontier_m, nodeTileIdx, cache_w);
        print_debug(me, 6);
        // Process next frontier tile if it is not empty
        if (nextFrontierTile)
        {

          // Mark everything that was previously added to the next frontier as
          // visited
          print_debug(me, 5);
          uint64_t visitedTile = load8B(visited_m, nodeTileIdx, cache_w);
          print_debug(me, 6);
          visitedTile |= nextFrontierTile;

          print_debug(me, 5);
          store8B(visitedTile, visited_m, nodeTileIdx, cache_w);
          // Clear the next frontier
          store8B(0, nextFrontier_m, nodeTileIdx, cache_w);
          print_debug(me, 6);
        }

        // Extract the current frontier from the previous next frontier and
        // update node levels
        uint32_t startTileIdx = startNodeIdx / 64;
        uint32_t numTiles = numNodes / 64;
        if (startTileIdx <= nodeTileIdx &&
            nodeTileIdx < startTileIdx + numTiles)
        {
          print_debug(me, 5);

          // Update current frontier
          store8B(nextFrontierTile, currentFrontier_m,
                  nodeTileIdx - startTileIdx, cache_w);
          print_debug(me, 6);

          // Update node levels
          if (nextFrontierTile)
          {
            for (uint32_t node = nodeTileIdx * 64;
                 node < (nodeTileIdx + 1) * 64; ++node)
            {
              if (isSet(nextFrontierTile, node % 64))
              {
                print_debug(me, 5);
                store4B(level, nodeLevel_m, node - startNodeIdx,
                        cache_w); // No false sharing so no need for locks
                print_debug(me, 6);
              }
            }
          }
        }
      }

      // Wait until all tasklets have updated the current frontier
      // barrier_wait(&bfsBarrier);
      print_debug(me, 1);
      active_wait_barrier(&bfsBarrier);
      print_debug(me, 2);

      // Identify tasklet's nodes
      uint32_t numNodesPerTasklet = (numNodes + nb_thread - 1) / nb_thread;
      uint32_t taskletNodesStart = me * numNodesPerTasklet;
      uint32_t taskletNumNodes;
      if (taskletNodesStart > numNodes)
      {
        taskletNumNodes = 0;
      }
      else if (taskletNodesStart + numNodesPerTasklet > numNodes)
      {
        taskletNumNodes = numNodes - taskletNodesStart;
      }
      else
      {
        taskletNumNodes = numNodesPerTasklet;
      }

      // Visit neighbors of the current frontier
      // mutex_id_t mutexID = MUTEX_GET(nextFrontierMutex);
      for (uint32_t node = taskletNodesStart;
           node < taskletNodesStart + taskletNumNodes; ++node)
      {

        uint32_t nodeTileIdx = node / 64;
        print_debug(me, 5);
        uint64_t currentFrontierTile =
            load8B(currentFrontier_m, nodeTileIdx,
                   cache_w); // TODO: Optimize: load tile then loop over nodes
                             // in the tile
        print_debug(me, 6);

        if (isSet(currentFrontierTile,
                  node % 64))

        { // If the node is in the current frontier
          // Visit its neighbors
          print_debug(me, 5);

          uint32_t nodePtr = load4B(nodePtrs_m, node, cache_w) - nodePtrsOffset;
          uint32_t nextNodePtr = load4B(nodePtrs_m, node + 1, cache_w) -
                                 nodePtrsOffset; // TODO: Optimize: might be in
          // the same 8B as nodePtr
          print_debug(me, 6);
          if (me == 0 && nodePtr != nextNodePtr)
          {
            // debug_int(nodePtr);
            // debug_int(nextNodePtr);
          }

          for (uint32_t i = nodePtr; i < nextNodePtr; ++i)
          {
            print_debug(me, 5);

            uint32_t neighbor =
                load4B(neighborIdxs_m, i,
                       cache_w); // TODO: Optimize: sequential access to
                                 // neighbors can use sequential reader
            print_debug(me, 6);
            uint32_t neighborTileIdx = neighbor / 64;
            print_debug(me, 5);
            uint64_t visitedTile = load8B(visited_m, neighborTileIdx, cache_w);
            print_debug(me, 6);

            if (!isSet(visitedTile,
                       neighbor % 64))
            { // Neighbor not previously visited
              // Add neighbor to next frontier
              // mutex_lock(
              //     mutexID); // TODO: Optimize: use more locks to reduce
              //     contention
              lock(&nextFrontierMutex);
              print_debug(me, 5);
              uint64_t nextFrontierTile =
                  load8B(nextFrontier_m, neighborTileIdx, cache_w);
              print_debug(me, 6);
              setBit(nextFrontierTile, neighbor % 64);
              print_debug(me, 5);

              store8B(nextFrontierTile, nextFrontier_m, neighborTileIdx,
                      cache_w);
              print_debug(me, 6);
              // mutex_unlock(mutexID);
              unlock(&nextFrontierMutex);
            }
          }
          //   aa();
        }
      }
      //   debug_int(me);
    }
    // wait_barrier(&my_barrier);
    // if (me == 0) {
    //   socket_write(sd_host, &ok, 1);
    //   //   debug_int(nb_loop++);
    //   socket_read(sd_host, &ok, 1);
    // }
    print_debug(me, 4); // rc,ra
    wait_barrier(&my_barrier);
    if (me == 0)
    {
      socket_write(sd_host, &ok, 1);
      print_debug(me, 4);
      socket_read(sd_host, &ok, 1);

      // Load parameters
      //   uint32_t params_m = (uint32_t)DPU_MRAM_HEAP_POINTER;
      uint32_t params_m = 0;
      r = umram_read(params_w,
                     ROUND_UP_TO_MULTIPLE_OF_8(sizeof(struct DPUParams)),
                     params_m);
      if (r != 0)
      {
        fault_notif();
      }
    }
  }
  return;
}
