#ifndef UPMEM_SIM_ABI_ISA_REG_SP_REG_H_
#define UPMEM_SIM_ABI_ISA_REG_SP_REG_H_

namespace upmem_sim::abi::reg {

enum SPReg { ZERO, ONE, LNEG, MNEG, ID, ID2, ID4, ID8 };
}

#endif/**
 ZERO,  // 零寄存器，永远保存值0
    ONE,   // 常数1寄存器，永远保存值1
    LNEG,  // 逻辑非寄存器，保存逻辑非结果
    MNEG,  // 数值取反寄存器，保存数值取反结果
    ID,    // 线程ID寄存器，保存当前线程的ID
    ID2,   // 线程ID*2寄存器，保存当前线程ID的2倍
    ID4,   // 线程ID*4寄存器，保存当前线程ID的4倍
    ID8    // 线程ID*8寄存器，保存当前线程ID的8倍 */
