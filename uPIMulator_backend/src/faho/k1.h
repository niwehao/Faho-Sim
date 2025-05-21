#ifndef PMEM_SIM_SIMULATOR__FAHO_K1_H_
#define PMEM_SIM_SIMULATOR__FAHO_K1_H_
#include <stdio.h>
#include <iostream>
#include <string>
#include "simulator/rank/rank.h"
#include <filesystem>
#include <fstream>
#include <sstream>
#include "faho/def.h"
#include "faho/inode.h"
#include "faho/socket.h"

using namespace std;
namespace upmem_sim::simulator::faho::k1
{
    class K1
    {
    public:
        K1();
        ~K1();
        void init();
        void cycle();
        encoder::ByteStream *load_bin(def::ProcessEvent *event, std::string file);
        int get_inode();
        void init_K2andK3();
        void init_mram();
        void init_event();
        void read_process(def::DpuManager *dpu_manager);
        void write_process(def::DpuManager *dpu_manager);
        void read_inode_data(def::DpuManager *dpu_manager);
        void write_inode_data(def::DpuManager *dpu_manager);
        def::Event *get_event(int time);
        void set_timer();
        void connect_rank(rank::Rank *rank);
        void init_dpu_manager();
        void spread_to_dpu(def::Event *event);
        void launch_event(def::DpuManager *dpu_manager);
        void load_event(def::DpuManager *dpu_manager);
        void transfert_socket(def::DpuManager *dpu_manager); //传递新进程
        void parse_new_socket(def::DpuManager *dpu_manager); //获取新进程
        void launch_event_handle_evt(def::Event *event);
        void socket_write_handle_evt(def::Event *event);
        void write_inode_handle_evt(def::Event *event);
        void read_inode_handle_evt(def::Event *event);
        void parse_end_process(def::DpuManager *dpu_manager) ;


  
        

    private:
        std::string bindir_;
        int cycle_ = 0;
        int timer_ = 0;
        rank::Rank *rank_;
        std::vector<def::Event *> events_;
        std::vector<def::DpuManager *> dpu_managers_;//在inode::read_inode(dpu_managers_[sc_p->dpu_id], sc_p->inode,要求顺序与初始化顺序必须一致
        struct socket::socket_connection *sockets_connection;
        uint32_t nb_so = 0;
        int all_num_process=0;
        std::vector<struct def::process_host *> all_processes;
    };

} // namespace upmem_sim::simulator::faho::k1
#endif