#include "host.h"
#include "encoder/byte_stream.h"

namespace upmem_sim::simulator::faho::def
{
   
    Host::~Host()
    {
        for (auto &event : events_)
        {
            delete event->buf; // 释放事件中的缓冲区
            delete event;      // 释放事件对象
        }
        for (auto &buffer : ReadBuffer_)
        {
            delete buffer->buf; // 释放缓冲区数据
            delete buffer;      // 释放缓冲区对象
        }
    }
    encoder::ByteStream *Host::transfer_buf_bytes(void *buf, int size)
    {

        std::vector<int> bytes_;

        for (int i = 0; i < size; i++)
        {
            bytes_.push_back(((uint8_t *)buf)[i]);
        }
        encoder::ByteStream *byte_stream = new encoder::ByteStream(bytes_);
        return byte_stream; // 返回新的ByteStream对象
    }
    void Host::write_buffer(int app_id, int pid, void *buf, int size)
    {

        // 如果没有找到空闲的缓冲区，则创建一个新的缓冲区
        ReadBuffer *new_buffer = new ReadBuffer();
        new_buffer->buf = new char[size];
        memcpy(new_buffer->buf, buf, size);
        new_buffer->need_read = size;
        new_buffer->app_id = app_id;
        new_buffer->pid = pid;     // 设置角色id
        ReadBuffer_.push_back(new_buffer); // 将新缓冲区添加到列表中
    }
    def::ReadBuffer *Host::read_buffer(int pid)
    {
        
        // 先获取第一个元素
        if (ReadBuffer_.empty())
        {
            return nullptr; // 如果没有缓冲区可读，返回nullptr
        }

        // 查找第一个匹配pid的ReadBuffer
        for (auto it = ReadBuffer_.begin(); it != ReadBuffer_.end(); ++it)
        {
            if ((*it)->pid == pid)
            {
                def::ReadBuffer *found = *it;
                ReadBuffer_.erase(it); // 从vector中删除找到的元素
                return found;
            }
        }

        return nullptr; // 如果没有找到匹配的pid，返回nullptr
    }

    def::Event *Host::get_event(int time)
    {

        def::Event *event_f = events_.front();
        if (event_f->time <= time)
        {
            // 去除第一个
            if (event_f->kind == def::KIND::ReadSocket)
            {
                def::ReadBuffer *read_buffer_ = read_buffer(event_f->pid);
                if (read_buffer_ == nullptr)
                {
                    return nullptr; // 如果没有可读缓冲区，返回nullptr,没有读到任何信息,继续保留这个event
                }
                //从read_buffer_buf中读取read_buffer_->need_read个字节
                assert(read_buffer_->buf != nullptr); // 确保缓冲区不为空
                assert(read_buffer_->need_read > 0); // 确保需要读取的字节数大于0
                std::cout << "ReadSocket event for pid: " << event_f->pid << " at time: " << event_f->time << std::endl;
                for(int i = 0; i < read_buffer_->need_read; i++)
                {
                    std::cout << static_cast<char *>(read_buffer_->buf)[i]; // 输出读取的字节
                }
                std::cout << std::endl; // 输出换行符
                delete read_buffer_;
                
                events_.erase(events_.begin());
                return event_f;
            }
            events_.erase(events_.begin());
            return event_f;
        }
        return nullptr; // 如果没有找到对应时间的事件，返回nullptr
    }
    def::Event *Host::init_NewProcess(int rolepid, int time, int num_dpu, std::string path)
    {
        def::Event *event = new def::Event();
        event->pid = rolepid;
        event->time = time;
        event->kind = def::KIND::NewProcess;
        event->num_dpu = num_dpu;
        event->path = bindir_+path;
        return event; // 返回新创建的事件对象
    }
    def::Event *Host::init_LanuchProcess(int rolepid, int time)
    {
        def::Event *event = new def::Event();
        event->pid = rolepid;
        event->time = time;
        event->kind = def::KIND::LaunchProcess;
        return event; // 返回新创建的事件对象
    }
    def::Event *Host::init_ReadSocket(int pid)
    {
        def::Event *event = new def::Event();
        event->pid = pid;
        event->kind = def::KIND::ReadSocket;
        return event; // 返回新创建的事件对象
    }
    def::Event *Host::init_InodeWrite(int pid, int time, int offset, encoder::ByteStream *buf)
    {
        def::Event *event = new def::Event();
        event->pid = pid;
        event->time = time;
        event->kind = def::KIND::InodeWrite;
        event->offset = offset;
        event->buf = buf; // 直接使用传入的buf指针
        return event;     // 返回新创建的事件对象
    }
    def::Event *Host::init_InodeRead(int pid, int time, void *pointer, int offset, int size)
    {
        def::Event *event = new def::Event();
        event->pid = pid;
        event->time = time;
        event->kind = def::KIND::InodeRead;
        event->pointer = pointer; // 直接使用传入的指针
        event->offset = offset;
        event->size = size;
        return event; // 返回新创建的事件对象
    }
    def::Event *Host::init_WriteSockets(int pid, int time, int size, encoder::ByteStream *buf)
    {
        def::Event *event = new def::Event();
        event->pid = pid;
        event->time = time;
        event->kind = def::KIND::WriteSockets;
        event->size = size;
        event->buf = buf; // 直接使用传入的buf指针
        return event;     // 返回新创建的事件对象
    }
    def::Event *Host::init_Check(int pid)
    {
        def::Event *event = new def::Event();
        event->pid = pid; // 设置pid
        event->kind = def::KIND::Check;
        return event; // 返回新创建的事件对象
    }
    
}
