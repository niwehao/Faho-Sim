#include "host.h"

namespace upmem_sim::simulator::faho::def
{
    def::Event *ALLOC::benchmark(int time_)
    {
   
        if (events_.empty())
        {
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
   
    void ALLOC::benchmark_init(std::string bindir)
    {
        bindir_ = bindir;
        def::Event *event;
        event = init_NewProcess(1, 1000, 1, "ALLOC.16");//只有new和lanuch指定role_id=1
        events_.push_back(event);
        event = init_LanuchProcess(1, 1100);
        events_.push_back(event);
    }
    void ALLOC::check(int pid)
    {
        
    }
}