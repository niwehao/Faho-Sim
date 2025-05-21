#include "faho/k1.h"
#include "faho/def.h"
#include "faho/inode.h"
#include "faho/socket.h"
#include <stack>
namespace upmem_sim::simulator::faho::k1
{
    K1::K1()
    {
        // 先连接rank再初始化
    }
    void K1::init()
    {
        init_mram();
        init_K2andK3();
        init_event(); // 读入指令表
        init_dpu_manager();
    }
    void K1::init_event()
    {
        // 打开文件
        std::ifstream file(bindir_ + "/event");

        assert(file.is_open());

        std::string line;
        // 逐行读取
        while (std::getline(file, line))
        {
            std::istringstream iss(line);
            std::string token;

            // 根据空格分割每一行
            while (iss >> token)
            {
                if (token == "NewProcess")
                { // NewProcess pid(role id) time num_dpu path(keep path for ram)
                    int pid;
                    int time;
                    int num_dpu;
                    std::string path;
                    iss >> pid >> time >> num_dpu >> path;
                    def::Event *event = new def::Event();
                    event->pid = pid;
                    event->time = time;
                    event->kind = def::KIND::NewProcess;
                    event->path = bindir_ + "/" + path;
                    events_.push_back(event);
                }
                else if (token == "InodeRead")
                { // InodeRead pid time path offset size
                    int pid;
                    int time;
                    int offset;
                    int size;
                    std::string path;
                    iss >> pid >> time >> path >> offset >> size;

                    def::Event *event = new def::Event();
                    event->pid = pid;
                    event->time = time;
                    event->path = path;
                    event->offset = offset;
                    event->size = size;
                    event->kind = def::KIND::InodeRead;
                    events_.push_back(event);
                }
                else if (token == "InodeWrite")
                { // InodeWrite pid(roleid) time path(read as buf) offset
                    int pid;
                    int time;
                    int offset;
                    std::string path;
                    iss >> pid >> time >> path >> offset;
                    def::Event *event = new def::Event();
                    event->pid = pid;
                    event->time = time;
                    event->offset = offset;
                    event->kind = def::KIND::InodeWrite;
                    event->buf = new encoder::ByteStream(bindir_ + "/" + path);
                    events_.push_back(event);
                }
                else if (token == "LaunchProcess") // all_launch_evt
                {                                  // LaunchProcess pid(rolepid) time
                    int pid;
                    int time;
                    iss >> pid >> time;
                    def::Event *event = new def::Event();
                    event->pid = pid;
                    event->time = time;
                    event->kind = def::KIND::LaunchProcess;
                    events_.push_back(event);
                }
                else if (token == "WriteSocket")
                { // WriteSocket pid(pid) time path(buf)
                    int pid;
                    int time;
                    std::string path;
                    iss >> pid >> time;
                    def::Event *event = new def::Event();
                    event->pid = pid;
                    event->time = time;
                    event->kind = def::KIND::WriteSocket;
                    event->buf = new encoder::ByteStream(bindir_ + "/" + path);
                    events_.push_back(event);
                }
                else
                {
                    assert(0);
                }
                break;
            }

            std::cout << "read_event_done" << std::endl;
        }

        file.close();
        return;
    }

    void K1::cycle()
    {
        timer_++;
        def::Event *event = get_event(timer_);
        if (event != nullptr) // 模拟api的操作
        {
            switch (event->kind)
            {
            case def::KIND::NewProcess:
                spread_to_dpu(event);
                break;
            case def::KIND::LaunchProcess: // all_launch_evt
                // 进行分配
                launch_event_handle_evt(event);
            case def::KIND::WriteSocket: // socket_write_handle_evt
                socket_write_handle_evt(event);
                break;
            case def::KIND::InodeWrite: // inode_write_handle_evt
                write_inode_handle_evt(event);
                break;
            case def::KIND::InodeRead:
                read_inode_handle_evt(event);
            }
        }
        for (size_t i = 0; i < dpu_managers_.size(); i++)
        {
            auto &dpumanager = dpu_managers_[i];

            dpumanager->ki.flag1 = def::read_flag(dpumanager);
            def::write_flags(dpumanager, 0);
            if (dpumanager->ki.flag1 & (PROCESS_END | NEW_SOCKET | SOCKET_OUT) ||
                dpumanager->dpu_flag->load_proc || dpumanager->dpu_flag->launch_proc ||
                dpumanager->dpu_flag->write_inode || dpumanager->dpu_flag->read_inode)
            {
                read_process(dpumanager); // 从内存里读取进程相关信息
            }
            if (dpumanager->dpu_flag->launch_proc)
            {
                launch_event(dpumanager);
            }
            if (dpumanager->dpu_flag->load_proc) // 载入Proc
            {
                load_event(dpumanager);
            }
            if (dpumanager->dpu_flag->write_inode)
            {
                write_inode_data(dpumanager);
            }
            if (dpumanager->dpu_flag->read_inode)
            {
                read_inode_data(dpumanager);
                dpumanager->dpu_flag->read_inode = 0;
            }
            if (dpumanager->ki.flag1 & NEW_SOCKET)
            {
                parse_new_socket(dpumanager);
            }
            if ((dpumanager->ki.flag1 & SOCKET_OUT) ||
                dpumanager->dpu_flag->write_socket)
            {

                transfert_socket(dpumanager);
            }
            if (dpumanager->dpu_flag->dpu_process_change)
            {
                write_process(dpumanager);
            }

            // 获取事件,并且写入远端dpu中
        }
    }
    void K1::read_process(def::DpuManager *dpu_manager)
    {
        for (int i = 0; i < MAX_PRG; i++)
        {
            dpu::DPU *dpu = dpu_manager->dpu;
            def::dpu_copy_from_mram(dpu, dpu_manager->processes[i], 
                def::processs_address + i * sizeof(struct def::process_host),
                                    sizeof(struct def::process_host));
        }
    }
    void K1::write_process(def::DpuManager *dpu_manager){
        for(int i=0;i<MAX_PRG;i++)
        {
            def::dpu_copy_to_wram(dpu_manager->dpu, 
                def::processs_address+i*sizeof(struct def::process_host), dpu_manager->processes[i], 
                sizeof(struct def::process_host));
        }

    }
    void K1::launch_event(def::DpuManager *dpu_manager)
    {

        for (auto &process : dpu_manager->unlaunch_processes)
        {
            assert(process->process->state == def::STATE::LOADED);
            process->process->state = def::STATE::READY;
            dpu_manager->launch_processes.push_back(process);
        }
        dpu_manager->dpu_flag->launch_proc = 0; // flag
        dpu_manager->dpu_flag->dpu_process_change = 1;
        dpu_manager->unlaunch_processes.clear();
    }
    void K1::launch_event_handle_evt(def::Event *event)
    {
        int found = 0;
        int role_pid = event->pid;
        for (auto &dpu_manager : dpu_managers_)
        {
            for (auto &process : dpu_manager->load_processes)
            {
                if (process->process->role == role_pid) // 全部启动
                {

                    dpu_manager->dpu_flag->launch_proc = 1; // set flag
                    // 删除vector中的该元素
                    dpu_manager->unlaunch_processes.push_back(process);
                    found = 1;
                }
            }
            // 删除需要进入ready模式的进程
            auto it = std::remove_if(dpu_manager->load_processes.begin(), dpu_manager->load_processes.end(),
                                     [role_pid](def::ProcessEvent *event)
                                     { return event->process->role == role_pid; });
            dpu_manager->load_processes.erase(it, dpu_manager->load_processes.end());
        }
        assert(found == 1);
    }
    void K1::socket_write_handle_evt(def::Event *event)
    {
        for (auto &dpu_manager : dpu_managers_)
        {
            for (auto &p : dpu_manager->processes)
            {
                if (p == nullptr)
                    continue;
                if (p->pid == event->pid) // 可能还有application_id,但是意义不大
                {
                    dpu_manager->dpu_flag->write_socket = 1;
                    socket::add_write_data_socket(dpu_manager, event, p);
                    return;
                }
            }
        }
        assert(0); // 没有这进程
    }
    void K1::write_inode_handle_evt(def::Event *event)
    {
        for (auto &dpu_manager : dpu_managers_)
        {
            for (auto &p : dpu_manager->processes)
            {
                if (p == nullptr)
                    continue;
                if (p->pid == event->pid) // 可能还有application_id,但是意义不大
                {
                    dpu_manager->dpu_flag->write_inode = 1; // set_flag
                    for (auto &process : dpu_manager->launch_processes)
                    {
                        if (process->process->pid == event->pid)
                        {
                            inode::add_write_data_inode(dpu_manager, event, p, MAX_PRG);
                            return;
                        }
                    }
                    // 该进程还没有启动
                    // inode::add_write_data_inode(dpu_manager, event, p);
                    event->time++;

                    return;
                }
            }
        }
        assert(0); // 没有这进程
    }
    void K1::read_inode_handle_evt(def::Event *event)
    {
        for (auto &dpu_manager : dpu_managers_)
        {
            for (auto &p : dpu_manager->processes)
            {
                if (p == nullptr)
                    continue;
                if (p->pid == event->pid) // 可能还有application_id,但是意义不大
                {
                    dpu_manager->dpu_flag->read_inode = 1;
                    inode::add_read_request(dpu_manager, event, p->pid);
                    return;
                }
            }
        }
        assert(0);
    }
    void K1::spread_to_dpu(def::Event *event) // 把进程分配到dpus
    {
        int num_dpu = event->num_dpu;
        assert(num_dpu <= dpu_managers_.size());
        std::vector<def::DpuManager *> ManagerStack;

        for (auto &dpu_manager : dpu_managers_)
        {

            ManagerStack.push_back(dpu_manager);
        }
        std::sort(ManagerStack.begin(), ManagerStack.end(),
                  [](def::DpuManager *a, def::DpuManager *b)
                  {
                      return a->num_process < b->num_process;
                  });
        for (auto &dpu_manager : ManagerStack)
        {
            assert(dpu_manager->num_process < MAX_PRG);
            all_num_process++; // 总进程+1.多个同样的进程pid不一样

            struct def::process_host *process = new def::process_host();
            dpu_manager->inode_num = dpu_manager->inode_num + def::init_process(process, 0, all_num_process, event->pid, 0, event->path); // 不立即启动,此时状态为Load

            all_processes.push_back(process); // 全部的进程
            int found = 0;
            for (int i = 0; i < MAX_PRG; i++)
            {
                if (dpu_manager->process_table[i] == 0) // 空闲
                {
                    def::ProcessEvent *process_event = new def::ProcessEvent(process, event, i);
                    dpu_manager->unload_processes.push_back(process_event);
                    dpu_manager->num_process++;
                    dpu_manager->dpu_flag->load_proc = 1; // set flag
                    num_dpu--;
                    dpu_manager->processes[i] = process;
                    dpu_manager->process_table[i] = all_num_process; // 被占用的
                    found = 1;
                    break;
                }
            }
            assert(found == 1);
            if (num_dpu == 0)
            {
                break;
            }
        }
        assert(num_dpu == 0);
    }
    void K1::connect_rank(rank::Rank *rank)
    {
        assert(rank != nullptr);
        assert(rank_ == nullptr);
        rank_ = rank;
    }
    void K1::init_dpu_manager()
    {
        int dpu_num = 0;
        for (auto &dpu : rank_->dpus())
        {
            assert(dpu_num == dpu->dpu_id());
            auto dpu_manager = new def::DpuManager(dpu->dpu_id(), dpu);
            dpu_managers_.push_back(dpu_manager);
            def::dpu_copy_to_wram(dpu,
                                  def::dpu_id_address ,&dpu_num, sizeof(int)); // 传递dpu id
             dpu_num++;
        }
    }
    def::Event *K1::get_event(int time)
    {
        for (auto &event : events_)
        {
            if (event->time == time)
            {
                return event;
            }
        }
        return nullptr;
    }

    void K1::load_event(def::DpuManager *dpu_manager)
    {
        dpu_manager->dpu_flag->load_proc = 0;
        dpu_manager->dpu_flag->dpu_process_change = 1;
        for (auto &event : dpu_manager->unload_processes)
        {
            assert(event->event->time == timer_); // 必须在这个时间进行触发
            struct def::process_host *p = event->process;
            encoder::ByteStream *buf_wram = new encoder::ByteStream(event->event->path + "/wram.bin");
            encoder::ByteStream *buf_iram = new encoder::ByteStream(event->event->path + "/iram.bin");
            p->prg.size_text = buf_iram->size() + SIZE_STACK;
            p->prg.size_data = buf_wram->size();
            fprintf(stdout, "text section size is %x\n", p->prg.size_text);
            if (p->prg.size_text > 0x80002388 - 0x80000000)
                fprintf(stderr, "Warning !! text section is to big (%x)\n",
                        p->prg.size_text);
            if (p->prg.size_data >= INODE_BLOCK ||
                p->prg.size_text > INODE_BLOCK)
                p->state = def::STATE::FAILED;

            p->prg.inode_data = inode::write_content_inode(buf_wram, p->prg.size_data - SIZE_STACK, dpu_manager->dpu);
            delete buf_wram;
            p->prg.inode_text = inode::write_content_inode(buf_iram, p->prg.size_text, dpu_manager->dpu);
            delete buf_iram;
            int first_inode = inode::alloc_inode(dpu_manager->dpu);
            dpu_manager->inode_table[first_inode][0][0] = p->prg.inode_text;
            u_int16_t inode_table[4][2];
            def::dpu_copy_from_wram(dpu_manager->dpu, inode_table, def::inode_table_address+event->index*sizeof(inode_table), sizeof(inode_table)); 
            // 处设计地址
            inode_table[0][0] = first_inode; // 额外inode
            inode_table[0][1] = 1;
            def::dpu_copy_to_wram(dpu_manager->dpu, def::inode_table_address+event->index*sizeof(inode_table),inode_table, sizeof(inode_table));

            dpu_manager->load_processes.push_back(event);
        }

        dpu_manager->unload_processes.clear();
    }

    void K1::set_timer()
    {
        timer_ = cycle_;
    }
    void K1::init_mram()
    { // 主要是初始化jmp+bit_map+inod_table+dpu_id+inode_table的值
        // load the event
        std::string bin_filepath = bindir_ + "/" + "kernel" + "/mram"
                                                              ".bin";
        // 遍历dpu然后写入
        for (auto &dpu : rank_->dpus())
        {
            auto byte_stream = new encoder::ByteStream(bin_filepath);
            dpu->dma()->transfer_to_mram(util::ConfigLoader::mram_offset(), byte_stream);
            delete byte_stream;
        }
    }
    void K1::init_K2andK3()
    {
        std::string wram_filepath = bindir_ + "/" + "kernel" + "/" + "wram" +
                                    ".bin";
        std::string iram_filepath = bindir_ + "/" + "kernel" + "/" + "iram" +
                                    ".bin";
        std::string pointer_filepath = bindir_ + "/" + "kernel" + "/" + "pointer" +
                                    ".bin";
        auto byte_stream = new encoder::ByteStream(wram_filepath);
        auto byte_stream2 = new encoder::ByteStream(iram_filepath);
        assert(byte_stream->size() < util::ConfigLoader::wram_size() - util::ConfigLoader::wram_K2andK2_offset());
        assert(byte_stream2->size() < util::ConfigLoader::iram_size() - util::ConfigLoader::iram_K2andK2_offset());

        for (auto &dpu : rank_->dpus())
        {
            dpu->dma()->transfer_to_wram(util::ConfigLoader::wram_K2andK2_offset()+util::ConfigLoader::wram_offset(), byte_stream);
            dpu->dma()->transfer_to_iram(util::ConfigLoader::iram_K2andK2_offset()+util::ConfigLoader::iram_offset(), byte_stream2);
        }
        delete byte_stream;
        delete byte_stream2;
        std::string line;
        std::ifstream file(pointer_filepath);
        std::getline(file, line);
        def::dpu_id_address = std::stoul(line);
        std::cout << "address for dpu_id" << def::dpu_id_address << std::endl;
        std::getline(file, line);
        def::processs_address = std::stoul(line);
        std::cout << "address for process" << def::processs_address << std::endl;
        std::getline(file, line);
        def::inode_table_address = std::stoul(line);
        std::cout << "address for inode_table" << def::inode_table_address << std::endl;
    }
    void K1::parse_new_socket(def::DpuManager *dpu_manager)
    {
        for (int i = 0; i < MAX_PRG; i++)
        {
            def::process_host *p = dpu_manager->processes[i];
            for (int j = 0; j < MAX_SD; j++)
            {

                if (p->sd[j].inode != 0 && p->sd[j].flags & NEW_SOCKET)
                {
                    dpu_manager->dpu_flag->dpu_process_change = 1;
                    p->sd[j].flags &= ~SOCKET_NEW;
                    struct socket::socket_info si;
                    uint32_t inode = p->sd[j].inode;
                    uint32_t penpal[2] = {0, 0}; // 0表示是host,1表示是dpu
                    inode::read_inode(dpu_manager, inode, &penpal, sizeof(penpal), sizeof(si));
                    if (penpal[0] == 0)
                    {
                        struct socket::socket_connection *sc = socket::find_free_socket_connection_or_alloc(nb_so, sockets_connection);
                        sc->dpu_id = dpu_manager->dpu_id;
                        sc->penpal_is_host = 1;
                        sc->pid = p->pid;
                        sc->sd = j;
                        sc->penpal_sc_idx = -1;
                        sc->inode = inode;
                        sc->penpal_pid = 0;
                        continue;
                    }
                    else
                    {
                        char found = 0;
                        struct def::process_host *p_penpal_ = nullptr;
                        for (auto &p_penpal : all_processes)
                        {
                            if (p_penpal->app_id == p->app_id && p_penpal->role == penpal[0])
                            {
                                found = 1;
                                p_penpal_ = p_penpal;
                                break;
                            }
                        }
                        if (!found)
                        {

                            p->sd[j].flags |= SOCKET_FAIL;
                        }
                        struct socket::socket_connection *sc = socket::find_free_socket_connection_or_alloc(nb_so, sockets_connection);
                        sc->dpu_id = dpu_manager->dpu_id;
                        sc->penpal_is_host = 0;
                        sc->pid = p->pid;
                        sc->inode = inode;
                        sc->sd = j;
                        sc->penpal_sc_idx = -1;
                        sc->penpal_pid = p_penpal_->pid;

                        for (unsigned int k = 0; k < nb_so; k++)
                        {
                            if (sockets_connection[k].pid == p_penpal_->pid &&
                                sockets_connection[k].penpal_pid == p->pid)
                            {
                                sc->penpal_sc_idx = k;
                                sockets_connection[k].penpal_sc_idx = sc->idx;
                                break;
                            }
                        }
                        continue;
                    }
                }
            }
        }
        return;
    }
    void K1::transfert_socket(def::DpuManager *dpu_manager)
    {
        uint8_t same = 0;
        if (dpu_manager->dpu_flag->write_socket)
        {
            socket::transfert_from_api(dpu_manager, nb_so, sockets_connection);
        }
        for (auto &process : dpu_manager->processes)
        {
            for (unsigned int j = 0; j < MAX_SD; j++)
            {
                if (process->sd[j].flags & SOCKET_W && process->sd[j].inode != 0)
                {
                    dpu_manager->dpu_flag->dpu_process_change = 1;
                    process->sd[j].flags &= ~SOCKET_W;
                    char found_sockets_connections = 0;

                    for (unsigned int k = 0; k < nb_so; k++)
                    {
                        if (sockets_connection[k].pid == process->pid &&
                            sockets_connection[k].sd == j)
                        {
                            struct socket::socket_info si;
                            inode::read_inode(dpu_manager, process->sd[j].inode, &si, sizeof(si), 0);
                            uint32_t size_8align = (si.w / 8 + 1) * 8;
                            uint32_t size = si.w;
                            void *buf;
                            if (sockets_connection[k].penpal_is_host)
                            {
                                buf = malloc(size_8align);
                                assert(buf != NULL);
                                inode::read_inode(dpu_manager, process->sd[j].inode, buf, size_8align,
                                                  sizeof(si) + SIZE_SOCKET);
                                // socket_send_to_main
                            }
                            else
                            {
                                struct socket::socket_connection *sc = &sockets_connection[k], *sc_p;
                                if (sc->penpal_pid == 0 || sc->penpal_sc_idx == -1)
                                {
                                    assert(0);
                                    break;
                                }
                                sc_p = &sockets_connection[sc->penpal_sc_idx];
                                same = sc_p->pid == sc->pid;
                                struct socket::socket_info si_penpal;
                                inode::read_inode(dpu_managers_[sc_p->dpu_id], sc_p->inode,
                                                  &si_penpal, sizeof(si_penpal), 0);

                                uint8_t revolution = si_penpal.rr < si_penpal.rw;
                                uint32_t place_left =
                                    (!revolution) ? si_penpal.rr - si_penpal.rw
                                                  : SIZE_SOCKET - si_penpal.rr + si_penpal.rw;

                                place_left = (place_left) ? place_left - 1 : SIZE_SOCKET - 1;
                                assert(place_left >= size);
                                uint8_t nb_byte_begin_of_read_buffer = si_penpal.rw % 8;
                                uint8_t nb_byte_end_of_read_buffer = si_penpal.rr % 8;

                                buf = malloc(size_8align + nb_byte_begin_of_read_buffer +
                                             nb_byte_end_of_read_buffer); // more byte to read
                                assert(buf != NULL);
                                if (nb_byte_begin_of_read_buffer)
                                    inode::read_inode(dpu_managers_[sc_p->dpu_id], sc_p->inode, buf, 8,
                                                      sizeof(si) + si_penpal.rw - si_penpal.rw % 8);
                                inode::read_inode(dpu_manager, process->sd[j].inode, buf + nb_byte_begin_of_read_buffer,
                                                  size_8align, sizeof(si) + SIZE_SOCKET);
                                if (nb_byte_end_of_read_buffer)
                                    inode::read_inode(dpu_managers_[sc_p->dpu_id], sc_p->inode,
                                                      buf + nb_byte_begin_of_read_buffer + size, 8,
                                                      sizeof(si) + si_penpal.rr - si_penpal.rr % 8);

                                if (revolution)
                                {
                                    // TODO("text_todo");
                                }
                                else
                                {

                                    inode::write_inode(dpu_managers_[sc_p->dpu_id], sc_p->inode, buf,
                                                       (size / 8 + 1) * 8,
                                                       sizeof(si) + si_penpal.rw - si_penpal.rw % 8);
                                }

                                si_penpal.rw = si_penpal.rw + size % SIZE_SOCKET;
                                inode::write_inode(dpu_managers_[sc_p->dpu_id], sc_p->inode,
                                                   &si_penpal, sizeof(si_penpal), 0);

                                uint8_t found = 0;
                                def::process_host *p_penpal_ = nullptr;
                                for (auto &p_penpal : dpu_managers_[sc_p->dpu_id]->processes)
                                {
                                    if (p_penpal->pid == sc_p->pid)
                                    {
                                        p_penpal_ = p_penpal;
                                        found = 1;
                                        break;
                                    }
                                }
                                assert(found);
                                p_penpal_->sd[sc_p->sd].flags |= SOCKET_UPDATE;
                                dpu_managers_[sc_p->dpu_id]->dpu_flag->dpu_process_change = 1;
                                set_flags(dpu_managers_[sc_p->dpu_id], SOCKET_UPDATE);
                                if (same)
                                { // the sender and the receiver is the same fProc, so
                                  // do not overwrite the previous value of rr and rw
                                    si = si_penpal;
                                }
                            }
                            si.w = 0;
                            free(buf);
                            inode::write_inode(dpu_manager, process->sd[j].inode, &si, sizeof(si), 0);
                            process->sd[j].flags |= SOCKET_UPDATE;
                            set_flags(dpu_manager, SOCKET_UPDATE);
                            dpu_manager->dpu_flag->dpu_process_change = 1;
                            found_sockets_connections = 1;
                            break;
                        }
                    }
                    assert(found_sockets_connections);
                }
            }
        }
    }
    void K1::write_inode_data(def::DpuManager *dpu_manager)
    {
        dpu_manager->dpu_flag->write_inode = 0; // set flag
        for (unsigned int i = 0; i < dpu_manager->write_inode->nb_data; i++)
        {
            if (dpu_manager->write_inode->data[i]->pid == 0)
            {
                continue;
            }
            if (dpu_manager->write_inode->data[i]->prc_ix == MAX_PRG)
            {
                for (int j = 0; j < MAX_PRG; j++)
                {
                    assert(MAX_PRG == dpu_manager->processes.size());
                    if (dpu_manager->processes[j] == nullptr)
                    {
                        continue;
                    }
                    if (dpu_manager->processes[j]->pid == dpu_manager->write_inode->data[i]->pid)
                    {
                        // struct process_host *p = &di->dpu_process_tab[j];
                        dpu_manager->write_inode->data[i]->prc_ix = j;
                    }
                    // 不然就是找不到对应的进程
                    assert(dpu_manager->write_inode->data[i]->prc_ix != MAX_PRG);
                }
            }

            void *buf = malloc(dpu_manager->write_inode->data[i]->buf->size());
            for (int j = 0; j < dpu_manager->write_inode->data[i]->buf->size(); j++)
            {
                ((char *)buf)[j] = dpu_manager->write_inode->data[i]->buf->byte(j);
            }

            assert(inode::write_chained_inode(dpu_manager, dpu_manager->write_inode->data[i]->prc_ix, buf, dpu_manager->write_inode->data[i]->size, dpu_manager->write_inode->data[i]->offset) == 0);
            free(buf);
            dpu_manager->write_inode->data[i]->pid = 0;
            dpu_manager->write_inode->data[i]->prc_ix = MAX_PRG;
        }
        return;
    }
    void K1::read_inode_data(def::DpuManager *dpu_manager)
    {
        dpu_manager->dpu_flag->read_inode = 0; // set flag
        for (unsigned int i = 0;
             i < dpu_manager->read_inode->nb_data && dpu_manager->read_inode->data[i]->pid != 0; i++)
        {
            for (int j = 0; j < MAX_PRG; j++)
            {
                assert(MAX_PRG == dpu_manager->processes.size());
                if (dpu_manager->read_inode->data[i]->pid != 0 &&
                    dpu_manager->processes[j]->pid == dpu_manager->read_inode->data[i]->pid)
                {
                    dpu_manager->read_inode->data[i]->pid = 0;
                    struct def::process_host *p = dpu_manager->processes[j];
                    uint8_t *buf = (uint8_t *)(dpu_manager->read_inode->data[i]->size);
                    assert(!(inode::read_chained_inode(dpu_manager, j, buf,
                                                       dpu_manager->read_inode->data[i]->size,
                                                       dpu_manager->read_inode->data[i]->offset) < 0));
                    // 把buf的数据读到dpu_manager->read_inode->data[i]->path的文件中
                    FILE *fp = fopen(dpu_manager->read_inode->data[i]->path.c_str(), "wb");
                    if (fp == NULL)
                    {
                        fprintf(stderr, "Error opening file %s\n", dpu_manager->read_inode->data[i]->path.c_str());
                        assert(0);
                    }
                    fwrite(buf, 1, dpu_manager->read_inode->data[i]->size, fp);
                    fclose(fp);
                    free(buf);
                }
            }
        }
        return;
    }
    void K1::parse_end_process(def::DpuManager *dpu_manager)
    {
        int ret = -1;

        for (int i = 0; i < MAX_PRG; i++)
            if (dpu_manager->processes[i]->state == def::STATE::FINISHED)
            {
                struct def::process_host *p = dpu_manager->processes[i];

                // bench_stop_timer(1);   //benchmarck uncomment to see the time of a proc
                printf("#%u#Process %i(%i) finish with %i value \n", dpu_manager->dpu_id, p->pid,
                       p->app_id, (int32_t)p->end_value);

                ret = 0;
                uint32_t pid = p->pid;
                p->state = def::STATE::NONE;
                auto it = std::remove_if(dpu_manager->launch_processes.begin(), dpu_manager->launch_processes.end(),
                                         [pid](def::ProcessEvent *event)
                                         { return event->process->pid == pid; }); // 从已经启动的进程中删除
                p->pid = 0;
                dpu_manager->processes[i] = nullptr; // 清空
                dpu_manager->dpu_flag->dpu_process_change = 1;
                dpu_manager->process_table[i] = 0;

                inode::free_inode(dpu_manager, p->prg.inode_text);
                inode::free_inode(dpu_manager, p->prg.inode_data);
                inode::free_chained_inode(dpu_manager, i);
                for (unsigned int j = 0; j < MAX_SD; j++)
                    if (p->sd[j].inode > 1)
                    {
                        inode::free_inode(dpu_manager, p->sd[j].inode);
                        p->sd[j].inode = 0;
                    }
            }

        return;
    }

    K1::~K1()
    {
        for (auto &event : events_)
        { //&代表取引用,不同的意义
            delete event->buf;
            delete event;
        }
        for (auto &process : all_processes)
        {
            delete process->sd;
            delete process;
        }
        // 按nb_so删除sockets_connection
        for (int i = nb_so; i < nb_so; i--)
        {
            delete &sockets_connection[i];
        }

        // 删除dpu_manager
        for (auto &dpu_manager : dpu_managers_)
        {
            for (auto &process : dpu_manager->processes)
            {

                delete process->sd;
                delete process;
            }

            for (auto &process : dpu_manager->unload_processes)
            {

                delete process->event;
                delete process->process->sd;
                delete process->process;
                delete process;
            }
            for (auto &process : dpu_manager->load_processes)
            {
                delete process->event;
                delete process->process->sd;
                delete process->process;
                delete process;
            }
            for (auto &process : dpu_manager->unlaunch_processes)
            {
                delete process->event;
                delete process->process->sd;
                delete process->process;
                delete process;
            }
            for (auto &process : dpu_manager->launch_processes)
            {
                delete process->event;
                delete process->process->sd;
                delete process->process;
                delete process;
            }
            for (auto &d : dpu_manager->write_socket->data)
            {
                delete d->buf;
                delete d;
            }
            for (auto &d : dpu_manager->write_inode->data)
            {
                delete d->buf;
                delete d;
            }
            for (auto &d : dpu_manager->read_inode->data)
            {
                delete d->buf;
                delete d;
            }
            delete dpu_manager->write_socket;
            delete dpu_manager->write_inode;
            delete dpu_manager->read_inode;
            delete dpu_manager->dpu_flag;
            delete dpu_manager->dpu;
            delete dpu_manager;
        }
    }
}