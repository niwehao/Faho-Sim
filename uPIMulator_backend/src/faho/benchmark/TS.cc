#include "host.h"
#include <getopt.h>
#include <math.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#define DTYPE int32_t
#define NR_FTHREAD 16
typedef struct
{
  uint32_t ts_length;
  uint32_t query_length;
  DTYPE query_mean;
  DTYPE query_std;
  uint32_t slice_per_dpu;
  int32_t exclusion_zone;
  enum kernels
  {
    kernel1 = 0,
    nr_kernels = 1,
  } kernel;
  uint32_t __8align;
} dpu_arguments_t;

typedef struct
{
  DTYPE minValue;
  uint32_t minIndex;
  DTYPE maxValue;
  uint32_t maxIndex;
} dpu_result_t;
#define NR_DPUS 1
#define MAX_DATA_VAL 127
static uint32_t nr_of_dpus = NR_DPUS;
static DTYPE query_mean;
static double queryMean = 0;
static uint32_t slice_per_dpu;
static dpu_result_t result;
static DTYPE query_std;
static DTYPE tSeries[1 << 26];
static DTYPE query[1 << 15];
static DTYPE AMean[1 << 26];
static DTYPE ASigma[1 << 26];
static DTYPE minHost;
static DTYPE minHostIdx;
static dpu_result_t *results_retrieve[NR_DPUS];
static unsigned long int ts_size;
static const unsigned int query_length = 64;
static DTYPE *create_test_file(unsigned int ts_elements,
                               unsigned int query_elements)
{
  srand(0);

  for (uint64_t i = 0; i < ts_elements; i++)
  {
    tSeries[i] = i % MAX_DATA_VAL;
  }

  for (uint64_t i = 0; i < query_elements; i++)
  {
    query[i] = i % MAX_DATA_VAL;
  }

  return tSeries;
}

// Compute output in the host
static void streamp(DTYPE *tSeries, DTYPE *AMean, DTYPE *ASigma,
                    int ProfileLength, DTYPE *query, int queryLength,
                    DTYPE queryMean, DTYPE queryStdDeviation)
{
  DTYPE distance;
  DTYPE dotprod;
  minHost = INT32_MAX;
  minHostIdx = 0;

  for (int subseq = 0; subseq < ProfileLength; subseq++)
  {
    dotprod = 0;
    for (int j = 0; j < queryLength; j++)
    {
      dotprod += tSeries[j + subseq] * query[j];
    }
    // //打印 ASigma
    // std::cout << "ASigma[" << subseq << "] = " << ASigma[subseq] << std::endl;

    distance =
        2 * (queryLength - (dotprod - queryLength * AMean[subseq] * queryMean) / (ASigma[subseq] * queryStdDeviation));

    if (distance < minHost)
    {
      minHost = distance;
      minHostIdx = subseq;
      // std::cout << "ASigma[" << subseq << "] = " <<  distance << std::endl;
    }
  }
}

static void compute_ts_statistics(unsigned int timeSeriesLength,
                                  unsigned int ProfileLength,
                                  unsigned int queryLength)
{
  double *ACumSum = (double *)malloc(sizeof(double) * timeSeriesLength);
  ACumSum[0] = tSeries[0];
  for (uint64_t i = 1; i < timeSeriesLength; i++)
    ACumSum[i] = tSeries[i] + ACumSum[i - 1];
  double *ASqCumSum = (double *)malloc(sizeof(double) * timeSeriesLength);
  ASqCumSum[0] = tSeries[0] * tSeries[0];
  for (uint64_t i = 1; i < timeSeriesLength; i++)
    ASqCumSum[i] = tSeries[i] * tSeries[i] + ASqCumSum[i - 1];
  double *ASum = (double *)malloc(sizeof(double) * ProfileLength);
  ASum[0] = ACumSum[queryLength - 1];
  for (uint64_t i = 0; i < timeSeriesLength - queryLength; i++)
    ASum[i + 1] = ACumSum[queryLength + i] - ACumSum[i];
  double *ASumSq = (double *)malloc(sizeof(double) * ProfileLength);
  ASumSq[0] = ASqCumSum[queryLength - 1];
  for (uint64_t i = 0; i < timeSeriesLength - queryLength; i++)
    ASumSq[i + 1] = ASqCumSum[queryLength + i] - ASqCumSum[i];
  double *AMean_tmp = (double *)malloc(sizeof(double) * ProfileLength);
  for (uint64_t i = 0; i < ProfileLength; i++)
    AMean_tmp[i] = ASum[i] / queryLength;
  double *ASigmaSq = (double *)malloc(sizeof(double) * ProfileLength);
  for (uint64_t i = 0; i < ProfileLength; i++)
    ASigmaSq[i] = ASumSq[i] / queryLength - AMean[i] * AMean[i];
  for (uint64_t i = 0; i < ProfileLength; i++)
  {
    ASigma[i] = sqrt(ASigmaSq[i]);
    if (ASigma[i] < 1)
    {
      assert(0);
    }
    AMean[i] = (DTYPE)AMean_tmp[i];
  }

  free(ACumSum);
  free(ASqCumSum);
  free(ASum);
  free(ASumSq);
  free(ASigmaSq);
  free(AMean_tmp);
}

namespace upmem_sim::simulator::faho::def
{
  def::Event *TS::benchmark(int time_)
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
  void TS::check(int pid)
  {
    int status = 0;

    for (uint32_t i = 0; i < NR_DPUS; i++)
    {
      for (unsigned int each_tasklet = 0; each_tasklet < NR_FTHREAD;
           each_tasklet++)
      {
        if (results_retrieve[i][each_tasklet].minValue < result.minValue)
        {
          result.minValue = results_retrieve[i][each_tasklet].minValue;
          result.minIndex = (DTYPE)results_retrieve[i][each_tasklet].minIndex +
                            (i * slice_per_dpu);
        }
      }
      free(results_retrieve[i]);
      i++;
    }

    status = (minHost == result.minValue);

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
  void TS::benchmark_init(std::string bindir, int data_prep)
  {
    bindir_ = bindir;
    ts_size = data_prep;
    if (nr_of_dpus != 1)
    {
      std::cout << "not support multiple dpus" << std::endl;
    }
    // Size adjustment
    if (ts_size % (nr_of_dpus * NR_FTHREAD * query_length))
      ts_size = ts_size + (nr_of_dpus * NR_FTHREAD * query_length -
                           ts_size % (nr_of_dpus * NR_FTHREAD * query_length));

    // Create an input file with arbitrary data
    create_test_file(ts_size, query_length);
    compute_ts_statistics(ts_size, ts_size - query_length, query_length);

    for (unsigned i = 0; i < query_length; i++)
      queryMean += query[i];
    queryMean /= (double)query_length;
    query_mean = (DTYPE)queryMean;

    double queryStdDeviation;
    double queryVariance = 0;
    for (unsigned i = 0; i < query_length; i++)
    {
      queryVariance += (query[i] - queryMean) * (query[i] - queryMean);
    }
    queryVariance /= (double)query_length;
    queryStdDeviation = sqrt(queryVariance);
    query_std = (DTYPE)queryStdDeviation;

    DTYPE *bufferTS = tSeries;
    DTYPE *bufferQ = query;
    DTYPE *bufferAMean = AMean;
    DTYPE *bufferASigma = ASigma;

    slice_per_dpu = ts_size / nr_of_dpus;

    unsigned int kernel = 0;
    dpu_arguments_t input_arguments = {
        ts_size, query_length, query_mean, query_std, slice_per_dpu, 0, static_cast<enum dpu_arguments_t::kernels>(kernel)};
    // uint32_t mem_offset;

    result.minValue = INT32_MAX;
    result.minIndex = 0;
    result.maxValue = 0;
    result.maxIndex = 0;

    int first_role_id = 1;
    Event *event;
    event = init_NewProcess(
        first_role_id, 1000, nr_of_dpus, "TS.16");
    events_.push_back(event);
    event = init_LanuchProcess(first_role_id, 1000);
    events_.push_back(event);
    for (uint32_t i = 0; i < nr_of_dpus; i++)
    {
      event = init_ReadSocket(first_role_id + i); // dpu已经启动
      events_.push_back(event);
    }

    for (uint32_t i = 0; i < nr_of_dpus; i++)
    {
      int role_id = i + first_role_id;
      input_arguments.exclusion_zone = 0;

      // write_inode(&api, role_id, &input_arguments, sizeof(input_arguments), 0);
      event = init_InodeWrite(
          role_id, 1000, 0,
          transfer_buf_bytes(&input_arguments, sizeof(input_arguments)));
      events_.push_back(event);

      // write_inode(&api, role_id, bufferQ, query_length * sizeof(DTYPE),
      //             sizeof(input_arguments));
      event = init_InodeWrite(
          role_id, 1000, sizeof(input_arguments),
          transfer_buf_bytes(bufferQ, query_length * sizeof(DTYPE)));
      events_.push_back(event);

      // write_inode(&api, role_id, bufferTS + slice_per_dpu * i,
      //             (slice_per_dpu + query_length) * sizeof(DTYPE),
      //             query_length * sizeof(DTYPE) + sizeof(input_arguments));
      event = init_InodeWrite(
          role_id, 1000, sizeof(input_arguments) + query_length * sizeof(DTYPE),
          transfer_buf_bytes(bufferTS + slice_per_dpu * i,
                             (slice_per_dpu + query_length) * sizeof(DTYPE)));
      events_.push_back(event);

      // write_inode(&api, role_id, bufferAMean + slice_per_dpu * i,
      //             (slice_per_dpu + query_length) * sizeof(DTYPE),
      //             (slice_per_dpu + query_length) * sizeof(DTYPE) +
      //                 query_length * sizeof(DTYPE) + sizeof(input_arguments));
      event = init_InodeWrite(
          role_id, 1000,
          (slice_per_dpu + query_length) * sizeof(DTYPE) +
              query_length * sizeof(DTYPE) + sizeof(input_arguments),
          transfer_buf_bytes(bufferAMean + slice_per_dpu * i,
                             (slice_per_dpu + query_length) * sizeof(DTYPE)));
      events_.push_back(event);

      // write_inode(&api, role_id, bufferASigma + slice_per_dpu * i,
      //             (slice_per_dpu + query_length) * sizeof(DTYPE),
      //             2 * (slice_per_dpu + query_length) * sizeof(DTYPE) +
      //                 query_length * sizeof(DTYPE) + sizeof(input_arguments));
      event = init_InodeWrite(
          role_id, 1000,
          2 * (slice_per_dpu + query_length) * sizeof(DTYPE) +
              query_length * sizeof(DTYPE) + sizeof(input_arguments),
          transfer_buf_bytes(bufferASigma + slice_per_dpu * i,
                             (slice_per_dpu + query_length) * sizeof(DTYPE)));
      events_.push_back(event);

      results_retrieve[i] =
          (dpu_result_t *)malloc(NR_FTHREAD * sizeof(dpu_result_t));
      // retrive_inode_at_end(
      //     &api, role_id, results_retrieve[i], NR_FTHREAD * sizeof(dpu_result_t),
      //     3 * (slice_per_dpu + query_length) * sizeof(DTYPE) +
      //         query_length * sizeof(DTYPE) + sizeof(input_arguments));
      // int retrive_inode_at_end(struct api *api, unsigned char role_id, void *buf,
      //      size_t size, unsigned int offset)
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

    for (uint32_t i = 0; i < nr_of_dpus; i++)
    {
      event = init_InodeRead(
          i + first_role_id, 1000,
          (uint8_t *)results_retrieve[i],
          3 * (slice_per_dpu + query_length) * sizeof(DTYPE) +
              query_length * sizeof(DTYPE) + sizeof(input_arguments),
          NR_FTHREAD * sizeof(dpu_result_t));
      events_.push_back(event);
      event = init_Check(i + first_role_id);
      events_.push_back(event);
    }
    streamp(tSeries, AMean, ASigma, ts_size - query_length - 1, query,
            query_length, query_mean, query_std);

    return;
  }

}