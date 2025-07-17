#ifndef PMEM_SIM_SIMULATOR__FAHO_K1_H_
#define PMEM_SIM_SIMULATOR__FAHO_K1_H_
#include <stdio.h>
#include <iostream>
#include <string>
#include "faho/def.h"
#include "simulator/rank/rank.h"
#include <filesystem>
#include <fstream>
#include <sstream>

namespace upmem_sim::simulator::faho::k1
{
    class K1
    {
    public:
        K1(std::string bindir, std::string benchmark, std::string app, int num_tasklets,rank::Rank *rank_,int data_prep);
        ~K1();
        void init();
        void cycle();
        int get_inode();
    
        void init_mram();
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
        void check_handle_evt(def::Event *event);
        void parse_end_process(def::DpuManager *dpu_manager) ;
        void update_bit_map(encoder::ByteStream* syscall, uint32_t inode_maxe) ;
        void check_atomic(encoder::ByteStream *buf);
        void socket_send_to_main(uint32_t app_id, uint32_t pid, void *buf,uint32_t size);
        //void read_jobs(def::DpuManager *dpu_manager);
        struct def::socket_connection *find_free_socket_connection_or_alloc();
        int check_dpu_stop();
        void api_retrieve();
    private:
        std::string bindir_;
        int cycle_ = 0;
        int inode_num_initialization=2;
        int timer_ = 0;
        int rank_state=0;
        rank::Rank *rank_;
        def::Host *host_; 
        std::vector<def::DpuManager *> dpu_managers_;//在inode::read_inode(dpu_managers_[sc_p->dpu_id], sc_p->inode,要求顺序与初始化顺序必须一致
        int all_num_process=0;
        std::vector<struct def::process_host *> all_processes;
        std::string benchmark_;
        int num_tasklets_ = 0; // 任务数
        encoder::ByteStream *syscall;
        std::vector<def::Event *> events_; // 存储事件  
        //读取job 状态
    };

} // namespace upmem_sim::simulator::faho::k1
#endif