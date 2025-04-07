#include "pair_reg.h"

#include <cassert>

namespace upmem_sim::abi::reg {

PairReg::PairReg(RegIndex index) {
  assert(index % 2 == 0);//对于偶数寄存器来说,偶数寄存器和奇数寄存器是成对出现的,所以index必须为偶数,自动匹配对应的两个寄存器

  even_reg_ = new GPReg(index);
  odd_reg_ = new GPReg(index + 1);
}

PairReg::~PairReg() {
  delete even_reg_;
  delete odd_reg_;
}

}  // namespace upmem_sim::abi::reg
