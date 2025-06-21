#ifndef PMEM_SIM_SIMULATOR__FAHO_HOST_H_
#define PMEM_SIM_SIMULATOR__FAHO_HOST_H_
#include "../def.h"
#include <string.h>
namespace upmem_sim::simulator::faho::def
{
    class ReadBuffer
    {
    public:
        int need_read = 0;
        int app_id = 0;
        int pid = 0; // 角色id
        void *buf = nullptr;
     
    };
    typedef struct
    {
        uint32_t size;
        uint32_t transfer_size;
    } dpu_arguments_t;

    class Host
    {
    public:

        ~Host();
        void write_buffer(int app_id, int role_id, void *buf, int size);
        def::ReadBuffer *read_buffer(int pid);
        encoder::ByteStream *transfer_buf_bytes(void *buf, int size);
        def::Event *get_event(int time);
        def::Event *init_NewProcess(int pid, int time, int num_dpu, std::string path);
        def::Event *init_LanuchProcess(int pid, int time);
        def::Event *init_ReadSocket(int pid);
        def::Event *init_InodeWrite(int pid,int time, int offset, encoder::ByteStream *buf);
        def::Event *init_InodeRead(int pid, int time, void *pointer, int offset, int size);
        def::Event *init_WriteSockets(int pid, int time, int size, encoder::ByteStream *buf);
        def::Event *init_Check(int pid);
        std::vector<def::Event *> events_;
        std::vector<def::ReadBuffer *> ReadBuffer_;
        std::string bindir_;
        virtual def::Event *benchmark(int time_) = 0; // 基准测试
        virtual void benchmark_init(std::string bindir) = 0;            // 初始化基准测试
        virtual void check(int pid) = 0; // 检查事件
    };
    class VA : public Host
    {
    public:

  
        def::Event *benchmark(int time_) override;
        void benchmark_init(std::string bindir) override;
        void check(int pid) override;
        int end_flag=0;

    };

}
#endif