#include "simulator/reg/reg_file.h"

#include <stdexcept>
#include <tuple>

namespace upmem_sim::simulator::reg
{

  RegFile::RegFile(ThreadID id, std::string benchmark, std::string bindir)
      : sp_reg_(new SPReg(id)),             // sp寄存器
        pc_reg_(new PCReg()),               // pc寄存器
        condition_reg_(new ConditionReg()), // 条件寄存器
        flag_reg_(new FlagReg()),           // 标志寄存器
        exception_reg_(new ExceptionReg())
  {                                                                          // 异常寄存器
    for (RegIndex index = 0; index < util::ConfigLoader::num_gp_registers(); // 通用寄存器
         index++)
    {

      gp_regs_.push_back(new GPReg(index)); // 通用寄存器
    }
    std::ifstream file(bindir + "KERNEL.16/iram_labels.bin");
    std::string line;
    int time_ = 0;
    std::string name_;

    if (file.is_open())
    {
      while (std::getline(file, line))
      {
        std::istringstream iss(line);
        iss >> time_ >> name_;
        // 如果name里包含_begin或者_end则跳过
        if (name_.find("_begin") != std::string::npos || name_.find("_end") != std::string::npos)
        {
          continue;
        }
        time_table_.push_back(new timetable(time_, name_)); // 时间表
      }
      file.close();
    }
    else
    {
      std::cout << "无法打开文件" << std::endl;
    }
    file.close();
    std::ifstream file_b(bindir + benchmark + ".16/iram_labels.bin");

    if (file_b.is_open())
    {
      while (std::getline(file_b, line))
      {
        std::istringstream iss(line);
        iss >> time_ >> name_;
        if (name_.find("_begin") != std::string::npos || name_.find("_end") != std::string::npos)
        {
          continue;
        }
        time_table_helloworld.push_back(new timetable(time_, name_)); // 时间表
      }
      file_b.close();
    }
    else
    {
      std::cout << "无法打开文件" << std::endl;
    }
  }
  /**
   * 这个RegFile类是DPU模拟器中的关键组件：
  管理所有类型的寄存器
  提供统一的访问接口
  支持复杂的寄存器操作
  维护处理器的状态信息
  确保数据的正确表示和存储
   */

  RegFile::~RegFile()
  {
    for (RegIndex index = 0; index < util::ConfigLoader::num_gp_registers();
         index++)
    {
      delete gp_regs_[index];
    }
    delete sp_reg_;
    for (auto &timetable : time_table_)
    {
      delete timetable;
    }
    for (auto &timetable : time_table_helloworld)
    {
      delete timetable;
    }
    delete pc_reg_;
    delete condition_reg_;
    delete flag_reg_;
    delete exception_reg_;
  }

  std::tuple<int64_t, int64_t> RegFile::read_pair_reg(
      abi::reg::PairReg *pair_reg, abi::word::Representation representation)
  { // 读取pair寄存器
    int64_t even = read_gp_reg(pair_reg->even_reg(), representation);
    int64_t odd = read_gp_reg(pair_reg->odd_reg(), abi::word::UNSIGNED);
    return {even, odd};
  }

  int64_t RegFile::read_src_reg(abi::reg::SrcReg *src_reg,
                                abi::word::Representation representation)
  { // 读取源寄存器
    if (src_reg->is_gp_reg())
    {
      return read_gp_reg(src_reg->gp_reg(), representation);
    }
    else
    {
      return read_sp_reg(*src_reg->sp_reg(), representation);
    }
  }

  void RegFile::write_pair_reg(abi::reg::PairReg *pair_reg, int64_t even,
                               int64_t odd)
  { // 写入pair寄存器
    write_gp_reg(pair_reg->even_reg(), even);
    write_gp_reg(pair_reg->odd_reg(), odd);
  }

} // namespace upmem_sim::simulator::reg
