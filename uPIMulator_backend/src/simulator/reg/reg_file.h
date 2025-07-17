#ifndef UPMEM_SIM_SIMULATOR_REG_REG_FILE_H_
#define UPMEM_SIM_SIMULATOR_REG_REG_FILE_H_

#include "abi/reg/pair_reg.h"
#include "abi/reg/src_reg.h"
#include "simulator/reg/condition_reg.h"
#include "simulator/reg/exception_reg.h"
#include "simulator/reg/flag_reg.h"
#include "simulator/reg/gp_reg.h"
#include "simulator/reg/pc_reg.h"
#include "simulator/reg/sp_reg.h"
#include <fstream>
#include <iostream>
#include <vector>
#include <filesystem>
#include <fstream>
#include <sstream>

namespace upmem_sim::simulator::reg
{
  class timetable
  {
  public:
    int time;
    std::string name;
    timetable(int time, std::string name) : time(time), name(name) {}
  };
  class RegFile
  {
  public:
    explicit RegFile(ThreadID id,std::string benchmark,std::string bindir);
    ~RegFile();

    int64_t read_gp_reg(abi::reg::GPReg *gp_reg,
                        abi::word::Representation representation)
    {
      return gp_regs_[gp_reg->index()]->read(representation);
    }
    int64_t read_gp_reg(int index)
    {
      return gp_regs_[index]->read(abi::word::UNSIGNED);
    }
    int64_t read_sp_reg(abi::reg::SPReg sp_reg,
                        abi::word::Representation representation)
    {
      return sp_reg_->read(sp_reg, representation);
    }
    std::tuple<int64_t, int64_t> read_pair_reg(
        abi::reg::PairReg *pair_reg, abi::word::Representation representation);
    int64_t read_src_reg(abi::reg::SrcReg *src_reg,
                         abi::word::Representation representation);

    int64_t read_pc_reg() { return pc_reg_->read(); }
    bool condition(abi::isa::Condition condition)
    {
      return condition_reg_->condition(condition);
    }
    bool flag(abi::isa::Flag flag) { return flag_reg_->flag(flag); }
    bool exception(abi::isa::Exception exception)
    {
      return exception_reg_->exception(exception);
    }

    void write_gp_reg(abi::reg::GPReg *gp_reg, int64_t value)
    {
      // if(gp_reg->index() == 15)
      // {
      //   std::cout << "Thread id: " << sp_reg_->thread_id << "  ";
      //   std::cout << "write gp_reg 15 value: " << value << std::endl;
      // }
      // if (gp_reg->index() == 1)
      // {
      //    std::cout << "Thread id: " << sp_reg_->thread_id << "  ";
      //   std::cout << "write gp_reg 1 value: " << value << std::endl;
      // }

      // if (gp_reg->index() == 2)
      // {
      //   std::cout << "write gp_reg 2 value: " << value << std::endl;
      // }
      // if (gp_reg->index() == 3)
      // {
      //   std::cout << "write gp_reg 3 value: " << value << std::endl;
      // }
      if (gp_reg->index() == 22)
      {
        bool user_flag=(value< util::ConfigLoader::wram_offset() + util::ConfigLoader::wram_kernel_offset());
        bool kernel_flag=(value >= sp_reg_->thread_id * 512 + 136063 && value < sp_reg_->thread_id * 512 + 136063 + 512);
        //std::cout << "write gp_reg 22 value: " << value << std::endl;  
        assert(user_flag || kernel_flag); // 22号寄存器只能是用户态或系统态的栈地址   

      }
      // if (gp_reg->index() == 23)
      // {
      //   std::cout << "write gp_reg 23 value: " << value << std::endl;
      // }
      gp_regs_[gp_reg->index()]->write(value);
    }
    void write_pair_reg(abi::reg::PairReg *pair_reg, int64_t even, int64_t odd);
    void print_jump(int value)
    {
      timetable *timetable_p = nullptr;
      int found = 0;
      if (value < util::ConfigLoader::iram_offset() + util::ConfigLoader::iram_kernel_offset())
      { // 用户态debug
        state = 1;
        std::cout << "Thread id: " << sp_reg_->thread_id << "  ";
        for (auto &timetable_n : time_table_helloworld)
        {
          if (value == 393216)
          {
            std::cout << "*** jmp to 0x0" << std::endl;
            found = 1;
            break;
          }
          if (timetable_n->time == value)
          {
            // if (timetable_n->name == ".LBB25_2" || timetable_n->name == "text.wakeup" || timetable_n->name == "wakeup")
            // {
            //   std::cout << "*** break point" << std::endl;
            // }
            std::cout << "*** jmp to user: " << timetable_n->name << std::endl;
            found = 1;
            break;
          }
          else if (timetable_n->time > value)
          {
            assert(timetable_p != nullptr);

            assert((value - timetable_p->time) % 12 == 0);

            std::cout << "*** jmp to user: " << timetable_p->name << "+" << (value - timetable_p->time) / 12 << std::endl;

            found = 1;
            break;
          }
          timetable_p = timetable_n;
        }
        if (!found)
        {
          // 找到timetable_最后一项
          std::cout << "  *** jmp to user: " << timetable_p->name << "+" << (value - timetable_p->time) / 12 << std::endl;
        }
      }
      else
      { // 系统态debug
 
        state = 0;
        std::cout << "Thread id: " << sp_reg_->thread_id << "  ";
        for (auto &timetable_n : time_table_)
        {
          if (value == 542100)
          {
            std::cout << "*** jmp to syscall" << std::endl;
            found = 1;
            break;
          }
          if (timetable_n->time == value)
          {
            std::cout << "*** jmp to kernel: " << timetable_n->name << std::endl;
            // if(timetable_n->name == ".LBB40_2") {
            //   std::cout << "*** .LBB40_2" << std::endl;
            //   return;
            // }
            found = 1;
            break;
          }
          else if (timetable_n->time > value)
          {
            assert(timetable_p != nullptr);

            assert((value - timetable_p->time) % 12 == 0);
            found = 1;
            std::cout << "*** jmp to kernel: " << timetable_p->name << "+" << (value - timetable_p->time) / 12 << std::endl;
            break;
          }
          timetable_p = timetable_n;
        }
      }
      if (!found)
      {
        // 找到timetable_最后一项
        std::cout << "  *** jmp to kernel: " << timetable_p->name << "+" << (value - timetable_p->time) / 12 << std::endl;
      }
    }
    void write_pc_reg(int64_t value)
    {
      //print_jump(value);
      pc_reg_->write(value);
    }
    void increment_pc_reg()
    {

      pc_reg_->increment();
      int64_t pc_value = pc_reg_->read();
     //print_jump(pc_value);
      // if(pc_reg_->read()  == 570432+12) {
      //   std::cout << "pc_reg increment to: " << pc_reg_->read() << std::endl;
      // }
    }

    void set_condition(abi::isa::Condition condition)
    {
      condition_reg_->set_condition(condition);
    }
    void clear_condition(abi::isa::Condition condition)
    {
      condition_reg_->clear_condition(condition);
    }
    void clear_conditions() { condition_reg_->clear_conditions(); }

    void set_flag(abi::isa::Flag flag) { flag_reg_->set_flag(flag); }
    void clear_flag(abi::isa::Flag flag) { flag_reg_->clear_flag(flag); }

    void set_exception(abi::isa::Exception exception)
    {
      exception_reg_->set_exception(exception);
    }
    void clear_exception(abi::isa::Exception exception)
    {
      exception_reg_->clear_exception(exception);
    }

    void cycle() = delete;

  private:
    std::vector<GPReg *> gp_regs_; // 普通寄存器 24个
    SPReg *sp_reg_;                // 特殊寄存器
    PCReg *pc_reg_;
    std::vector<timetable *> time_table_; // 时间表
    std::vector<timetable *> time_table_helloworld;
    ConditionReg *condition_reg_; // 条件位
    FlagReg *flag_reg_;           // zero & carry
    ExceptionReg *exception_reg_; // 处理异常
    int state = 0;
  };

} // namespace upmem_sim::simulator::reg

#endif
