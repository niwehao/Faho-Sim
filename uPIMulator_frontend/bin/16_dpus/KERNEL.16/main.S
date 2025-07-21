	$text,
	$file,	"memset.c"
	$section,	%text, __memset_wram_4align,"ax",@progbits
	$globl,	__memset_wram_4align            //  -  -  Begin function __memset_wram_4align
	$type,	__memset_wram_4align,@function
__memset_wram_4align:                   // @__memset_wram_4align
memset..Lfunc_begin0:
// %bb.0:
	$lsr , r2, r2, 2, z, memset..LBB0_3
// %bb.1:
	$and , r3, r1, 255
	$lsl_add , r1, r3, r1, 24
	$lsl_add , r1, r1, r3, 8
	$lsl_add , r1, r1, r3, 16
	$move , r3, r0
memset..LBB0_2:                                // =>This Inner Loop Header: Depth=1
	$sw , r3, 0, r1
	$add , r3, r3, 4
	$add , r2, r2,  - 1, nz, memset..LBB0_2
memset..LBB0_3:
	$jump , r23
memset..Lfunc_end0:
	$size,	__memset_wram_4align, memset..Lfunc_end0 - __memset_wram_4align
	$section,	%stack_sizes,"o",@progbits,%text, __memset_wram_4align
	$long,	memset..Lfunc_begin0
	$byte,	0
	$section,	%text, __memset_wram_4align,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, memset,"ax",@progbits
	$globl,	memset                          //  -  -  Begin function memset
	$type,	memset,@function
memset:                                 // @memset
memset..Lfunc_begin1:
// %bb.0:
	$and , r3, r0, 3, z, memset..LBB1_1
// %bb.2:
	$sub , r4, 4, r3
	$move , r3, r2
	$jgtu , r4, r2, memset..LBB1_4
// %bb.3:
	$move , r3, r4
memset..LBB1_4:
	$jeq , r3, 0, memset..LBB1_7
// %bb.5:
	$move , r4, r0
	$move , r5, r3
memset..LBB1_6:                                // =>This Inner Loop Header: Depth=1
	$sb , r4, 0, r1
	$add , r4, r4, 1
	$add , r5, r5,  - 1, nz, memset..LBB1_6
memset..LBB1_7:
	$sub , r2, r2, r3
	$add , r3, r0, r3
	$jgeu , r2, 4, memset..LBB1_9
memset..LBB1_12:
	$jeq , r2, 0, memset..LBB1_14
memset..LBB1_13:                               // =>This Inner Loop Header: Depth=1
	$sb , r3, 0, r1
	$add , r3, r3, 1
	$add , r2, r2,  - 1, nz, memset..LBB1_13
memset..LBB1_14:
	$jump , r23
memset..LBB1_1:
	$move , r3, r0
	$jltu , r2, 4, memset..LBB1_12
memset..LBB1_9:
	$and , r4, r2,  - 4
	$and , r5, r1, 255
	$lsl_add , r6, r5, r1, 24
	$lsl_add , r6, r6, r5, 8
	$lsl_add , r5, r6, r5, 16
	$lsr , r6, r2, 2
	$move , r7, r3
memset..LBB1_10:                               // =>This Inner Loop Header: Depth=1
	$sw , r7, 0, r5
	$add , r7, r7, 4
	$add , r6, r6,  - 1, nz, memset..LBB1_10
// %bb.11:
	$and , r2, r2, 3
	$add , r3, r3, r4
	$jneq , r2, 0, memset..LBB1_13
	$jump , memset..LBB1_14
memset..Lfunc_end1:
	$size,	memset, memset..Lfunc_end1 - memset
	$section,	%stack_sizes,"o",@progbits,%text, memset
	$long,	memset..Lfunc_begin1
	$byte,	0
	$section,	%text, memset,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, __memset_mram_8align,"ax",@progbits
	$globl,	__memset_mram_8align            //  -  -  Begin function __memset_mram_8align
	$type,	__memset_mram_8align,@function
__memset_mram_8align:                   // @__memset_mram_8align
memset..Lfunc_begin2:
// %bb.0:
	$and , r3, r1, 255
	$lsl_add , r1, r3, r1, 24
	$lsl_add , r1, r1, r3, 8
	$lsl_add , r1, r1, r3, 16
	$sw , r22, 0, r1
	$sw , r22, 4, r1
	$jeq , r2, 0, memset..LBB2_3
// %bb.1:
	$move , r1, 0
memset..LBB2_2:                                // =>This Inner Loop Header: Depth=1
	$add , r3, r0, r1
	$add , r4, r22, 0
	$add , r1, r1, 8
	$sdma , r4, r3, 0
	$jltu , r1, r2, memset..LBB2_2
memset..LBB2_3:
	$jump , r23
memset..Lfunc_end2:
	$size,	__memset_mram_8align, memset..Lfunc_end2 - __memset_mram_8align
	$section,	%stack_sizes,"o",@progbits,%text, __memset_mram_8align
	$long,	memset..Lfunc_begin2
	$byte,	8
	$section,	%text, __memset_mram_8align,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, __memset_mram,"ax",@progbits
	$globl,	__memset_mram                   //  -  -  Begin function __memset_mram
	$type,	__memset_mram,@function
__memset_mram:                          // @__memset_mram
memset..Lfunc_begin3:
// %bb.0:
	$and , r3, r0,  - 8
	$and , r6, r0, 7, z, memset..LBB3_7
// %bb.1:
	$sub , r5, 8, r6
	$move , r4, r2
	$jgtu , r5, r2, memset..LBB3_3
// %bb.2:
	$move , r4, r5
memset..LBB3_3:
	$add , r5, r22, 8
	$ldma , r5, r3, 0
	$jeq , r4, 0, memset..LBB3_6
// %bb.4:
	$or , r6, r5, r6
	$move , r7, r4
memset..LBB3_5:                                // =>This Inner Loop Header: Depth=1
	$sb , r6, 0, r1
	$add , r6, r6, 1
	$add , r7, r7,  - 1, nz, memset..LBB3_5
memset..LBB3_6:
	$sdma , r5, r3, 0
	$sub , r2, r2, r4
	$add , r3, r3, 8
memset..LBB3_7:
	$jltu , r2, 8, memset..LBB3_12
// %bb.8:
	$and , r4, r1, 255
	$lsl_add , r5, r4, r1, 24
	$lsl_add , r5, r5, r4, 8
	$lsl_add , r4, r5, r4, 16
	$sw , r22, 0, r4
	$sw , r22, 4, r4
	$and , r4, r2,  - 8, z, memset..LBB3_11
// %bb.9:
	$move , r5, 0
memset..LBB3_10:                               // =>This Inner Loop Header: Depth=1
	$add , r6, r3, r5
	$add , r7, r22, 0
	$add , r5, r5, 8
	$sdma , r7, r6, 0
	$jltu , r5, r4, memset..LBB3_10
memset..LBB3_11:
	$and , r2, r2, 7
	$add , r3, r3, r4
memset..LBB3_12:
	$jeq , r2, 0, memset..LBB3_16
// %bb.13:
	$add , r4, r22, 8
	$ldma , r4, r3, 0
memset..LBB3_14:                               // =>This Inner Loop Header: Depth=1
	$sb , r4, 0, r1
	$add , r4, r4, 1
	$add , r2, r2,  - 1, nz, memset..LBB3_14
// %bb.15:
	$add , r1, r22, 8
	$sdma , r1, r3, 0
memset..LBB3_16:
	$jump , r23
memset..Lfunc_end3:
	$size,	__memset_mram, memset..Lfunc_end3 - __memset_mram
	$section,	%stack_sizes,"o",@progbits,%text, __memset_mram
	$long,	memset..Lfunc_begin3
	$byte,	16
	$section,	%text, __memset_mram,"ax",@progbits
                                        //  -  -  End function
	$addrsig,
	$addrsig_sym, __memset_wram_4align
	$addrsig_sym, __memset_mram_8align
	$addrsig_sym, __memset_mram
	$text,
	$file,	"perfcounter.c"
	$section,	%text, perfcounter_get,"ax",@progbits
	$globl,	perfcounter_get                 //  -  -  Begin function perfcounter_get
	$type,	perfcounter_get,@function
perfcounter_get:                        // @perfcounter_get
perfcounter..Lfunc_begin0:
// %bb.0:
	// inline asm
	$time , r0
	// inline asm
	$move .u, d2, r0
	$lslx , r0, r3, 4
	$lsl_add , r0, r0, r2, 4
	$lsl , r1, r3, 4
	$jump , r23
perfcounter..Lfunc_end0:
	$size,	perfcounter_get, perfcounter..Lfunc_end0 - perfcounter_get
	$section,	%stack_sizes,"o",@progbits,%text, perfcounter_get
	$long,	perfcounter..Lfunc_begin0
	$byte,	0
	$section,	%text, perfcounter_get,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, perfcounter_config,"ax",@progbits
	$globl,	perfcounter_config              //  -  -  Begin function perfcounter_config
	$type,	perfcounter_config,@function
perfcounter_config:                     // @perfcounter_config
perfcounter..Lfunc_begin1:
// %bb.0:
	$lsl_add , r0, r1, r0, 1
	// inline asm
	$time_cfg , r0, r0
	// inline asm
	$move .u, d2, r0
	$lslx , r0, r3, 4
	$lsl_add , r0, r0, r2, 4
	$lsl , r1, r3, 4
	$jump , r23
perfcounter..Lfunc_end1:
	$size,	perfcounter_config, perfcounter..Lfunc_end1 - perfcounter_config
	$section,	%stack_sizes,"o",@progbits,%text, perfcounter_config
	$long,	perfcounter..Lfunc_begin1
	$byte,	0
	$section,	%text, perfcounter_config,"ax",@progbits
                                        //  -  -  End function
	$addrsig,
	$text,
	$file,	"crt0.c"
	$section,	%text, __bootstrap,"ax",@progbits
	$globl,	__bootstrap                     //  -  -  Begin function __bootstrap
	$type,	__bootstrap,@function
__bootstrap:                            // @__bootstrap
crt0..Lfunc_begin0:
// %bb.0:
	// inline asm
	$jnz , id, crt0.__sys_start_thread

	$sd , zero, __stdout_buffer_state, 0
	$move , r23, __atomic_end_addr
crt0.__sys_atomic_bit_clear:
	$jeq , r23, __atomic_used_addr, crt0.__sys_start_thread
crt0..Ltmp0:
	$release , r23, 0, nz, crt0..Ltmp0 + 1
	$add , r23, r23,  - 1, true, crt0.__sys_atomic_bit_clear
crt0.__sys_start_thread:
crt0..Ltmp1:
	$jeq , id, NR_TASKLETS - 1, crt0..Ltmp1 + 2
	$boot , id, 1
	$ld , d22, id8, __sys_thread_stack_table_ptr
	$call , r23, main
	$globl,	__sys_end
__sys_end:

	$stop , true, __sys_end
	// inline asm
crt0..Lfunc_end0:
	$size,	__bootstrap, crt0..Lfunc_end0 - __bootstrap
	$section,	%stack_sizes,"o",@progbits,%text, __bootstrap
	$long,	crt0..Lfunc_begin0
	$byte,	0
	$section,	%text, __bootstrap,"ax",@progbits
                                        //  -  -  End function
	$type,	__sys_null_pointer,@object      // @__sys_null_pointer
	$section,	%data, __sys_zero,"aw",@progbits
	$globl,	__sys_null_pointer
	$p2align,	3
__sys_null_pointer:
	$quad,	0                               // 0x0
	$size,	__sys_null_pointer, 8

	$type,	__sys_thread_stack_table_ptr,@object // @__sys_thread_stack_table_ptr
	$section,	%data, __sys_keep,"aw",@progbits
	$globl,	__sys_thread_stack_table_ptr
	$p2align,	3
__sys_thread_stack_table_ptr:
	$long,	STACK_SIZE_TASKLET_0
	$long,	__sys_stack_thread_0
	$long,	STACK_SIZE_TASKLET_1
	$long,	__sys_stack_thread_1
	$long,	STACK_SIZE_TASKLET_2
	$long,	__sys_stack_thread_2
	$long,	STACK_SIZE_TASKLET_3
	$long,	__sys_stack_thread_3
	$long,	STACK_SIZE_TASKLET_4
	$long,	__sys_stack_thread_4
	$long,	STACK_SIZE_TASKLET_5
	$long,	__sys_stack_thread_5
	$long,	STACK_SIZE_TASKLET_6
	$long,	__sys_stack_thread_6
	$long,	STACK_SIZE_TASKLET_7
	$long,	__sys_stack_thread_7
	$long,	STACK_SIZE_TASKLET_8
	$long,	__sys_stack_thread_8
	$long,	STACK_SIZE_TASKLET_9
	$long,	__sys_stack_thread_9
	$long,	STACK_SIZE_TASKLET_10
	$long,	__sys_stack_thread_10
	$long,	STACK_SIZE_TASKLET_11
	$long,	__sys_stack_thread_11
	$long,	STACK_SIZE_TASKLET_12
	$long,	__sys_stack_thread_12
	$long,	STACK_SIZE_TASKLET_13
	$long,	__sys_stack_thread_13
	$long,	STACK_SIZE_TASKLET_14
	$long,	__sys_stack_thread_14
	$long,	STACK_SIZE_TASKLET_15
	$long,	__sys_stack_thread_15
	$long,	STACK_SIZE_TASKLET_16
	$long,	__sys_stack_thread_16
	$long,	STACK_SIZE_TASKLET_17
	$long,	__sys_stack_thread_17
	$long,	STACK_SIZE_TASKLET_18
	$long,	__sys_stack_thread_18
	$long,	STACK_SIZE_TASKLET_19
	$long,	__sys_stack_thread_19
	$long,	STACK_SIZE_TASKLET_20
	$long,	__sys_stack_thread_20
	$long,	STACK_SIZE_TASKLET_21
	$long,	__sys_stack_thread_21
	$long,	STACK_SIZE_TASKLET_22
	$long,	__sys_stack_thread_22
	$long,	STACK_SIZE_TASKLET_23
	$long,	__sys_stack_thread_23
	$size,	__sys_thread_stack_table_ptr, 192

	$type,	__sys_used_mram_end,@object     // @__sys_used_mram_end
	$section,	%mram, noinit,"aw",@progbits
	$globl,	__sys_used_mram_end
	$p2align,	3
__sys_used_mram_end:
	$size,	__sys_used_mram_end, 0

	$type,	thread_profiling,@object        // @thread_profiling
	$section,	%data, immediate_memory.thread_profiling,"aw",@progbits
	$globl,	thread_profiling
	$p2align,	2
thread_profiling:
	$zero,	96
	$size,	thread_profiling, 96

	$type,	perfcounter_end_value,@object   // @perfcounter_end_value
	$section,	%bss, perfcounter_end_value,"aw",@nobits
	$globl,	perfcounter_end_value
	$p2align,	2
perfcounter_end_value:
	$long,	0                               // 0x0
	$size,	perfcounter_end_value, 4

	$type,	CLOCKS_PER_SEC,@object          // @CLOCKS_PER_SEC
	$section,	%dpu_host,"a",@progbits
	$globl,	CLOCKS_PER_SEC
	$p2align,	3
CLOCKS_PER_SEC:
	$long,	0                               // 0x0
	$size,	CLOCKS_PER_SEC, 4

	$type,	error_storage,@object           // @error_storage
	$globl,	error_storage
	$p2align,	3
error_storage:
	$long,	0                               // 0x0
	$size,	error_storage, 4

	$addrsig,
	$addrsig_sym, __bootstrap
	$addrsig_sym, __sys_null_pointer
	$addrsig_sym, STACK_SIZE_TASKLET_0
	$addrsig_sym, __sys_stack_thread_0
	$addrsig_sym, STACK_SIZE_TASKLET_1
	$addrsig_sym, __sys_stack_thread_1
	$addrsig_sym, STACK_SIZE_TASKLET_2
	$addrsig_sym, __sys_stack_thread_2
	$addrsig_sym, STACK_SIZE_TASKLET_3
	$addrsig_sym, __sys_stack_thread_3
	$addrsig_sym, STACK_SIZE_TASKLET_4
	$addrsig_sym, __sys_stack_thread_4
	$addrsig_sym, STACK_SIZE_TASKLET_5
	$addrsig_sym, __sys_stack_thread_5
	$addrsig_sym, STACK_SIZE_TASKLET_6
	$addrsig_sym, __sys_stack_thread_6
	$addrsig_sym, STACK_SIZE_TASKLET_7
	$addrsig_sym, __sys_stack_thread_7
	$addrsig_sym, STACK_SIZE_TASKLET_8
	$addrsig_sym, __sys_stack_thread_8
	$addrsig_sym, STACK_SIZE_TASKLET_9
	$addrsig_sym, __sys_stack_thread_9
	$addrsig_sym, STACK_SIZE_TASKLET_10
	$addrsig_sym, __sys_stack_thread_10
	$addrsig_sym, STACK_SIZE_TASKLET_11
	$addrsig_sym, __sys_stack_thread_11
	$addrsig_sym, STACK_SIZE_TASKLET_12
	$addrsig_sym, __sys_stack_thread_12
	$addrsig_sym, STACK_SIZE_TASKLET_13
	$addrsig_sym, __sys_stack_thread_13
	$addrsig_sym, STACK_SIZE_TASKLET_14
	$addrsig_sym, __sys_stack_thread_14
	$addrsig_sym, STACK_SIZE_TASKLET_15
	$addrsig_sym, __sys_stack_thread_15
	$addrsig_sym, STACK_SIZE_TASKLET_16
	$addrsig_sym, __sys_stack_thread_16
	$addrsig_sym, STACK_SIZE_TASKLET_17
	$addrsig_sym, __sys_stack_thread_17
	$addrsig_sym, STACK_SIZE_TASKLET_18
	$addrsig_sym, __sys_stack_thread_18
	$addrsig_sym, STACK_SIZE_TASKLET_19
	$addrsig_sym, __sys_stack_thread_19
	$addrsig_sym, STACK_SIZE_TASKLET_20
	$addrsig_sym, __sys_stack_thread_20
	$addrsig_sym, STACK_SIZE_TASKLET_21
	$addrsig_sym, __sys_stack_thread_21
	$addrsig_sym, STACK_SIZE_TASKLET_22
	$addrsig_sym, __sys_stack_thread_22
	$addrsig_sym, STACK_SIZE_TASKLET_23
	$addrsig_sym, __sys_stack_thread_23
	$addrsig_sym, __sys_thread_stack_table_ptr
	$addrsig_sym, __sys_used_mram_end
	$addrsig_sym, thread_profiling
	$addrsig_sym, CLOCKS_PER_SEC
	$addrsig_sym, error_storage
	$text,
	$file,	"stdio.c"
	$section,	%text, printf,"ax",@progbits
	$globl,	printf                          //  -  -  Begin function printf
	$type,	printf,@function
printf:                                 // @printf
stdio..Lfunc_begin0:
// %bb.0:
	$sd , r22, 40, d22
	$add , r22, r22, 48
	$sd , r22,  - 32, d14
	$sd , r22,  - 40, d16
	$sd , r22,  - 48, d18
	$move , r14, r0
	$call , r23, stdio.__open_print_sequence
	$sub , r0, r22, 56, false
	$sw , r22,  - 24, r0
	$move , r0, 1
	$move , r15, r14, true, stdio..LBB0_1
stdio..LBB0_19:                               //   in Loop: Header=BB0_1 Depth=1
	$add , r15, r15, 1
	$move , r0, r16
stdio..LBB0_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_9 Depth 2
	$lbu , r1, r15, 0
	$jeq , r1, 37, stdio..LBB0_6
// %bb.2:                               //   in Loop: Header=BB0_1 Depth=1
	$jneq , r1, 0, stdio..LBB0_3
	$jump , stdio..LBB0_20
stdio..LBB0_6:                                //   in Loop: Header=BB0_1 Depth=1
	$lbu , r1, r15, 1
	$add , r15, r15, 1
	$jeq , r1, 37, stdio..LBB0_3
// %bb.7:                               //   in Loop: Header=BB0_1 Depth=1
	$jeq , r1, 0, stdio..LBB0_20
// %bb.8:                               //   in Loop: Header=BB0_1 Depth=1
	$move , r0, 37
	$call , r23, stdio.__write_byte_and_flush_if_needed
	$jump , stdio..LBB0_9
stdio..LBB0_18:                               //   in Loop: Header=BB0_9 Depth=2
	$call , r23, stdio.__write_byte_and_flush_if_needed
	$lbu , r0, r15, 0
	$and , r0, r0, 223
	$add , r0, r0,  - 65
	$and , r0, r0, 255
	$jltu , r0, 26, stdio..LBB0_19
stdio..LBB0_17:                               //   in Loop: Header=BB0_9 Depth=2
	$add , r15, r15, 1
stdio..LBB0_9:                                //   Parent Loop BB0_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	$lbu , r0, r15, 0
	$move , r16, 1
	$jles , r0, 107, stdio..LBB0_10
// %bb.14:                              //   in Loop: Header=BB0_9 Depth=2
	$jeq , r0, 122, stdio..LBB0_17
// %bb.15:                              //   in Loop: Header=BB0_9 Depth=2
	$jneq , r0, 108, stdio..LBB0_18
// %bb.16:                              //   in Loop: Header=BB0_9 Depth=2
	$move , r0, 108
	$call , r23, stdio.__write_byte_and_flush_if_needed
	$jump , stdio..LBB0_17
stdio..LBB0_10:                               //   in Loop: Header=BB0_9 Depth=2
	$jeq , r0, 76, stdio..LBB0_17
// %bb.11:                              //   in Loop: Header=BB0_9 Depth=2
	$jeq , r0, 0, stdio..LBB0_19
// %bb.12:                              //   in Loop: Header=BB0_9 Depth=2
	$jneq , r0, 105, stdio..LBB0_18
// %bb.13:                              //   in Loop: Header=BB0_1 Depth=1
	$move , r0, 100
	$call , r23, stdio.__write_byte_and_flush_if_needed
	$jump , stdio..LBB0_19
stdio..LBB0_3:                                //   in Loop: Header=BB0_1 Depth=1
	$move , r16, 0
	$and , r0, r0, 1, z, stdio..LBB0_19
// %bb.4:                               //   in Loop: Header=BB0_1 Depth=1
	$move , r0, 37
	$call , r23, stdio.__write_byte_and_flush_if_needed
	$move , r0, 115
	$call , r23, stdio.__write_byte_and_flush_if_needed
	$jump , stdio..LBB0_19
stdio..LBB0_20:
	$move , r15, 0
	$move , r0, r15
	$call , r23, stdio.__write_byte_and_flush_if_needed
	$add , r0, r22,  - 16
	$or , r16, r0, 1, true, stdio..LBB0_21
stdio..LBB0_22:                               //   in Loop: Header=BB0_21 Depth=1
	$jeq , r0, 0, stdio..LBB0_52
stdio..LBB0_23:                               //   in Loop: Header=BB0_21 Depth=1
	$call , r23, stdio.__write_byte_and_flush_if_needed
	$move , r15, 1
	$add , r14, r14, 1
stdio..LBB0_21:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_30 Depth 2
                                        //     Child Loop BB0_41 Depth 2
                                        //     Child Loop BB0_50 Depth 2
	$lbu , r0, r14, 0
	$jneq , r0, 37, stdio..LBB0_22
// %bb.24:                              //   in Loop: Header=BB0_21 Depth=1
	$lbu , r1, r14, 1
	$add , r14, r14, 1
	$jeq , r1, 37, stdio..LBB0_23
// %bb.25:                              //   in Loop: Header=BB0_21 Depth=1
	$jeq , r1, 0, stdio..LBB0_52
// %bb.26:                              //   in Loop: Header=BB0_21 Depth=1
	$and , r0, r15, 1, z, stdio..LBB0_28
// %bb.27:                              //   in Loop: Header=BB0_21 Depth=1
	$move , r0, 0
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..LBB0_28:                               //   in Loop: Header=BB0_21 Depth=1
	$move , r0, 0
	$lbu , r1, r14, 0
	$jgts , r1, 121, stdio..LBB0_35
	$jump , stdio..LBB0_30
stdio..LBB0_36:                               //   in Loop: Header=BB0_21 Depth=1
	$and , r2, r1, 223
	$add , r2, r2,  - 65
	$and , r2, r2, 255
	$jleu , r2, 25, stdio..LBB0_37
stdio..LBB0_34:                               //   in Loop: Header=BB0_21 Depth=1
	$add , r14, r14, 1
	$lbu , r1, r14, 0
	$jles , r1, 121, stdio..LBB0_30
stdio..LBB0_35:                               //   in Loop: Header=BB0_21 Depth=1
	$jeq , r1, 122, stdio..LBB0_34
	$jump , stdio..LBB0_36
stdio..LBB0_30:                               //   Parent Loop BB0_21 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	$jeq , r1, 0, stdio..LBB0_46
// %bb.31:                              //   in Loop: Header=BB0_30 Depth=2
	$jeq , r1, 76, stdio..LBB0_33
// %bb.32:                              //   in Loop: Header=BB0_30 Depth=2
	$jneq , r1, 108, stdio..LBB0_36
stdio..LBB0_33:                               //   in Loop: Header=BB0_30 Depth=2
	$add , r14, r14, 1
	$move , r0, 1
	$lbu , r1, r14, 0
	$jgts , r1, 121, stdio..LBB0_35
	$jump , stdio..LBB0_30
stdio..LBB0_37:                               //   in Loop: Header=BB0_21 Depth=1
	$add , r1, r1,  - 69
	$jgtu , r1, 46, stdio..LBB0_46
// %bb.38:                              //   in Loop: Header=BB0_21 Depth=1
	$lsl , r1, r1, 2
	$lw , r1, r1, stdio..LJTI0_0
	$jump , r1
stdio..LBB0_45:                               //   in Loop: Header=BB0_21 Depth=1
	// inline asm
	$nop ,
	// inline asm
	$lw , r0, r22,  - 24
	$add , r0, r0,  - 8
	$and , r0, r0,  - 8
	$sw , r22,  - 24, r0
	$ld , d18, r0, 0
	$and , r0, r19, 255
	$call , r23, stdio.__write_byte_and_flush_if_needed
	$lsr , r0, r19, 8
	$and , r0, r0, 255
	$call , r23, stdio.__write_byte_and_flush_if_needed
	$lsr , r0, r19, 16
	$and , r0, r0, 255
	$call , r23, stdio.__write_byte_and_flush_if_needed
	$lsr , r0, r19, 24
	$call , r23, stdio.__write_byte_and_flush_if_needed
	$and , r0, r18, 255
	$call , r23, stdio.__write_byte_and_flush_if_needed
	$lsr .u, d0, r18, 8
	$and , r0, r1, 255
	$call , r23, stdio.__write_byte_and_flush_if_needed
	$lsr .u, d0, r18, 16
	$and , r0, r1, 255
	$call , r23, stdio.__write_byte_and_flush_if_needed
	$lsr .u, d0, r18, 24
	$move , r0, r1
	$call , r23, stdio.__write_byte_and_flush_if_needed
	$jump , stdio..LBB0_51
stdio..LBB0_46:                               //   in Loop: Header=BB0_21 Depth=1
	$and , r0, r0, 1, z, stdio..LBB0_48
// %bb.47:                              //   in Loop: Header=BB0_21 Depth=1
	$lw , r0, r22,  - 24
	$add , r0, r0,  - 8
	$and , r0, r0,  - 8
	$sw , r22,  - 24, r0
	$ld , d0, r0, 0
	$move , r15, 8, true, stdio..LBB0_49
stdio..LBB0_48:                               //   in Loop: Header=BB0_21 Depth=1
	$lw , r0, r22,  - 24
	$add , r1, r0,  - 4
	$sw , r22,  - 24, r1
	$lw .s, d0, r0,  - 4
	$move , r15, 4
stdio..LBB0_49:                               //   in Loop: Header=BB0_21 Depth=1
	$sd , r22,  - 16, d0
	$and , r0, r1, 255
	$call , r23, stdio.__write_byte_and_flush_if_needed
	$add , r15, r15,  - 1
	$move , r17, r16
stdio..LBB0_50:                               //   Parent Loop BB0_21 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	$lbu , r0, r17, 0
	$call , r23, stdio.__write_byte_and_flush_if_needed
	$add , r17, r17, 1
	$add , r15, r15,  - 1, nz, stdio..LBB0_50
stdio..LBB0_51:                               //   in Loop: Header=BB0_21 Depth=1
	$move , r15, 0
	$add , r14, r14, 1, true, stdio..LBB0_21
stdio..LBB0_43:                               //   in Loop: Header=BB0_21 Depth=1
	$lw , r0, r22,  - 24
	$add , r1, r0,  - 4
	$sw , r22,  - 24, r1
	$lbu , r0, r0,  - 4
	$call , r23, stdio.__write_byte_and_flush_if_needed
	$jump , stdio..LBB0_51
stdio..LBB0_39:                               //   in Loop: Header=BB0_21 Depth=1
	$lw , r0, r22,  - 24
	$add , r1, r0,  - 4
	$sw , r22,  - 24, r1
	$lw , r1, r0,  - 4
	$lbu , r0, r1, 0
	$jeq , r0, 0, stdio..LBB0_42
// %bb.40:                              //   in Loop: Header=BB0_21 Depth=1
	$add , r15, r1, 1
stdio..LBB0_41:                               //   Parent Loop BB0_21 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	$and , r0, r0, 255
	$call , r23, stdio.__write_byte_and_flush_if_needed
	$lbu , r0, r15, 0
	$add , r15, r15, 1
	$jneq , r0, 0, stdio..LBB0_41
stdio..LBB0_42:                               //   in Loop: Header=BB0_21 Depth=1
	$move , r15, 0
	$move , r0, r15
	$call , r23, stdio.__write_byte_and_flush_if_needed
	$add , r14, r14, 1, true, stdio..LBB0_21
stdio..LBB0_52:
	$and , r0, r15, 1, z, stdio..LBB0_54
// %bb.53:
	$move , r0, 0
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..LBB0_54:
	$call , r23, stdio.__finalized_print_sequence
	$call , r23, stdio.__close_print_sequence
	$ld , d18, r22,  - 48
	$ld , d16, r22,  - 40
	$ld , d14, r22,  - 32
	$ld , d22, r22,  - 8
	$jump , r23
stdio..Lfunc_end0:
	$size,	printf, stdio..Lfunc_end0 - printf
	$section,	%rodata, printf,"a",@progbits
	$p2align,	2
stdio..LJTI0_0:
	$long,	stdio..LBB0_45
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_45
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_43
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_45
	$long,	stdio..LBB0_45
	$long,	stdio..LBB0_45
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_46
	$long,	stdio..LBB0_39
	$section,	%stack_sizes,"o",@progbits,%rodata, printf
	$long,	stdio..Lfunc_begin0
	$byte,	48
	$section,	%rodata, printf,"a",@progbits
                                        //  -  -  End function
	$section,	%text, stdio.__write_byte_and_flush_if_needed,"ax",@progbits
	$type,	stdio.__write_byte_and_flush_if_needed,@function //  -  -  Begin function stdio.__write_byte_and_flush_if_needed
stdio.__write_byte_and_flush_if_needed:       // @stdio.__write_byte_and_flush_if_needed
stdio..Lfunc_begin1:
// %bb.0:
	$sd , r22, 0, d22
	$add , r22, r22, 8
	$lw , r1, zero, stdio.__stdout_cache_write_index
	$sb , r1, stdio.__stdout_cache_buffer, r0
	$add , r0, r1, 1
	$sw , zero, stdio.__stdout_cache_write_index, r0
	$jneq , r0, 8, stdio..LBB1_2
// %bb.1:
	$call , r23, stdio.__transfer_cache_to_mram
	$move , r0, stdio.__stdout_cache_write_index
	$sw , r0, 0, 0
stdio..LBB1_2:
	$ld , d22, r22,  - 8
	$jump , r23
stdio..Lfunc_end1:
	$size,	stdio.__write_byte_and_flush_if_needed, stdio..Lfunc_end1 - stdio.__write_byte_and_flush_if_needed
	$section,	%stack_sizes,"o",@progbits,%text, stdio.__write_byte_and_flush_if_needed
	$long,	stdio..Lfunc_begin1
	$byte,	8
	$section,	%text, stdio.__write_byte_and_flush_if_needed,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, puts,"ax",@progbits
	$globl,	puts                            //  -  -  Begin function puts
	$type,	puts,@function
puts:                                   // @puts
stdio..Lfunc_begin2:
// %bb.0:
	$sd , r22, 8, d22
	$add , r22, r22, 16
	$sd , r22,  - 16, d14
	$move , r14, r0
	$call , r23, stdio.__open_print_sequence
	$move , r0, 37
	$call , r23, stdio.__write_byte_and_flush_if_needed
	$move , r0, 115
	$call , r23, stdio.__write_byte_and_flush_if_needed
	$move , r0, 0
	$call , r23, stdio.__write_byte_and_flush_if_needed
	$lbu , r0, r14, 0
	$jeq , r0, 0, stdio..LBB2_3
// %bb.1:
	$add , r14, r14, 1
stdio..LBB2_2:                                // =>This Inner Loop Header: Depth=1
	$and , r0, r0, 255
	$call , r23, stdio.__write_byte_and_flush_if_needed
	$lbu , r0, r14, 0
	$add , r14, r14, 1
	$jneq , r0, 0, stdio..LBB2_2
stdio..LBB2_3:
	$move , r0, 10
	$call , r23, stdio.__write_byte_and_flush_if_needed
	$move , r0, 0
	$call , r23, stdio.__write_byte_and_flush_if_needed
	$call , r23, stdio.__finalized_print_sequence
	$call , r23, stdio.__close_print_sequence
	$ld , d14, r22,  - 16
	$ld , d22, r22,  - 8
	$jump , r23
stdio..Lfunc_end2:
	$size,	puts, stdio..Lfunc_end2 - puts
	$section,	%stack_sizes,"o",@progbits,%text, puts
	$long,	stdio..Lfunc_begin2
	$byte,	16
	$section,	%text, puts,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, putchar,"ax",@progbits
	$globl,	putchar                         //  -  -  Begin function putchar
	$type,	putchar,@function
putchar:                                // @putchar
stdio..Lfunc_begin3:
// %bb.0:
	$sd , r22, 8, d22
	$add , r22, r22, 16
	$sd , r22,  - 16, d14
	$move , r14, r0
	$call , r23, stdio.__open_print_sequence
	$move , r0, 37
	$call , r23, stdio.__write_byte_and_flush_if_needed
	$move , r0, 99
	$call , r23, stdio.__write_byte_and_flush_if_needed
	$move , r0, 0
	$call , r23, stdio.__write_byte_and_flush_if_needed
	$and , r0, r14, 255
	$call , r23, stdio.__write_byte_and_flush_if_needed
	$call , r23, stdio.__finalized_print_sequence
	$call , r23, stdio.__close_print_sequence
	$ld , d14, r22,  - 16
	$ld , d22, r22,  - 8
	$jump , r23
stdio..Lfunc_end3:
	$size,	putchar, stdio..Lfunc_end3 - putchar
	$section,	%stack_sizes,"o",@progbits,%text, putchar
	$long,	stdio..Lfunc_begin3
	$byte,	16
	$section,	%text, putchar,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, stdio.__open_print_sequence,"ax",@progbits
	$type,	stdio.__open_print_sequence,@function //  -  -  Begin function stdio.__open_print_sequence
stdio.__open_print_sequence:                  // @stdio.__open_print_sequence
stdio..Lfunc_begin4:
// %bb.0:
	// inline asm
stdio..Ltmp0:
	$acquire , zero, __atomic_bit___stdout_buffer_lock, nz, stdio..Ltmp0
	// inline asm
	$move , r0, stdio.__stdout_cache_write_index
	$lw , r1, zero, __stdout_buffer_state
	$sw , r0, 0, 0
	$move , r0, stdio.__stdout_nr_of_wrapping
	$sw , r0, 0, 0
	$sw , zero, stdio.__stdout_buffer_write_pointer_initial, r1
	$jump , r23
stdio..Lfunc_end4:
	$size,	stdio.__open_print_sequence, stdio..Lfunc_end4 - stdio.__open_print_sequence
	$section,	%stack_sizes,"o",@progbits,%text, stdio.__open_print_sequence
	$long,	stdio..Lfunc_begin4
	$byte,	0
	$section,	%text, stdio.__open_print_sequence,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, stdio.__transfer_cache_to_mram,"ax",@progbits
	$type,	stdio.__transfer_cache_to_mram,@function //  -  -  Begin function stdio.__transfer_cache_to_mram
stdio.__transfer_cache_to_mram:               // @stdio.__transfer_cache_to_mram
stdio..Lfunc_begin5:
// %bb.0:
	$lw , r0, zero, __stdout_buffer_state
	$lw , r1, zero, stdio.__stdout_buffer_size
	$add , r2, r0, 8
	$sw , zero, __stdout_buffer_state, r2
	$jltu , r2, r1, stdio..LBB5_2
// %bb.1:
	$lw , r1, zero, stdio.__stdout_nr_of_wrapping
	$move , r3, 0
	$move , r2, 1
	$sd , zero, __stdout_buffer_state, d2
	$add , r1, r1, 1
	$sw , zero, stdio.__stdout_nr_of_wrapping, r1
stdio..LBB5_2:
	$move , r1, stdio.__stdout_buffer
	$add , r0, r0, r1
	$move , r1, stdio.__stdout_cache_buffer
	$sdma , r1, r0, 0
	$jump , r23
stdio..Lfunc_end5:
	$size,	stdio.__transfer_cache_to_mram, stdio..Lfunc_end5 - stdio.__transfer_cache_to_mram
	$section,	%stack_sizes,"o",@progbits,%text, stdio.__transfer_cache_to_mram
	$long,	stdio..Lfunc_begin5
	$byte,	0
	$section,	%text, stdio.__transfer_cache_to_mram,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, stdio.__finalized_print_sequence,"ax",@progbits
	$type,	stdio.__finalized_print_sequence,@function //  -  -  Begin function stdio.__finalized_print_sequence
stdio.__finalized_print_sequence:             // @stdio.__finalized_print_sequence
stdio..Lfunc_begin6:
// %bb.0:
	$sd , r22, 0, d22
	$add , r22, r22, 8
	$lw , r1, zero, stdio.__stdout_cache_write_index
	$move , r0, stdio.__stdout_cache_buffer
	$add , r0, r0, r1
	$sub , r2, 8, r1
	$move , r1, 0
	$call , r23, memset
	$call , r23, stdio.__transfer_cache_to_mram
	$lw , r0, zero, stdio.__stdout_nr_of_wrapping
	$jgtu , r0, 1, stdio..LBB6_3
// %bb.1:
	$jneq , r0, 1, stdio..LBB6_4
// %bb.2:
	$lw , r0, zero, __stdout_buffer_state
	$lw , r1, zero, stdio.__stdout_buffer_write_pointer_initial
	$jleu , r0, r1, stdio..LBB6_4
stdio..LBB6_3:
	// inline asm
	$fault , 5
	// inline asm
stdio..LBB6_4:
	$ld , d22, r22,  - 8
	$jump , r23
stdio..Lfunc_end6:
	$size,	stdio.__finalized_print_sequence, stdio..Lfunc_end6 - stdio.__finalized_print_sequence
	$section,	%stack_sizes,"o",@progbits,%text, stdio.__finalized_print_sequence
	$long,	stdio..Lfunc_begin6
	$byte,	8
	$section,	%text, stdio.__finalized_print_sequence,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, stdio.__close_print_sequence,"ax",@progbits
	$type,	stdio.__close_print_sequence,@function //  -  -  Begin function stdio.__close_print_sequence
stdio.__close_print_sequence:                 // @stdio.__close_print_sequence
stdio..Lfunc_begin7:
// %bb.0:
	// inline asm
stdio..Ltmp1:
	$release , zero, __atomic_bit___stdout_buffer_lock, nz, stdio..Ltmp1 + 1
	// inline asm
	$jump , r23
stdio..Lfunc_end7:
	$size,	stdio.__close_print_sequence, stdio..Lfunc_end7 - stdio.__close_print_sequence
	$section,	%stack_sizes,"o",@progbits,%text, stdio.__close_print_sequence
	$long,	stdio..Lfunc_begin7
	$byte,	0
	$section,	%text, stdio.__close_print_sequence,"ax",@progbits
                                        //  -  -  End function
	$type,	stdio.__stdout_buffer_size,@object    // @stdio.__stdout_buffer_size
	$section,	%data, stdio.__stdout_buffer_size,"aw",@progbits
	$weak,	stdio.__stdout_buffer_size
	$p2align,	2
stdio.__stdout_buffer_size:
	$long,	1048576                         // 0x100000
	$size,	stdio.__stdout_buffer_size, 4

	$type,	stdio.__stdout_buffer,@object         // @stdio.__stdout_buffer
	$section,	%mram, noinit,"aw",@progbits
	$weak,	stdio.__stdout_buffer
	$p2align,	3
stdio.__stdout_buffer:
	$zero,	1048576
	$size,	stdio.__stdout_buffer, 1048576

	$type,	__stdout_buffer_state,@object   // @__stdout_buffer_state
	$section,	%data, immediate_memory.__stdout_buffer_state,"aw",@progbits
	$globl,	__stdout_buffer_state
	$p2align,	3
__stdout_buffer_state:
	$zero,	8
	$size,	__stdout_buffer_state, 8

	$type,	__atomic_bit___stdout_buffer_lock,@object // @__atomic_bit___stdout_buffer_lock
	$section,	%atomic,"aw",@progbits
	$globl,	__atomic_bit___stdout_buffer_lock
__atomic_bit___stdout_buffer_lock:
	$byte,	0                               // 0x0
	$size,	__atomic_bit___stdout_buffer_lock, 1

	$type,	stdio.__stdout_cache_write_index,@object // @stdio.__stdout_cache_write_index
	$section,	%bss, stdio.__stdout_cache_write_index,"aw",@nobits
	$p2align,	2
stdio.__stdout_cache_write_index:
	$long,	0                               // 0x0
	$size,	stdio.__stdout_cache_write_index, 4

	$type,	stdio.__stdout_nr_of_wrapping,@object // @stdio.__stdout_nr_of_wrapping
	$section,	%bss, stdio.__stdout_nr_of_wrapping,"aw",@nobits
	$p2align,	2
stdio.__stdout_nr_of_wrapping:
	$long,	0                               // 0x0
	$size,	stdio.__stdout_nr_of_wrapping, 4

	$type,	stdio.__stdout_buffer_write_pointer_initial,@object // @stdio.__stdout_buffer_write_pointer_initial
	$section,	%bss, stdio.__stdout_buffer_write_pointer_initial,"aw",@nobits
	$p2align,	2
stdio.__stdout_buffer_write_pointer_initial:
	$long,	0                               // 0x0
	$size,	stdio.__stdout_buffer_write_pointer_initial, 4

	$type,	stdio.__stdout_cache_buffer,@object   // @stdio.__stdout_cache_buffer
	$section,	%bss, stdio.__stdout_cache_buffer,"aw",@nobits
	$p2align,	3
stdio.__stdout_cache_buffer:
	$zero,	8
	$size,	stdio.__stdout_cache_buffer, 8

	$addrsig,
	$addrsig_sym, stdio.__stdout_buffer
	$addrsig_sym, __stdout_buffer_state
	$addrsig_sym, __atomic_bit___stdout_buffer_lock
	$addrsig_sym, stdio.__stdout_cache_buffer
	$text,
	$file,	"kernel.c"
$section,	%text, boot_me,"ax",@progbits
	$globl,	boot_me                //  -  -  Begin function boot_me
	$type,	boot_me,@function
boot_me:      ///beginin of kernel code
	$nop ,
	$move , r1, 0
	$ldmai , zero,r1, 1 //load the jump syscall into addr 0 (for user) 
	$jump , r23  //will never return 
	$jump , main      
	$jump , syscall    //parse by the mram_creator and write at 0 in MRAM.
	$move , r0, r23            //error
	$call , r23, __end_process
$section,	%text, stop_me,"ax",@progbits
	$globl,	stop_me                //  -  -  Begin function stop_me
	$type,	stop_me,@function
stop_me:  //save the flow context in the stack and save the stack offset in r0 and stop. resume function will restart after this function
	$stop ,
	$jump , r23
$section,	%text, swap_context,"ax",@progbits
	$globl,	swap_context               //  -  -  Begin function 	$globl,	swap_context           
	$type,	swap_context,@function
swap_context: //Save the current flow context inside the stack (and store stack offset in r0), load the new stack (store in r1) and restore the flow context contain in it. 
	$sd , r22, 0, d14
	$sd , r22, 8, d16
	$sd , r22, 16, d18
	$sd , r22, 24, d20
	$sd , r22, 32, d22
	$sw , r0, 0, r22   //save the stack inside r0
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 
	$move , r22, r1 //saveback the stack save in r1
	$ld , d14, r22, 0
	$ld , d16, r22, 8
	$ld , d18, r22, 16
	$ld , d20, r22, 24
	$ld , d22, r22, 32 //æ¢å¤å°ä¹åçä½ç½®
	$jump , r23
$section,	%text, first_swap_context,"ax",@progbits
	$globl,	first_swap_context               //  -  -  Begin function 	$globl,	first_swap_context           
	$type,	first_swap_context,@function
first_swap_context: //Same that swap_context but there are 3 parameters the last one if the place to jump
	$sd , r22, 0, d14
	$sd , r22, 8, d16
	$sd , r22, 16, d18
	$sd , r22, 24, d20
	$sd , r22, 32, d22
	$sw , r0, 0, r22   //save the stack inside r0
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 
	$move , r22, r1 //saveback the stack save in r1
	$ld , d14, r22, 0
	$ld , d16, r22, 8
	$ld , d18, r22, 16
	$ld , d20, r22, 24
	$ld , d22, r22, 32
	$jump , r2
$section,	%text, jmp_mram,"ax",@progbits
	$globl,	jmp_mram             //  -  -  Begin function 	$globl,	jmp_mram         
	$type,	jmp_mram,@function
jmp_mram: 
	$jump , syscall
$section,	%text, resume_me,"ax",@progbits
	$globl, resume_me
	$type,	resume_me,@function
resume_me:   //restore the flow context store in r1 and continue the execution after the stop. This function will never returns
	$move , r22, r0 
	$move , r0, r23
	$ld , d14, r22, 0
	$ld , d16, r22, 8
	$ld , d18, r22, 16
	$ld , d20, r22, 24
	$ld , d22, r22, 32
	$jump , r0
$section,	%text, me_new,"ax",@progbits
	$globl, me_new
	$type,	me_new,@function
me_new:                                 // @me_new
// %bb.0:
	$move , r0, 0
	// inline asm
	$move , r0, id
	// inline asm
	$jump , r23
$section,	%text, wake_up_one,"ax",@progbits
	$globl, wake_up_one
	$type,	wake_up_one,@function
wake_up_one:
	$move , r1, 0
wake_up_one_start:
	$jeq , r0, r1, wake_up_one_end
	$resume , r1, 0, nz, wake_up_one_start + 3 
	$jump , wake_up_one_end
	$add , r1, r1, 1
	$jump , wake_up_one_start
wake_up_one_end:
	$jump , r23
	$section,	%text, print_debug,"ax",@progbits
$section,	%text, fault_notif,"ax",@progbits
	$globl,	fault_notif                         //  -  -  Begin function syscall
	$type,	fault_notif,@function
fault_notif:                                // @syscall
// %bb.0:
	$fault , 1
$section,	%text, print_debug,"ax",@progbits
	$globl,	print_debug                         //  -  -  Begin function syscall
	$type,	print_debug,@function
print_debug:                                // @syscall
// %bb.0:
	$add , r1, r1, 8
	$time_cfg , r0,r1
	$jump , r23
	$section,	%text, sp_wait,"ax",@progbits
	$globl,	sp_wait                         //  -  -  Begin function sp_wait
	$type,	sp_wait,@function
sp_wait:                                // @sp_wait
.Lfunc_begin0:
// %bb.0:
	$sd , r22, 8, d22
	$add , r22, r22, 16
	$sd , r22,  - 16, d14
	$move , r14, r0
	$lw , r0, r14, 4
	// inline asm
.Ltmp0:
	$acquire , r0, 0, nz, .Ltmp0
	// inline asm
	$call , r23, me_new
	$lbs , r1, r14, 1
	$add , r1, r1, 1
	$sb , r14, 1, r1
	$lbu , r3, r14, 0
	$and , r2, r1, 255
	$jneq , r2, r3, .LBB0_7
// %bb.1:
	$sb , r14, 2, 0
	$jeq , r2, 0, .LBB0_6
// %bb.2:
	$and , r0, r0, 255
	$move , r2, 0, true, .LBB0_3
.LBB0_5:                                //   in Loop: Header=BB0_3 Depth=1
	$add , r2, r2, 1
	$and , r3, r1, 255
	$jgeu , r2, r3, .LBB0_6
.LBB0_3:                                // =>This Inner Loop Header: Depth=1
	$jeq , r0, r2, .LBB0_5
// %bb.4:                               //   in Loop: Header=BB0_3 Depth=1
	// inline asm
.Ltmp1:
	$resume , r2, 0, nz, .Ltmp1 + 0
	// inline asm
	$lbs , r1, r14, 0
	$jump , .LBB0_5
.LBB0_7:
	$lw , r0, r14, 4
	// inline asm
.Ltmp2:
	$release , r0, 0, nz, .Ltmp2 + 1
	// inline asm
	// inline asm
	$stop , false, 0x0
	// inline asm
	$lbu , r0, r14, 2
	$jump , .LBB0_8
.LBB0_6:
	$sb , r14, 1, 0
	$lw , r0, r14, 4
	// inline asm
.Ltmp3:
	$release , r0, 0, nz, .Ltmp3 + 1
	// inline asm
	$move , r0, 0
.LBB0_8:
	$ld , d14, r22,  - 16
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end0:
	$size,	sp_wait, .Lfunc_end0 - sp_wait
	$section,	%stack_sizes,"o",@progbits,%text, sp_wait
	$long,	.Lfunc_begin0
	$byte,	16
	$section,	%text, sp_wait,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, abnormal_wakeup,"ax",@progbits
	$globl,	abnormal_wakeup                 //  -  -  Begin function abnormal_wakeup
	$type,	abnormal_wakeup,@function
abnormal_wakeup:                        // @abnormal_wakeup
.Lfunc_begin1:
// %bb.0:
	$lw , r1, r0, 4
	// inline asm
.Ltmp4:
	$acquire , r1, 0, nz, .Ltmp4
	// inline asm
	$sb , r0, 2, 1
	$lbu , r1, r0, 0
	$jeq , r1, 0, .LBB1_3
// %bb.1:
	$move , r1, 0
.LBB1_2:                                // =>This Inner Loop Header: Depth=1
	// inline asm
.Ltmp5:
	$resume , r1, 0, nz, .Ltmp5 + 1
	// inline asm
	$lbu , r2, r0, 0
	$add , r1, r1, 1
	$jltu , r1, r2, .LBB1_2
.LBB1_3:
	$sb , r0, 1, 0
	$lw , r0, r0, 4
	// inline asm
.Ltmp6:
	$release , r0, 0, nz, .Ltmp6 + 1
	// inline asm
	$jump , r23
.Lfunc_end1:
	$size,	abnormal_wakeup, .Lfunc_end1 - abnormal_wakeup
	$section,	%stack_sizes,"o",@progbits,%text, abnormal_wakeup
	$long,	.Lfunc_begin1
	$byte,	0
	$section,	%text, abnormal_wakeup,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, abnormal_wakeup_one,"ax",@progbits
	$globl,	abnormal_wakeup_one             //  -  -  Begin function abnormal_wakeup_one
	$type,	abnormal_wakeup_one,@function
abnormal_wakeup_one:                    // @abnormal_wakeup_one
.Lfunc_begin2:
// %bb.0:
	$sd , r22, 8, d22
	$add , r22, r22, 16
	$sd , r22,  - 16, d14
	$move , r14, r0
	$lw , r0, r14, 4
	// inline asm
.Ltmp7:
	$acquire , r0, 0, nz, .Ltmp7
	// inline asm
	$lbu , r0, r14, 1
	$jeq , r0, 0, .LBB2_2
// %bb.1:
	$sb , r14, 2, 1
	$add , r0, r0,  - 1
	$sb , r14, 1, r0
	$lbu , r0, r14, 0
	$call , r23, wake_up_one
.LBB2_2:
	$lw , r0, r14, 4
	// inline asm
.Ltmp8:
	$release , r0, 0, nz, .Ltmp8 + 1
	// inline asm
	$ld , d14, r22,  - 16
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end2:
	$size,	abnormal_wakeup_one, .Lfunc_end2 - abnormal_wakeup_one
	$section,	%stack_sizes,"o",@progbits,%text, abnormal_wakeup_one
	$long,	.Lfunc_begin2
	$byte,	16
	$section,	%text, abnormal_wakeup_one,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, swap_scheduler,"ax",@progbits
	$globl,	swap_scheduler                  //  -  -  Begin function swap_scheduler
	$type,	swap_scheduler,@function
swap_scheduler:                         // @swap_scheduler
.Lfunc_begin3:
// %bb.0:
	$sd , r22, 8, d22
	$add , r22, r22, 16
	$sd , r22,  - 16, d14
	$call , r23, me_new
	$lbu , r0, r0, cur_jobs
	$lsl , r1, r0, 2
	$lsl_add , r0, r1, r0, 4
	$move , r1, jobs
	$add , r0, r1, r0
	$add , r14, r0, 16
	$call , r23, me_new
	$lsl , r0, r0, 2
	$lw , r1, r0, fc_scheduler_job
	$move , r0, r14
	$call , r23, swap_context
	$ld , d14, r22,  - 16
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end3:
	$size,	swap_scheduler, .Lfunc_end3 - swap_scheduler
	$section,	%stack_sizes,"o",@progbits,%text, swap_scheduler
	$long,	.Lfunc_begin3
	$byte,	16
	$section,	%text, swap_scheduler,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, __end_child_jobs,"ax",@progbits
	$globl,	__end_child_jobs                //  -  -  Begin function __end_child_jobs
	$type,	__end_child_jobs,@function
__end_child_jobs:                       // @__end_child_jobs
.Lfunc_begin4:
// %bb.0:
	$sd , r22, 8, d22
	$add , r22, r22, 16
	$sd , r22,  - 16, d14
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp9:
	$acquire , r0, 0, nz, .Ltmp9
	// inline asm
	$call , r23, me_new
	$lbu , r0, r0, cur_jobs
	$lsl , r1, r0, 2
	$lw , r2, zero, mutex_jobs
	$lsl_add , r0, r1, r0, 4
	$move , r1, 4
	$sb , r0, jobs, r1
	// inline asm
.Ltmp10:
	$release , r2, 0, nz, .Ltmp10 + 1
	// inline asm
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp11:
	$acquire , r0, 0, nz, .Ltmp11
	// inline asm
	$lw , r0, zero, cur_process_index
	$jeq , r0, 0, .LBB4_1
// %bb.13:
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp12:
	$acquire , r0, 0, nz, .Ltmp12
	// inline asm
	$lw , r1, zero, cur_process_index
	$move , r0, 1
	$jeq , r1, 1, .LBB4_2
// %bb.14:
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp13:
	$acquire , r0, 0, nz, .Ltmp13
	// inline asm
	$lw , r1, zero, cur_process_index
	$move , r0, 2
	$jeq , r1, 2, .LBB4_2
// %bb.15:
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp14:
	$acquire , r0, 0, nz, .Ltmp14
	// inline asm
	$lw , r1, zero, cur_process_index
	$move , r0, 3
	$jeq , r1, 3, .LBB4_2
// %bb.16:
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp15:
	$acquire , r0, 0, nz, .Ltmp15
	// inline asm
	$lw , r1, zero, cur_process_index
	$move , r0, 4
	$jeq , r1, 4, .LBB4_2
// %bb.17:
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp16:
	$acquire , r0, 0, nz, .Ltmp16
	// inline asm
	$lw , r1, zero, cur_process_index
	$move , r0, 5
	$jeq , r1, 5, .LBB4_2
// %bb.18:
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp17:
	$acquire , r0, 0, nz, .Ltmp17
	// inline asm
	$lw , r1, zero, cur_process_index
	$move , r0, 6
	$jeq , r1, 6, .LBB4_2
// %bb.19:
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp18:
	$acquire , r0, 0, nz, .Ltmp18
	// inline asm
	$lw , r1, zero, cur_process_index
	$move , r0, 7
	$jeq , r1, 7, .LBB4_2
// %bb.20:
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp19:
	$acquire , r0, 0, nz, .Ltmp19
	// inline asm
	$lw , r1, zero, cur_process_index
	$move , r0, 8
	$jeq , r1, 8, .LBB4_2
// %bb.21:
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp20:
	$acquire , r0, 0, nz, .Ltmp20
	// inline asm
	$lw , r1, zero, cur_process_index
	$move , r0, 9
	$jeq , r1, 9, .LBB4_2
// %bb.22:
	$lw , r0, zero, cur_process_index
	$lsl , r1, r0, 4
	$lsl_add , r1, r1, r0, 11
	$lsl_sub , r0, r1, r0, 6
	$add , r0, r0, 651280
	$move , r1, jobs
	$ldma , r1, r0, 249
	$jump , .LBB4_9
.LBB4_1:
	$move , r0, 0
.LBB4_2:
	$lsl , r1, r0, 4
	$lsl_add , r0, r1, r0, 6
	$move , r1, processs
	$add , r0, r1, r0
	$lbu , r0, r0, 2
	$jeq , r0, 0, .LBB4_8
// %bb.3:
	$move , r1, 0, true, .LBB4_4
.LBB4_7:                                //   in Loop: Header=BB4_4 Depth=1
	$add , r1, r1, 1
	$jgeu , r1, r0, .LBB4_8
.LBB4_4:                                // =>This Inner Loop Header: Depth=1
	$lsl , r2, r1, 2
	$lsl_add , r2, r2, r1, 4
	$lbu , r3, r2, jobs
	$jneq , r3, 6, .LBB4_7
// %bb.5:                               //   in Loop: Header=BB4_4 Depth=1
	$move , r3, jobs
	$add , r2, r3, r2
	$lw , r2, r2, 8
	$jneq , r2, r3, .LBB4_7
// %bb.6:                               //   in Loop: Header=BB4_4 Depth=1
	$lsl , r2, r1, 2
	$lsl_add , r2, r2, r1, 4
	$move , r3, 3
	$sb , r2, jobs, r3
	$jump , .LBB4_7
.LBB4_8:
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp21:
	$release , r0, 0, nz, .Ltmp21 + 1
	// inline asm
.LBB4_9:
	$move , r0, cp
	$lw , r1, r0, 4
	// inline asm
.Ltmp22:
	$acquire , r1, 0, nz, .Ltmp22
	// inline asm
	$sb , r0, 2, 1
	$lbu , r1, zero, cp
	$jeq , r1, 0, .LBB4_12
// %bb.10:
	$move , r1, 0
.LBB4_11:                               // =>This Inner Loop Header: Depth=1
	// inline asm
.Ltmp23:
	$resume , r1, 0, nz, .Ltmp23 + 1
	// inline asm
	$lbu , r2, zero, cp
	$add , r1, r1, 1
	$jltu , r1, r2, .LBB4_11
.LBB4_12:
	$sb , r0, 1, 0
	$lw , r0, r0, 4
	// inline asm
.Ltmp24:
	$release , r0, 0, nz, .Ltmp24 + 1
	// inline asm
	$call , r23, me_new
	$lbu , r0, r0, cur_jobs
	$lsl , r1, r0, 2
	$lsl_add , r0, r1, r0, 4
	$move , r1, jobs
	$add , r0, r1, r0
	$add , r14, r0, 16
	$call , r23, me_new
	$lsl , r0, r0, 2
	$lw , r1, r0, fc_scheduler_job
	$move , r0, r14
	$call , r23, swap_context
	$ld , d14, r22,  - 16
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end4:
	$size,	__end_child_jobs, .Lfunc_end4 - __end_child_jobs
	$section,	%stack_sizes,"o",@progbits,%text, __end_child_jobs
	$long,	.Lfunc_begin4
	$byte,	16
	$section,	%text, __end_child_jobs,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, wakeup,"ax",@progbits
	$globl,	wakeup                          //  -  -  Begin function wakeup
	$type,	wakeup,@function
wakeup:                                 // @wakeup
.Lfunc_begin5:
// %bb.0:
	$move , r3, 0, true, .LBB5_1
.LBB5_14:                               //   in Loop: Header=BB5_1 Depth=1
	$add , r3, r3, 1
	$jeq , r3, 10, .LBB5_15
.LBB5_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB5_6 Depth 2
	$lw , r4, zero, mutex_jobs
	// inline asm
.Ltmp25:
	$acquire , r4, 0, nz, .Ltmp25
	// inline asm
	$jeq , r1, 0, .LBB5_2
// %bb.3:                               //   in Loop: Header=BB5_1 Depth=1
	$lw , r4, zero, cur_process_index
	$jneq , r3, r4, .LBB5_14
	$jump , .LBB5_4
.LBB5_2:                                //   in Loop: Header=BB5_1 Depth=1
	$lsl , r4, r3, 4
	$lsl_add , r4, r4, r3, 11
	$lsl_sub , r4, r4, r3, 6
	$add , r4, r4, 651280
	$move , r5, jobs
	$ldma , r5, r4, 249
.LBB5_4:                                //   in Loop: Header=BB5_1 Depth=1
	$lsl , r4, r3, 4
	$lsl_add , r4, r4, r3, 6
	$move , r5, processs
	$add , r4, r5, r4
	$lbu , r4, r4, 2
	$jeq , r4, 0, .LBB5_12
// %bb.5:                               //   in Loop: Header=BB5_1 Depth=1
	$move , r5, 0, true, .LBB5_6
.LBB5_11:                               //   in Loop: Header=BB5_6 Depth=2
	$add , r5, r5, 1
	$jgeu , r5, r4, .LBB5_12
.LBB5_6:                                //   Parent Loop BB5_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	$lsl , r6, r5, 2
	$lsl_add , r6, r6, r5, 4
	$lbu , r7, r6, jobs
	$jneq , r7, 6, .LBB5_11
// %bb.7:                               //   in Loop: Header=BB5_6 Depth=2
	$move , r7, jobs
	$add , r6, r7, r6
	$lw , r6, r6, 8
	$jneq , r6, r0, .LBB5_11
// %bb.8:                               //   in Loop: Header=BB5_6 Depth=2
	$lsl , r6, r5, 2
	$lsl_add , r6, r6, r5, 4
	$move , r7, 3
	$sb , r6, jobs, r7
	$jneq , r1, 0, .LBB5_11
// %bb.9:                               //   in Loop: Header=BB5_6 Depth=2
	$lsl , r6, r3, 4
	$lsl_add , r6, r6, r3, 6
	$move , r7, processs
	$add , r6, r7, r6
	$lw , r7, r6, 8
	$jneq , r7, 5, .LBB5_11
// %bb.10:                              //   in Loop: Header=BB5_6 Depth=2
	$sw , r6, 8, 3
	$jump , .LBB5_11
.LBB5_12:                               //   in Loop: Header=BB5_1 Depth=1
	$lw , r4, zero, mutex_jobs
	// inline asm
.Ltmp26:
	$release , r4, 0, nz, .Ltmp26 + 1
	// inline asm
	$jneq , r1, 0, .LBB5_16
// %bb.13:                              //   in Loop: Header=BB5_1 Depth=1
	$lsl , r4, r3, 4
	$lsl_add , r4, r4, r3, 11
	$lsl_sub , r4, r4, r3, 6
	$add , r4, r4, 651280
	$move , r5, jobs
	$sdma , r5, r4, 249
	$jump , .LBB5_14
.LBB5_15:
	$lw , r0, zero, cur_process_index
	$lsl , r1, r0, 4
	$lsl_add , r1, r1, r0, 11
	$lsl_sub , r0, r1, r0, 6
	$add , r0, r0, 651280
	$move , r1, jobs
	$ldma , r1, r0, 249
.LBB5_16:
	$jeq , r2, 0, .LBB5_21
// %bb.17:
	$move , r0, cp
	$lw , r1, r0, 4
	// inline asm
.Ltmp27:
	$acquire , r1, 0, nz, .Ltmp27
	// inline asm
	$sb , r0, 2, 1
	$lbu , r1, zero, cp
	$jeq , r1, 0, .LBB5_20
// %bb.18:
	$move , r1, 0
.LBB5_19:                               // =>This Inner Loop Header: Depth=1
	// inline asm
.Ltmp28:
	$resume , r1, 0, nz, .Ltmp28 + 1
	// inline asm
	$lbu , r2, zero, cp
	$add , r1, r1, 1
	$jltu , r1, r2, .LBB5_19
.LBB5_20:
	$sb , r0, 1, 0
	$lw , r0, r0, 4
	// inline asm
.Ltmp29:
	$release , r0, 0, nz, .Ltmp29 + 1
	// inline asm
.LBB5_21:
	$move , r0, 0
	$jump , r23
.Lfunc_end5:
	$size,	wakeup, .Lfunc_end5 - wakeup
	$section,	%stack_sizes,"o",@progbits,%text, wakeup
	$long,	.Lfunc_begin5
	$byte,	0
	$section,	%text, wakeup,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, create_job,"ax",@progbits
	$globl,	create_job                      //  -  -  Begin function create_job
	$type,	create_job,@function
create_job:                             // @create_job
.Lfunc_begin6:
// %bb.0:
	$sd , r22, 16, d22
	$add , r22, r22, 24
	$sd , r22,  - 16, d14
	$sd , r22,  - 24, d16
	$move , r14, r0
	$call , r23, me_new
	$lbu , r0, r0, cur_jobs
	$lsl , r1, r0, 2
	$lsl_add , r0, r1, r0, 4
	$move , r1, jobs
	$add , r0, r1, r0
	$lbu , r0, r0, 1
	$move , r15,  - 15
	$jneq , r0, 0, .LBB6_19
// %bb.1:
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp30:
	$acquire , r0, 0, nz, .Ltmp30
	// inline asm
	$move , r16, 0
.LBB6_2:                                // =>This Inner Loop Header: Depth=1
	$lsl , r0, r16, 2
	$lsl_add , r0, r0, r16, 4
	$lbu , r1, r0, jobs
	$jeq , r1, 8, .LBB6_5
// %bb.3:                               //   in Loop: Header=BB6_2 Depth=1
	$add , r16, r16, 1
	$jneq , r16, 100, .LBB6_2
// %bb.4:
	$move , r16,  - 1, true, .LBB6_6
.LBB6_5:
	$move , r1, jobs
	$add , r0, r0, r1
	$lw , r0, r0, 4
	$jneq , r0, 0, .LBB6_10
.LBB6_6:
	$lw , r0, zero, mutex_sbrk
	// inline asm
.Ltmp31:
	$acquire , r0, 0, nz, .Ltmp31
	// inline asm
	$lw , r0, zero, cur_process_index
	$lsl , r1, r0, 4
	$lsl_add , r1, r1, r0, 6
	$move , r0, processs
	$add , r1, r0, r1
	$lw , r1, r1, 32
	$add , r1, r1, 512
	$move , r15,  - 2
	$lsr , r1, r1, 8
	$jgtu , r1, 510, .LBB6_8
// %bb.7:
	$lw , r1, zero, cur_process_index
	$lsl , r2, r1, 4
	$lsl_add , r1, r2, r1, 6
	$add , r1, r0, r1
	$lw , r2, r1, 32
	$add , r2, r2, 512
	$sw , r1, 32, r2
	$lw , r1, zero, cur_process_index
	$lsl , r2, r1, 4
	$lsl_add , r1, r2, r1, 6
	$add , r0, r0, r1
	$lw , r0, r0, 32
	$add , r15, r0, 512
	$jgts , r15,  - 1, .LBB6_9
.LBB6_8:
	$call , r23, fault_notif
.LBB6_9:
	$lw , r0, zero, mutex_sbrk
	// inline asm
.Ltmp32:
	$release , r0, 0, nz, .Ltmp32 + 1
	// inline asm
	$add , r0, r15,  - 512
.LBB6_10:
	$lw , r1, zero, cur_process_index
	$lsl , r2, r1, 4
	$lsl_add , r1, r2, r1, 6
	$move , r2, processs
	$add , r1, r2, r1
	$lbu , r15, r1, 2
	$add , r2, r15, 1
	$sb , r1, 2, r2
	$jeq , r16,  - 1, .LBB6_11
.LBB6_15:
	$lsl , r1, r16, 2
	$lsl_add , r1, r1, r16, 4
	$move , r2, jobs
	$add , r2, r2, r1
	$move , r3, 1
	$sb , r1, jobs, r3
	$sb , r2, 1, r15
	$sw , r2, 16, r0
	$sw , r2, 4, r0
	$sw , r0, 36, r0
	$move , r1, __end_child_jobs
	$sw , r0, 32, r1
	$sw , r0, 24, r14
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp33:
	$release , r0, 0, nz, .Ltmp33 + 1
	// inline asm
	$move , r14, cp
	$lw , r0, r14, 4
	// inline asm
.Ltmp34:
	$acquire , r0, 0, nz, .Ltmp34
	// inline asm
	$lbu , r0, r14, 1
	$jeq , r0, 0, .LBB6_17
// %bb.16:
	$sb , r14, 2, 1
	$add , r0, r0,  - 1
	$sb , r14, 1, r0
	$lbu , r0, zero, cp
	$call , r23, wake_up_one
.LBB6_17:
	$lw , r0, r14, 4
	// inline asm
.Ltmp35:
	$release , r0, 0, nz, .Ltmp35 + 1
	// inline asm
	$jump , .LBB6_19
.LBB6_11:
	$move , r16,  - 1
	$move , r2, jobs
.LBB6_12:                               // =>This Inner Loop Header: Depth=1
	$lsl , r1, r16, 2
	$lsl_add , r1, r1, r16, 4
	$add , r1, r2, r1
	$lbu , r1, r1, 20
	$add , r16, r16, 1
	$jeq , r1, 0, .LBB6_14
// %bb.13:                              //   in Loop: Header=BB6_12 Depth=1
	$jltu , r16, 99, .LBB6_12
.LBB6_14:
	$jeq , r1, 0, .LBB6_15
// %bb.18:
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp36:
	$release , r0, 0, nz, .Ltmp36 + 1
	// inline asm
	$move , r15,  - 16
.LBB6_19:
	$move , r0, r15
	$ld , d16, r22,  - 24
	$ld , d14, r22,  - 16
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end6:
	$size,	create_job, .Lfunc_end6 - create_job
	$section,	%stack_sizes,"o",@progbits,%text, create_job
	$long,	.Lfunc_begin6
	$byte,	24
	$section,	%text, create_job,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, sbrk,"ax",@progbits
	$globl,	sbrk                            //  -  -  Begin function sbrk
	$type,	sbrk,@function
sbrk:                                   // @sbrk
.Lfunc_begin7:
// %bb.0:
	$sd , r22, 8, d22
	$add , r22, r22, 16
	$sd , r22,  - 16, d14
	$lw , r1, zero, mutex_sbrk
	// inline asm
.Ltmp37:
	$acquire , r1, 0, nz, .Ltmp37
	// inline asm
	$jlts , r0, 1, .LBB7_2
// %bb.1:
	$lw , r1, zero, cur_process_index
	$lsl , r2, r1, 4
	$lsl_add , r1, r2, r1, 6
	$move , r2, processs
	$add , r1, r2, r1
	$lw , r1, r1, 32
	$add , r1, r1, r0
	$move , r14,  - 2
	$lsr , r1, r1, 8
	$jleu , r1, 510, .LBB7_4
	$jump , .LBB7_6
.LBB7_2:
	$jgts , r0,  - 1, .LBB7_5
// %bb.3:
	$lw , r1, zero, cur_process_index
	$lsl , r2, r1, 4
	$lsl_add , r1, r2, r1, 6
	$move , r2, processs
	$add , r1, r2, r1
	$lw , r1, r1, 32
	$lw , r3, zero, cur_process_index
	$lsl , r4, r3, 4
	$lsl_add , r3, r4, r3, 6
	$add , r2, r2, r3
	$lw , r2, r2, 44
	$add , r1, r1, r0
	$move , r14,  - 3
	$jltu , r1, r2, .LBB7_6
.LBB7_4:
	$lw , r1, zero, cur_process_index
	$lsl , r2, r1, 4
	$lsl_add , r1, r2, r1, 6
	$move , r2, processs
	$add , r1, r2, r1
	$lw , r2, r1, 32
	$add , r0, r2, r0
	$sw , r1, 32, r0
.LBB7_5:
	$lw , r0, zero, cur_process_index
	$lsl , r1, r0, 4
	$lsl_add , r0, r1, r0, 6
	$move , r1, processs
	$add , r0, r1, r0
	$lw , r0, r0, 32
	$add , r14, r0, 512
	$jgts , r14,  - 1, .LBB7_7
.LBB7_6:
	$call , r23, fault_notif
.LBB7_7:
	$lw , r0, zero, mutex_sbrk
	// inline asm
.Ltmp38:
	$release , r0, 0, nz, .Ltmp38 + 1
	// inline asm
	$move , r0, r14
	$ld , d14, r22,  - 16
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end7:
	$size,	sbrk, .Lfunc_end7 - sbrk
	$section,	%stack_sizes,"o",@progbits,%text, sbrk
	$long,	.Lfunc_begin7
	$byte,	16
	$section,	%text, sbrk,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, join_job,"ax",@progbits
	$globl,	join_job                        //  -  -  Begin function join_job
	$type,	join_job,@function
join_job:                               // @join_job
.Lfunc_begin8:
// %bb.0:
	$sd , r22, 16, d22
	$add , r22, r22, 24
	$sd , r22,  - 16, d14
	$sd , r22,  - 24, d16
	$lw , r0, zero, mutex_jobs
	$move , r15, 0
	// inline asm
.Ltmp39:
	$acquire , r0, 0, nz, .Ltmp39
	// inline asm
	$jump , .LBB8_1
.LBB8_6:                                //   in Loop: Header=BB8_1 Depth=1
	$call , r23, me_new
	$lbu , r0, r0, cur_jobs
	$lsl , r1, r0, 2
	$lsl_add , r0, r1, r0, 4
	$add , r0, r14, r0
	$add , r14, r0, 16
	$call , r23, me_new
	$lsl , r0, r0, 2
	$lw , r1, r0, fc_scheduler_job
	$move , r0, r14
	$call , r23, swap_context
.LBB8_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB8_2 Depth 2
	$move , r0, r15
.LBB8_2:                                //   Parent Loop BB8_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	$lsl , r1, r0, 2
	$lsl_add , r1, r1, r0, 4
	$lbu , r2, r1, jobs
	$jeq , r2, 4, .LBB8_7
// %bb.3:                               //   in Loop: Header=BB8_2 Depth=2
	$add , r0, r0, 1
	$jneq , r0, 100, .LBB8_2
// %bb.4:                               //   in Loop: Header=BB8_1 Depth=1
	$lw , r16, zero, mutex_jobs
	$call , r23, me_new
	$lbu , r0, r0, cur_jobs
	$lsl , r1, r0, 2
	$lsl_add , r0, r1, r0, 4
	$move , r14, jobs
	$add , r1, r14, r0
	$move , r2, 6
	$sb , r0, jobs, r2
	$sw , r1, 8, r14
	$jeq , r16, 0, .LBB8_6
// %bb.5:                               //   in Loop: Header=BB8_1 Depth=1
	// inline asm
.Ltmp40:
	$release , r16, 0, nz, .Ltmp40 + 1
	// inline asm
	$call , r23, me_new
	$lbu , r0, r0, cur_jobs
	$lsl , r1, r0, 2
	$lsl_add , r0, r1, r0, 4
	$add , r0, r14, r0
	$add , r14, r0, 16
	$call , r23, me_new
	$lsl , r0, r0, 2
	$lw , r1, r0, fc_scheduler_job
	$move , r0, r14
	$call , r23, swap_context
	// inline asm
.Ltmp41:
	$acquire , r16, 0, nz, .Ltmp41
	// inline asm
	$jump , .LBB8_1
.LBB8_7:
	$move , r0, jobs
	$add , r0, r0, r1
	$move , r2, 8
	$sb , r1, jobs, r2
	$lbu , r0, r0, 1
	$lw , r1, zero, mutex_jobs
	// inline asm
.Ltmp42:
	$release , r1, 0, nz, .Ltmp42 + 1
	// inline asm
	$ld , d16, r22,  - 24
	$ld , d14, r22,  - 16
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end8:
	$size,	join_job, .Lfunc_end8 - join_job
	$section,	%stack_sizes,"o",@progbits,%text, join_job
	$long,	.Lfunc_begin8
	$byte,	24
	$section,	%text, join_job,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, sleep,"ax",@progbits
	$globl,	sleep                           //  -  -  Begin function sleep
	$type,	sleep,@function
sleep:                                  // @sleep
.Lfunc_begin9:
// %bb.0:
	$sd , r22, 16, d22
	$add , r22, r22, 24
	$sd , r22,  - 16, d14
	$sd , r22,  - 24, d16
	$move , r14, r2
	$move , r15, r1
	$move , r16, r0
	$call , r23, me_new
	$lbu , r0, r0, cur_jobs
	$lsl , r1, r0, 2
	$lsl_add , r0, r1, r0, 4
	$move , r1, jobs
	$add , r1, r1, r0
	$move , r2, 6
	$sb , r0, jobs, r2
	$sw , r1, 8, r16
	$jeq , r15, 0, .LBB9_2
// %bb.1:
	$move , r0, r15
	$call , r23, unlock
.LBB9_2:
	$jeq , r14, 0, .LBB9_4
// %bb.3:
	// inline asm
.Ltmp43:
	$release , r14, 0, nz, .Ltmp43 + 1
	// inline asm
.LBB9_4:
	$call , r23, me_new
	$lbu , r0, r0, cur_jobs
	$lsl , r1, r0, 2
	$lsl_add , r0, r1, r0, 4
	$move , r1, jobs
	$add , r0, r1, r0
	$add , r16, r0, 16
	$call , r23, me_new
	$lsl , r0, r0, 2
	$lw , r1, r0, fc_scheduler_job
	$move , r0, r16
	$call , r23, swap_context
	$jeq , r15, 0, .LBB9_6
// %bb.5:
	$move , r0, r15
	$call , r23, lock
.LBB9_6:
	$jeq , r14, 0, .LBB9_8
// %bb.7:
	// inline asm
.Ltmp44:
	$acquire , r14, 0, nz, .Ltmp44
	// inline asm
.LBB9_8:
	$move , r0, 0
	$ld , d16, r22,  - 24
	$ld , d14, r22,  - 16
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end9:
	$size,	sleep, .Lfunc_end9 - sleep
	$section,	%stack_sizes,"o",@progbits,%text, sleep
	$long,	.Lfunc_begin9
	$byte,	24
	$section,	%text, sleep,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, swap,"ax",@progbits
	$globl,	swap                            //  -  -  Begin function swap
	$type,	swap,@function
swap:                                   // @swap
.Lfunc_begin10:
// %bb.0:
	$sd , r22, 16, d22
	$add , r22, r22, 24
	$sd , r22,  - 16, d14
	$sd , r22,  - 24, d16
	$move , r14, r1
	$move , r15, r0
	$lsl , r0, r15, 2
	$lsl_add , r0, r0, r15, 4
	$move , r1, jobs
	$lw , r2, zero, mutex_jobs
	$add , r16, r1, r0
	$move , r1, 2
	$sb , r0, jobs, r1
	// inline asm
.Ltmp45:
	$release , r2, 0, nz, .Ltmp45 + 1
	// inline asm
	$call , r23, me_new
	$sb , r0, cur_jobs, r15
	// inline asm
	$time , r0

	// inline asm
	$sw , r16, 12, r0
	$jeq , r14, 0, .LBB10_2
// %bb.1:
	$move , r0, 6
	$move , r1, 0
	$call , r23, print_debug
	$call , r23, me_new
	$lw , r1, r16, 16
	$lw , r2, r1, 24
	$move , r3, fc_scheduler_job
	$lsl_add , r0, r3, r0, 2
	$call , r23, first_swap_context
	$jump , .LBB10_3
.LBB10_2:
	$call , r23, me_new
	$lw , r1, r16, 16
	$move , r2, fc_scheduler_job
	$lsl_add , r0, r2, r0, 2
	$call , r23, swap_context
.LBB10_3:
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp46:
	$acquire , r0, 0, nz, .Ltmp46
	// inline asm
	$ld , d16, r22,  - 24
	$ld , d14, r22,  - 16
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end10:
	$size,	swap, .Lfunc_end10 - swap
	$section,	%stack_sizes,"o",@progbits,%text, swap
	$long,	.Lfunc_begin10
	$byte,	24
	$section,	%text, swap,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, check_time_process,"ax",@progbits
	$globl,	check_time_process              //  -  -  Begin function check_time_process
	$type,	check_time_process,@function
check_time_process:                     // @check_time_process
.Lfunc_begin11:
// %bb.0:
	// inline asm
	$time , r0

	// inline asm
	$lw , r1, zero, cur_process_index
	$lsl , r2, r1, 4
	$lsl_add , r1, r2, r1, 6
	$move , r2, processs
	$add , r1, r2, r1
	$lw , r1, r1, 20
	$sub , r0, r0, r1
	$move , r1, 50000
	$sub , r0, r0, r1, gtu
	$jump , r23
.Lfunc_end11:
	$size,	check_time_process, .Lfunc_end11 - check_time_process
	$section,	%stack_sizes,"o",@progbits,%text, check_time_process
	$long,	.Lfunc_begin11
	$byte,	0
	$section,	%text, check_time_process,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, scheduler_jobs,"ax",@progbits
	$globl,	scheduler_jobs                  //  -  -  Begin function scheduler_jobs
	$type,	scheduler_jobs,@function
scheduler_jobs:                         // @scheduler_jobs
.Lfunc_begin12:
// %bb.0:
	$sd , r22, 16, d22
	$add , r22, r22, 24
	$sd , r22,  - 16, d14
	$sd , r22,  - 24, d16
	$move , r14, cp
	$lw , r0, r14, 4
	// inline asm
.Ltmp47:
	$acquire , r0, 0, nz, .Ltmp47
	// inline asm
	$call , r23, me_new
	$lbs , r1, r14, 1
	$add , r1, r1, 1
	$sb , r14, 1, r1
	$lbu , r3, zero, cp
	$and , r2, r1, 255
	$jneq , r2, r3, .LBB12_7
// %bb.1:
	$sb , r14, 2, 0
	$jeq , r2, 0, .LBB12_6
// %bb.2:
	$and , r0, r0, 255
	$move , r2, 0, true, .LBB12_3
.LBB12_5:                               //   in Loop: Header=BB12_3 Depth=1
	$add , r2, r2, 1
	$and , r3, r1, 255
	$jgeu , r2, r3, .LBB12_6
.LBB12_3:                               // =>This Inner Loop Header: Depth=1
	$jeq , r0, r2, .LBB12_5
// %bb.4:                               //   in Loop: Header=BB12_3 Depth=1
	// inline asm
.Ltmp48:
	$resume , r2, 0, nz, .Ltmp48 + 0
	// inline asm
	$lbs , r1, zero, cp
	$jump , .LBB12_5
.LBB12_7:
	$lw , r0, r14, 4
	// inline asm
.Ltmp49:
	$release , r0, 0, nz, .Ltmp49 + 1
	// inline asm
	// inline asm
	$stop , false, 0x0
	// inline asm
	$jump , .LBB12_8
.LBB12_6:
	$move , r0, cp
	$sb , r0, 1, 0
	$lw , r0, r0, 4
	// inline asm
.Ltmp50:
	$release , r0, 0, nz, .Ltmp50 + 1
	// inline asm
.LBB12_8:
	$move , r14, 0
	$move , r0, r14
	$move , r17, cp
	$jump , .LBB12_9
.LBB12_36:                              //   in Loop: Header=BB12_9 Depth=1
	$lw , r0, r15, 4
	// inline asm
.Ltmp51:
	$release , r0, 0, nz, .Ltmp51 + 1
	// inline asm
	// inline asm
	$stop , false, 0x0
	// inline asm
.LBB12_37:                              //   in Loop: Header=BB12_9 Depth=1
	$move , r0, all_end_or_waiting
	$sb , r0, 0, 1
	$move , r0, r14
.LBB12_9:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB12_12 Depth 2
                                        //     Child Loop BB12_23 Depth 2
                                        //     Child Loop BB12_32 Depth 2
	$lw , r1, zero, mutex_jobs
	// inline asm
.Ltmp52:
	$acquire , r1, 0, nz, .Ltmp52
	// inline asm
	$lw , r1, zero, cur_process_index
	$move , r15, processs
	$and , r0, r0, 255
	$jneq , r0, 0, .LBB12_18
// %bb.10:                              //   in Loop: Header=BB12_9 Depth=1
	$lsl , r0, r1, 4
	$lsl_add , r0, r0, r1, 6
	$add , r0, r15, r0
	$lbs , r0, r0, 2
	$and , r0, r0, 255
	$jeq , r0, 0, .LBB12_18
// %bb.11:                              //   in Loop: Header=BB12_9 Depth=1
	$move , r0, 1
.LBB12_12:                              //   Parent Loop BB12_9 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	$move , r16, r0
	$lsl , r0, r16, 2
	$lsl_add , r0, r0, r16, 4
	$move , r1, jobs
	$add , r0, r1, r0
	$lbu , r0, r0,  - 20
	$move , r1, 0
	$jeq , r0, 3, .LBB12_15
// %bb.13:                              //   in Loop: Header=BB12_12 Depth=2
	$jneq , r0, 1, .LBB12_16
// %bb.14:                              //   in Loop: Header=BB12_12 Depth=2
	$move , r1, 1
.LBB12_15:                              //   in Loop: Header=BB12_12 Depth=2
	$add , r0, r16,  - 1
	$call , r23, swap
	$move , r0, all_end_or_waiting
	$sb , r0, 0, 0
	// inline asm
	$time , r0

	// inline asm
	$lw , r1, zero, cur_process_index
	$lsl , r2, r1, 4
	$lsl_add , r1, r2, r1, 6
	$move , r2, processs
	$add , r1, r2, r1
	$lw , r1, r1, 20
	$sub , r0, r0, r1
	$move , r1, 50000
	$sub , r1, r0, r1, gtu
.LBB12_16:                              //   in Loop: Header=BB12_12 Depth=2
	$lw , r0, zero, cur_process_index
	$and , r1, r1, 255
	$jneq , r1, 0, .LBB12_18
// %bb.17:                              //   in Loop: Header=BB12_12 Depth=2
	$lsl , r1, r0, 4
	$lsl_add , r0, r1, r0, 6
	$move , r1, processs
	$add , r0, r1, r0
	$lbu , r1, r0, 2
	$add , r0, r16, 1
	$jltu , r16, r1, .LBB12_12
.LBB12_18:                              //   in Loop: Header=BB12_9 Depth=1
	// inline asm
	$time , r0

	// inline asm
	$lw , r1, zero, cur_process_index
	$lsl , r2, r1, 4
	$lsl_add , r1, r2, r1, 6
	$add , r1, r15, r1
	$lw , r1, r1, 20
	$lw , r2, zero, mutex_jobs
	$sub , r15, r0, r1
	$move , r16, 50000
	// inline asm
.Ltmp53:
	$release , r2, 0, nz, .Ltmp53 + 1
	// inline asm
	$jgtu , r15, r16, .LBB12_20
// %bb.19:                              //   in Loop: Header=BB12_9 Depth=1
	$lbs , r0, zero, all_end_or_waiting
	$and , r0, r0, 255
	$jeq , r0, 0, .LBB12_37
.LBB12_20:                              //   in Loop: Header=BB12_9 Depth=1
	$lw , r0, r17, 4
	// inline asm
.Ltmp54:
	$acquire , r0, 0, nz, .Ltmp54
	// inline asm
	$call , r23, me_new
	$lbs , r1, r17, 1
	$add , r1, r1, 1
	$sb , r17, 1, r1
	$lbu , r3, zero, cp
	$and , r2, r1, 255
	$jneq , r2, r3, .LBB12_27
// %bb.21:                              //   in Loop: Header=BB12_9 Depth=1
	$sb , r17, 2, 0
	$jeq , r2, 0, .LBB12_26
// %bb.22:                              //   in Loop: Header=BB12_9 Depth=1
	$and , r0, r0, 255
	$move , r2, 0, true, .LBB12_23
.LBB12_25:                              //   in Loop: Header=BB12_23 Depth=2
	$add , r2, r2, 1
	$and , r3, r1, 255
	$jgeu , r2, r3, .LBB12_26
.LBB12_23:                              //   Parent Loop BB12_9 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	$jeq , r0, r2, .LBB12_25
// %bb.24:                              //   in Loop: Header=BB12_23 Depth=2
	// inline asm
.Ltmp55:
	$resume , r2, 0, nz, .Ltmp55 + 0
	// inline asm
	$lbs , r1, zero, cp
	$jump , .LBB12_25
.LBB12_27:                              //   in Loop: Header=BB12_9 Depth=1
	$lw , r0, r17, 4
	// inline asm
.Ltmp56:
	$release , r0, 0, nz, .Ltmp56 + 1
	// inline asm
	// inline asm
	$stop , false, 0x0
	// inline asm
	$lbu , r1, r17, 2
	$sub , r0, r15, r16, gtu
	$jneq , r1, 0, .LBB12_9
// %bb.28:                              //   in Loop: Header=BB12_9 Depth=1
	$call , r23, me_new
	$jneq , r0, 0, .LBB12_29
	$jump , .LBB12_38
.LBB12_26:                              //   in Loop: Header=BB12_9 Depth=1
	$move , r0, cp
	$sb , r0, 1, 0
	$lw , r0, r0, 4
	// inline asm
.Ltmp57:
	$release , r0, 0, nz, .Ltmp57 + 1
	// inline asm
	$call , r23, me_new
	$jeq , r0, 0, .LBB12_38
.LBB12_29:                              //   in Loop: Header=BB12_9 Depth=1
	$move , r15, cp
	$lw , r0, r15, 4
	// inline asm
.Ltmp58:
	$acquire , r0, 0, nz, .Ltmp58
	// inline asm
	$call , r23, me_new
	$lbs , r1, r15, 1
	$add , r1, r1, 1
	$sb , r15, 1, r1
	$lbu , r3, zero, cp
	$and , r2, r1, 255
	$jneq , r2, r3, .LBB12_36
// %bb.30:                              //   in Loop: Header=BB12_9 Depth=1
	$sb , r15, 2, 0
	$jeq , r2, 0, .LBB12_35
// %bb.31:                              //   in Loop: Header=BB12_9 Depth=1
	$and , r0, r0, 255
	$move , r2, 0, true, .LBB12_32
.LBB12_34:                              //   in Loop: Header=BB12_32 Depth=2
	$add , r2, r2, 1
	$and , r3, r1, 255
	$jgeu , r2, r3, .LBB12_35
.LBB12_32:                              //   Parent Loop BB12_9 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	$jeq , r0, r2, .LBB12_34
// %bb.33:                              //   in Loop: Header=BB12_32 Depth=2
	// inline asm
.Ltmp59:
	$resume , r2, 0, nz, .Ltmp59 + 0
	// inline asm
	$lbs , r1, zero, cp
	$jump , .LBB12_34
.LBB12_35:                              //   in Loop: Header=BB12_9 Depth=1
	$move , r0, cp
	$sb , r0, 1, 0
	$lw , r0, r0, 4
	// inline asm
.Ltmp60:
	$release , r0, 0, nz, .Ltmp60 + 1
	// inline asm
	$jump , .LBB12_37
.LBB12_38:
	$lbu , r0, zero, all_end_or_waiting
	$ld , d16, r22,  - 24
	$ld , d14, r22,  - 16
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end12:
	$size,	scheduler_jobs, .Lfunc_end12 - scheduler_jobs
	$section,	%stack_sizes,"o",@progbits,%text, scheduler_jobs
	$long,	.Lfunc_begin12
	$byte,	24
	$section,	%text, scheduler_jobs,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, try_lock,"ax",@progbits
	$globl,	try_lock                        //  -  -  Begin function try_lock
	$type,	try_lock,@function
try_lock:                               // @try_lock
.Lfunc_begin13:
// %bb.0:
	$sd , r22, 8, d22
	$add , r22, r22, 16
	$sd , r22,  - 16, d14
	$move , r14, r0
	$call , r23, me_new
	$lw , r1, zero, mutex_l
	// inline asm
.Ltmp61:
	$acquire , r1, 0, nz, .Ltmp61
	// inline asm
	$lw , r1, zero, mutex_jobs
	// inline asm
.Ltmp62:
	$acquire , r1, 0, nz, .Ltmp62
	// inline asm
	$lw , r1, r14, 0
	$jeq , r1,  - 1, .LBB13_2
// %bb.1:
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp63:
	$release , r0, 0, nz, .Ltmp63 + 1
	// inline asm
	$lw , r0, zero, mutex_l
	// inline asm
.Ltmp64:
	$release , r0, 0, nz, .Ltmp64 + 1
	// inline asm
	$move , r0, 1, true, .LBB13_3
.LBB13_2:
	$lbu , r0, r0, cur_jobs
	$sw , r14, 0, r0
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp65:
	$release , r0, 0, nz, .Ltmp65 + 1
	// inline asm
	$lw , r0, zero, mutex_l
	// inline asm
.Ltmp66:
	$release , r0, 0, nz, .Ltmp66 + 1
	// inline asm
	$move , r0, 0
.LBB13_3:
	$ld , d14, r22,  - 16
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end13:
	$size,	try_lock, .Lfunc_end13 - try_lock
	$section,	%stack_sizes,"o",@progbits,%text, try_lock
	$long,	.Lfunc_begin13
	$byte,	16
	$section,	%text, try_lock,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, lock,"ax",@progbits
	$globl,	lock                            //  -  -  Begin function lock
	$type,	lock,@function
lock:                                   // @lock
.Lfunc_begin14:
// %bb.0:
	$sd , r22, 8, d22
	$add , r22, r22, 16
	$sd , r22,  - 16, d14
	$move , r14, r0
	$call , r23, me_new
	$lw , r1, zero, mutex_l
	$lbu , r0, r0, cur_jobs
	// inline asm
.Ltmp67:
	$acquire , r1, 0, nz, .Ltmp67
	// inline asm
	$lw , r1, zero, mutex_jobs
	// inline asm
.Ltmp68:
	$acquire , r1, 0, nz, .Ltmp68
	// inline asm
	$lw , r1, r14, 0
	$jeq , r1,  - 1, .LBB14_2
// %bb.1:
	$lsl , r1, r0, 2
	$lsl_add , r0, r1, r0, 4
	$move , r15, jobs
	$add , r1, r15, r0
	$lw , r2, zero, mutex_jobs
	$move , r3, 5
	$sb , r0, jobs, r3
	$sw , r1, 8, r14
	// inline asm
.Ltmp69:
	$release , r2, 0, nz, .Ltmp69 + 1
	// inline asm
	$lw , r0, zero, mutex_l
	// inline asm
.Ltmp70:
	$release , r0, 0, nz, .Ltmp70 + 1
	// inline asm
	$call , r23, me_new
	$lbu , r0, r0, cur_jobs
	$lsl , r1, r0, 2
	$lsl_add , r0, r1, r0, 4
	$add , r0, r15, r0
	$add , r14, r0, 16
	$call , r23, me_new
	$lsl , r0, r0, 2
	$lw , r1, r0, fc_scheduler_job
	$move , r0, r14
	$call , r23, swap_context
	$jump , .LBB14_3
.LBB14_2:
	$sw , r14, 0, r0
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp71:
	$release , r0, 0, nz, .Ltmp71 + 1
	// inline asm
	$lw , r0, zero, mutex_l
	// inline asm
.Ltmp72:
	$release , r0, 0, nz, .Ltmp72 + 1
	// inline asm
.LBB14_3:
	$move , r0, 0
	$ld , d14, r22,  - 16
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end14:
	$size,	lock, .Lfunc_end14 - lock
	$section,	%stack_sizes,"o",@progbits,%text, lock
	$long,	.Lfunc_begin14
	$byte,	16
	$section,	%text, lock,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, unlock,"ax",@progbits
	$globl,	unlock                          //  -  -  Begin function unlock
	$type,	unlock,@function
unlock:                                 // @unlock
.Lfunc_begin15:
// %bb.0:
	$sd , r22, 8, d22
	$add , r22, r22, 16
	$sd , r22,  - 16, d14
	$lw , r1, zero, mutex_l
	// inline asm
.Ltmp73:
	$acquire , r1, 0, nz, .Ltmp73
	// inline asm
	$lw , r1, zero, mutex_jobs
	// inline asm
.Ltmp74:
	$acquire , r1, 0, nz, .Ltmp74
	// inline asm
	$sw , r0, 0,  - 1
	$lw , r1, zero, cur_process_index
	$lsl , r2, r1, 4
	$lsl_add , r1, r2, r1, 6
	$move , r2, processs
	$add , r1, r2, r1
	$lbu , r1, r1, 2
	$jeq , r1, 0, .LBB15_8
// %bb.1:
	$move , r1, 0, true, .LBB15_2
.LBB15_7:                               //   in Loop: Header=BB15_2 Depth=1
	$lw , r2, zero, cur_process_index
	$lsl , r3, r2, 4
	$lsl_add , r2, r3, r2, 6
	$move , r3, processs
	$add , r2, r3, r2
	$lbu , r2, r2, 2
	$add , r1, r1, 1
	$jgeu , r1, r2, .LBB15_8
.LBB15_2:                               // =>This Inner Loop Header: Depth=1
	$lsl , r2, r1, 2
	$lsl_add , r2, r2, r1, 4
	$lbu , r3, r2, jobs
	$jneq , r3, 5, .LBB15_7
// %bb.3:                               //   in Loop: Header=BB15_2 Depth=1
	$move , r3, jobs
	$add , r2, r3, r2
	$lw , r2, r2, 8
	$jneq , r2, r0, .LBB15_7
// %bb.4:
	$lsl , r2, r1, 2
	$lsl_add , r2, r2, r1, 4
	$sw , r0, 0, r1
	$move , r0, 3
	$sb , r2, jobs, r0
	$lw , r0, zero, mutex_l
	// inline asm
.Ltmp75:
	$release , r0, 0, nz, .Ltmp75 + 1
	// inline asm
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp76:
	$release , r0, 0, nz, .Ltmp76 + 1
	// inline asm
	$move , r14, cp
	$lw , r0, r14, 4
	// inline asm
.Ltmp77:
	$acquire , r0, 0, nz, .Ltmp77
	// inline asm
	$lbu , r0, r14, 1
	$jeq , r0, 0, .LBB15_6
// %bb.5:
	$sb , r14, 2, 1
	$add , r0, r0,  - 1
	$sb , r14, 1, r0
	$lbu , r0, zero, cp
	$call , r23, wake_up_one
.LBB15_6:
	$lw , r0, r14, 4
	// inline asm
.Ltmp78:
	$release , r0, 0, nz, .Ltmp78 + 1
	// inline asm
	$jump , .LBB15_9
.LBB15_8:
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp79:
	$release , r0, 0, nz, .Ltmp79 + 1
	// inline asm
	$lw , r0, zero, mutex_l
	// inline asm
.Ltmp80:
	$release , r0, 0, nz, .Ltmp80 + 1
	// inline asm
.LBB15_9:
	$move , r0, 0
	$ld , d14, r22,  - 16
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end15:
	$size,	unlock, .Lfunc_end15 - unlock
	$section,	%stack_sizes,"o",@progbits,%text, unlock
	$long,	.Lfunc_begin15
	$byte,	16
	$section,	%text, unlock,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, inode_operation,"ax",@progbits
	$globl,	inode_operation                 //  -  -  Begin function inode_operation
	$type,	inode_operation,@function
inode_operation:                        // @inode_operation
.Lfunc_begin16:
// %bb.0:
	$lsl_add , r0, r3, r0, 16
	$add , r0, r0, 651264
	$lsr , r3, r2, 11
	$jeq , r4, 0, .LBB16_1
// %bb.8:
	$jeq , r3, 0, .LBB16_9
// %bb.10:
	$move , r4, r1
	$move , r5, r0
.LBB16_11:                              // =>This Inner Loop Header: Depth=1
	$sdma , r4, r5, 255
	$add , r5, r5, 2048
	$add , r4, r4, 2048
	$add , r3, r3,  - 1, nz, .LBB16_11
// %bb.12:
	$and , r3, r2,  - 2048
	$and , r2, r2, 2047
	$jneq , r2, 0, .LBB16_14
.LBB16_15:
	$move , r0, 0
	$jump , r23
.LBB16_1:
	$jeq , r3, 0, .LBB16_2
// %bb.3:
	$move , r4, r0
	$move , r5, r1
.LBB16_4:                               // =>This Inner Loop Header: Depth=1
	$ldma , r5, r4, 255
	$add , r5, r5, 2048
	$add , r4, r4, 2048
	$add , r3, r3,  - 1, nz, .LBB16_4
// %bb.5:
	$and , r3, r2,  - 2048
	$and , r2, r2, 2047
	$jneq , r2, 0, .LBB16_7
	$jump , .LBB16_15
.LBB16_9:
	$move , r3, 0
	$and , r2, r2, 2047
	$jeq , r2, 0, .LBB16_15
.LBB16_14:
	$add , r1, r1, r3
	$add , r0, r0, r3
	$move , r3,  - 1
	$lsr_add , r2, r3, r2, 3
	$lsl_add , r1, r1, r2, 24
	$sdma , r1, r0, 0
	$move , r0, 0
	$jump , r23
.LBB16_2:
	$move , r3, 0
	$and , r2, r2, 2047
	$jeq , r2, 0, .LBB16_15
.LBB16_7:
	$add , r0, r0, r3
	$add , r1, r1, r3
	$move , r3,  - 1
	$lsr_add , r2, r3, r2, 3
	$lsl_add , r1, r1, r2, 24
	$ldma , r1, r0, 0
	$move , r0, 0
	$jump , r23
.Lfunc_end16:
	$size,	inode_operation, .Lfunc_end16 - inode_operation
	$section,	%stack_sizes,"o",@progbits,%text, inode_operation
	$long,	.Lfunc_begin16
	$byte,	0
	$section,	%text, inode_operation,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, load_big_blocks,"ax",@progbits
	$globl,	load_big_blocks                 //  -  -  Begin function load_big_blocks
	$type,	load_big_blocks,@function
load_big_blocks:                        // @load_big_blocks
.Lfunc_begin17:
// %bb.0:
	$lsr , r3, r2, 11, z, .LBB17_1
// %bb.2:
	$move , r4, r0
	$move , r5, r1
.LBB17_3:                               // =>This Inner Loop Header: Depth=1
	$ldma , r5, r4, 255
	$add , r5, r5, 2048
	$add , r4, r4, 2048
	$add , r3, r3,  - 1, nz, .LBB17_3
// %bb.4:
	$and , r3, r2,  - 2048
	$and , r2, r2, 2047
	$jeq , r2, 0, .LBB17_7
.LBB17_6:
	$add , r0, r0, r3
	$add , r1, r1, r3
	$move , r3,  - 1
	$lsr_add , r2, r3, r2, 3
	$lsl_add , r1, r1, r2, 24
	$ldma , r1, r0, 0
.LBB17_7:
	$jump , r23
.LBB17_1:
	$move , r3, 0
	$and , r2, r2, 2047
	$jneq , r2, 0, .LBB17_6
	$jump , .LBB17_7
.Lfunc_end17:
	$size,	load_big_blocks, .Lfunc_end17 - load_big_blocks
	$section,	%stack_sizes,"o",@progbits,%text, load_big_blocks
	$long,	.Lfunc_begin17
	$byte,	0
	$section,	%text, load_big_blocks,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, store_big_blocks,"ax",@progbits
	$globl,	store_big_blocks                //  -  -  Begin function store_big_blocks
	$type,	store_big_blocks,@function
store_big_blocks:                       // @store_big_blocks
.Lfunc_begin18:
// %bb.0:
	$lsr , r3, r2, 11, z, .LBB18_1
// %bb.2:
	$move , r4, r0
	$move , r5, r1
.LBB18_3:                               // =>This Inner Loop Header: Depth=1
	$sdma , r4, r5, 255
	$add , r5, r5, 2048
	$add , r4, r4, 2048
	$add , r3, r3,  - 1, nz, .LBB18_3
// %bb.4:
	$and , r3, r2,  - 2048
	$and , r2, r2, 2047
	$jeq , r2, 0, .LBB18_7
.LBB18_6:
	$add , r0, r0, r3
	$add , r1, r1, r3
	$move , r3,  - 1
	$lsr_add , r2, r3, r2, 3
	$lsl_add , r0, r0, r2, 24
	$sdma , r0, r1, 0
.LBB18_7:
	$jump , r23
.LBB18_1:
	$move , r3, 0
	$and , r2, r2, 2047
	$jneq , r2, 0, .LBB18_6
	$jump , .LBB18_7
.Lfunc_end18:
	$size,	store_big_blocks, .Lfunc_end18 - store_big_blocks
	$section,	%stack_sizes,"o",@progbits,%text, store_big_blocks
	$long,	.Lfunc_begin18
	$byte,	0
	$section,	%text, store_big_blocks,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, alloc_inode,"ax",@progbits
	$globl,	alloc_inode                     //  -  -  Begin function alloc_inode
	$type,	alloc_inode,@function
alloc_inode:                            // @alloc_inode
.Lfunc_begin19:
// %bb.0:
	$lw , r0, zero, mutex_mram
	$move , r4, 0
	// inline asm
.Ltmp81:
	$acquire , r0, 0, nz, .Ltmp81
	// inline asm
	$move , r0, r4
	$move , r5, r4
.LBB19_1:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB19_2 Depth 2
	$lsl , r1, r5, 4
	$lsl_add , r1, r1, r5, 7
	$lsl_add , r1, r1, r5, 8
	$add , r1, r1, 712800
	$move , r2, alloc_inode.bit_map
	$ldma , r2, r1, 49
	$move , r6, r4, true, .LBB19_2
.LBB19_8:                               //   in Loop: Header=BB19_2 Depth=2
	$add , r6, r6, 8
	$move , r3, 3200
	$add , r2, r2, 1
	$jeq , r6, r3, .LBB19_9
.LBB19_2:                               //   Parent Loop BB19_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	$lbu , r3, r2, 0
	$jeq , r3, 255, .LBB19_8
// %bb.3:                               //   in Loop: Header=BB19_2 Depth=2
	$and , r7, r3, 1, nz, .LBB19_5
// %bb.4:                               //   in Loop: Header=BB19_2 Depth=2
	$jneq , r0, r6, .LBB19_16
.LBB19_5:                               //   in Loop: Header=BB19_2 Depth=2
	$and , r7, r3, 2, nz, .LBB19_19
// %bb.6:                               //   in Loop: Header=BB19_2 Depth=2
	$jneq , r0, r6, .LBB19_7
.LBB19_19:                              //   in Loop: Header=BB19_2 Depth=2
	$and , r7, r3, 4, z, .LBB19_15
// %bb.20:                              //   in Loop: Header=BB19_2 Depth=2
	$and , r7, r3, 8, z, .LBB19_14
// %bb.21:                              //   in Loop: Header=BB19_2 Depth=2
	$and , r7, r3, 16, z, .LBB19_13
// %bb.22:                              //   in Loop: Header=BB19_2 Depth=2
	$and , r7, r3, 32, z, .LBB19_12
// %bb.23:                              //   in Loop: Header=BB19_2 Depth=2
	$and , r7, r3, 64, z, .LBB19_11
// %bb.24:                              //   in Loop: Header=BB19_2 Depth=2
	$and , r7, r3, 128
	$jneq , r7, 0, .LBB19_8
	$jump , .LBB19_25
.LBB19_9:                               //   in Loop: Header=BB19_1 Depth=1
	$add , r0, r0,  - 3200
	$add , r5, r5, 1
	$jneq , r5, 10, .LBB19_1
// %bb.10:
	$lw , r0, zero, mutex_mram
	// inline asm
.Ltmp82:
	$release , r0, 0, nz, .Ltmp82 + 1
	// inline asm
	$move , r0,  - 11
	$jump , r23
.LBB19_16:
	$sub , r0, r6, r0
	$move , r4, 1, true, .LBB19_17
.LBB19_7:
	$sub , r0, r6, r0
	$add , r0, r0, 1
	$move , r4, 2, true, .LBB19_17
.LBB19_15:
	$sub , r0, r6, r0
	$add , r0, r0, 2
	$move , r4, 4, true, .LBB19_17
.LBB19_14:
	$sub , r0, r6, r0
	$add , r0, r0, 3
	$move , r4, 8, true, .LBB19_17
.LBB19_13:
	$sub , r0, r6, r0
	$add , r0, r0, 4
	$move , r4, 16, true, .LBB19_17
.LBB19_12:
	$sub , r0, r6, r0
	$add , r0, r0, 5
	$move , r4, 32, true, .LBB19_17
.LBB19_11:
	$sub , r0, r6, r0
	$add , r0, r0, 6
	$move , r4, 64, true, .LBB19_17
.LBB19_25:
	$sub , r0, r6, r0
	$add , r0, r0, 7
	$move , r4, 128
.LBB19_17:
	$or , r3, r3, r4
	$sb , r2, 0, r3
	$move , r2, alloc_inode.bit_map
	$sdma , r2, r1, 49
	$lw , r1, zero, mutex_mram
	// inline asm
.Ltmp83:
	$release , r1, 0, nz, .Ltmp83 + 1
	// inline asm
	$jump , r23
.Lfunc_end19:
	$size,	alloc_inode, .Lfunc_end19 - alloc_inode
	$section,	%stack_sizes,"o",@progbits,%text, alloc_inode
	$long,	.Lfunc_begin19
	$byte,	0
	$section,	%text, alloc_inode,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, find_inode,"ax",@progbits
	$globl,	find_inode                      //  -  -  Begin function find_inode
	$type,	find_inode,@function
find_inode:                             // @find_inode
.Lfunc_begin20:
// %bb.0:
	$sd , r22, 16, d22
	$add , r22, r22, 24
	$sd , r22,  - 16, d14
	$sd , r22,  - 24, d16
	$lw , r2, zero, mutex_inode
	$move , r14, r0
	// inline asm
.Ltmp84:
	$acquire , r2, 0, nz, .Ltmp84
	// inline asm
	$lsl , r0, r14, 4
	$lhu , r2, r0, inode_table
	$lsr , r0, r1, 16
	$jeq , r2, 0, .LBB20_1
// %bb.2:
	$move , r1, inode_table
	$lsl_add , r2, r1, r14, 4
	$lhu , r2, r2, 2
	$lsl_add , r1, r1, r14, 4
	$jltu , r0, r2, .LBB20_3
// %bb.4:
	$move , r1, inode_table
	$lsl_add , r1, r1, r14, 4
	$lhu , r3, r1, 4
	$sub , r0, r0, r2
	$jeq , r3, 0, .LBB20_5
// %bb.16:
	$lhu , r2, r1, 6
	$add , r1, r1, 4
	$jlts , r0, r2, .LBB20_3
// %bb.17:
	$move , r1, inode_table
	$lsl_add , r1, r1, r14, 4
	$lhu , r3, r1, 8
	$sub , r0, r0, r2
	$jeq , r3, 0, .LBB20_18
// %bb.19:
	$lhu , r2, r1, 10
	$add , r1, r1, 8
	$jlts , r0, r2, .LBB20_3
// %bb.20:
	$move , r1, inode_table
	$lsl_add , r1, r1, r14, 4
	$lhu , r3, r1, 12
	$sub , r0, r0, r2
	$jeq , r3, 0, .LBB20_21
// %bb.22:
	$lhu , r2, r1, 14
	$add , r1, r1, 12
	$jges , r0, r2, .LBB20_23
.LBB20_3:
	$lw , r2, zero, mutex_inode
	// inline asm
.Ltmp85:
	$release , r2, 0, nz, .Ltmp85 + 1
	// inline asm
	$lhu , r1, r1, 0
	$add , r0, r0, r1, true, .LBB20_15
.LBB20_1:
	$move , r15,  - 1, true, .LBB20_6
.LBB20_5:
	$move , r15, 0, true, .LBB20_6
.LBB20_18:
	$move , r15, 1, true, .LBB20_6
.LBB20_21:
	$move , r15, 2
.LBB20_6:
	$add , r16, r0, 1, true, .LBB20_7
.LBB20_10:                              //   in Loop: Header=BB20_7 Depth=1
	$add , r1, r1, 2
	$add , r2, r2, 1
	$sh , r1, 0, r2
	$add , r16, r16,  - 1, z, .LBB20_14
.LBB20_7:                               // =>This Inner Loop Header: Depth=1
	$call , r23, alloc_inode
	$jles , r0,  - 1, .LBB20_8
// %bb.9:                               //   in Loop: Header=BB20_7 Depth=1
	$move , r1, inode_table
	$lsl_add , r1, r1, r14, 4
	$lsl_add , r1, r1, r15, 2
	$lhu , r3, r1, 0
	$lhu , r2, r1, 2
	$add , r3, r2, r3
	$jeq , r0, r3, .LBB20_10
// %bb.11:                              //   in Loop: Header=BB20_7 Depth=1
	$jges , r15, 3, .LBB20_24
// %bb.12:                              //   in Loop: Header=BB20_7 Depth=1
	$add , r15, r15, 1
	$move , r1, inode_table
	$lsl_add , r1, r1, r14, 4
	$lsl_add , r1, r1, r15, 2
	$sh , r1, 0, r0
	$sh , r1, 2, 1
	$add , r16, r16,  - 1, nz, .LBB20_7
.LBB20_14:
	$lw , r1, zero, mutex_inode
	// inline asm
.Ltmp86:
	$release , r1, 0, nz, .Ltmp86 + 1
	// inline asm
	$jump , .LBB20_15
.LBB20_8:
	$lw , r1, zero, mutex_inode
	// inline asm
.Ltmp87:
	$release , r1, 0, nz, .Ltmp87 + 1
	// inline asm
.LBB20_15:
	$ld , d16, r22,  - 24
	$ld , d14, r22,  - 16
	$ld , d22, r22,  - 8
	$jump , r23
.LBB20_23:
	$lw , r0, zero, mutex_inode
	// inline asm
.Ltmp88:
	$release , r0, 0, nz, .Ltmp88 + 1
	// inline asm
	$move , r0,  - 54, true, .LBB20_15
.LBB20_24:
	$move , r0, 4444
	$call , r23, printk_int
	$lw , r0, zero, mutex_inode
	// inline asm
.Ltmp89:
	$release , r0, 0, nz, .Ltmp89 + 1
	// inline asm
	$fault , 4
.Lfunc_end20:
	$size,	find_inode, .Lfunc_end20 - find_inode
	$section,	%stack_sizes,"o",@progbits,%text, find_inode
	$long,	.Lfunc_begin20
	$byte,	24
	$section,	%text, find_inode,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, printk_int,"ax",@progbits
	$globl,	printk_int                      //  -  -  Begin function printk_int
	$type,	printk_int,@function
printk_int:                             // @printk_int
.Lfunc_begin21:
// %bb.0:
	$lw , r1, zero, log_w
	$add , r1, r1, 8
	$move , r2, 65536
	$jgtu , r1, r2, .LBB21_2
// %bb.1:
	$lw , r1, zero, mutex_printk
	// inline asm
.Ltmp90:
	$acquire , r1, 0, nz, .Ltmp90
	// inline asm
	$lw , r1, zero, log_w
	$sw , r22, 16, 1
	$sw , r22, 20, r0
	$add , r0, r1, 716800
	$add , r1, r22, 16
	$sdma , r1, r0, 0
	$lw , r0, zero, log_w
	$lw , r1, zero, mutex_flag
	$add , r0, r0, 8
	$sw , zero, log_w, r0
	// inline asm
.Ltmp91:
	$acquire , r1, 0, nz, .Ltmp91
	// inline asm
	$move , r0, 651264
	$add , r1, r22, 0
	$ldma , r1, r0, 1
	$lw , r2, r22, 8
	$or , r2, r2, 64
	$sw , r22, 8, r2
	$sdma , r1, r0, 1
	$lw , r0, zero, mutex_flag
	// inline asm
.Ltmp92:
	$release , r0, 0, nz, .Ltmp92 + 1
	// inline asm
	$lw , r0, zero, mutex_printk
	// inline asm
.Ltmp93:
	$release , r0, 0, nz, .Ltmp93 + 1
	// inline asm
.LBB21_2:
	$jump , r23
.Lfunc_end21:
	$size,	printk_int, .Lfunc_end21 - printk_int
	$section,	%stack_sizes,"o",@progbits,%text, printk_int
	$long,	.Lfunc_begin21
	$byte,	24
	$section,	%text, printk_int,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, chained_inode_operation,"ax",@progbits
	$globl,	chained_inode_operation         //  -  -  Begin function chained_inode_operation
	$type,	chained_inode_operation,@function
chained_inode_operation:                // @chained_inode_operation
.Lfunc_begin22:
// %bb.0:
	$sd , r22, 32, d22
	$add , r22, r22, 40
	$sd , r22,  - 16, d14
	$sd , r22,  - 24, d16
	$sd , r22,  - 32, d18
	$sd , r22,  - 40, d20
	$move , r15, r3
	$move , r17, r2
	$move , r18, r1
	$move , r16, r0
	$move , r0, 65536
	$move , r14,  - 20
	$jgtu , r18, r0, .LBB22_40
// %bb.1:
	$and , r20, r17, 65535
	$sub , r0, 65536, r20
	$move , r19, r18
	$jgtu , r0, r18, .LBB22_3
// %bb.2:
	$move , r19, r0
.LBB22_3:
	$lw , r0, zero, cur_process_index
	$move , r1, inode_table
	$lsl_add , r0, r1, r0, 4
	$lhu , r2, r0, 2
	$lw , r0, zero, cur_process_index
	$lsr , r1, r17, 16
	$jgeu , r1, r2, .LBB22_5
// %bb.4:
	$lsl , r0, r0, 4
	$lhu , r0, r0, inode_table
	$add , r0, r1, r0
	$move , r14,  - 11
	$jleu , r0, 1023, .LBB22_7
	$jump , .LBB22_40
.LBB22_5:
	$move , r1, r17
	$call , r23, find_inode
	$move , r14,  - 11
	$jgtu , r0, 1023, .LBB22_40
.LBB22_7:
	$lsl_add , r0, r20, r0, 16
	$add , r0, r0, 651264
	$lsr , r1, r19, 11
	$jeq , r15, 0, .LBB22_8
// %bb.15:
	$jeq , r1, 0, .LBB22_16
// %bb.17:
	$move , r2, r16
	$move , r3, r0
.LBB22_18:                              // =>This Inner Loop Header: Depth=1
	$sdma , r2, r3, 255
	$add , r3, r3, 2048
	$add , r2, r2, 2048
	$add , r1, r1,  - 1, nz, .LBB22_18
// %bb.19:
	$and , r1, r19, 129024
	$and , r2, r19, 2047
	$jneq , r2, 0, .LBB22_21
	$jump , .LBB22_22
.LBB22_8:
	$jeq , r1, 0, .LBB22_9
// %bb.10:
	$move , r2, r0
	$move , r3, r16
.LBB22_11:                              // =>This Inner Loop Header: Depth=1
	$ldma , r3, r2, 255
	$add , r3, r3, 2048
	$add , r2, r2, 2048
	$add , r1, r1,  - 1, nz, .LBB22_11
// %bb.12:
	$and , r1, r19, 129024
	$and , r2, r19, 2047
	$jneq , r2, 0, .LBB22_14
	$jump , .LBB22_22
.LBB22_16:
	$move , r1, 0
	$and , r2, r19, 2047
	$jeq , r2, 0, .LBB22_22
.LBB22_21:
	$add , r3, r16, r1
	$add , r0, r0, r1
	$move , r1,  - 1
	$lsr_add , r1, r1, r2, 3
	$lsl_add , r1, r3, r1, 24
	$sdma , r1, r0, 0
	$jump , .LBB22_22
.LBB22_9:
	$move , r1, 0
	$and , r2, r19, 2047
	$jeq , r2, 0, .LBB22_22
.LBB22_14:
	$add , r0, r0, r1
	$add , r1, r16, r1
	$move , r3,  - 1
	$lsr_add , r2, r3, r2, 3
	$lsl_add , r1, r1, r2, 24
	$ldma , r1, r0, 0
.LBB22_22:
	$sub , r18, r18, r19, z, .LBB22_23
// %bb.24:
	$lw , r0, zero, cur_process_index
	$add , r1, r19, r17
	$call , r23, find_inode
	$jlts , r0, 0, .LBB22_25
// %bb.26:
	$jgts , r0, 1023, .LBB22_40
// %bb.27:
	$add , r1, r16, r19
	$move , r2, 651264
	$lsl_add , r0, r2, r0, 16
	$lsr , r2, r18, 11
	$move , r14, 0
	$move , r3, r14
	$jeq , r15, 0, .LBB22_28
// %bb.34:
	$jeq , r2, 0, .LBB22_38
// %bb.35:
	$move , r3, r1
	$move , r4, r0
.LBB22_36:                              // =>This Inner Loop Header: Depth=1
	$sdma , r3, r4, 255
	$add , r4, r4, 2048
	$add , r3, r3, 2048
	$add , r2, r2,  - 1, nz, .LBB22_36
// %bb.37:
	$and , r3, r18,  - 2048
.LBB22_38:
	$and , r2, r18, 2047
	$jeq , r2, 0, .LBB22_40
// %bb.39:
	$add , r1, r1, r3
	$add , r0, r0, r3
	$move , r3,  - 1
	$lsr_add , r2, r3, r2, 3
	$lsl_add , r1, r1, r2, 24
	$sdma , r1, r0, 0
	$jump , .LBB22_40
.LBB22_23:
	$move , r14, 0, true, .LBB22_40
.LBB22_25:
	$move , r14, r0
.LBB22_40:
	$move , r0, r14
	$ld , d20, r22,  - 40
	$ld , d18, r22,  - 32
	$ld , d16, r22,  - 24
	$ld , d14, r22,  - 16
	$ld , d22, r22,  - 8
	$jump , r23
.LBB22_28:
	$jeq , r2, 0, .LBB22_32
// %bb.29:
	$move , r3, r0
	$move , r4, r1
.LBB22_30:                              // =>This Inner Loop Header: Depth=1
	$ldma , r4, r3, 255
	$add , r4, r4, 2048
	$add , r3, r3, 2048
	$add , r2, r2,  - 1, nz, .LBB22_30
// %bb.31:
	$and , r3, r18,  - 2048
.LBB22_32:
	$and , r2, r18, 2047
	$jeq , r2, 0, .LBB22_40
// %bb.33:
	$add , r0, r0, r3
	$add , r1, r1, r3
	$move , r3,  - 1
	$lsr_add , r2, r3, r2, 3
	$lsl_add , r1, r1, r2, 24
	$ldma , r1, r0, 0
	$jump , .LBB22_40
.Lfunc_end22:
	$size,	chained_inode_operation, .Lfunc_end22 - chained_inode_operation
	$section,	%stack_sizes,"o",@progbits,%text, chained_inode_operation
	$long,	.Lfunc_begin22
	$byte,	40
	$section,	%text, chained_inode_operation,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, free_inode,"ax",@progbits
	$globl,	free_inode                      //  -  -  Begin function free_inode
	$type,	free_inode,@function
free_inode:                             // @free_inode
.Lfunc_begin23:
// %bb.0:
	$sd , r22, 0, d22
	$add , r22, r22, 8
	$move , r0, 75698
	$call , r23, printk_int
	$fault , 4
.Lfunc_end23:
	$size,	free_inode, .Lfunc_end23 - free_inode
	$section,	%stack_sizes,"o",@progbits,%text, free_inode
	$long,	.Lfunc_begin23
	$byte,	8
	$section,	%text, free_inode,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, wakeup_sleepy_socket,"ax",@progbits
	$globl,	wakeup_sleepy_socket            //  -  -  Begin function wakeup_sleepy_socket
	$type,	wakeup_sleepy_socket,@function
wakeup_sleepy_socket:                   // @wakeup_sleepy_socket
.Lfunc_begin24:
// %bb.0:
	$move , r0, 0, true, .LBB24_1
.LBB24_33:                              //   in Loop: Header=BB24_1 Depth=1
	$lw , r1, zero, cur_process_index
	$lsl , r2, r1, 4
	$lsl_add , r2, r2, r1, 11
	$lsl_sub , r1, r2, r1, 6
	$add , r1, r1, 651280
	$move , r2, jobs
	$ldma , r2, r1, 249
.LBB24_34:                              //   in Loop: Header=BB24_1 Depth=1
	$add , r0, r0, 1
	$jeq , r0, 10, .LBB24_35
.LBB24_1:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB24_3 Depth 2
                                        //       Child Loop BB24_5 Depth 3
                                        //     Child Loop BB24_14 Depth 2
                                        //       Child Loop BB24_16 Depth 3
                                        //     Child Loop BB24_25 Depth 2
                                        //       Child Loop BB24_27 Depth 3
	$lsl , r1, r0, 4
	$lsl_add , r1, r1, r0, 6
	$move , r2, processs
	$add , r1, r2, r1
	$lw , r3, r1, 60
	$and , r2, r3, 32, z, .LBB24_12
// %bb.2:                               //   in Loop: Header=BB24_1 Depth=1
	$add , r2, r1, 56
	$and , r3, r3,  - 33
	$sw , r1, 60, r3
	$move , r3, 0, true, .LBB24_3
.LBB24_10:                              //   in Loop: Header=BB24_3 Depth=2
	$lw , r6, zero, mutex_jobs
	// inline asm
.Ltmp94:
	$release , r6, 0, nz, .Ltmp94 + 1
	// inline asm
	$sdma , r5, r4, 249
	$add , r3, r3, 1
	$jeq , r3, 10, .LBB24_11
.LBB24_3:                               //   Parent Loop BB24_1 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB24_5 Depth 3
	$lw , r4, zero, mutex_jobs
	// inline asm
.Ltmp95:
	$acquire , r4, 0, nz, .Ltmp95
	// inline asm
	$lsl , r6, r3, 4
	$lsl_add , r4, r6, r3, 11
	$lsl_sub , r4, r4, r3, 6
	$add , r4, r4, 651280
	$move , r5, jobs
	$ldma , r5, r4, 249
	$lsl_add , r6, r6, r3, 6
	$move , r7, processs
	$add , r6, r7, r6
	$lbu , r6, r6, 2
	$jeq , r6, 0, .LBB24_10
// %bb.4:                               //   in Loop: Header=BB24_3 Depth=2
	$move , r7, 0, true, .LBB24_5
.LBB24_9:                               //   in Loop: Header=BB24_5 Depth=3
	$add , r7, r7, 1
	$jgeu , r7, r6, .LBB24_10
.LBB24_5:                               //   Parent Loop BB24_1 Depth=1
                                        //     Parent Loop BB24_3 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	$lsl , r8, r7, 2
	$lsl_add , r8, r8, r7, 4
	$lbu , r9, r8, jobs
	$jneq , r9, 6, .LBB24_9
// %bb.6:                               //   in Loop: Header=BB24_5 Depth=3
	$move , r9, jobs
	$add , r8, r9, r8
	$lw , r8, r8, 8
	$jneq , r8, r2, .LBB24_9
// %bb.7:                               //   in Loop: Header=BB24_5 Depth=3
	$lsl , r8, r3, 4
	$lsl_add , r8, r8, r3, 6
	$move , r9, processs
	$add , r8, r9, r8
	$lw , r9, r8, 8
	$lsl , r10, r7, 2
	$lsl_add , r10, r10, r7, 4
	$move , r11, 3
	$sb , r10, jobs, r11
	$jneq , r9, 5, .LBB24_9
// %bb.8:                               //   in Loop: Header=BB24_5 Depth=3
	$sw , r8, 8, 3
	$jump , .LBB24_9
.LBB24_11:                              //   in Loop: Header=BB24_1 Depth=1
	$lw , r2, zero, cur_process_index
	$lsl , r3, r2, 4
	$lsl_add , r3, r3, r2, 11
	$lsl_sub , r2, r3, r2, 6
	$add , r2, r2, 651280
	$move , r3, jobs
	$ldma , r3, r2, 249
.LBB24_12:                              //   in Loop: Header=BB24_1 Depth=1
	$lw , r3, r1, 68
	$and , r1, r3, 32, z, .LBB24_23
// %bb.13:                              //   in Loop: Header=BB24_1 Depth=1
	$lsl , r1, r0, 4
	$lsl_add , r2, r1, r0, 6
	$move , r1, processs
	$add , r4, r1, r2
	$add , r2, r4, 64
	$and , r3, r3,  - 33
	$sw , r4, 68, r3
	$move , r3, 0, true, .LBB24_14
.LBB24_21:                              //   in Loop: Header=BB24_14 Depth=2
	$lw , r6, zero, mutex_jobs
	// inline asm
.Ltmp96:
	$release , r6, 0, nz, .Ltmp96 + 1
	// inline asm
	$sdma , r5, r4, 249
	$add , r3, r3, 1
	$jeq , r3, 10, .LBB24_22
.LBB24_14:                              //   Parent Loop BB24_1 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB24_16 Depth 3
	$lw , r4, zero, mutex_jobs
	// inline asm
.Ltmp97:
	$acquire , r4, 0, nz, .Ltmp97
	// inline asm
	$lsl , r6, r3, 4
	$lsl_add , r4, r6, r3, 11
	$lsl_sub , r4, r4, r3, 6
	$add , r4, r4, 651280
	$move , r5, jobs
	$ldma , r5, r4, 249
	$lsl_add , r6, r6, r3, 6
	$add , r6, r1, r6
	$lbu , r6, r6, 2
	$jeq , r6, 0, .LBB24_21
// %bb.15:                              //   in Loop: Header=BB24_14 Depth=2
	$move , r7, 0, true, .LBB24_16
.LBB24_20:                              //   in Loop: Header=BB24_16 Depth=3
	$add , r7, r7, 1
	$jgeu , r7, r6, .LBB24_21
.LBB24_16:                              //   Parent Loop BB24_1 Depth=1
                                        //     Parent Loop BB24_14 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	$lsl , r8, r7, 2
	$lsl_add , r8, r8, r7, 4
	$lbu , r9, r8, jobs
	$jneq , r9, 6, .LBB24_20
// %bb.17:                              //   in Loop: Header=BB24_16 Depth=3
	$move , r9, jobs
	$add , r8, r9, r8
	$lw , r8, r8, 8
	$jneq , r8, r2, .LBB24_20
// %bb.18:                              //   in Loop: Header=BB24_16 Depth=3
	$lsl , r8, r3, 4
	$lsl_add , r8, r8, r3, 6
	$move , r9, processs
	$add , r8, r9, r8
	$lw , r9, r8, 8
	$lsl , r10, r7, 2
	$lsl_add , r10, r10, r7, 4
	$move , r11, 3
	$sb , r10, jobs, r11
	$jneq , r9, 5, .LBB24_20
// %bb.19:                              //   in Loop: Header=BB24_16 Depth=3
	$sw , r8, 8, 3
	$jump , .LBB24_20
.LBB24_22:                              //   in Loop: Header=BB24_1 Depth=1
	$lw , r1, zero, cur_process_index
	$lsl , r2, r1, 4
	$lsl_add , r2, r2, r1, 11
	$lsl_sub , r1, r2, r1, 6
	$add , r1, r1, 651280
	$move , r2, jobs
	$ldma , r2, r1, 249
.LBB24_23:                              //   in Loop: Header=BB24_1 Depth=1
	$lsl , r1, r0, 4
	$lsl_add , r1, r1, r0, 6
	$move , r2, processs
	$add , r2, r2, r1
	$lw , r3, r2, 76
	$and , r1, r3, 32, z, .LBB24_34
// %bb.24:                              //   in Loop: Header=BB24_1 Depth=1
	$add , r1, r2, 72
	$and , r3, r3,  - 33
	$sw , r2, 76, r3
	$move , r2, 0, true, .LBB24_25
.LBB24_32:                              //   in Loop: Header=BB24_25 Depth=2
	$lw , r5, zero, mutex_jobs
	// inline asm
.Ltmp98:
	$release , r5, 0, nz, .Ltmp98 + 1
	// inline asm
	$sdma , r4, r3, 249
	$add , r2, r2, 1
	$jeq , r2, 10, .LBB24_33
.LBB24_25:                              //   Parent Loop BB24_1 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB24_27 Depth 3
	$lw , r3, zero, mutex_jobs
	// inline asm
.Ltmp99:
	$acquire , r3, 0, nz, .Ltmp99
	// inline asm
	$lsl , r5, r2, 4
	$lsl_add , r3, r5, r2, 11
	$lsl_sub , r3, r3, r2, 6
	$add , r3, r3, 651280
	$move , r4, jobs
	$ldma , r4, r3, 249
	$lsl_add , r5, r5, r2, 6
	$move , r6, processs
	$add , r5, r6, r5
	$lbu , r5, r5, 2
	$jeq , r5, 0, .LBB24_32
// %bb.26:                              //   in Loop: Header=BB24_25 Depth=2
	$move , r6, 0, true, .LBB24_27
.LBB24_31:                              //   in Loop: Header=BB24_27 Depth=3
	$add , r6, r6, 1
	$jgeu , r6, r5, .LBB24_32
.LBB24_27:                              //   Parent Loop BB24_1 Depth=1
                                        //     Parent Loop BB24_25 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	$lsl , r7, r6, 2
	$lsl_add , r7, r7, r6, 4
	$lbu , r8, r7, jobs
	$jneq , r8, 6, .LBB24_31
// %bb.28:                              //   in Loop: Header=BB24_27 Depth=3
	$move , r8, jobs
	$add , r7, r8, r7
	$lw , r7, r7, 8
	$jneq , r7, r1, .LBB24_31
// %bb.29:                              //   in Loop: Header=BB24_27 Depth=3
	$lsl , r7, r2, 4
	$lsl_add , r7, r7, r2, 6
	$move , r8, processs
	$add , r7, r8, r7
	$lw , r8, r7, 8
	$lsl , r9, r6, 2
	$lsl_add , r9, r9, r6, 4
	$move , r10, 3
	$sb , r9, jobs, r10
	$jneq , r8, 5, .LBB24_31
// %bb.30:                              //   in Loop: Header=BB24_27 Depth=3
	$sw , r7, 8, 3
	$jump , .LBB24_31
.LBB24_35:
	$move , r0, 0
	$jump , r23
.Lfunc_end24:
	$size,	wakeup_sleepy_socket, .Lfunc_end24 - wakeup_sleepy_socket
	$section,	%stack_sizes,"o",@progbits,%text, wakeup_sleepy_socket
	$long,	.Lfunc_begin24
	$byte,	0
	$section,	%text, wakeup_sleepy_socket,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, socket_open,"ax",@progbits
	$globl,	socket_open                     //  -  -  Begin function socket_open
	$type,	socket_open,@function
socket_open:                            // @socket_open
.Lfunc_begin25:
// %bb.0:
	$sd , r22, 40, d22
	$add , r22, r22, 48
	$sd , r22,  - 40, d14
	$sd , r22,  - 48, d16
	$lw , r1, zero, mutex_sockets
	// inline asm
.Ltmp100:
	$acquire , r1, 0, nz, .Ltmp100
	// inline asm
	$lw , r16, zero, cur_process_index
	$lsl , r1, r16, 4
	$lsl_add , r1, r1, r16, 6
	$move , r2, processs
	$add , r1, r2, r1
	$lw , r2, r1, 56
	$move , r15, r0
	$jeq , r2, 0, .LBB25_1
// %bb.4:
	$lw , r0, r1, 64
	$jeq , r0, 0, .LBB25_5
// %bb.8:
	$lsl , r0, r16, 4
	$lsl_add , r0, r0, r16, 6
	$move , r1, processs
	$add , r0, r1, r0
	$lw , r1, r0, 72
	$jeq , r1, 0, .LBB25_9
// %bb.10:
	$lw , r0, zero, mutex_sockets
	// inline asm
.Ltmp101:
	$release , r0, 0, nz, .Ltmp101 + 1
	// inline asm
	$move , r14,  - 7, true, .LBB25_7
.LBB25_1:
	$add , r17, r1, 56
	$move , r14, 0
	$call , r23, alloc_inode
	$jleu , r0, 1, .LBB25_3
	$jump , .LBB25_6
.LBB25_5:
	$add , r17, r1, 64
	$move , r14, 1
	$call , r23, alloc_inode
	$jgtu , r0, 1, .LBB25_6
.LBB25_3:
	$lw , r0, zero, mutex_sockets
	// inline asm
.Ltmp102:
	$release , r0, 0, nz, .Ltmp102 + 1
	// inline asm
	$move , r14,  - 11, true, .LBB25_7
.LBB25_9:
	$add , r17, r0, 72
	$move , r14, 2
	$call , r23, alloc_inode
	$jleu , r0, 1, .LBB25_3
.LBB25_6:
	$sw , r17, 0, r0
	$lsl , r1, r16, 4
	$lsl_add , r1, r1, r16, 6
	$move , r2, processs
	$lw , r3, zero, mutex_flag
	$add , r1, r2, r1
	$lsl_add , r1, r1, r14, 3
	$sw , r1, 60, 5
	// inline asm
.Ltmp103:
	$acquire , r3, 0, nz, .Ltmp103
	// inline asm
	$move , r1, 651264
	$add , r2, r22,  - 32
	$ldma , r2, r1, 1
	$lw , r3, r22,  - 24
	$or , r3, r3, 16
	$sw , r22,  - 24, r3
	$sdma , r2, r1, 1
	$lw , r3, zero, mutex_flag
	// inline asm
.Ltmp104:
	$release , r3, 0, nz, .Ltmp104 + 1
	// inline asm
	$sd , r22,  - 24, 0
	$sd , r22,  - 32, 0
	$sw , r22,  - 16, r15
	$sw , r22,  - 12, 0
	$lsl_add , r1, r1, r0, 16
	$sdma , r2, r1, 1
	$move , r1, 651280
	$lsl_add , r0, r1, r0, 16
	$add , r1, r22,  - 16
	$sdma , r1, r0, 0
	$lw , r0, zero, mutex_sockets
	// inline asm
.Ltmp105:
	$release , r0, 0, nz, .Ltmp105 + 1
	// inline asm
.LBB25_7:
	$move , r0, r14
	$ld , d16, r22,  - 48
	$ld , d14, r22,  - 40
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end25:
	$size,	socket_open, .Lfunc_end25 - socket_open
	$section,	%stack_sizes,"o",@progbits,%text, socket_open
	$long,	.Lfunc_begin25
	$byte,	48
	$section,	%text, socket_open,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, set_flag,"ax",@progbits
	$globl,	set_flag                        //  -  -  Begin function set_flag
	$type,	set_flag,@function
set_flag:                               // @set_flag
.Lfunc_begin26:
// %bb.0:
	$lw , r1, zero, mutex_flag
	// inline asm
.Ltmp106:
	$acquire , r1, 0, nz, .Ltmp106
	// inline asm
	$move , r1, 651264
	$add , r2, r22, 0
	$ldma , r2, r1, 1
	$lw , r3, r22, 8
	$or , r0, r3, r0
	$sw , r22, 8, r0
	$sdma , r2, r1, 1
	$lw , r0, zero, mutex_flag
	// inline asm
.Ltmp107:
	$release , r0, 0, nz, .Ltmp107 + 1
	// inline asm
	$jump , r23
.Lfunc_end26:
	$size,	set_flag, .Lfunc_end26 - set_flag
	$section,	%stack_sizes,"o",@progbits,%text, set_flag
	$long,	.Lfunc_begin26
	$byte,	16
	$section,	%text, set_flag,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, check_sd,"ax",@progbits
	$globl,	check_sd                        //  -  -  Begin function check_sd
	$type,	check_sd,@function
check_sd:                               // @check_sd
.Lfunc_begin27:
// %bb.0:
	$jgtu , r0, 3, .LBB27_4
// %bb.2:
	$lw , r1, zero, cur_process_index
	$lsl , r2, r1, 4
	$lsl_add , r1, r2, r1, 6
	$move , r2, processs
	$add , r1, r2, r1
	$lsl_add , r0, r1, r0, 3
	$lw , r0, r0, 56
	$jeq , r0, 0, .LBB27_4
// %bb.3:
	$move , r0, 0
	$jump , r23
.LBB27_4:
	$move , r0,  - 8
	$jump , r23
.Lfunc_end27:
	$size,	check_sd, .Lfunc_end27 - check_sd
	$section,	%stack_sizes,"o",@progbits,%text, check_sd
	$long,	.Lfunc_begin27
	$byte,	0
	$section,	%text, check_sd,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, socket_close,"ax",@progbits
	$globl,	socket_close                    //  -  -  Begin function socket_close
	$type,	socket_close,@function
socket_close:                           // @socket_close
.Lfunc_begin28:
// %bb.0:
	$sd , r22, 0, d22
	$add , r22, r22, 8
	$lw , r1, zero, mutex_sockets
	// inline asm
.Ltmp108:
	$acquire , r1, 0, nz, .Ltmp108
	// inline asm
	$jgtu , r0, 3, .LBB28_2
// %bb.1:
	$lw , r1, zero, cur_process_index
	$lsl , r2, r1, 4
	$lsl_add , r1, r2, r1, 6
	$move , r2, processs
	$add , r1, r2, r1
	$lsl_add , r0, r1, r0, 3
	$lw , r0, r0, 56
	$jneq , r0, 0, .LBB28_3
.LBB28_2:
	$lw , r1, zero, mutex_sockets
	$move , r0,  - 8
	// inline asm
.Ltmp109:
	$release , r1, 0, nz, .Ltmp109 + 1
	// inline asm
	$ld , d22, r22,  - 8
	$jump , r23
.LBB28_3:
	$lw , r0, zero, cur_process_index
	$call , r23, free_inode
.Lfunc_end28:
	$size,	socket_close, .Lfunc_end28 - socket_close
	$section,	%stack_sizes,"o",@progbits,%text, socket_close
	$long,	.Lfunc_begin28
	$byte,	8
	$section,	%text, socket_close,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, socket_read,"ax",@progbits
	$globl,	socket_read                     //  -  -  Begin function socket_read
	$type,	socket_read,@function
socket_read:                            // @socket_read
.Lfunc_begin29:
// %bb.0:
	$sd , r22, 48, d22
	$add , r22, r22, 56
	$sd , r22,  - 32, d14
	$sd , r22,  - 40, d16
	$sd , r22,  - 48, d18
	$sd , r22,  - 56, d20
	$lw , r3, zero, mutex_sockets
	$move , r14, r2
	$move , r15, r1
	$move , r16, r0
	// inline asm
.Ltmp110:
	$acquire , r3, 0, nz, .Ltmp110
	// inline asm
	$move , r0,  - 8
	$jgtu , r16, 3, .LBB29_38
// %bb.1:
	$lw , r1, zero, cur_process_index
	$lsl , r2, r1, 4
	$lsl_add , r2, r2, r1, 6
	$move , r1, processs
	$add , r2, r1, r2
	$lsl_add , r2, r2, r16, 3
	$lw , r2, r2, 56
	$jeq , r2, 0, .LBB29_38
// %bb.2:
	$lw , r0, zero, cur_process_index
	$lsl , r2, r0, 4
	$lsl_add , r0, r2, r0, 6
	$add , r0, r1, r0
	$lsl_add , r0, r0, r16, 3
	$lw , r0, r0, 56
	$lsl , r19, r0, 16
	$move , r1, 651264
	$lsl_add , r18, r1, r0, 16
	$add , r0, r22,  - 24
	$ldma , r0, r18, 1
	$jump , .LBB29_3
.LBB29_9:                               //   in Loop: Header=BB29_3 Depth=1
	$call , r23, me_new
	$lbu , r0, r0, cur_jobs
	$lsl , r1, r0, 2
	$lsl_add , r0, r1, r0, 4
	$add , r0, r17, r0
	$add , r17, r0, 16
	$call , r23, me_new
	$lsl , r0, r0, 2
	$lw , r1, r0, fc_scheduler_job
	$move , r0, r17
	$call , r23, swap_context
.LBB29_10:                              //   in Loop: Header=BB29_3 Depth=1
	$add , r0, r22,  - 24
	$ldma , r0, r18, 1
	$lw , r0, r22,  - 16
	$move , r1, 4
	$call , r23, print_debug
	$lw , r0, r22,  - 20
	$move , r1, 5
	$call , r23, print_debug
	$move , r1, 6
	$move , r0, r14
	$call , r23, print_debug
.LBB29_3:                               // =>This Inner Loop Header: Depth=1
	$lw , r0, r22,  - 16
	$lw , r2, r22,  - 20
	$jltu , r0, r2, .LBB29_5
// %bb.4:                               //   in Loop: Header=BB29_3 Depth=1
	$sub , r1, r0, r2
	$jltu , r1, r14, .LBB29_7
.LBB29_5:                               //   in Loop: Header=BB29_3 Depth=1
	$jgeu , r0, r2, .LBB29_11
// %bb.6:                               //   in Loop: Header=BB29_3 Depth=1
	$sub , r0, r0, r2
	$add , r0, r0, 16384
	$jgeu , r0, r14, .LBB29_11
.LBB29_7:                               //   in Loop: Header=BB29_3 Depth=1
	$lw , r0, zero, cur_process_index
	$lsl , r1, r0, 4
	$lsl_add , r0, r1, r0, 6
	$move , r1, processs
	$add , r0, r1, r0
	$lw , r20, zero, mutex_sockets
	$lsl_add , r0, r0, r16, 3
	$add , r21, r0, 56
	$call , r23, me_new
	$lbu , r0, r0, cur_jobs
	$lsl , r1, r0, 2
	$lsl_add , r0, r1, r0, 4
	$move , r17, jobs
	$add , r1, r17, r0
	$move , r2, 6
	$sb , r0, jobs, r2
	$sw , r1, 8, r21
	$jeq , r20, 0, .LBB29_9
// %bb.8:                               //   in Loop: Header=BB29_3 Depth=1
	// inline asm
.Ltmp111:
	$release , r20, 0, nz, .Ltmp111 + 1
	// inline asm
	$call , r23, me_new
	$lbu , r0, r0, cur_jobs
	$lsl , r1, r0, 2
	$lsl_add , r0, r1, r0, 4
	$add , r0, r17, r0
	$add , r17, r0, 16
	$call , r23, me_new
	$lsl , r0, r0, 2
	$lw , r1, r0, fc_scheduler_job
	$move , r0, r17
	$call , r23, swap_context
	// inline asm
.Ltmp112:
	$acquire , r20, 0, nz, .Ltmp112
	// inline asm
	$jump , .LBB29_10
.LBB29_11:
	$add , r0, r14, r2
	$add , r0, r0, 8
	$and , r1, r0,  - 8
	$add , r2, r2, 16
	$and , r2, r2,  - 8
	$add , r3, r2, r1
	$move , r4, 16384
	$jgtu , r3, r4, .LBB29_19
// %bb.12:
	$add , r1, r2, r19
	$add , r1, r1, 651264
	$lsr , r2, r0, 11, z, .LBB29_13
// %bb.14:
	$move , r3, buf_socket
	$move , r4, r1
.LBB29_15:                              // =>This Inner Loop Header: Depth=1
	$ldma , r3, r4, 255
	$add , r3, r3, 2048
	$add , r4, r4, 2048
	$add , r2, r2,  - 1, nz, .LBB29_15
// %bb.16:
	$and , r2, r0,  - 2048
	$and , r0, r0, 2040
	$jneq , r0, 0, .LBB29_18
	$jump , .LBB29_33
.LBB29_19:
	$sub , r0, 16384, r2
	$add , r2, r2, r19
	$add , r2, r2, 651264
	$lsr , r3, r0, 11, z, .LBB29_20
// %bb.21:
	$move , r4, buf_socket
	$move , r5, r2
.LBB29_22:                              // =>This Inner Loop Header: Depth=1
	$ldma , r4, r5, 255
	$add , r4, r4, 2048
	$add , r5, r5, 2048
	$add , r3, r3,  - 1, nz, .LBB29_22
// %bb.23:
	$and , r3, r0,  - 2048
	$jump , .LBB29_24
.LBB29_13:
	$move , r2, 0
	$and , r0, r0, 2040
	$jeq , r0, 0, .LBB29_33
.LBB29_18:
	$add , r1, r1, r2
	$move , r3, buf_socket
	$add , r2, r3, r2
	$move , r3,  - 1
	$lsr_add , r0, r3, r0, 3
	$lsl_add , r0, r2, r0, 24
	$ldma , r0, r1, 0
	$jump , .LBB29_33
.LBB29_20:
	$move , r3, 0
.LBB29_24:
	$sub , r1, r1, r0
	$and , r4, r0, 2040
	$jeq , r4, 0, .LBB29_26
// %bb.25:
	$add , r2, r2, r3
	$move , r5, buf_socket
	$add , r3, r5, r3
	$move , r5,  - 1
	$lsr_add , r4, r5, r4, 3
	$lsl_add , r3, r3, r4, 24
	$ldma , r3, r2, 0
.LBB29_26:
	$move , r2, buf_socket
	$or , r3, r19, 16
	$add , r3, r3, 651264
	$lsr , r4, r1, 11, z, .LBB29_27
// %bb.28:
	$add , r5, r0, r2
	$move , r6, r3
.LBB29_29:                              // =>This Inner Loop Header: Depth=1
	$ldma , r5, r6, 255
	$add , r5, r5, 2048
	$add , r6, r6, 2048
	$add , r4, r4,  - 1, nz, .LBB29_29
// %bb.30:
	$and , r4, r1,  - 2048
	$and , r1, r1, 2040
	$jeq , r1, 0, .LBB29_33
.LBB29_32:
	$add , r0, r2, r0
	$add , r2, r3, r4
	$add , r0, r0, r4
	$move , r3,  - 1
	$lsr_add , r1, r3, r1, 3
	$lsl_add , r0, r0, r1, 24
	$ldma , r0, r2, 0
.LBB29_33:
	$lw , r0, r22,  - 20
	$jeq , r14, 0, .LBB29_37
// %bb.34:
	$and , r0, r0, 7
	$move , r1, buf_socket
	$add , r0, r1, r0
	$move , r1, r14
.LBB29_35:                              // =>This Inner Loop Header: Depth=1
	$lbs , r2, r0, 0
	$sb , r15, 0, r2
	$add , r15, r15, 1
	$add , r0, r0, 1
	$add , r1, r1,  - 1, nz, .LBB29_35
// %bb.36:
	$lw , r0, r22,  - 20
.LBB29_37:
	$add , r0, r0, r14
	$and , r0, r0, 16383
	$sw , r22,  - 20, r0
	$add , r0, r22,  - 24
	$sdma , r0, r18, 1
	$move , r0, 0
.LBB29_38:
	$lw , r1, zero, mutex_sockets
	// inline asm
.Ltmp113:
	$release , r1, 0, nz, .Ltmp113 + 1
	// inline asm
	$ld , d20, r22,  - 56
	$ld , d18, r22,  - 48
	$ld , d16, r22,  - 40
	$ld , d14, r22,  - 32
	$ld , d22, r22,  - 8
	$jump , r23
.LBB29_27:
	$move , r4, 0
	$and , r1, r1, 2040
	$jneq , r1, 0, .LBB29_32
	$jump , .LBB29_33
.Lfunc_end29:
	$size,	socket_read, .Lfunc_end29 - socket_read
	$section,	%stack_sizes,"o",@progbits,%text, socket_read
	$long,	.Lfunc_begin29
	$byte,	56
	$section,	%text, socket_read,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, socket_write,"ax",@progbits
	$globl,	socket_write                    //  -  -  Begin function socket_write
	$type,	socket_write,@function
socket_write:                           // @socket_write
.Lfunc_begin30:
// %bb.0:
	$sd , r22, 64, d22
	$add , r22, r22, 72
	$sd , r22,  - 48, d14
	$sd , r22,  - 56, d16
	$sd , r22,  - 64, d18
	$sd , r22,  - 72, d20
	$move , r15, r2
	$move , r16, r1
	$move , r14, r0
	$move , r0,  - 20
	$jgtu , r15, 264, .LBB30_23
// %bb.1:
	$lw , r0, zero, mutex_sockets
	// inline asm
.Ltmp114:
	$acquire , r0, 0, nz, .Ltmp114
	// inline asm
	$move , r0,  - 8
	$jgtu , r14, 3, .LBB30_22
// %bb.2:
	$lw , r1, zero, cur_process_index
	$lsl , r2, r1, 4
	$lsl_add , r2, r2, r1, 6
	$move , r1, processs
	$add , r2, r1, r2
	$lsl_add , r2, r2, r14, 3
	$lw , r2, r2, 56
	$jeq , r2, 0, .LBB30_22
// %bb.3:
	$lw , r0, zero, cur_process_index
	$lsl , r2, r0, 4
	$lsl_add , r0, r2, r0, 6
	$add , r0, r1, r0
	$lsl_add , r0, r0, r14, 3
	$lw , r19, r0, 56
	$move , r0, 651264
	$lsl_add , r18, r0, r19, 16, true, .LBB30_4
.LBB30_7:                               //   in Loop: Header=BB30_4 Depth=1
	$call , r23, me_new
	$lbu , r0, r0, cur_jobs
	$lsl , r1, r0, 2
	$lsl_add , r0, r1, r0, 4
	$add , r0, r17, r0
	$add , r17, r0, 16
	$call , r23, me_new
	$lsl , r0, r0, 2
	$lw , r1, r0, fc_scheduler_job
	$move , r0, r17
	$call , r23, swap_context
.LBB30_4:                               // =>This Inner Loop Header: Depth=1
	$add , r0, r22,  - 24
	$ldma , r0, r18, 1
	$lw , r0, r22,  - 24
	$add , r1, r0, r15
	$lsr , r1, r1, 14, z, .LBB30_8
// %bb.5:                               //   in Loop: Header=BB30_4 Depth=1
	$lw , r0, zero, cur_process_index
	$lsl , r1, r0, 4
	$lsl_add , r0, r1, r0, 6
	$move , r1, processs
	$add , r0, r1, r0
	$lw , r20, zero, mutex_sockets
	$lsl_add , r0, r0, r14, 3
	$add , r21, r0, 56
	$call , r23, me_new
	$lbu , r0, r0, cur_jobs
	$lsl , r1, r0, 2
	$lsl_add , r0, r1, r0, 4
	$move , r17, jobs
	$add , r1, r17, r0
	$move , r2, 6
	$sb , r0, jobs, r2
	$sw , r1, 8, r21
	$jeq , r20, 0, .LBB30_7
// %bb.6:                               //   in Loop: Header=BB30_4 Depth=1
	// inline asm
.Ltmp115:
	$release , r20, 0, nz, .Ltmp115 + 1
	// inline asm
	$call , r23, me_new
	$lbu , r0, r0, cur_jobs
	$lsl , r1, r0, 2
	$lsl_add , r0, r1, r0, 4
	$add , r0, r17, r0
	$add , r17, r0, 16
	$call , r23, me_new
	$lsl , r0, r0, 2
	$lw , r1, r0, fc_scheduler_job
	$move , r0, r17
	$call , r23, swap_context
	// inline asm
.Ltmp116:
	$acquire , r20, 0, nz, .Ltmp116
	// inline asm
	$jump , .LBB30_4
.LBB30_8:
	$lsl , r1, r19, 16
	$and , r2, r0, 7, z, .LBB30_9
// %bb.10:
	$add , r0, r0, 16400
	$and , r0, r0,  - 8
	$add , r0, r0, r1
	$add , r0, r0, 651264
	$move , r2, buf_socket
	$ldma , r2, r0, 0
	$lw , r0, r22,  - 24
	$and , r2, r0, 7
	$jneq , r15, 0, .LBB30_12
	$jump , .LBB30_14
.LBB30_9:
	$move , r2, 0
	$jeq , r15, 0, .LBB30_14
.LBB30_12:
	$move , r3, buf_socket
	$add , r2, r3, r2
	$move , r3, r15
.LBB30_13:                              // =>This Inner Loop Header: Depth=1
	$lbs , r4, r16, 0
	$sb , r2, 0, r4
	$add , r2, r2, 1
	$add , r16, r16, 1
	$add , r3, r3,  - 1, nz, .LBB30_13
.LBB30_14:
	$add , r2, r15, r0
	$add , r2, r2, 8
	$add , r0, r0, 16400
	$and , r0, r0,  - 8
	$add , r0, r0, r1
	$add , r0, r0, 651264
	$lsr , r1, r2, 11, z, .LBB30_15
// %bb.16:
	$move , r3, buf_socket
	$move , r4, r0
.LBB30_17:                              // =>This Inner Loop Header: Depth=1
	$sdma , r3, r4, 255
	$add , r3, r3, 2048
	$add , r4, r4, 2048
	$add , r1, r1,  - 1, nz, .LBB30_17
// %bb.18:
	$and , r1, r2,  - 2048
	$and , r2, r2, 2040
	$jeq , r2, 0, .LBB30_21
.LBB30_20:
	$move , r3, buf_socket
	$add , r3, r3, r1
	$add , r0, r0, r1
	$move , r1,  - 1
	$lsr_add , r1, r1, r2, 3
	$lsl_add , r1, r3, r1, 24
	$sdma , r1, r0, 0
.LBB30_21:
	$lw , r0, r22,  - 24
	$add , r0, r0, r15
	$sw , r22,  - 24, r0
	$add , r0, r22,  - 24
	$sdma , r0, r18, 1
	$lw , r0, zero, cur_process_index
	$lsl , r1, r0, 4
	$lsl_add , r0, r1, r0, 6
	$move , r1, processs
	$add , r0, r1, r0
	$lsl_add , r0, r0, r14, 3
	$lw , r1, r0, 60
	$lw , r2, zero, mutex_flag
	$or , r1, r1, 64
	$sw , r0, 60, r1
	// inline asm
.Ltmp117:
	$acquire , r2, 0, nz, .Ltmp117
	// inline asm
	$move , r0, 651264
	$add , r1, r22,  - 40
	$ldma , r1, r0, 1
	$lw , r2, r22,  - 32
	$or , r2, r2, 8
	$sw , r22,  - 32, r2
	$sdma , r1, r0, 1
	$lw , r0, zero, mutex_flag
	// inline asm
.Ltmp118:
	$release , r0, 0, nz, .Ltmp118 + 1
	// inline asm
	$move , r0, 0
.LBB30_22:
	$lw , r1, zero, mutex_sockets
	// inline asm
.Ltmp119:
	$release , r1, 0, nz, .Ltmp119 + 1
	// inline asm
.LBB30_23:
	$ld , d20, r22,  - 72
	$ld , d18, r22,  - 64
	$ld , d16, r22,  - 56
	$ld , d14, r22,  - 48
	$ld , d22, r22,  - 8
	$jump , r23
.LBB30_15:
	$move , r1, 0
	$and , r2, r2, 2040
	$jneq , r2, 0, .LBB30_20
	$jump , .LBB30_21
.Lfunc_end30:
	$size,	socket_write, .Lfunc_end30 - socket_write
	$section,	%stack_sizes,"o",@progbits,%text, socket_write
	$long,	.Lfunc_begin30
	$byte,	72
	$section,	%text, socket_write,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, syscall,"ax",@progbits
	$globl,	syscall                         //  -  -  Begin function syscall
	$type,	syscall,@function
syscall:                                // @syscall
.Lfunc_begin31:
// %bb.0:
	$sd , r22, 56, d22
	$add , r22, r22, 64
	$sd , r22,  - 40, d14
	$sd , r22,  - 48, d16
	$sd , r22,  - 56, d18
	$sd , r22,  - 64, d20
	$move , r18, r4
	$move , r17, r2
	$move , r16, r1
	$move , r14, r0
	$move , r15, 0
	$jeq , r18, 0, .LBB31_60
// %bb.1:
	$call , r23, me_new
	$lbu , r20, r0, cur_jobs
	// inline asm
	$time , r1

	// inline asm
	$lsl , r0, r20, 2
	$lsl_add , r0, r0, r20, 4
	$move , r19, jobs
	$add , r2, r19, r0
	$lw , r2, r2, 12
	$sub , r1, r1, r2
	$move , r2, 2501
	$jltu , r1, r2, .LBB31_3
// %bb.2:
	$move , r1, 3
	$sb , r0, jobs, r1
	$call , r23, me_new
	$lbu , r0, r0, cur_jobs
	$lsl , r1, r0, 2
	$lsl_add , r0, r1, r0, 4
	$add , r0, r19, r0
	$add , r19, r0, 16
	$call , r23, me_new
	$lsl , r0, r0, 2
	$lw , r1, r0, fc_scheduler_job
	$move , r0, r19
	$call , r23, swap_context
.LBB31_3:
	$jneq , r18, 24, .LBB31_7
// %bb.4:
	$call , r23, me_new
	$lw , r1, zero, mutex_l
	// inline asm
.Ltmp120:
	$acquire , r1, 0, nz, .Ltmp120
	// inline asm
	$lw , r1, zero, mutex_jobs
	// inline asm
.Ltmp121:
	$acquire , r1, 0, nz, .Ltmp121
	// inline asm
	$lw , r1, r14, 0
	$jeq , r1,  - 1, .LBB31_6
// %bb.5:
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp122:
	$release , r0, 0, nz, .Ltmp122 + 1
	// inline asm
	$lw , r0, zero, mutex_l
	// inline asm
.Ltmp123:
	$release , r0, 0, nz, .Ltmp123 + 1
	// inline asm
	$move , r15, 1, true, .LBB31_60
.LBB31_7:
	$and , r0, r18,  - 2
	$jneq , r0, 22, .LBB31_12
// %bb.8:
	$jeq , r14, 0, .LBB31_60
// %bb.9:
	$move , r15,  - 19
	$and , r0, r16, 7, nz, .LBB31_60
// %bb.10:
	$move , r15,  - 21
	$and , r0, r17, 7, nz, .LBB31_60
// %bb.11:
	$move , r0, 22
	$sub , r3, r18, r0, neq
	$move , r0, r14
	$move , r1, r16
	$move , r2, r17
	$call , r23, chained_inode_operation
	$move , r15, r0, true, .LBB31_60
.LBB31_12:
	$add , r0, r18,  - 1
	$jgtu , r0, 20, .LBB31_58
// %bb.13:
	$lsl , r0, r0, 2
	$lw , r0, r0, .LJTI31_0
	$jump , r0
.LBB31_32:
	$lw , r0, zero, mutex_sbrk
	// inline asm
.Ltmp124:
	$acquire , r0, 0, nz, .Ltmp124
	// inline asm
	$jlts , r14, 1, .LBB31_34
// %bb.33:
	$lw , r0, zero, cur_process_index
	$lsl , r1, r0, 4
	$lsl_add , r0, r1, r0, 6
	$move , r1, processs
	$add , r0, r1, r0
	$lw , r0, r0, 32
	$add , r0, r0, r14
	$move , r15,  - 2
	$lsr , r0, r0, 8
	$jgtu , r0, 510, .LBB31_38
.LBB31_36:
	$lw , r0, zero, cur_process_index
	$lsl , r1, r0, 4
	$lsl_add , r0, r1, r0, 6
	$move , r1, processs
	$add , r0, r1, r0
	$lw , r1, r0, 32
	$add , r1, r1, r14
	$sw , r0, 32, r1
	$jump , .LBB31_37
.LBB31_6:
	$lbu , r0, r0, cur_jobs
	$sw , r14, 0, r0
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp125:
	$release , r0, 0, nz, .Ltmp125 + 1
	// inline asm
	$lw , r0, zero, mutex_l
	// inline asm
.Ltmp126:
	$release , r0, 0, nz, .Ltmp126 + 1
	// inline asm
.LBB31_60:
	$move , r0, r15
	$ld , d20, r22,  - 64
	$ld , d18, r22,  - 56
	$ld , d16, r22,  - 48
	$ld , d14, r22,  - 40
	$ld , d22, r22,  - 8
	$jump , r23
.LBB31_51:
	$move , r0, r14
	$move , r1, r16
	$move , r2, r17
	$call , r23, socket_read
	$move , r15, r0, true, .LBB31_60
.LBB31_31:
	$sw , r14, 0,  - 1
	$jump , .LBB31_60
.LBB31_27:
	$move , r0, r14
	$call , r23, lock
	$jump , .LBB31_60
.LBB31_28:
	$move , r0, r14
	$call , r23, unlock
	$jump , .LBB31_60
.LBB31_29:
	$call , r23, me_new
	$lbu , r0, r0, cur_jobs
	$lsl , r1, r0, 2
	$lsl_add , r0, r1, r0, 4
	$move , r17, jobs
	$add , r1, r17, r0
	$move , r2, 6
	$sb , r0, jobs, r2
	$sw , r1, 8, r14
	$jeq , r16, 0, .LBB31_59
// %bb.30:
	$move , r0, r16
	$call , r23, unlock
	$call , r23, me_new
	$lbu , r0, r0, cur_jobs
	$lsl , r1, r0, 2
	$lsl_add , r0, r1, r0, 4
	$add , r0, r17, r0
	$add , r14, r0, 16
	$call , r23, me_new
	$lsl , r0, r0, 2
	$lw , r1, r0, fc_scheduler_job
	$move , r0, r14
	$call , r23, swap_context
	$move , r0, r16
	$call , r23, lock
	$jump , .LBB31_60
.LBB31_14:
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp127:
	$acquire , r0, 0, nz, .Ltmp127
	// inline asm
	$lw , r0, zero, cur_process_index
	$jeq , r0, 0, .LBB31_15
// %bb.61:
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp128:
	$acquire , r0, 0, nz, .Ltmp128
	// inline asm
	$lw , r1, zero, cur_process_index
	$move , r0, 1
	$jeq , r1, 1, .LBB31_16
// %bb.62:
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp129:
	$acquire , r0, 0, nz, .Ltmp129
	// inline asm
	$lw , r1, zero, cur_process_index
	$move , r0, 2
	$jeq , r1, 2, .LBB31_16
// %bb.63:
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp130:
	$acquire , r0, 0, nz, .Ltmp130
	// inline asm
	$lw , r1, zero, cur_process_index
	$move , r0, 3
	$jeq , r1, 3, .LBB31_16
// %bb.64:
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp131:
	$acquire , r0, 0, nz, .Ltmp131
	// inline asm
	$lw , r1, zero, cur_process_index
	$move , r0, 4
	$jeq , r1, 4, .LBB31_16
// %bb.65:
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp132:
	$acquire , r0, 0, nz, .Ltmp132
	// inline asm
	$lw , r1, zero, cur_process_index
	$move , r0, 5
	$jeq , r1, 5, .LBB31_16
// %bb.66:
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp133:
	$acquire , r0, 0, nz, .Ltmp133
	// inline asm
	$lw , r1, zero, cur_process_index
	$move , r0, 6
	$jeq , r1, 6, .LBB31_16
// %bb.67:
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp134:
	$acquire , r0, 0, nz, .Ltmp134
	// inline asm
	$lw , r1, zero, cur_process_index
	$move , r0, 7
	$jeq , r1, 7, .LBB31_16
// %bb.68:
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp135:
	$acquire , r0, 0, nz, .Ltmp135
	// inline asm
	$lw , r1, zero, cur_process_index
	$move , r0, 8
	$jeq , r1, 8, .LBB31_16
// %bb.69:
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp136:
	$acquire , r0, 0, nz, .Ltmp136
	// inline asm
	$lw , r1, zero, cur_process_index
	$move , r0, 9
	$jeq , r1, 9, .LBB31_16
// %bb.70:
	$lw , r0, zero, cur_process_index
	$lsl , r1, r0, 4
	$lsl_add , r1, r1, r0, 11
	$lsl_sub , r0, r1, r0, 6
	$add , r0, r0, 651280
	$move , r1, jobs
	$ldma , r1, r0, 249
	$jump , .LBB31_23
.LBB31_40:
	$lw , r0, zero, cur_process_index
	$lsl , r1, r0, 4
	$lsl_add , r0, r1, r0, 6
	$move , r1, processs
	$add , r0, r1, r0
	$lw , r15, r0, 4
	$jump , .LBB31_60
.LBB31_41:
	$lw , r0, zero, cur_process_index
	$lsl , r1, r0, 4
	$lsl_add , r0, r1, r0, 6
	$move , r1, processs
	$jump , .LBB31_44
.LBB31_42:
	$lw , r0, zero, cur_process_index
	$lsl , r1, r0, 4
	$lsl_add , r0, r1, r0, 6
	$lbu , r15, r0, processs
	$jump , .LBB31_60
.LBB31_43:
	$lsl , r0, r20, 2
	$lsl_add , r0, r0, r20, 4
	$move , r1, jobs
.LBB31_44:
	$add , r0, r1, r0
	$lbu , r15, r0, 1
	$jump , .LBB31_60
.LBB31_46:
	$move , r0, beg
	$call , r23, printk
	$move , r0, r14
	$call , r23, printk
	$jump , .LBB31_49
.LBB31_47:
	$move , r0, beg
	$call , r23, printk
	$lw , r0, zero, log_w
	$add , r0, r0, 8
	$move , r1, 65536
	$jgtu , r0, r1, .LBB31_49
// %bb.48:
	$lw , r0, zero, mutex_printk
	// inline asm
.Ltmp137:
	$acquire , r0, 0, nz, .Ltmp137
	// inline asm
	$lw , r0, zero, log_w
	$sw , r22,  - 16, 1
	$sw , r22,  - 12, r14
	$add , r0, r0, 716800
	$add , r1, r22,  - 16
	$sdma , r1, r0, 0
	$lw , r0, zero, log_w
	$lw , r1, zero, mutex_flag
	$add , r0, r0, 8
	$sw , zero, log_w, r0
	// inline asm
.Ltmp138:
	$acquire , r1, 0, nz, .Ltmp138
	// inline asm
	$move , r0, 651264
	$add , r1, r22,  - 32
	$ldma , r1, r0, 1
	$lw , r2, r22,  - 24
	$or , r2, r2, 64
	$sw , r22,  - 24, r2
	$sdma , r1, r0, 1
	$lw , r0, zero, mutex_flag
	// inline asm
.Ltmp139:
	$release , r0, 0, nz, .Ltmp139 + 1
	// inline asm
	$lw , r0, zero, mutex_printk
	// inline asm
.Ltmp140:
	$release , r0, 0, nz, .Ltmp140 + 1
	// inline asm
.LBB31_49:
	$move , r0, end
	$call , r23, printk
	$jump , .LBB31_60
.LBB31_50:
	$move , r0, r14
	$call , r23, socket_open
	$move , r15, r0, true, .LBB31_60
.LBB31_52:
	$move , r0, r14
	$move , r1, r16
	$move , r2, r17
	$call , r23, socket_write
	$move , r15, r0, true, .LBB31_60
.LBB31_53:
	$lw , r0, zero, mutex_sockets
	// inline asm
.Ltmp141:
	$acquire , r0, 0, nz, .Ltmp141
	// inline asm
	$jgtu , r14, 3, .LBB31_55
// %bb.54:
	$lw , r0, zero, cur_process_index
	$lsl , r1, r0, 4
	$lsl_add , r0, r1, r0, 6
	$move , r1, processs
	$add , r0, r1, r0
	$lsl_add , r0, r0, r14, 3
	$lw , r0, r0, 56
	$jneq , r0, 0, .LBB31_71
.LBB31_55:
	$lw , r0, zero, mutex_sockets
	// inline asm
.Ltmp142:
	$release , r0, 0, nz, .Ltmp142 + 1
	// inline asm
	$move , r15,  - 8, true, .LBB31_60
.LBB31_58:
	$move , r15,  - 1, true, .LBB31_60
.LBB31_56:
	$move , r0, r14
	$call , r23, create_job
	$move , r15, r0, true, .LBB31_60
.LBB31_57:
	$call , r23, join_job
	$move , r15, r0, true, .LBB31_60
.LBB31_59:
	$call , r23, me_new
	$lbu , r0, r0, cur_jobs
	$lsl , r1, r0, 2
	$lsl_add , r0, r1, r0, 4
	$add , r0, r17, r0
	$add , r14, r0, 16
	$call , r23, me_new
	$lsl , r0, r0, 2
	$lw , r1, r0, fc_scheduler_job
	$move , r0, r14
	$call , r23, swap_context
	$jump , .LBB31_60
.LBB31_15:
	$move , r0, 0
.LBB31_16:
	$lsl , r1, r0, 4
	$lsl_add , r0, r1, r0, 6
	$move , r1, processs
	$add , r0, r1, r0
	$lbu , r0, r0, 2
	$jeq , r0, 0, .LBB31_22
// %bb.17:
	$move , r1, 0, true, .LBB31_18
.LBB31_21:                              //   in Loop: Header=BB31_18 Depth=1
	$add , r1, r1, 1
	$jgeu , r1, r0, .LBB31_22
.LBB31_18:                              // =>This Inner Loop Header: Depth=1
	$lsl , r2, r1, 2
	$lsl_add , r2, r2, r1, 4
	$lbu , r3, r2, jobs
	$jneq , r3, 6, .LBB31_21
// %bb.19:                              //   in Loop: Header=BB31_18 Depth=1
	$move , r3, jobs
	$add , r2, r3, r2
	$lw , r2, r2, 8
	$jneq , r2, r14, .LBB31_21
// %bb.20:                              //   in Loop: Header=BB31_18 Depth=1
	$lsl , r2, r1, 2
	$lsl_add , r2, r2, r1, 4
	$move , r3, 3
	$sb , r2, jobs, r3
	$jump , .LBB31_21
.LBB31_22:
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp143:
	$release , r0, 0, nz, .Ltmp143 + 1
	// inline asm
.LBB31_23:
	$move , r0, cp
	$lw , r1, r0, 4
	// inline asm
.Ltmp144:
	$acquire , r1, 0, nz, .Ltmp144
	// inline asm
	$sb , r0, 2, 1
	$lbu , r1, zero, cp
	$jeq , r1, 0, .LBB31_26
// %bb.24:
	$move , r1, 0
.LBB31_25:                              // =>This Inner Loop Header: Depth=1
	// inline asm
.Ltmp145:
	$resume , r1, 0, nz, .Ltmp145 + 1
	// inline asm
	$lbu , r2, zero, cp
	$add , r1, r1, 1
	$jltu , r1, r2, .LBB31_25
.LBB31_26:
	$sb , r0, 1, 0
	$lw , r0, r0, 4
	// inline asm
.Ltmp146:
	$release , r0, 0, nz, .Ltmp146 + 1
	// inline asm
	$move , r15, 0, true, .LBB31_60
.LBB31_34:
	$jles , r14,  - 1, .LBB31_35
.LBB31_37:
	$lw , r0, zero, cur_process_index
	$lsl , r1, r0, 4
	$lsl_add , r0, r1, r0, 6
	$move , r1, processs
	$add , r0, r1, r0
	$lw , r0, r0, 32
	$add , r15, r0, 512
	$jgts , r15,  - 1, .LBB31_39
	$jump , .LBB31_38
.LBB31_35:
	$lw , r0, zero, cur_process_index
	$lsl , r1, r0, 4
	$lsl_add , r0, r1, r0, 6
	$move , r1, processs
	$add , r0, r1, r0
	$lw , r0, r0, 32
	$lw , r2, zero, cur_process_index
	$lsl , r3, r2, 4
	$lsl_add , r2, r3, r2, 6
	$add , r1, r1, r2
	$lw , r1, r1, 44
	$add , r0, r0, r14
	$move , r15,  - 3
	$jgeu , r0, r1, .LBB31_36
.LBB31_38:
	$call , r23, fault_notif
.LBB31_39:
	$lw , r0, zero, mutex_sbrk
	// inline asm
.Ltmp147:
	$release , r0, 0, nz, .Ltmp147 + 1
	// inline asm
	$jump , .LBB31_60
.LBB31_45:
	$move , r0, r14
	$call , r23, __end_process
.LBB31_71:
	$lw , r0, zero, cur_process_index
	$call , r23, free_inode
.Lfunc_end31:
	$size,	syscall, .Lfunc_end31 - syscall
	$section,	%rodata, syscall,"a",@progbits
	$p2align,	2
.LJTI31_0:
	$long,	.LBB31_60
	$long,	.LBB31_32
	$long,	.LBB31_40
	$long,	.LBB31_41
	$long,	.LBB31_42
	$long,	.LBB31_43
	$long,	.LBB31_45
	$long,	.LBB31_46
	$long,	.LBB31_47
	$long,	.LBB31_50
	$long,	.LBB31_51
	$long,	.LBB31_52
	$long,	.LBB31_53
	$long,	.LBB31_31
	$long,	.LBB31_27
	$long,	.LBB31_28
	$long,	.LBB31_29
	$long,	.LBB31_14
	$long,	.LBB31_58
	$long,	.LBB31_56
	$long,	.LBB31_57
	$section,	%stack_sizes,"o",@progbits,%rodata, syscall
	$long,	.Lfunc_begin31
	$byte,	64
	$section,	%rodata, syscall,"a",@progbits
                                        //  -  -  End function
	$section,	%text, __end_process,"ax",@progbits
	$globl,	__end_process                   //  -  -  Begin function __end_process
	$type,	__end_process,@function
__end_process:                          // @__end_process
.Lfunc_begin32:
// %bb.0:
	$sd , r22, 16, d22
	$add , r22, r22, 24
	$lw , r1, zero, mutex_jobs
	// inline asm
.Ltmp148:
	$acquire , r1, 0, nz, .Ltmp148
	// inline asm
	$lw , r1, zero, cur_process_index
	$lsl , r2, r1, 4
	$lsl_add , r1, r2, r1, 6
	$move , r2, processs
	$add , r1, r2, r1
	$sw , r1, 8, 4
	$lw , r1, zero, cur_process_index
	$lsl , r3, r1, 4
	$lw , r4, zero, mutex_flag
	$lsl_add , r1, r3, r1, 6
	$add , r1, r2, r1
	$sw , r1, 12, r0
	// inline asm
.Ltmp149:
	$acquire , r4, 0, nz, .Ltmp149
	// inline asm
	$move , r0, 651264
	$add , r1, r22,  - 24
	$ldma , r1, r0, 1
	$lw , r3, r22,  - 16
	$or , r3, r3, 2
	$sw , r22,  - 16, r3
	$sdma , r1, r0, 1
	$lw , r0, zero, mutex_flag
	// inline asm
.Ltmp150:
	$release , r0, 0, nz, .Ltmp150 + 1
	// inline asm
	$lw , r0, zero, cur_process_index
	$lsl , r1, r0, 4
	$lsl_add , r0, r1, r0, 6
	$add , r0, r2, r0
	$lbu , r0, r0, 2
	$jeq , r0, 0, .LBB32_3
// %bb.1:
	$move , r0, 0
.LBB32_2:                               // =>This Inner Loop Header: Depth=1
	$lsl , r1, r0, 2
	$lsl_add , r1, r1, r0, 4
	$move , r2, 4
	$sb , r1, jobs, r2
	$lw , r1, zero, cur_process_index
	$lsl , r2, r1, 4
	$lsl_add , r1, r2, r1, 6
	$move , r2, processs
	$add , r1, r2, r1
	$lbu , r1, r1, 2
	$add , r0, r0, 1
	$jltu , r0, r1, .LBB32_2
.LBB32_3:
	$lw , r0, zero, mutex_jobs
	// inline asm
.Ltmp151:
	$release , r0, 0, nz, .Ltmp151 + 1
	// inline asm
	$call , r23, me_new
	$lsl , r0, r0, 2
	$lw , r1, r0, fc_scheduler_job
	$move , r0, jobs
	$add , r0, r0, 16
	$call , r23, swap_context
	$fault , 4
.Lfunc_end32:
	$size,	__end_process, .Lfunc_end32 - __end_process
	$section,	%stack_sizes,"o",@progbits,%text, __end_process
	$long,	.Lfunc_begin32
	$byte,	24
	$section,	%text, __end_process,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, printk,"ax",@progbits
	$globl,	printk                          //  -  -  Begin function printk
	$type,	printk,@function
printk:                                 // @printk
.Lfunc_begin33:
// %bb.0:
	$lbu , r1, r0, 0
	$jeq , r1, 0, .LBB33_1
// %bb.2:
	$move , r1, 0
.LBB33_3:                               // =>This Inner Loop Header: Depth=1
	$add , r2, r0, r1
	$lbu , r3, r2, 1
	$add , r2, r1, 1
	$move , r1, r2
	$jneq , r3, 0, .LBB33_3
	$jump , .LBB33_4
.LBB33_1:
	$move , r2, 0
.LBB33_4:
	$lw , r1, zero, log_w
	$add , r1, r1, r2
	$move , r3, 65536
	$jgtu , r1, r3, .LBB33_12
// %bb.5:
	$lw , r1, zero, mutex_printk
	// inline asm
.Ltmp152:
	$acquire , r1, 0, nz, .Ltmp152
	// inline asm
	$jeq , r2, 0, .LBB33_6
// %bb.13:
	$move , r1, 0, true, .LBB33_14
.LBB33_16:                              //   in Loop: Header=BB33_14 Depth=1
	$add , r0, r0, 1
	$add , r2, r2,  - 1, z, .LBB33_8
.LBB33_14:                              // =>This Inner Loop Header: Depth=1
	$lbs , r3, r0, 0
	$and , r4, r1, 255
	$sb , r4, buf_aligned, r3
	$add , r1, r1, 1
	$and , r3, r1, 255
	$jneq , r3, 128, .LBB33_16
// %bb.15:                              //   in Loop: Header=BB33_14 Depth=1
	$lw , r1, zero, log_w
	$add , r1, r1, 716800
	$move , r3, buf_aligned
	$sdma , r3, r1, 15
	$lw , r1, zero, log_w
	$add , r1, r1, 128
	$sw , zero, log_w, r1
	$move , r1, 0, true, .LBB33_16
.LBB33_7:                               //   in Loop: Header=BB33_8 Depth=1
	$move , r2, 0
	$sb , r0, buf_aligned, r2
	$add , r1, r1, 1
.LBB33_8:                               // =>This Inner Loop Header: Depth=1
	$and , r0, r1, 255
	$and , r2, r1, 7, nz, .LBB33_7
// %bb.9:
	$and , r1, r1, 255
	$jeq , r1, 0, .LBB33_11
// %bb.10:
	$lw , r1, zero, log_w
	$add , r1, r1, 716800
	$move , r2,  - 1
	$lsr_add , r2, r2, r0, 3
	$move , r3, buf_aligned
	$lsl_add , r2, r3, r2, 24
	$sdma , r2, r1, 0
	$jump , .LBB33_11
.LBB33_6:
	$move , r0, 0
.LBB33_11:
	$lw , r1, zero, log_w
	$lw , r2, zero, mutex_flag
	$add , r0, r1, r0
	$sw , zero, log_w, r0
	// inline asm
.Ltmp153:
	$acquire , r2, 0, nz, .Ltmp153
	// inline asm
	$move , r0, 651264
	$add , r1, r22, 0
	$ldma , r1, r0, 1
	$lw , r2, r22, 8
	$or , r2, r2, 64
	$sw , r22, 8, r2
	$sdma , r1, r0, 1
	$lw , r0, zero, mutex_flag
	// inline asm
.Ltmp154:
	$release , r0, 0, nz, .Ltmp154 + 1
	// inline asm
	$lw , r0, zero, mutex_printk
	// inline asm
.Ltmp155:
	$release , r0, 0, nz, .Ltmp155 + 1
	// inline asm
.LBB33_12:
	$jump , r23
.Lfunc_end33:
	$size,	printk, .Lfunc_end33 - printk
	$section,	%stack_sizes,"o",@progbits,%text, printk
	$long,	.Lfunc_begin33
	$byte,	16
	$section,	%text, printk,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, read_flags,"ax",@progbits
	$globl,	read_flags                      //  -  -  Begin function read_flags
	$type,	read_flags,@function
read_flags:                             // @read_flags
.Lfunc_begin34:
// %bb.0:
	$lw , r0, zero, mutex_flag
	// inline asm
.Ltmp156:
	$acquire , r0, 0, nz, .Ltmp156
	// inline asm
	$move , r0, 651264
	$add , r1, r22, 0
	$ldma , r1, r0, 1
	$lw , r0, zero, mutex_flag
	// inline asm
.Ltmp157:
	$release , r0, 0, nz, .Ltmp157 + 1
	// inline asm
	$lw , r0, r22, 8
	$jump , r23
.Lfunc_end34:
	$size,	read_flags, .Lfunc_end34 - read_flags
	$section,	%stack_sizes,"o",@progbits,%text, read_flags
	$long,	.Lfunc_begin34
	$byte,	16
	$section,	%text, read_flags,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, write_flags,"ax",@progbits
	$globl,	write_flags                     //  -  -  Begin function write_flags
	$type,	write_flags,@function
write_flags:                            // @write_flags
.Lfunc_begin35:
// %bb.0:
	$lw , r1, zero, mutex_flag
	// inline asm
.Ltmp158:
	$acquire , r1, 0, nz, .Ltmp158
	// inline asm
	$sw , r22, 8, r0
	$move , r0, 651264
	$add , r1, r22, 0
	$sdma , r1, r0, 1
	$lw , r0, zero, mutex_flag
	// inline asm
.Ltmp159:
	$release , r0, 0, nz, .Ltmp159 + 1
	// inline asm
	$jump , r23
.Lfunc_end35:
	$size,	write_flags, .Lfunc_end35 - write_flags
	$section,	%stack_sizes,"o",@progbits,%text, write_flags
	$long,	.Lfunc_begin35
	$byte,	16
	$section,	%text, write_flags,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, load_prg_memory,"ax",@progbits
	$globl,	load_prg_memory                 //  -  -  Begin function load_prg_memory
	$type,	load_prg_memory,@function
load_prg_memory:                        // @load_prg_memory
.Lfunc_begin36:
// %bb.0:
	$sd , r22, 16, d22
	$add , r22, r22, 24
	$sd , r22,  - 16, d14
	$sd , r22,  - 24, d16
	$move , r14, r0
	$move , r0, 2
	$move , r15, 0
	$move , r1, r15
	$call , r23, print_debug
	$lsl , r0, r14, 4
	$lsl_add , r0, r0, r14, 6
	$move , r1, processs
	$add , r0, r1, r0
	$lw , r2, r0, 28
	$lw , r1, r0, 32
	$move , r0, 651264
	$lsl_add , r0, r0, r2, 16
	$lsr , r2, r1, 11, z, .LBB36_4
// %bb.1:
	$move , r3, 512
	$move , r4, r0
.LBB36_2:                               // =>This Inner Loop Header: Depth=1
	$ldma , r3, r4, 255
	$add , r3, r3, 2048
	$add , r4, r4, 2048
	$add , r2, r2,  - 1, nz, .LBB36_2
// %bb.3:
	$and , r15, r1,  - 2048
.LBB36_4:
	$and , r1, r1, 2047
	$jeq , r1, 0, .LBB36_6
// %bb.5:
	$add , r0, r0, r15
	$add , r2, r15, 512
	$move , r3,  - 1
	$lsr_add , r1, r3, r1, 3
	$lsl_add , r1, r2, r1, 24
	$ldma , r1, r0, 0
.LBB36_6:
	$move , r0, 3
	$move , r15, 0
	$move , r1, r15
	$call , r23, print_debug
	$lsl , r0, r14, 4
	$lsl_add , r0, r0, r14, 6
	$move , r1, processs
	$add , r16, r1, r0
	$lw , r17, r16, 40
	$move , r0, 4
	$move , r1, r15
	$call , r23, print_debug
	$move , r0, 16
	$lsr , r1, r17, 11, z, .LBB36_9
// %bb.7:
	$move , r0, 16
.LBB36_8:                               // =>This Inner Loop Header: Depth=1
	$lsl , r1, r14, 4
	$lsl_add , r1, r1, r14, 6
	$move , r2, processs
	$add , r1, r2, r1
	$lw , r1, r1, 36
	$add , r17, r17,  - 2048
	$or , r2, r0,  - 16777216
	$lsl_add , r1, r0, r1, 16
	// inline asm
	$ldmai , r2, r1, 0

	// inline asm
	$add , r0, r0, 2048
	$lsr , r1, r17, 11, nz, .LBB36_8
.LBB36_9:
	$move , r1,  - 16777216
	$lw , r2, r16, 36
	$lsl_add , r1, r1, r17, 21
	$and , r1, r1,  - 16777216
	$or , r1, r1, r0
	$lsl_add , r0, r0, r2, 16
	// inline asm
	$ldmai , r1, r0, 0

	// inline asm
	$move , r0, 5
	$move , r1, 0
	$call , r23, print_debug
	$ld , d16, r22,  - 24
	$ld , d14, r22,  - 16
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end36:
	$size,	load_prg_memory, .Lfunc_end36 - load_prg_memory
	$section,	%stack_sizes,"o",@progbits,%text, load_prg_memory
	$long,	.Lfunc_begin36
	$byte,	24
	$section,	%text, load_prg_memory,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, save_wram_process,"ax",@progbits
	$globl,	save_wram_process               //  -  -  Begin function save_wram_process
	$type,	save_wram_process,@function
save_wram_process:                      // @save_wram_process
.Lfunc_begin37:
// %bb.0:
	$lsl , r1, r0, 4
	$lsl_add , r0, r1, r0, 6
	$move , r1, processs
	$add , r0, r1, r0
	$lw , r2, r0, 28
	$lw , r1, r0, 32
	$move , r0, 651264
	$lsl_add , r0, r0, r2, 16
	$lsr , r2, r1, 11, z, .LBB37_1
// %bb.2:
	$move , r3, 512
	$move , r4, r0
.LBB37_3:                               // =>This Inner Loop Header: Depth=1
	$sdma , r3, r4, 255
	$add , r4, r4, 2048
	$add , r3, r3, 2048
	$add , r2, r2,  - 1, nz, .LBB37_3
// %bb.4:
	$and , r2, r1,  - 2048
	$and , r1, r1, 2047
	$jeq , r1, 0, .LBB37_7
.LBB37_6:
	$add , r3, r2, 512
	$add , r0, r0, r2
	$move , r2,  - 1
	$lsr_add , r1, r2, r1, 3
	$lsl_add , r1, r3, r1, 24
	$sdma , r1, r0, 0
.LBB37_7:
	$jump , r23
.LBB37_1:
	$move , r2, 0
	$and , r1, r1, 2047
	$jneq , r1, 0, .LBB37_6
	$jump , .LBB37_7
.Lfunc_end37:
	$size,	save_wram_process, .Lfunc_end37 - save_wram_process
	$section,	%stack_sizes,"o",@progbits,%text, save_wram_process
	$long,	.Lfunc_begin37
	$byte,	0
	$section,	%text, save_wram_process,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, launch_proc,"ax",@progbits
	$globl,	launch_proc                     //  -  -  Begin function launch_proc
	$type,	launch_proc,@function
launch_proc:                            // @launch_proc
.Lfunc_begin38:
// %bb.0:
	$sd , r22, 8, d22
	$add , r22, r22, 16
	$sd , r22,  - 16, d14
	$move , r14, r0
	$lsl , r0, r14, 4
	$lsl_add , r0, r0, r14, 6
	$move , r2, processs
	$add , r15, r2, r0
	$sw , r15, 8, 2
	$sw , zero, cur_process_index, r14
	$jeq , r1, 0, .LBB38_4
// %bb.1:
	$move , r1, 100
.LBB38_2:                               // =>This Inner Loop Header: Depth=1
	$lsl , r0, r1, 2
	$lsl_add , r2, r0, r1, 4
	$move , r0, jobs
	$sub , r2, r0, r2
	$sb , r2, 2000, 0
	$add , r1, r1,  - 1, nz, .LBB38_2
// %bb.3:
	$lsl , r1, r14, 4
	$lsl_add , r1, r1, r14, 6
	$move , r2, processs
	$add , r1, r2, r1
	$sb , r1, 2, 1
	$lw , r2, r1, 24
	$sw , r0, 16, r2
	$sw , r2, 36, r2
	$move , r3, __end_process
	$sw , r2, 32, r3
	$lw , r1, r1, 12
	$sw , r2, 24, r1
	$sh , r0, 0, 1
.LBB38_4:
	// inline asm
	$time , r0

	// inline asm
	$sw , r15, 20, r0
	$call , r23, scheduler_jobs
	$lw , r1, r15, 8
	$jeq , r0, 0, .LBB38_7
// %bb.5:
	$jeq , r1, 4, .LBB38_9
// %bb.6:
	$lsl , r0, r14, 4
	$lsl_add , r0, r0, r14, 6
	$move , r1, processs
	$add , r0, r1, r0
	$sw , r0, 8, 5
	$jump , .LBB38_9
.LBB38_7:
	$jneq , r1, 2, .LBB38_9
// %bb.8:
	$lsl , r0, r14, 4
	$lsl_add , r0, r0, r14, 6
	$move , r1, processs
	$add , r0, r1, r0
	$sw , r0, 8, 3
.LBB38_9:
	$ld , d14, r22,  - 16
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end38:
	$size,	launch_proc, .Lfunc_end38 - launch_proc
	$section,	%stack_sizes,"o",@progbits,%text, launch_proc
	$long,	.Lfunc_begin38
	$byte,	16
	$section,	%text, launch_proc,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, stop_dpu,"ax",@progbits
	$globl,	stop_dpu                        //  -  -  Begin function stop_dpu
	$type,	stop_dpu,@function
stop_dpu:                               // @stop_dpu
.Lfunc_begin39:
// %bb.0:
	$sd , r22, 16, d22
	$add , r22, r22, 24
	$call , r23, stop_me
	$move , r0, 15
	$move , r1, 3
	// inline asm
	$time_cfg , r0, r1

	// inline asm
	$lw , r0, zero, mutex_flag
	// inline asm
.Ltmp160:
	$acquire , r0, 0, nz, .Ltmp160
	// inline asm
	$move , r0, 651264
	$add , r1, r22,  - 24
	$ldma , r1, r0, 1
	$lw , r2, zero, mutex_flag
	// inline asm
.Ltmp161:
	$release , r2, 0, nz, .Ltmp161 + 1
	// inline asm
	$lw , r2, zero, mutex_flag
	$lw , r3, r22,  - 16
	// inline asm
.Ltmp162:
	$acquire , r2, 0, nz, .Ltmp162
	// inline asm
	$sw , r22,  - 16, 0
	$sdma , r1, r0, 1
	$lw , r0, zero, mutex_flag
	// inline asm
.Ltmp163:
	$release , r0, 0, nz, .Ltmp163 + 1
	// inline asm
	$and , r0, r3, 32, z, .LBB39_2
// %bb.1:
	$call , r23, wakeup_sleepy_socket
.LBB39_2:
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end39:
	$size,	stop_dpu, .Lfunc_end39 - stop_dpu
	$section,	%stack_sizes,"o",@progbits,%text, stop_dpu
	$long,	.Lfunc_begin39
	$byte,	24
	$section,	%text, stop_dpu,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, check_timer_stop,"ax",@progbits
	$globl,	check_timer_stop                //  -  -  Begin function check_timer_stop
	$type,	check_timer_stop,@function
check_timer_stop:                       // @check_timer_stop
.Lfunc_begin40:
// %bb.0:
	$sd , r22, 16, d22
	$add , r22, r22, 24
	// inline asm
	$time , r0

	// inline asm
	$move , r1, 5000001
	$jltu , r0, r1, .LBB40_3
// %bb.1:
	$call , r23, stop_me
	$move , r0, 15
	$move , r1, 3
	// inline asm
	$time_cfg , r0, r1

	// inline asm
	$lw , r0, zero, mutex_flag
	// inline asm
.Ltmp164:
	$acquire , r0, 0, nz, .Ltmp164
	// inline asm
	$move , r0, 651264
	$add , r1, r22,  - 24
	$ldma , r1, r0, 1
	$lw , r2, zero, mutex_flag
	// inline asm
.Ltmp165:
	$release , r2, 0, nz, .Ltmp165 + 1
	// inline asm
	$lw , r2, zero, mutex_flag
	$lw , r3, r22,  - 16
	// inline asm
.Ltmp166:
	$acquire , r2, 0, nz, .Ltmp166
	// inline asm
	$sw , r22,  - 16, 0
	$sdma , r1, r0, 1
	$lw , r0, zero, mutex_flag
	// inline asm
.Ltmp167:
	$release , r0, 0, nz, .Ltmp167 + 1
	// inline asm
	$and , r0, r3, 32, z, .LBB40_3
// %bb.2:
	$call , r23, wakeup_sleepy_socket
.LBB40_3:
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end40:
	$size,	check_timer_stop, .Lfunc_end40 - check_timer_stop
	$section,	%stack_sizes,"o",@progbits,%text, check_timer_stop
	$long,	.Lfunc_begin40
	$byte,	24
	$section,	%text, check_timer_stop,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, scheduler,"ax",@progbits
	$globl,	scheduler                       //  -  -  Begin function scheduler
	$type,	scheduler,@function
scheduler:                              // @scheduler
.Lfunc_begin41:
// %bb.0:
	$sd , r22, 64, d22
	$add , r22, r22, 72
	$sd , r22,  - 48, d14
	$sd , r22,  - 56, d16
	$sd , r22,  - 64, d18
	$sd , r22,  - 72, d20
	$move , r21, 0
	$move , r15, 1
	$move , r14, r15
	$sw , r22,  - 20, r21
	$move , r17, r21
	$sw , r22,  - 16, r15
	$move , r19, processs
	$jump , .LBB41_1
.LBB41_34:                              //   in Loop: Header=BB41_1 Depth=1
	$move , r14, 0
	$move , r17, r14
.LBB41_1:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB41_2 Depth 2
                                        //     Child Loop BB41_14 Depth 2
                                        //     Child Loop BB41_22 Depth 2
	$lsl , r0, r17, 4
	$lsl_add , r0, r0, r17, 11
	$lsl_sub , r0, r0, r17, 6
	$add , r17, r17, 1
	$add , r20, r0, 651280
.LBB41_2:                               //   Parent Loop BB41_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	// inline asm
	$time , r0

	// inline asm
	$move , r1, 5000001
	$jltu , r0, r1, .LBB41_5
// %bb.3:                               //   in Loop: Header=BB41_2 Depth=2
	$call , r23, stop_me
	$move , r0, 15
	$move , r1, 3
	// inline asm
	$time_cfg , r0, r1

	// inline asm
	$lw , r0, zero, mutex_flag
	// inline asm
.Ltmp168:
	$acquire , r0, 0, nz, .Ltmp168
	// inline asm
	$move , r0, 651264
	$add , r1, r22,  - 40
	$ldma , r1, r0, 1
	$lw , r2, zero, mutex_flag
	// inline asm
.Ltmp169:
	$release , r2, 0, nz, .Ltmp169 + 1
	// inline asm
	$lw , r2, zero, mutex_flag
	$lw , r3, r22,  - 32
	// inline asm
.Ltmp170:
	$acquire , r2, 0, nz, .Ltmp170
	// inline asm
	$sw , r22,  - 32, 0
	$sdma , r1, r0, 1
	$lw , r0, zero, mutex_flag
	// inline asm
.Ltmp171:
	$release , r0, 0, nz, .Ltmp171 + 1
	// inline asm
	$and , r0, r3, 32, z, .LBB41_5
// %bb.4:                               //   in Loop: Header=BB41_2 Depth=2
	$call , r23, wakeup_sleepy_socket
.LBB41_5:                               //   in Loop: Header=BB41_2 Depth=2
	$lsl , r0, r17, 4
	$lsl_add , r0, r0, r17, 6
	$move , r1, processs
	$add , r0, r1, r0
	$lw , r0, r0,  - 72
	$jeq , r0, 1, .LBB41_8
// %bb.6:                               //   in Loop: Header=BB41_2 Depth=2
	$jeq , r0, 3, .LBB41_7
// %bb.30:                              //   in Loop: Header=BB41_2 Depth=2
	$add , r20, r20, 2000
	$add , r17, r17, 1
	$jneq , r17, 11, .LBB41_2
// %bb.31:                              //   in Loop: Header=BB41_1 Depth=1
	$and , r0, r14, 1
	$jnz , r0, .LBB41_34
// %bb.32:                              //   in Loop: Header=BB41_1 Depth=1
	$call , r23, stop_me
	$move , r0, 15
	$move , r1, 3
	// inline asm
	$time_cfg , r0, r1

	// inline asm
	$lw , r0, zero, mutex_flag
	// inline asm
.Ltmp172:
	$acquire , r0, 0, nz, .Ltmp172
	// inline asm
	$move , r0, 651264
	$add , r1, r22,  - 40
	$ldma , r1, r0, 1
	$lw , r2, zero, mutex_flag
	// inline asm
.Ltmp173:
	$release , r2, 0, nz, .Ltmp173 + 1
	// inline asm
	$lw , r2, zero, mutex_flag
	$lw , r3, r22,  - 32
	// inline asm
.Ltmp174:
	$acquire , r2, 0, nz, .Ltmp174
	// inline asm
	$sw , r22,  - 32, 0
	$sdma , r1, r0, 1
	$lw , r0, zero, mutex_flag
	// inline asm
.Ltmp175:
	$release , r0, 0, nz, .Ltmp175 + 1
	// inline asm
	$and , r0, r3, 32, z, .LBB41_34
// %bb.33:                              //   in Loop: Header=BB41_1 Depth=1
	$call , r23, wakeup_sleepy_socket
	$jump , .LBB41_34
.LBB41_7:                               //   in Loop: Header=BB41_1 Depth=1
	$move , r14, 1
	$call , r23, me_new
	$jeq , r0, 0, .LBB41_10
	$jump , .LBB41_35
.LBB41_8:                               //   in Loop: Header=BB41_1 Depth=1
	$move , r14, 0
	$call , r23, me_new
	$jneq , r0, 0, .LBB41_35
.LBB41_10:                              //   in Loop: Header=BB41_1 Depth=1
	$sw , r22,  - 24, r14
	$lsl , r0, r17, 4
	$lsl_add , r0, r0, r17, 6
	$add , r16, r19, r0
	$lw , r18, r16,  - 76
	$add , r14, r17,  - 1
	$jeq , r21, r18, .LBB41_20
// %bb.11:                              //   in Loop: Header=BB41_1 Depth=1
	$move , r15, 0
	$move , r1, 3
	$move , r0, r15
	$call , r23, print_debug
	$lw , r2, r22,  - 20
	$lsl , r0, r2, 4
	$move , r1, r21
	$lsl_add , r21, r0, r2, 6
	$add , r0, r19, r21
	$lw , r0, r0, 4
	$jneq , r0, r1, .LBB41_19
// %bb.12:                              //   in Loop: Header=BB41_1 Depth=1
	$move , r0, r15
	$move , r1, r15
	$call , r23, print_debug
	$move , r0, processs
	$add , r0, r0, r21
	$lw , r2, r0, 28
	$lw , r1, r0, 32
	$move , r0, 651264
	$lsl_add , r0, r0, r2, 16
	$lsr , r2, r1, 11, z, .LBB41_16
// %bb.13:                              //   in Loop: Header=BB41_1 Depth=1
	$move , r3, 512
	$move , r4, r0
.LBB41_14:                              //   Parent Loop BB41_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	$sdma , r3, r4, 255
	$add , r4, r4, 2048
	$add , r3, r3, 2048
	$add , r2, r2,  - 1, nz, .LBB41_14
// %bb.15:                              //   in Loop: Header=BB41_1 Depth=1
	$and , r15, r1,  - 2048
.LBB41_16:                              //   in Loop: Header=BB41_1 Depth=1
	$and , r1, r1, 2047
	$jeq , r1, 0, .LBB41_18
// %bb.17:                              //   in Loop: Header=BB41_1 Depth=1
	$add , r2, r15, 512
	$add , r0, r0, r15
	$move , r3,  - 1
	$lsr_add , r1, r3, r1, 3
	$lsl_add , r1, r2, r1, 24
	$sdma , r1, r0, 0
.LBB41_18:                              //   in Loop: Header=BB41_1 Depth=1
	$move , r0, 1
	$move , r1, 0
	$call , r23, print_debug
.LBB41_19:                              //   in Loop: Header=BB41_1 Depth=1
	$move , r0, r14
	$call , r23, load_prg_memory
	$sw , r22,  - 20, r14
	$move , r21, r18
	$lw , r15, r22,  - 16
.LBB41_20:                              //   in Loop: Header=BB41_1 Depth=1
	$lw , r1, r22,  - 24
	$move , r0, jobs
	$ldma , r0, r20, 249
	$sw , r16,  - 72, 2
	$sw , zero, cur_process_index, r14
	$jnz , r1, .LBB41_24
// %bb.21:                              //   in Loop: Header=BB41_1 Depth=1
	$move , r1, 100
.LBB41_22:                              //   Parent Loop BB41_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	$lsl , r0, r1, 2
	$lsl_add , r2, r0, r1, 4
	$move , r0, jobs
	$sub , r2, r0, r2
	$sb , r2, 2000, 0
	$add , r1, r1,  - 1, nz, .LBB41_22
// %bb.23:                              //   in Loop: Header=BB41_1 Depth=1
	$lsl , r1, r17, 4
	$lsl_add , r1, r1, r17, 6
	$move , r2, processs
	$add , r1, r2, r1
	$sb , r1,  - 78, 1
	$lw , r2, r1,  - 56
	$sw , r0, 16, r2
	$sw , r2, 36, r2
	$move , r3, __end_process
	$sw , r2, 32, r3
	$lw , r1, r1,  - 68
	$sw , r2, 24, r1
	$sh , r0, 0, 1
.LBB41_24:                              //   in Loop: Header=BB41_1 Depth=1
	// inline asm
	$time , r0

	// inline asm
	$lsl , r1, r17, 4
	$lsl_add , r1, r1, r17, 6
	$move , r2, processs
	$add , r14, r2, r1
	$sw , r14,  - 60, r0
	$call , r23, scheduler_jobs
	$lw , r1, r14,  - 72
	$jeq , r0, 0, .LBB41_27
// %bb.25:                              //   in Loop: Header=BB41_1 Depth=1
	$jeq , r1, 4, .LBB41_29
// %bb.26:                              //   in Loop: Header=BB41_1 Depth=1
	$lsl , r0, r17, 4
	$lsl_add , r0, r0, r17, 6
	$move , r1, processs
	$add , r0, r1, r0
	$sw , r0,  - 72, 5
	$jump , .LBB41_29
.LBB41_27:                              //   in Loop: Header=BB41_1 Depth=1
	$jneq , r1, 2, .LBB41_29
// %bb.28:                              //   in Loop: Header=BB41_1 Depth=1
	$lsl , r0, r17, 4
	$lsl_add , r0, r0, r17, 6
	$move , r1, processs
	$add , r0, r1, r0
	$sw , r0,  - 72, 3
.LBB41_29:                              //   in Loop: Header=BB41_1 Depth=1
	$move , r0, jobs
	$sdma , r0, r20, 249
	$move , r14, r15
	$jneq , r17, 10, .LBB41_1
	$jump , .LBB41_34
.LBB41_35:
	$fault , 4
.Lfunc_end41:
	$size,	scheduler, .Lfunc_end41 - scheduler
	$section,	%stack_sizes,"o",@progbits,%text, scheduler
	$long,	.Lfunc_begin41
	$byte,	72
	$section,	%text, scheduler,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, main,"ax",@progbits
	$globl,	main                            //  -  -  Begin function main
	$type,	main,@function
main:                                   // @main
.Lfunc_begin42:
// %bb.0:
	$sd , r22, 0, d22
	$add , r22, r22, 8
	$call , r23, me_new
	$jneq , r0, 0, .LBB42_2
// %bb.1:
	$move , r0, __atomic_bit_mutex_sp
	$move , r1, cp
	$sw , r1, 4, r0
	$sh , r1, 0, 16
	$sb , r1, 2, 0
	$move , r0, __atomic_bit_mutex_mutex_flag
	$sw , zero, mutex_flag, r0
	$move , r0, __atomic_bit_mutex_mutex_l
	$sw , zero, mutex_l, r0
	$move , r0, __atomic_bit_mutex_mutex_printk
	$sw , zero, mutex_printk, r0
	$move , r0, __atomic_bit_mutex_mutex_jobs
	$sw , zero, mutex_jobs, r0
	$move , r0, __atomic_bit_mutex_mutex_sockets
	$sw , zero, mutex_sockets, r0
	$move , r0, __atomic_bit_mutex_mutex_mram
	$sw , zero, mutex_mram, r0
	$jump , .LBB42_3
.LBB42_2:
	$call , r23, scheduler_jobs
.LBB42_3:
	$call , r23, boot_me
	$move , r0, 1
	$move , r1, r0
	$call , r23, perfcounter_config
	$call , r23, scheduler
.Lfunc_end42:
	$size,	main, .Lfunc_end42 - main
	$section,	%stack_sizes,"o",@progbits,%text, main
	$long,	.Lfunc_begin42
	$byte,	8
	$section,	%text, main,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, index_from_roleid,"ax",@progbits
	$globl,	index_from_roleid               //  -  -  Begin function index_from_roleid
	$type,	index_from_roleid,@function
index_from_roleid:                      // @index_from_roleid
.Lfunc_begin43:
// %bb.0:
	$lw , r1, zero, cur_process_index
	$lsl , r2, r1, 4
	$lsl_add , r1, r2, r1, 6
	$move , r3, processs
	$lw , r4, r3, 4
	$lbs , r2, r1, processs
	$jeq , r4, 0, .LBB43_3
// %bb.1:
	$lbs , r1, zero, processs
	$and , r4, r2, 255
	$and , r1, r1, 255
	$jneq , r1, r4, .LBB43_3
// %bb.2:
	$lbs , r1, r3, 1
	$and , r4, r1, 255
	$move , r1, 0
	$jeq , r4, r0, .LBB43_30
.LBB43_3:
	$lw , r1, r3, 84
	$jeq , r1, 0, .LBB43_6
// %bb.4:
	$lbs , r1, r3, 80
	$and , r4, r2, 255
	$and , r1, r1, 255
	$jneq , r1, r4, .LBB43_6
// %bb.5:
	$lbs , r1, r3, 81
	$and , r3, r1, 255
	$move , r1, 1
	$jeq , r3, r0, .LBB43_30
.LBB43_6:
	$move , r3, processs
	$lw , r1, r3, 164
	$jeq , r1, 0, .LBB43_9
// %bb.7:
	$lbs , r1, r3, 160
	$and , r4, r2, 255
	$and , r1, r1, 255
	$jneq , r1, r4, .LBB43_9
// %bb.8:
	$lbs , r1, r3, 161
	$and , r4, r1, 255
	$move , r1, 2
	$jeq , r4, r0, .LBB43_30
.LBB43_9:
	$lw , r1, r3, 244
	$jeq , r1, 0, .LBB43_12
// %bb.10:
	$lbs , r1, r3, 240
	$and , r4, r2, 255
	$and , r1, r1, 255
	$jneq , r1, r4, .LBB43_12
// %bb.11:
	$lbs , r1, r3, 241
	$and , r3, r1, 255
	$move , r1, 3
	$jeq , r3, r0, .LBB43_30
.LBB43_12:
	$move , r3, processs
	$lw , r1, r3, 324
	$jeq , r1, 0, .LBB43_15
// %bb.13:
	$lbs , r1, r3, 320
	$and , r4, r2, 255
	$and , r1, r1, 255
	$jneq , r1, r4, .LBB43_15
// %bb.14:
	$lbs , r1, r3, 321
	$and , r4, r1, 255
	$move , r1, 4
	$jeq , r4, r0, .LBB43_30
.LBB43_15:
	$lw , r1, r3, 404
	$jeq , r1, 0, .LBB43_18
// %bb.16:
	$lbs , r1, r3, 400
	$and , r4, r2, 255
	$and , r1, r1, 255
	$jneq , r1, r4, .LBB43_18
// %bb.17:
	$lbs , r1, r3, 401
	$and , r3, r1, 255
	$move , r1, 5
	$jeq , r3, r0, .LBB43_30
.LBB43_18:
	$move , r3, processs
	$lw , r1, r3, 484
	$jeq , r1, 0, .LBB43_21
// %bb.19:
	$lbs , r1, r3, 480
	$and , r4, r2, 255
	$and , r1, r1, 255
	$jneq , r1, r4, .LBB43_21
// %bb.20:
	$lbs , r1, r3, 481
	$and , r4, r1, 255
	$move , r1, 6
	$jeq , r4, r0, .LBB43_30
.LBB43_21:
	$lw , r1, r3, 564
	$jeq , r1, 0, .LBB43_24
// %bb.22:
	$lbs , r1, r3, 560
	$and , r4, r2, 255
	$and , r1, r1, 255
	$jneq , r1, r4, .LBB43_24
// %bb.23:
	$lbs , r1, r3, 561
	$and , r3, r1, 255
	$move , r1, 7
	$jeq , r3, r0, .LBB43_30
.LBB43_24:
	$move , r3, processs
	$lw , r1, r3, 644
	$jeq , r1, 0, .LBB43_27
// %bb.25:
	$lbs , r1, r3, 640
	$and , r4, r2, 255
	$and , r1, r1, 255
	$jneq , r1, r4, .LBB43_27
// %bb.26:
	$lbs , r1, r3, 641
	$and , r4, r1, 255
	$move , r1, 8
	$jneq , r4, r0, .LBB43_27
.LBB43_30:
	$move , r0, r1
	$jump , r23
.LBB43_27:
	$lw , r1, r3, 724
	$move , r4, 0
	$lbu , r5, r3, 720
	$sub , r1, r1, r4, neq
	$lbu , r3, r3, 721
	$and , r2, r2, 255
	$sub , r2, r5, r2, eq
	$and , r1, r1, r2
	$sub , r0, r3, r0, eq
	$and , r1, r1, r0
	$move , r0, 9
	$jnz , r1, .LBB43_29
// %bb.28:
	$move , r0,  - 1
.LBB43_29:
	$jump , r23
.Lfunc_end43:
	$size,	index_from_roleid, .Lfunc_end43 - index_from_roleid
	$section,	%stack_sizes,"o",@progbits,%text, index_from_roleid
	$long,	.Lfunc_begin43
	$byte,	0
	$section,	%text, index_from_roleid,"ax",@progbits
                                        //  -  -  End function
	$type,	fc_scheduler_job,@object        // @fc_scheduler_job
	$section,	%data,"aw",@progbits
	$globl,	fc_scheduler_job
	$p2align,	2
fc_scheduler_job:
	$zero,	64
	$size,	fc_scheduler_job, 64

	$type,	jobs,@object                    // @jobs
	$globl,	jobs
	$p2align,	3
jobs:
	$zero,	2000
	$size,	jobs, 2000

	$type,	cur_jobs,@object                // @cur_jobs
	$globl,	cur_jobs
cur_jobs:
	$zero,	16
	$size,	cur_jobs, 16

	$type,	mutex_jobs,@object              // @mutex_jobs
	$globl,	mutex_jobs
	$p2align,	2
mutex_jobs:
	$long,	0
	$size,	mutex_jobs, 4

	$type,	processs,@object                // @processs
	$section,	%dpu_host,"aw",@progbits
	$globl,	processs
	$p2align,	3
processs:
	$zero,	800
	$size,	processs, 800

	$type,	cur_process_index,@object       // @cur_process_index
	$section,	%data,"aw",@progbits
	$globl,	cur_process_index
	$p2align,	2
cur_process_index:
	$long,	0                               // 0x0
	$size,	cur_process_index, 4

	$type,	cp,@object                      // @cp
	$globl,	cp
	$p2align,	2
cp:
	$zero,	8
	$size,	cp, 8

	$type,	all_end_or_waiting,@object      // @all_end_or_waiting
	$globl,	all_end_or_waiting
all_end_or_waiting:
	$byte,	0                               // 0x0
	$size,	all_end_or_waiting, 1

	$type,	mutex_l,@object                 // @mutex_l
	$globl,	mutex_l
	$p2align,	2
mutex_l:
	$long,	0
	$size,	mutex_l, 4

	$type,	newline2,@object                // @newline2
	$globl,	newline2
	$p2align,	3
newline2:
	$asciz,	"      \n"
	$size,	newline2, 8

	$type,	inode_table,@object             // @inode_table
	$section,	%dpu_host,"aw",@progbits
	$globl,	inode_table
	$p2align,	3
inode_table:
	$zero,	160
	$size,	inode_table, 160

	$type,	mutex_mram,@object              // @mutex_mram
	$section,	%data,"aw",@progbits
	$globl,	mutex_mram
	$p2align,	2
mutex_mram:
	$long,	0
	$size,	mutex_mram, 4

	$type,	alloc_inode.bit_map,@object     // @alloc_inode.bit_map
	$p2align,	3
alloc_inode.bit_map:
	$zero,	400
	$size,	alloc_inode.bit_map, 400

	$type,	mutex_inode,@object             // @mutex_inode
	$globl,	mutex_inode
	$p2align,	2
mutex_inode:
	$long,	0
	$size,	mutex_inode, 4

	$type,	sync_extern_socket,@object      // @sync_extern_socket
	$globl,	sync_extern_socket
sync_extern_socket:
	$byte,	0                               // 0x0
	$size,	sync_extern_socket, 1

	$type,	buf_socket,@object              // @buf_socket
	$globl,	buf_socket
	$p2align,	3
buf_socket:
	$zero,	264
	$size,	buf_socket, 264

	$type,	mutex_sockets,@object           // @mutex_sockets
	$globl,	mutex_sockets
	$p2align,	2
mutex_sockets:
	$long,	0
	$size,	mutex_sockets, 4

	$type,	beg,@object                     // @beg
	$globl,	beg
beg:
	$asciz,	"{{{"
	$size,	beg, 4

	$type,	end,@object                     // @end
	$globl,	end
end:
	$asciz,	"}}}"
	$size,	end, 4

	$type,	global,@object                  // @global
	$globl,	global
	$p2align,	2
global:
	$long,	0                               // 0x0
	$size,	global, 4

	$type,	mutex_printk,@object            // @mutex_printk
	$globl,	mutex_printk
	$p2align,	2
mutex_printk:
	$long,	0
	$size,	mutex_printk, 4

	$type,	mutex_flag,@object              // @mutex_flag
	$globl,	mutex_flag
	$p2align,	2
mutex_flag:
	$long,	0
	$size,	mutex_flag, 4

	$type,	mutex_sbrk,@object              // @mutex_sbrk
	$globl,	mutex_sbrk
	$p2align,	2
mutex_sbrk:
	$long,	0
	$size,	mutex_sbrk, 4

	$type,	saved_fc_stop,@object           // @saved_fc_stop
	$globl,	saved_fc_stop
	$p2align,	2
saved_fc_stop:
	$long,	0
	$size,	saved_fc_stop, 4

	$type,	dpu_id,@object                  // @dpu_id
	$section,	%dpu_host,"aw",@progbits
	$globl,	dpu_id
	$p2align,	3
dpu_id:
	$long,	0                               // 0x0
	$size,	dpu_id, 4

	$type,	log_w,@object                   // @log_w
	$globl,	log_w
	$p2align,	3
log_w:
	$long,	0                               // 0x0
	$size,	log_w, 4

	$type,	buf_aligned,@object             // @buf_aligned
	$section,	%data,"aw",@progbits
	$globl,	buf_aligned
	$p2align,	3
buf_aligned:
	$zero,	128
	$size,	buf_aligned, 128

	$type,	__atomic_bit_mutex_sp,@object   // @__atomic_bit_mutex_sp
	$section,	%atomic,"aw",@progbits
	$globl,	__atomic_bit_mutex_sp
__atomic_bit_mutex_sp:
	$byte,	0                               // 0x0
	$size,	__atomic_bit_mutex_sp, 1

	$type,	__atomic_bit_mutex_mutex_flag,@object // @__atomic_bit_mutex_mutex_flag
	$globl,	__atomic_bit_mutex_mutex_flag
__atomic_bit_mutex_mutex_flag:
	$byte,	0                               // 0x0
	$size,	__atomic_bit_mutex_mutex_flag, 1

	$type,	__atomic_bit_mutex_mutex_l,@object // @__atomic_bit_mutex_mutex_l
	$globl,	__atomic_bit_mutex_mutex_l
__atomic_bit_mutex_mutex_l:
	$byte,	0                               // 0x0
	$size,	__atomic_bit_mutex_mutex_l, 1

	$type,	__atomic_bit_mutex_mutex_printk,@object // @__atomic_bit_mutex_mutex_printk
	$globl,	__atomic_bit_mutex_mutex_printk
__atomic_bit_mutex_mutex_printk:
	$byte,	0                               // 0x0
	$size,	__atomic_bit_mutex_mutex_printk, 1

	$type,	__atomic_bit_mutex_mutex_jobs,@object // @__atomic_bit_mutex_mutex_jobs
	$globl,	__atomic_bit_mutex_mutex_jobs
__atomic_bit_mutex_mutex_jobs:
	$byte,	0                               // 0x0
	$size,	__atomic_bit_mutex_mutex_jobs, 1

	$type,	__atomic_bit_mutex_mutex_sockets,@object // @__atomic_bit_mutex_mutex_sockets
	$globl,	__atomic_bit_mutex_mutex_sockets
__atomic_bit_mutex_mutex_sockets:
	$byte,	0                               // 0x0
	$size,	__atomic_bit_mutex_mutex_sockets, 1

	$type,	__atomic_bit_mutex_mutex_mram,@object // @__atomic_bit_mutex_mutex_mram
	$globl,	__atomic_bit_mutex_mutex_mram
__atomic_bit_mutex_mutex_mram:
	$byte,	0                               // 0x0
	$size,	__atomic_bit_mutex_mutex_mram, 1

	$type,	begin_mram,@object              // @begin_mram
	$section,	%bss, begin_mram,"aw",@nobits
	$globl,	begin_mram
	$p2align,	2
begin_mram:
	$zero,	16
	$size,	begin_mram, 16

	$type,	__atomic_bit_mutex_mutex_sbrk,@object // @__atomic_bit_mutex_mutex_sbrk
	$section,	%atomic,"aw",@progbits
	$globl,	__atomic_bit_mutex_mutex_sbrk
__atomic_bit_mutex_mutex_sbrk:
	$byte,	0                               // 0x0
	$size,	__atomic_bit_mutex_mutex_sbrk, 1

	$type,	__atomic_bit_mutex_mutex_inode,@object // @__atomic_bit_mutex_mutex_inode
	$globl,	__atomic_bit_mutex_mutex_inode
__atomic_bit_mutex_mutex_inode:
	$byte,	0                               // 0x0
	$size,	__atomic_bit_mutex_mutex_inode, 1

	$addrsig,
	$addrsig_sym, __end_child_jobs
	$addrsig_sym, __end_process
	$addrsig_sym, fc_scheduler_job
	$addrsig_sym, jobs
	$addrsig_sym, processs
	$addrsig_sym, cur_process_index
	$addrsig_sym, inode_table
	$addrsig_sym, alloc_inode.bit_map
	$addrsig_sym, buf_socket
	$addrsig_sym, beg
	$addrsig_sym, end
	$addrsig_sym, dpu_id
	$addrsig_sym, log_w
	$addrsig_sym, buf_aligned
	$addrsig_sym, __atomic_bit_mutex_sp
	$addrsig_sym, __atomic_bit_mutex_mutex_flag
	$addrsig_sym, __atomic_bit_mutex_mutex_l
	$addrsig_sym, __atomic_bit_mutex_mutex_printk
	$addrsig_sym, __atomic_bit_mutex_mutex_jobs
	$addrsig_sym, __atomic_bit_mutex_mutex_sockets
	$addrsig_sym, __atomic_bit_mutex_mutex_mram
