#include "socket.h"
namespace upmem_sim::simulator::faho::socket
{
    struct socket_connection *find_free_socket_connection_or_alloc(int nb_so,
                                                                   struct socket_connection *sockets_connection)
    {
        // 函数实现
        for (unsigned int i = 0; i < nb_so; i++)
        {
            if (sockets_connection[i].pid == 0)
            {
                return &sockets_connection[i];
            }
        }
        sockets_connection = (socket_connection *)realloc(
            sockets_connection, (nb_so + 1) * sizeof(*sockets_connection));
        struct socket_connection *sc = &sockets_connection[nb_so];
        sc->idx = nb_so;
        nb_so++;
        return sc;
    }
    void add_write_data_socket(def::DpuManager *DpuManager, def::Event *event, def::process_host *process)
    {
        for (unsigned int i = 0; i < DpuManager->write_socket->nb_data; i++)
        {
            if (DpuManager->write_socket->data[i]->pid == 0)
            {
                DpuManager->write_socket->data[i]->pid = process->pid;
                DpuManager->write_socket->data[i]->buf = event->buf;
                DpuManager->write_socket->data[i]->size = event->buf->size();
                return;
            }
        }
        DpuManager->write_socket->nb_data++;
        socket_data *ws = new socket_data(process->pid);
        ws->buf = event->buf;
        ws->size = event->buf->size();
        DpuManager->write_socket->data.push_back(ws);
        return;
    }
    void transfert_from_api(def::DpuManager *DpuManager, int nb_so, struct socket_connection *sockets_connection)

    {
        DpuManager->dpu_flag->write_socket = 0; // set flag
        for (unsigned int i = 0; i < DpuManager->write_socket->nb_data; i++)
        {
            if (DpuManager->write_socket->data[i]->pid == 0) // no more data to write
                break;
            struct socket_connection *sc = NULL;
            for (uint32_t j = 0; j < nb_so; j++)
            {
                if (sockets_connection[j].dpu_id == DpuManager->dpu_id &&
                    sockets_connection[j].pid == DpuManager->write_socket->data[i]->pid &&
                    sockets_connection[j].penpal_is_host)
                {
                    sc = &sockets_connection[j];
                    break;
                }
            }
            assert(sc != NULL);
            struct def::process_host *p = NULL;

            for (auto &process : DpuManager->processes)
            {
                if (process->pid == sc->pid)
                {
                    p = process;
                }
            }
            assert(p != NULL);
            write_in_socket(DpuManager, p->sd[sc->sd].inode, DpuManager->write_socket->data[i]->buf,
                                DpuManager->write_socket->data[i]->size);
            
            p->sd[sc->sd].flags |= SOCKET_UPDATE;
            DpuManager->dpu_flag->dpu_process_change = 1;
            DpuManager->write_socket->nb_data=0;
            for(auto& data: DpuManager->write_socket->data)
            {
                delete data;
            }
        
        }
    }
    int write_in_socket(def::DpuManager *DpuManager, int inode, encoder::ByteStream *buf, int size)
    {
        struct socket_info si;
        inode::read_inode(DpuManager, inode, &si, sizeof(si), 0);
        uint32_t place = (si.rw < si.rr) ? si.rr - si.rw : (SIZE_SOCKET - si.rr) + si.rw;
        if (si.rw < si.rr)
        {
            printf("--> %i %i\n", si.rw, si.rr);
        }
        assert(place >= size);
        uint32_t size_all = (size / 8 + 1) * 8;
        void *buf_all = malloc(size_all);
        assert(buf_all != NULL);
        uint8_t off = si.rw % 8;
        inode::read_inode(DpuManager, inode, buf_all, 8, sizeof(si) + si.rw - off);
        for (unsigned int i = 0; i < size; i++)
            ((char *)buf_all)[off + i] = buf->byte(i);

        if (size_all > (SIZE_SOCKET - si.rw + off))
        {
            uint32_t first_size = SIZE_SOCKET - sizeof(si) - (si.rw - off);
            uint32_t second_size = size - first_size;
            inode::write_inode(DpuManager, inode, buf_all, first_size, sizeof(si) + si.rw - off);
            inode::write_inode(DpuManager, inode, buf_all + first_size, second_size, sizeof(si));
        }
        else
            inode::write_inode(DpuManager, inode, buf_all, size_all, sizeof(si) + si.rw - off);
        si.rw = (si.rw + size) % SIZE_SOCKET;
        inode::write_inode(DpuManager, inode, &si, sizeof(si), 0);
        def::set_flags(DpuManager, SOCKET_UPDATE);
        return 0;
    }
    socket_data::socket_data(int pid)
    {
        this->pid = pid;
        this->size = 0;
        this->buf = nullptr;
    }
    socket_data::~socket_data()
    {
        if (buf != nullptr)
        {
            delete buf;
            buf = nullptr;
        }
    }

}