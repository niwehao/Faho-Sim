#include "host.h"
#include "encoder/byte_stream.h"

namespace upmem_sim::simulator::faho::def
{
   
    Host::~Host()
    {
        for (auto &event : events_)
        {
            delete event->buf;
            delete event;
        }
        for (auto &buffer : ReadBuffer_)
        {
            delete buffer->buf;
            delete buffer;
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
        return byte_stream;
    }
    void Host::write_buffer(int app_id, int pid, void *buf, int size)
    {

        ReadBuffer *new_buffer = new ReadBuffer();
        new_buffer->buf = new char[size];
        memcpy(new_buffer->buf, buf, size);
        new_buffer->need_read = size;
        new_buffer->app_id = app_id;
        new_buffer->pid = pid;
        ReadBuffer_.push_back(new_buffer);
    }
    def::ReadBuffer *Host::read_buffer(int pid)
    {
        
        if (ReadBuffer_.empty())
        {
            return nullptr;
        }

        for (auto it = ReadBuffer_.begin(); it != ReadBuffer_.end(); ++it)
        {
            if ((*it)->pid == pid)
            {
                def::ReadBuffer *found = *it;
                ReadBuffer_.erase(it);
                return found;
            }
        }

        return nullptr;
    }

    def::Event *Host::get_event(int time)
    {

        def::Event *event_f = events_.front();
        if (event_f->time <= time)
        {
            if (event_f->kind == def::KIND::ReadSocket)
            {
                def::ReadBuffer *read_buffer_ = read_buffer(event_f->pid);
                if (read_buffer_ == nullptr)
                {
                    return nullptr;
                }
                assert(read_buffer_->buf != nullptr);
                assert(read_buffer_->need_read > 0);
                std::cout << "ReadSocket event for pid: " << event_f->pid << " at time: " << event_f->time << std::endl;
                delete read_buffer_;
                
                events_.erase(events_.begin());
                return event_f;
            }
            events_.erase(events_.begin());
            return event_f;
        }
        return nullptr;
    }
    def::Event *Host::init_NewProcess(int rolepid, int time, int num_dpu, std::string path)
    {
        def::Event *event = new def::Event();
        event->pid = rolepid;
        event->time = time;
        event->kind = def::KIND::NewProcess;
        event->num_dpu = num_dpu;
        event->path = bindir_+path;
        return event;
    }
    def::Event *Host::init_LanuchProcess(int rolepid, int time)
    {
        def::Event *event = new def::Event();
        event->pid = rolepid;
        event->time = time;
        event->kind = def::KIND::LaunchProcess;
        return event;
    }
    def::Event *Host::init_ReadSocket(int pid)
    {
        def::Event *event = new def::Event();
        event->pid = pid;
        event->kind = def::KIND::ReadSocket;
        return event;
    }
    def::Event *Host::init_InodeWrite(int pid, int time, int offset, encoder::ByteStream *buf)
    {
        def::Event *event = new def::Event();
        event->pid = pid;
        event->time = time;
        event->kind = def::KIND::InodeWrite;
        event->offset = offset;
        event->buf = buf;
        return event;
    }
    def::Event *Host::init_InodeRead(int pid, int time, void *pointer, int offset, int size)
    {
        def::Event *event = new def::Event();
        event->pid = pid;
        event->time = time;
        event->kind = def::KIND::InodeRead;
        event->pointer = pointer;
        event->offset = offset;
        event->size = size;
        return event;
    }
    def::Event *Host::init_WriteSockets(int pid, int time, int size, encoder::ByteStream *buf)
    {
        def::Event *event = new def::Event();
        event->pid = pid;
        event->time = time;
        event->kind = def::KIND::WriteSockets;
        event->size = size;
        event->buf = buf;
        return event;
    }
    def::Event *Host::init_Check(int pid)
    {
        def::Event *event = new def::Event();
        event->pid = pid;
        event->kind = def::KIND::Check;
        return event;
    }
 
}
