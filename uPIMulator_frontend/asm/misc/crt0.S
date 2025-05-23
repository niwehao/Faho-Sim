	.text
	.file	"crt0.c"
	.section	.text.__bootstrap,"ax",@progbits
	.globl	__bootstrap                     // -- Begin function __bootstrap
	.type	__bootstrap,@function
__bootstrap:                            // @__bootstrap
.Lfunc_begin0:
// %bb.0:
	// inline asm
	jnz id, __sys_start_thread

	sd zero, __stdout_buffer_state, 0
	move r23, __atomic_end_addr
__sys_atomic_bit_clear:
	jeq r23, __atomic_used_addr, __sys_start_thread
.Ltmp0:
	release r23, 0, nz, .Ltmp0+1
	add r23, r23, -1, true, __sys_atomic_bit_clear
__sys_start_thread:
.Ltmp1:
	jeq id, NR_TASKLETS-1, .Ltmp1+2
	boot id, 1
	ld d22, id8, __sys_thread_stack_table_ptr
	call r23, main
	.globl	__sys_end
__sys_end:

	stop true, __sys_end
	// inline asm
.Lfunc_end0:
	.size	__bootstrap, .Lfunc_end0-__bootstrap
	.section	.stack_sizes,"o",@progbits,.text.__bootstrap
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__bootstrap,"ax",@progbits
                                        // -- End function
	.type	__sys_null_pointer,@object      // @__sys_null_pointer
	.section	.data.__sys_zero,"aw",@progbits
	.globl	__sys_null_pointer
	.p2align	3
__sys_null_pointer:
	.quad	0                               // 0x0
	.size	__sys_null_pointer, 8

	.type	__sys_thread_stack_table_ptr,@object // @__sys_thread_stack_table_ptr
	.section	.data.__sys_keep,"aw",@progbits
	.globl	__sys_thread_stack_table_ptr
	.p2align	3
__sys_thread_stack_table_ptr:
	.long	STACK_SIZE_TASKLET_0
	.long	__sys_stack_thread_0
	.long	STACK_SIZE_TASKLET_1
	.long	__sys_stack_thread_1
	.long	STACK_SIZE_TASKLET_2
	.long	__sys_stack_thread_2
	.long	STACK_SIZE_TASKLET_3
	.long	__sys_stack_thread_3
	.long	STACK_SIZE_TASKLET_4
	.long	__sys_stack_thread_4
	.long	STACK_SIZE_TASKLET_5
	.long	__sys_stack_thread_5
	.long	STACK_SIZE_TASKLET_6
	.long	__sys_stack_thread_6
	.long	STACK_SIZE_TASKLET_7
	.long	__sys_stack_thread_7
	.long	STACK_SIZE_TASKLET_8
	.long	__sys_stack_thread_8
	.long	STACK_SIZE_TASKLET_9
	.long	__sys_stack_thread_9
	.long	STACK_SIZE_TASKLET_10
	.long	__sys_stack_thread_10
	.long	STACK_SIZE_TASKLET_11
	.long	__sys_stack_thread_11
	.long	STACK_SIZE_TASKLET_12
	.long	__sys_stack_thread_12
	.long	STACK_SIZE_TASKLET_13
	.long	__sys_stack_thread_13
	.long	STACK_SIZE_TASKLET_14
	.long	__sys_stack_thread_14
	.long	STACK_SIZE_TASKLET_15
	.long	__sys_stack_thread_15
	.long	STACK_SIZE_TASKLET_16
	.long	__sys_stack_thread_16
	.long	STACK_SIZE_TASKLET_17
	.long	__sys_stack_thread_17
	.long	STACK_SIZE_TASKLET_18
	.long	__sys_stack_thread_18
	.long	STACK_SIZE_TASKLET_19
	.long	__sys_stack_thread_19
	.long	STACK_SIZE_TASKLET_20
	.long	__sys_stack_thread_20
	.long	STACK_SIZE_TASKLET_21
	.long	__sys_stack_thread_21
	.long	STACK_SIZE_TASKLET_22
	.long	__sys_stack_thread_22
	.long	STACK_SIZE_TASKLET_23
	.long	__sys_stack_thread_23
	.size	__sys_thread_stack_table_ptr, 192

	.type	__sys_used_mram_end,@object     // @__sys_used_mram_end
	.section	.mram.noinit,"aw",@progbits
	.globl	__sys_used_mram_end
	.p2align	3
__sys_used_mram_end:
	.size	__sys_used_mram_end, 0

	.type	thread_profiling,@object        // @thread_profiling
	.section	.data.immediate_memory.thread_profiling,"aw",@progbits
	.globl	thread_profiling
	.p2align	2
thread_profiling:
	.zero	96
	.size	thread_profiling, 96

	.type	perfcounter_end_value,@object   // @perfcounter_end_value
	.section	.bss.perfcounter_end_value,"aw",@nobits
	.globl	perfcounter_end_value
	.p2align	2
perfcounter_end_value:
	.long	0                               // 0x0
	.size	perfcounter_end_value, 4

	.type	CLOCKS_PER_SEC,@object          // @CLOCKS_PER_SEC
	.section	.dpu_host,"a",@progbits
	.globl	CLOCKS_PER_SEC
	.p2align	3
CLOCKS_PER_SEC:
	.long	0                               // 0x0
	.size	CLOCKS_PER_SEC, 4

	.type	error_storage,@object           // @error_storage
	.globl	error_storage
	.p2align	3
error_storage:
	.long	0                               // 0x0
	.size	error_storage, 4

	.addrsig
	.addrsig_sym __bootstrap
	.addrsig_sym __sys_null_pointer
	.addrsig_sym STACK_SIZE_TASKLET_0
	.addrsig_sym __sys_stack_thread_0
	.addrsig_sym STACK_SIZE_TASKLET_1
	.addrsig_sym __sys_stack_thread_1
	.addrsig_sym STACK_SIZE_TASKLET_2
	.addrsig_sym __sys_stack_thread_2
	.addrsig_sym STACK_SIZE_TASKLET_3
	.addrsig_sym __sys_stack_thread_3
	.addrsig_sym STACK_SIZE_TASKLET_4
	.addrsig_sym __sys_stack_thread_4
	.addrsig_sym STACK_SIZE_TASKLET_5
	.addrsig_sym __sys_stack_thread_5
	.addrsig_sym STACK_SIZE_TASKLET_6
	.addrsig_sym __sys_stack_thread_6
	.addrsig_sym STACK_SIZE_TASKLET_7
	.addrsig_sym __sys_stack_thread_7
	.addrsig_sym STACK_SIZE_TASKLET_8
	.addrsig_sym __sys_stack_thread_8
	.addrsig_sym STACK_SIZE_TASKLET_9
	.addrsig_sym __sys_stack_thread_9
	.addrsig_sym STACK_SIZE_TASKLET_10
	.addrsig_sym __sys_stack_thread_10
	.addrsig_sym STACK_SIZE_TASKLET_11
	.addrsig_sym __sys_stack_thread_11
	.addrsig_sym STACK_SIZE_TASKLET_12
	.addrsig_sym __sys_stack_thread_12
	.addrsig_sym STACK_SIZE_TASKLET_13
	.addrsig_sym __sys_stack_thread_13
	.addrsig_sym STACK_SIZE_TASKLET_14
	.addrsig_sym __sys_stack_thread_14
	.addrsig_sym STACK_SIZE_TASKLET_15
	.addrsig_sym __sys_stack_thread_15
	.addrsig_sym STACK_SIZE_TASKLET_16
	.addrsig_sym __sys_stack_thread_16
	.addrsig_sym STACK_SIZE_TASKLET_17
	.addrsig_sym __sys_stack_thread_17
	.addrsig_sym STACK_SIZE_TASKLET_18
	.addrsig_sym __sys_stack_thread_18
	.addrsig_sym STACK_SIZE_TASKLET_19
	.addrsig_sym __sys_stack_thread_19
	.addrsig_sym STACK_SIZE_TASKLET_20
	.addrsig_sym __sys_stack_thread_20
	.addrsig_sym STACK_SIZE_TASKLET_21
	.addrsig_sym __sys_stack_thread_21
	.addrsig_sym STACK_SIZE_TASKLET_22
	.addrsig_sym __sys_stack_thread_22
	.addrsig_sym STACK_SIZE_TASKLET_23
	.addrsig_sym __sys_stack_thread_23
	.addrsig_sym __sys_thread_stack_table_ptr
	.addrsig_sym __sys_used_mram_end
	.addrsig_sym thread_profiling
	.addrsig_sym CLOCKS_PER_SEC
	.addrsig_sym error_storage
