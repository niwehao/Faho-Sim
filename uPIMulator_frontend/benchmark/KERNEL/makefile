LIB := dpu/
NR_TASKLETS ?=16



# 目标汇编文件定义
K_ASM := dpu_code.S 
K_C := kernel.c

KERNEL_STACK_SIZE=256
REUSED_STACK_FTHREAD?=1

DPU_KERNEL_FLAG := -Wall -Wextra -Werror  -fverbose-asm  -fdata-sections -DNR_TASKLETS=${NR_TASKLETS} -DSTACK_SIZE_DEFAULT=${KERNEL_STACK_SIZE} -DREUSED_STACK_FTHREAD=${REUSED_STACK_FTHREAD}

all : ${K_ASM} 


${K_ASM} : 
	dpu-upmem-dpurte-clang -S -g0 -O2 ${DPU_KERNEL_FLAG} -o $@ ${K_C}


clean:
	rm -rf ${K_ASM}