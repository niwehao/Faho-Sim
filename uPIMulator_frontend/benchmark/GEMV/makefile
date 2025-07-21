LIB := dpu/
NR_FTHREAD ?= 16
BL ?= 11
NR_DPUS ?= 1 
TYPE ?= INT32
# 目标汇编文件定义
K_ASM := dpu_code.S 
K_C := main.c

COMMON_INCLUDES := support
COMMON_FLAGS := -w -I${COMMON_INCLUDES}
DPU_KERNEL_FLAG := -Wall -Wextra -Werror  ${COMMON_FLAGS} -fverbose-asm  -fdata-sections -DNR_FTHREAD=${NR_FTHREAD} -D${TYPE}  -DBL=${BL}

all : ${K_ASM} 


${K_ASM} : 
	dpu-upmem-dpurte-clang  -ffunction-sections -S -g0 -O2 ${DPU_KERNEL_FLAG} -o $@ ${K_C}


clean:
	rm -rf ${K_ASM}