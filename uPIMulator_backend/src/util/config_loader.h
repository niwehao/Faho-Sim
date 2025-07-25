#ifndef UPMEM_SIM_UTIL_CONFIG_LOADER_H_
#define UPMEM_SIM_UTIL_CONFIG_LOADER_H_

#include "main.h"
//配置的基本变量

namespace upmem_sim::util {

class ConfigLoader {
 public:
  static int atomic_address_width() { return 32; }
  static int atomic_data_width() { return 32; }
  static Address atomic_offset() { return 0; }
  static Address atomic_size() { return 256; }

  static int iram_address_width() { return 32; }
  static int iram_data_width() { return 96; }
    static int iram_data_width_align_bytes() { return 16; }
  static Address iram_offset() { return 384 * 1024; }//对于iram的基地址的偏移,mram和iram在同一片物理地址中
  static Address iram_size() { return 252 * 1024; }//代表可以接受的指令的总数

  static int wram_address_width() { return 32; }
  static int wram_data_width() { return 32; }
  static Address wram_offset() { return 512; }
  static Address wram_size() { return 256 * 1024; }
  static Address wram_kernel_offset() { return 128 * 1024; }//8k
  static Address iram_kernel_offset() { return 144* 1024; }//16k
  

  static Address stack_size() { return 512; }
  static Address heap_size() { return 4 * 1024; }

  static int mram_address_width() { return 32; }
  static int mram_data_width() { return 32; }
  static Address mram_offset() { return 636 * 1024; }
  static Address mram_size() { return 64 * 1024 * 1024; }

  static int num_gp_registers() { return 27; }
  static int max_num_tasklets() { return 24; }
  static int min_access_granularity() { return 8; }/**
  最小访问粒度
  最小访问粒度决定了 DRAM 访问的最小单位。
  例如，如果最小访问粒度为 8 字节，则 DRAM 访问的最小单位为 8 字节。
  如果最小访问粒度为 32 字节，则 DRAM 访问的最小单位为 32 字节。
  最小访问粒度越小，DRAM 访问的效率越高，但同时也会增加访问的延迟。16
  
   */
};

}  // namespace upmem_sim::util

#endif
