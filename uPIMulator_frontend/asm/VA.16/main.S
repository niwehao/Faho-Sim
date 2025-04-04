	.text
	.file	"task.c"
                                        // Start of file scope inline assembly
	.section	.data.my_barrier,"aw",@progbits
	.type	my_barrier,@object
	.globl	my_barrier
	.p2align	2
my_barrier:
	.byte	255
	.byte	16
	.byte	16
	.byte	__atomic_bit_barrier_my_barrier
	.size	my_barrier, 4
	.text

                                        // End of file scope inline assembly
	.file	1 "/root/uPIMulator_frontend/benchmark/VA" "dpu/task.c"
	.file	2 "/root" "upmem-2021.3.0-Linux-x86_64/bin/../share/upmem/include/stdlib/stdint.h"
	.file	3 "/root/uPIMulator_frontend/benchmark/VA" "dpu/../support/common.h"
	.section	.text.vector_addition,"ax",@progbits
	.globl	vector_addition                 // -- Begin function vector_addition
	.type	vector_addition,@function
vector_addition:                        // @vector_addition
.Lfunc_begin0:
	.loc	1 18 0                          // dpu/task.c:18:0
	.cfi_sections .debug_frame
	.cfi_startproc
// %bb.0:
	//DEBUG_VALUE: vector_addition:bufferB <- $r0
	//DEBUG_VALUE: vector_addition:bufferB <- $r0
	//DEBUG_VALUE: vector_addition:bufferA <- $r1
	//DEBUG_VALUE: vector_addition:bufferA <- $r1
	//DEBUG_VALUE: vector_addition:l_size <- $r2
	//DEBUG_VALUE: vector_addition:l_size <- $r2
	.cfi_def_cfa_offset 0
	//DEBUG_VALUE: i <- 0
	.loc	1 19 5 prologue_end             // dpu/task.c:19:5
	jeq r2, 0, .LBB0_2
.Ltmp0:
.LBB0_1:                                // =>This Inner Loop Header: Depth=1
	//DEBUG_VALUE: i <- undef
	.loc	1 20 23                         // dpu/task.c:20:23
	lw r3, r1, 0
	.loc	1 20 20 is_stmt 0               // dpu/task.c:20:20
	lw r4, r0, 0
	add r3, r4, r3
	sw r0, 0, r3
.Ltmp1:
	//DEBUG_VALUE: i <- [DW_OP_plus_uconst 1, DW_OP_stack_value] undef
	.loc	1 19 32 is_stmt 1               // dpu/task.c:19:32
	add r0, r0, 4
	add r1, r1, 4
	add r2, r2, -1, nz, .LBB0_1
.Ltmp2:
.LBB0_2:
	.loc	1 22 1                          // dpu/task.c:22:1
	jump r23
.Ltmp3:
.Lfunc_end0:
	.size	vector_addition, .Lfunc_end0-vector_addition
	.cfi_endproc
	.section	.stack_sizes,"o",@progbits,.text.vector_addition
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.vector_addition,"ax",@progbits
                                        // -- End function
	.section	.text.main_kernel1,"ax",@progbits
	.globl	main_kernel1                    // -- Begin function main_kernel1
	.type	main_kernel1,@function
main_kernel1:                           // @main_kernel1
.Lfunc_begin1:
	.loc	1 37 0                          // dpu/task.c:37:0
	.cfi_startproc
// %bb.0:
	.cfi_def_cfa_offset -48
	.cfi_offset 23, -8
	.cfi_offset 22, -4
	sd r22, 40, d22
	add r22, r22, 48
	.cfi_offset 15, -24
	.cfi_offset 14, -20
.Ltmp4:
	sd r22, -24, d14
	.cfi_offset 17, -32
	.cfi_offset 16, -28
	sd r22, -32, d16
	.cfi_offset 19, -40
	.cfi_offset 18, -36
	sd r22, -40, d18
	.cfi_offset 21, -48
	.cfi_offset 20, -44
	sd r22, -48, d20
.Ltmp5:
	//DEBUG_VALUE: main_kernel1:tasklet_id <- $r20
	.file	4 "/root" "upmem-2021.3.0-Linux-x86_64/bin/../share/upmem/include/syslib/defs.h"
	.loc	4 35 12 prologue_end            // upmem-2021.3.0-Linux-x86_64/bin/../share/upmem/include/syslib/defs.h:35:12
	move r20, id, nz, .LBB1_2
.Ltmp6:
// %bb.1:
	.loc	1 43 9                          // dpu/task.c:43:9
	call r23, mem_reset
.Ltmp7:
.LBB1_2:
	.loc	1 46 5                          // dpu/task.c:46:5
	move r0, my_barrier
	call r23, barrier_wait
.Ltmp8:
	.loc	1 48 57                         // dpu/task.c:48:57
	lw r16, zero, DPU_INPUT_ARGUMENTS
.Ltmp9:
	//DEBUG_VALUE: main_kernel1:input_size_dpu_bytes <- $r16
	move r0, DPU_INPUT_ARGUMENTS
	.loc	1 49 66                         // dpu/task.c:49:66
	lw r18, r0, 4
.Ltmp10:
	//DEBUG_VALUE: main_kernel1:input_size_dpu_bytes_transfer <- $r18
	.loc	1 52 40                         // dpu/task.c:52:40
	lsl r17, r20, 10
.Ltmp11:
	//DEBUG_VALUE: main_kernel1:mram_base_addr_B <- undef
	//DEBUG_VALUE: main_kernel1:base_tasklet <- $r17
	.loc	1 0 40 is_stmt 0                // dpu/task.c:0:40
	move r15, 1024
	.loc	1 57 24 is_stmt 1               // dpu/task.c:57:24
	move r0, r15
	call r23, mem_alloc
.Ltmp12:
	move r14, r0
.Ltmp13:
	//DEBUG_VALUE: main_kernel1:cache_A <- $r14
	.loc	1 58 24                         // dpu/task.c:58:24
	move r0, r15
	call r23, mem_alloc
.Ltmp14:
	move r15, r0
.Ltmp15:
	//DEBUG_VALUE: main_kernel1:mram_base_addr_A <- undef
	//DEBUG_VALUE: main_kernel1:cache_B <- $r15
	//DEBUG_VALUE: byte_index <- $r17
	.loc	1 60 5                          // dpu/task.c:60:5
	jleu r16, r17, .LBB1_7
.Ltmp16:
// %bb.3:
	//DEBUG_VALUE: main_kernel1:input_size_dpu_bytes_transfer <- $r18
	//DEBUG_VALUE: byte_index <- $r17
	//DEBUG_VALUE: main_kernel1:base_tasklet <- $r17
	//DEBUG_VALUE: main_kernel1:input_size_dpu_bytes <- $r16
	//DEBUG_VALUE: main_kernel1:cache_B <- $r15
	//DEBUG_VALUE: main_kernel1:cache_A <- $r14
	.loc	1 0 0 is_stmt 0                 // dpu/task.c:0:0
	move r0, __sys_used_mram_end
	add r0, r0, r18
.Ltmp17:
	//DEBUG_VALUE: main_kernel1:mram_base_addr_B <- $r0
	sw r22, -16, r0
.Ltmp18:
	//DEBUG_VALUE: main_kernel1:mram_base_addr_B <- [DW_OP_constu 16, DW_OP_minus] [$r22+0]
	.loc	1 60 5                          // dpu/task.c:60:5
	add r19, r17, 1024
	move r0, 0
	lsl_sub r20, r0, r20, 10, true, .LBB1_4
.Ltmp19:
.LBB1_6:                                //   in Loop: Header=BB1_4 Depth=1
	//DEBUG_VALUE: main_kernel1:mram_base_addr_B <- [DW_OP_constu 16, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: byte_index <- $r17
	//DEBUG_VALUE: main_kernel1:input_size_dpu_bytes <- $r16
	//DEBUG_VALUE: main_kernel1:cache_B <- $r15
	//DEBUG_VALUE: main_kernel1:cache_A <- $r14
	.loc	1 63 45 is_stmt 1               // dpu/task.c:63:45
	add r0, r0, r20
.Ltmp20:
	//DEBUG_VALUE: l_size_bytes <- undef
	.loc	1 66 61                         // dpu/task.c:66:61
	move r1, __sys_used_mram_end
	add r1, r17, r1
	move r2, -1
.Ltmp21:
	//DEBUG_VALUE: mram_write:nb_of_bytes <- undef
	//DEBUG_VALUE: mram_write:to <- undef
	//DEBUG_VALUE: mram_read:from <- $r1
	.file	5 "/root" "upmem-2021.3.0-Linux-x86_64/bin/../share/upmem/include/syslib/mram.h"
	.loc	5 35 24                         // upmem-2021.3.0-Linux-x86_64/bin/../share/upmem/include/syslib/mram.h:35:24
	lsr_add r2, r2, r0, 3
.Ltmp22:
	//DEBUG_VALUE: mram_read:nb_of_bytes <- undef
	//DEBUG_VALUE: mram_read:to <- $r14
	lsl_add r3, r14, r2, 24
	ldma r3, r1, 0
.Ltmp23:
	.loc	1 67 19                         // dpu/task.c:67:19
	lw r1, r22, -16
.Ltmp24:
	add r21, r1, r17
.Ltmp25:
	.loc	5 35 24                         // upmem-2021.3.0-Linux-x86_64/bin/../share/upmem/include/syslib/mram.h:35:24
	lsl_add r18, r15, r2, 24
.Ltmp26:
	//DEBUG_VALUE: mram_read:nb_of_bytes <- undef
	//DEBUG_VALUE: mram_read:to <- $r15
	//DEBUG_VALUE: mram_read:from <- $r21
	ldma r18, r21, 0
.Ltmp27:
	.loc	1 70 56                         // dpu/task.c:70:56
	lsr r2, r0, 2
	.loc	1 70 9 is_stmt 0                // dpu/task.c:70:9
	move r0, r15
	move r1, r14
	call r23, vector_addition
.Ltmp28:
	//DEBUG_VALUE: mram_write:from <- $r15
	.loc	5 53 24 is_stmt 1               // upmem-2021.3.0-Linux-x86_64/bin/../share/upmem/include/syslib/mram.h:53:24
	sdma r18, r21, 0
.Ltmp29:
	.loc	1 60 95                         // dpu/task.c:60:95
	add r17, r17, 16384
.Ltmp30:
	//DEBUG_VALUE: byte_index <- $r17
	.loc	1 60 60 is_stmt 0               // dpu/task.c:60:60
	add r19, r19, 16384
	add r20, r20, -16384
.Ltmp31:
	.loc	1 60 5                          // dpu/task.c:60:5
	jleu r16, r17, .LBB1_7
.Ltmp32:
.LBB1_4:                                // =>This Inner Loop Header: Depth=1
	//DEBUG_VALUE: main_kernel1:mram_base_addr_B <- [DW_OP_constu 16, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: byte_index <- $r17
	//DEBUG_VALUE: main_kernel1:input_size_dpu_bytes <- $r16
	//DEBUG_VALUE: main_kernel1:cache_B <- $r15
	//DEBUG_VALUE: main_kernel1:cache_A <- $r14
	//DEBUG_VALUE: byte_index <- $r17
	.loc	1 63 45 is_stmt 1               // dpu/task.c:63:45
	move r0, r16
	jltu r16, r19, .LBB1_6
.Ltmp33:
// %bb.5:                               //   in Loop: Header=BB1_4 Depth=1
	//DEBUG_VALUE: main_kernel1:mram_base_addr_B <- [DW_OP_constu 16, DW_OP_minus] [$r22+0]
	//DEBUG_VALUE: byte_index <- $r17
	//DEBUG_VALUE: main_kernel1:input_size_dpu_bytes <- $r16
	//DEBUG_VALUE: main_kernel1:cache_B <- $r15
	//DEBUG_VALUE: main_kernel1:cache_A <- $r14
	move r0, r19, true, .LBB1_6
.Ltmp34:
.LBB1_7:
	//DEBUG_VALUE: main_kernel1:input_size_dpu_bytes <- $r16
	//DEBUG_VALUE: main_kernel1:cache_B <- $r15
	//DEBUG_VALUE: main_kernel1:cache_A <- $r14
	.loc	1 0 45 is_stmt 0                // dpu/task.c:0:45
	move r0, 0
	.loc	1 77 5 is_stmt 1                // dpu/task.c:77:5
	ld d20, r22, -48
	ld d18, r22, -40
	ld d16, r22, -32
.Ltmp35:
	ld d14, r22, -24
.Ltmp36:
	ld d22, r22, -8
	jump r23
.Ltmp37:
.Lfunc_end1:
	.size	main_kernel1, .Lfunc_end1-main_kernel1
	.cfi_endproc
	.file	6 "/root" "upmem-2021.3.0-Linux-x86_64/bin/../share/upmem/include/syslib/sysdef.h"
	.section	.stack_sizes,"o",@progbits,.text.main_kernel1
	.long	.Lfunc_begin1
	.byte	48
	.section	.text.main_kernel1,"ax",@progbits
                                        // -- End function
	.section	.text.main,"ax",@progbits
	.globl	main                            // -- Begin function main
	.type	main,@function
main:                                   // @main
.Lfunc_begin2:
	.loc	1 31 0                          // dpu/task.c:31:0
	.cfi_startproc
// %bb.0:
	.cfi_def_cfa_offset -8
	.cfi_offset 23, -8
	.cfi_offset 22, -4
	sd r22, 0, d22
	add r22, r22, 8
.Ltmp38:
	.loc	1 33 40 prologue_end            // dpu/task.c:33:40
	move r0, DPU_INPUT_ARGUMENTS
	lw r0, r0, 8
	.loc	1 33 12 is_stmt 0               // dpu/task.c:33:12
	lsl r0, r0, 2
	lw r0, r0, kernels
	call r23, r0
.Ltmp39:
	.loc	1 33 5                          // dpu/task.c:33:5
	ld d22, r22, -8
	jump r23
.Ltmp40:
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc
	.section	.stack_sizes,"o",@progbits,.text.main
	.long	.Lfunc_begin2
	.byte	8
	.section	.text.main,"ax",@progbits
                                        // -- End function
	.type	kernels,@object                 // @kernels
	.section	.data.kernels,"aw",@progbits
	.globl	kernels
	.p2align	2
kernels:
	.long	main_kernel1
	.size	kernels, 4

	.type	DPU_INPUT_ARGUMENTS,@object     // @DPU_INPUT_ARGUMENTS
	.section	.dpu_host,"aw",@progbits
	.globl	DPU_INPUT_ARGUMENTS
	.p2align	3
DPU_INPUT_ARGUMENTS:
	.zero	12
	.size	DPU_INPUT_ARGUMENTS, 12

	.type	__atomic_bit_barrier_my_barrier,@object // @__atomic_bit_barrier_my_barrier
	.section	.atomic,"aw",@progbits
	.globl	__atomic_bit_barrier_my_barrier
__atomic_bit_barrier_my_barrier:
	.byte	0                               // 0x0
	.size	__atomic_bit_barrier_my_barrier, 1

	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.long	-1
	.long	.Lfunc_begin0                   //   base address
	.long	.Lfunc_begin0-.Lfunc_begin0
	.long	.Ltmp0-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	0
	.long	0
.Ldebug_loc1:
	.long	-1
	.long	.Lfunc_begin0                   //   base address
	.long	.Lfunc_begin0-.Lfunc_begin0
	.long	.Ltmp0-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.long	0
	.long	0
.Ldebug_loc2:
	.long	-1
	.long	.Lfunc_begin0                   //   base address
	.long	.Lfunc_begin0-.Lfunc_begin0
	.long	.Ltmp0-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	82                              // DW_OP_reg2
	.long	0
	.long	0
.Ldebug_loc3:
	.long	-1
	.long	.Lfunc_begin0                   //   base address
	.long	.Lfunc_begin0-.Lfunc_begin0
	.long	.Ltmp0-.Lfunc_begin0
	.short	2                               // Loc expr size
	.byte	48                              // DW_OP_lit0
	.byte	159                             // DW_OP_stack_value
	.long	0
	.long	0
.Ldebug_loc4:
	.long	-1
	.long	.Lfunc_begin1                   //   base address
	.long	.Ltmp5-.Lfunc_begin1
	.long	.Ltmp6-.Lfunc_begin1
	.short	1                               // Loc expr size
	.byte	100                             // DW_OP_reg20
	.long	0
	.long	0
.Ldebug_loc5:
	.long	-1
	.long	.Lfunc_begin1                   //   base address
	.long	.Ltmp9-.Lfunc_begin1
	.long	.Ltmp35-.Lfunc_begin1
	.short	1                               // Loc expr size
	.byte	96                              // DW_OP_reg16
	.long	0
	.long	0
.Ldebug_loc6:
	.long	-1
	.long	.Lfunc_begin1                   //   base address
	.long	.Ltmp10-.Lfunc_begin1
	.long	.Ltmp19-.Lfunc_begin1
	.short	1                               // Loc expr size
	.byte	98                              // DW_OP_reg18
	.long	0
	.long	0
.Ldebug_loc7:
	.long	-1
	.long	.Lfunc_begin1                   //   base address
	.long	.Ltmp17-.Lfunc_begin1
	.long	.Ltmp18-.Lfunc_begin1
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	.Ltmp18-.Lfunc_begin1
	.long	.Ltmp34-.Lfunc_begin1
	.short	2                               // Loc expr size
	.byte	134                             // DW_OP_breg22
	.byte	112                             // -16
	.long	0
	.long	0
.Ldebug_loc8:
	.long	-1
	.long	.Lfunc_begin1                   //   base address
	.long	.Ltmp11-.Lfunc_begin1
	.long	.Ltmp19-.Lfunc_begin1
	.short	1                               // Loc expr size
	.byte	97                              // DW_OP_reg17
	.long	0
	.long	0
.Ldebug_loc9:
	.long	-1
	.long	.Lfunc_begin1                   //   base address
	.long	.Ltmp13-.Lfunc_begin1
	.long	.Ltmp36-.Lfunc_begin1
	.short	1                               // Loc expr size
	.byte	94                              // DW_OP_reg14
	.long	0
	.long	0
.Ldebug_loc10:
	.long	-1
	.long	.Lfunc_begin1                   //   base address
	.long	.Ltmp15-.Lfunc_begin1
	.long	.Ltmp36-.Lfunc_begin1
	.short	1                               // Loc expr size
	.byte	95                              // DW_OP_reg15
	.long	0
	.long	0
.Ldebug_loc11:
	.long	-1
	.long	.Lfunc_begin1                   //   base address
	.long	.Ltmp22-.Lfunc_begin1
	.long	.Ltmp32-.Lfunc_begin1
	.short	1                               // Loc expr size
	.byte	94                              // DW_OP_reg14
	.long	0
	.long	0
.Ldebug_loc12:
	.long	-1
	.long	.Lfunc_begin1                   //   base address
	.long	.Ltmp26-.Lfunc_begin1
	.long	.Ltmp32-.Lfunc_begin1
	.short	1                               // Loc expr size
	.byte	95                              // DW_OP_reg15
	.long	0
	.long	0
.Ldebug_loc13:
	.long	-1
	.long	.Lfunc_begin1                   //   base address
	.long	.Ltmp26-.Lfunc_begin1
	.long	.Ltmp32-.Lfunc_begin1
	.short	1                               // Loc expr size
	.byte	101                             // DW_OP_reg21
	.long	0
	.long	0
	.section	.debug_abbrev,"",@progbits
	.byte	1                               // Abbreviation Code
	.byte	17                              // DW_TAG_compile_unit
	.byte	1                               // DW_CHILDREN_yes
	.byte	37                              // DW_AT_producer
	.byte	14                              // DW_FORM_strp
	.byte	19                              // DW_AT_language
	.byte	5                               // DW_FORM_data2
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	16                              // DW_AT_stmt_list
	.byte	23                              // DW_FORM_sec_offset
	.byte	27                              // DW_AT_comp_dir
	.byte	14                              // DW_FORM_strp
	.byte	17                              // DW_AT_low_pc
	.byte	1                               // DW_FORM_addr
	.byte	85                              // DW_AT_ranges
	.byte	23                              // DW_FORM_sec_offset
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	2                               // Abbreviation Code
	.byte	52                              // DW_TAG_variable
	.byte	0                               // DW_CHILDREN_no
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	63                              // DW_AT_external
	.byte	25                              // DW_FORM_flag_present
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	2                               // DW_AT_location
	.byte	24                              // DW_FORM_exprloc
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	3                               // Abbreviation Code
	.byte	1                               // DW_TAG_array_type
	.byte	1                               // DW_CHILDREN_yes
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	4                               // Abbreviation Code
	.byte	33                              // DW_TAG_subrange_type
	.byte	0                               // DW_CHILDREN_no
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	55                              // DW_AT_count
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	5                               // Abbreviation Code
	.byte	15                              // DW_TAG_pointer_type
	.byte	0                               // DW_CHILDREN_no
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	6                               // Abbreviation Code
	.byte	21                              // DW_TAG_subroutine_type
	.byte	0                               // DW_CHILDREN_no
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	39                              // DW_AT_prototyped
	.byte	25                              // DW_FORM_flag_present
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	7                               // Abbreviation Code
	.byte	36                              // DW_TAG_base_type
	.byte	0                               // DW_CHILDREN_no
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	62                              // DW_AT_encoding
	.byte	11                              // DW_FORM_data1
	.byte	11                              // DW_AT_byte_size
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	8                               // Abbreviation Code
	.byte	36                              // DW_TAG_base_type
	.byte	0                               // DW_CHILDREN_no
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	11                              // DW_AT_byte_size
	.byte	11                              // DW_FORM_data1
	.byte	62                              // DW_AT_encoding
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	9                               // Abbreviation Code
	.byte	52                              // DW_TAG_variable
	.byte	0                               // DW_CHILDREN_no
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	63                              // DW_AT_external
	.byte	25                              // DW_FORM_flag_present
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.ascii	"\210\001"                      // DW_AT_alignment
	.byte	15                              // DW_FORM_udata
	.byte	2                               // DW_AT_location
	.byte	24                              // DW_FORM_exprloc
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	10                              // Abbreviation Code
	.byte	22                              // DW_TAG_typedef
	.byte	0                               // DW_CHILDREN_no
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	11                              // Abbreviation Code
	.byte	19                              // DW_TAG_structure_type
	.byte	1                               // DW_CHILDREN_yes
	.byte	11                              // DW_AT_byte_size
	.byte	11                              // DW_FORM_data1
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	12                              // Abbreviation Code
	.byte	13                              // DW_TAG_member
	.byte	0                               // DW_CHILDREN_no
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	56                              // DW_AT_data_member_location
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	13                              // Abbreviation Code
	.byte	4                               // DW_TAG_enumeration_type
	.byte	1                               // DW_CHILDREN_yes
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	11                              // DW_AT_byte_size
	.byte	11                              // DW_FORM_data1
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	14                              // Abbreviation Code
	.byte	40                              // DW_TAG_enumerator
	.byte	0                               // DW_CHILDREN_no
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	28                              // DW_AT_const_value
	.byte	15                              // DW_FORM_udata
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	15                              // Abbreviation Code
	.byte	15                              // DW_TAG_pointer_type
	.byte	0                               // DW_CHILDREN_no
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	16                              // Abbreviation Code
	.byte	38                              // DW_TAG_const_type
	.byte	0                               // DW_CHILDREN_no
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	17                              // Abbreviation Code
	.byte	46                              // DW_TAG_subprogram
	.byte	1                               // DW_CHILDREN_yes
	.byte	17                              // DW_AT_low_pc
	.byte	1                               // DW_FORM_addr
	.byte	18                              // DW_AT_high_pc
	.byte	6                               // DW_FORM_data4
	.byte	64                              // DW_AT_frame_base
	.byte	24                              // DW_FORM_exprloc
	.ascii	"\227B"                         // DW_AT_GNU_all_call_sites
	.byte	25                              // DW_FORM_flag_present
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	39                              // DW_AT_prototyped
	.byte	25                              // DW_FORM_flag_present
	.byte	63                              // DW_AT_external
	.byte	25                              // DW_FORM_flag_present
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	18                              // Abbreviation Code
	.byte	5                               // DW_TAG_formal_parameter
	.byte	0                               // DW_CHILDREN_no
	.byte	2                               // DW_AT_location
	.byte	23                              // DW_FORM_sec_offset
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	19                              // Abbreviation Code
	.byte	11                              // DW_TAG_lexical_block
	.byte	1                               // DW_CHILDREN_yes
	.byte	17                              // DW_AT_low_pc
	.byte	1                               // DW_FORM_addr
	.byte	18                              // DW_AT_high_pc
	.byte	6                               // DW_FORM_data4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	20                              // Abbreviation Code
	.byte	52                              // DW_TAG_variable
	.byte	0                               // DW_CHILDREN_no
	.byte	2                               // DW_AT_location
	.byte	23                              // DW_FORM_sec_offset
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	21                              // Abbreviation Code
	.byte	46                              // DW_TAG_subprogram
	.byte	0                               // DW_CHILDREN_no
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	32                              // DW_AT_inline
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	22                              // Abbreviation Code
	.byte	46                              // DW_TAG_subprogram
	.byte	1                               // DW_CHILDREN_yes
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	39                              // DW_AT_prototyped
	.byte	25                              // DW_FORM_flag_present
	.byte	32                              // DW_AT_inline
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	23                              // Abbreviation Code
	.byte	5                               // DW_TAG_formal_parameter
	.byte	0                               // DW_CHILDREN_no
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	24                              // Abbreviation Code
	.byte	46                              // DW_TAG_subprogram
	.byte	1                               // DW_CHILDREN_yes
	.byte	17                              // DW_AT_low_pc
	.byte	1                               // DW_FORM_addr
	.byte	18                              // DW_AT_high_pc
	.byte	6                               // DW_FORM_data4
	.byte	64                              // DW_AT_frame_base
	.byte	24                              // DW_FORM_exprloc
	.ascii	"\227B"                         // DW_AT_GNU_all_call_sites
	.byte	25                              // DW_FORM_flag_present
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	39                              // DW_AT_prototyped
	.byte	25                              // DW_FORM_flag_present
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	63                              // DW_AT_external
	.byte	25                              // DW_FORM_flag_present
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	25                              // Abbreviation Code
	.byte	52                              // DW_TAG_variable
	.byte	0                               // DW_CHILDREN_no
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	26                              // Abbreviation Code
	.byte	29                              // DW_TAG_inlined_subroutine
	.byte	0                               // DW_CHILDREN_no
	.byte	49                              // DW_AT_abstract_origin
	.byte	19                              // DW_FORM_ref4
	.byte	17                              // DW_AT_low_pc
	.byte	1                               // DW_FORM_addr
	.byte	18                              // DW_AT_high_pc
	.byte	6                               // DW_FORM_data4
	.byte	88                              // DW_AT_call_file
	.byte	11                              // DW_FORM_data1
	.byte	89                              // DW_AT_call_line
	.byte	11                              // DW_FORM_data1
	.byte	87                              // DW_AT_call_column
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	27                              // Abbreviation Code
	.byte	11                              // DW_TAG_lexical_block
	.byte	1                               // DW_CHILDREN_yes
	.byte	85                              // DW_AT_ranges
	.byte	23                              // DW_FORM_sec_offset
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	28                              // Abbreviation Code
	.byte	52                              // DW_TAG_variable
	.byte	0                               // DW_CHILDREN_no
	.byte	2                               // DW_AT_location
	.byte	24                              // DW_FORM_exprloc
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	29                              // Abbreviation Code
	.byte	29                              // DW_TAG_inlined_subroutine
	.byte	1                               // DW_CHILDREN_yes
	.byte	49                              // DW_AT_abstract_origin
	.byte	19                              // DW_FORM_ref4
	.byte	17                              // DW_AT_low_pc
	.byte	1                               // DW_FORM_addr
	.byte	18                              // DW_AT_high_pc
	.byte	6                               // DW_FORM_data4
	.byte	88                              // DW_AT_call_file
	.byte	11                              // DW_FORM_data1
	.byte	89                              // DW_AT_call_line
	.byte	11                              // DW_FORM_data1
	.byte	87                              // DW_AT_call_column
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	30                              // Abbreviation Code
	.byte	5                               // DW_TAG_formal_parameter
	.byte	0                               // DW_CHILDREN_no
	.byte	2                               // DW_AT_location
	.byte	24                              // DW_FORM_exprloc
	.byte	49                              // DW_AT_abstract_origin
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	31                              // Abbreviation Code
	.byte	5                               // DW_TAG_formal_parameter
	.byte	0                               // DW_CHILDREN_no
	.byte	2                               // DW_AT_location
	.byte	23                              // DW_FORM_sec_offset
	.byte	49                              // DW_AT_abstract_origin
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	32                              // Abbreviation Code
	.byte	5                               // DW_TAG_formal_parameter
	.byte	0                               // DW_CHILDREN_no
	.byte	49                              // DW_AT_abstract_origin
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	33                              // Abbreviation Code
	.ascii	"\211\202\001"                  // DW_TAG_GNU_call_site
	.byte	0                               // DW_CHILDREN_no
	.ascii	"\223B"                         // DW_AT_GNU_call_site_target
	.byte	24                              // DW_FORM_exprloc
	.byte	17                              // DW_AT_low_pc
	.byte	1                               // DW_FORM_addr
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	0                               // EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.long	.Ldebug_info_end0-.Ldebug_info_start0 // Length of Unit
.Ldebug_info_start0:
	.short	4                               // DWARF version number
	.long	.debug_abbrev                   // Offset Into Abbrev. Section
	.byte	4                               // Address Size (in bytes)
	.byte	1                               // Abbrev [1] 0xb:0x32d DW_TAG_compile_unit
	.long	.Linfo_string0                  // DW_AT_producer
	.short	12                              // DW_AT_language
	.long	.Linfo_string1                  // DW_AT_name
	.long	.Lline_table_start0             // DW_AT_stmt_list
	.long	.Linfo_string2                  // DW_AT_comp_dir
	.long	0                               // DW_AT_low_pc
	.long	.Ldebug_ranges2                 // DW_AT_ranges
	.byte	2                               // Abbrev [2] 0x26:0x11 DW_TAG_variable
	.long	.Linfo_string3                  // DW_AT_name
	.long	55                              // DW_AT_type
                                        // DW_AT_external
	.byte	1                               // DW_AT_decl_file
	.byte	29                              // DW_AT_decl_line
	.byte	5                               // DW_AT_location
	.byte	3
	.long	kernels
	.byte	3                               // Abbrev [3] 0x37:0xc DW_TAG_array_type
	.long	67                              // DW_AT_type
	.byte	4                               // Abbrev [4] 0x3c:0x6 DW_TAG_subrange_type
	.long	84                              // DW_AT_type
	.byte	1                               // DW_AT_count
	.byte	0                               // End Of Children Mark
	.byte	5                               // Abbrev [5] 0x43:0x5 DW_TAG_pointer_type
	.long	72                              // DW_AT_type
	.byte	6                               // Abbrev [6] 0x48:0x5 DW_TAG_subroutine_type
	.long	77                              // DW_AT_type
                                        // DW_AT_prototyped
	.byte	7                               // Abbrev [7] 0x4d:0x7 DW_TAG_base_type
	.long	.Linfo_string4                  // DW_AT_name
	.byte	5                               // DW_AT_encoding
	.byte	4                               // DW_AT_byte_size
	.byte	8                               // Abbrev [8] 0x54:0x7 DW_TAG_base_type
	.long	.Linfo_string5                  // DW_AT_name
	.byte	8                               // DW_AT_byte_size
	.byte	7                               // DW_AT_encoding
	.byte	9                               // Abbrev [9] 0x5b:0x12 DW_TAG_variable
	.long	.Linfo_string6                  // DW_AT_name
	.long	109                             // DW_AT_type
                                        // DW_AT_external
	.byte	1                               // DW_AT_decl_file
	.byte	15                              // DW_AT_decl_line
	.byte	8                               // DW_AT_alignment
	.byte	5                               // DW_AT_location
	.byte	3
	.long	DPU_INPUT_ARGUMENTS
	.byte	10                              // Abbrev [10] 0x6d:0xb DW_TAG_typedef
	.long	120                             // DW_AT_type
	.long	.Linfo_string14                 // DW_AT_name
	.byte	3                               // DW_AT_decl_file
	.byte	12                              // DW_AT_decl_line
	.byte	11                              // Abbrev [11] 0x78:0x29 DW_TAG_structure_type
	.byte	12                              // DW_AT_byte_size
	.byte	3                               // DW_AT_decl_file
	.byte	5                               // DW_AT_decl_line
	.byte	12                              // Abbrev [12] 0x7c:0xc DW_TAG_member
	.long	.Linfo_string7                  // DW_AT_name
	.long	161                             // DW_AT_type
	.byte	3                               // DW_AT_decl_file
	.byte	6                               // DW_AT_decl_line
	.byte	0                               // DW_AT_data_member_location
	.byte	12                              // Abbrev [12] 0x88:0xc DW_TAG_member
	.long	.Linfo_string10                 // DW_AT_name
	.long	161                             // DW_AT_type
	.byte	3                               // DW_AT_decl_file
	.byte	7                               // DW_AT_decl_line
	.byte	4                               // DW_AT_data_member_location
	.byte	12                              // Abbrev [12] 0x94:0xc DW_TAG_member
	.long	.Linfo_string11                 // DW_AT_name
	.long	179                             // DW_AT_type
	.byte	3                               // DW_AT_decl_file
	.byte	11                              // DW_AT_decl_line
	.byte	8                               // DW_AT_data_member_location
	.byte	0                               // End Of Children Mark
	.byte	10                              // Abbrev [10] 0xa1:0xb DW_TAG_typedef
	.long	172                             // DW_AT_type
	.long	.Linfo_string9                  // DW_AT_name
	.byte	2                               // DW_AT_decl_file
	.byte	48                              // DW_AT_decl_line
	.byte	7                               // Abbrev [7] 0xac:0x7 DW_TAG_base_type
	.long	.Linfo_string8                  // DW_AT_name
	.byte	7                               // DW_AT_encoding
	.byte	4                               // DW_AT_byte_size
	.byte	13                              // Abbrev [13] 0xb3:0x19 DW_TAG_enumeration_type
	.long	172                             // DW_AT_type
	.long	.Linfo_string3                  // DW_AT_name
	.byte	4                               // DW_AT_byte_size
	.byte	3                               // DW_AT_decl_file
	.byte	8                               // DW_AT_decl_line
	.byte	14                              // Abbrev [14] 0xbf:0x6 DW_TAG_enumerator
	.long	.Linfo_string12                 // DW_AT_name
	.byte	0                               // DW_AT_const_value
	.byte	14                              // Abbrev [14] 0xc5:0x6 DW_TAG_enumerator
	.long	.Linfo_string13                 // DW_AT_name
	.byte	1                               // DW_AT_const_value
	.byte	0                               // End Of Children Mark
	.byte	2                               // Abbrev [2] 0xcc:0x11 DW_TAG_variable
	.long	.Linfo_string15                 // DW_AT_name
	.long	221                             // DW_AT_type
                                        // DW_AT_external
	.byte	1                               // DW_AT_decl_file
	.byte	25                              // DW_AT_decl_line
	.byte	5                               // DW_AT_location
	.byte	3
	.long	__atomic_bit_barrier_my_barrier
	.byte	10                              // Abbrev [10] 0xdd:0xb DW_TAG_typedef
	.long	232                             // DW_AT_type
	.long	.Linfo_string17                 // DW_AT_name
	.byte	2                               // DW_AT_decl_file
	.byte	40                              // DW_AT_decl_line
	.byte	7                               // Abbrev [7] 0xe8:0x7 DW_TAG_base_type
	.long	.Linfo_string16                 // DW_AT_name
	.byte	8                               // DW_AT_encoding
	.byte	1                               // DW_AT_byte_size
	.byte	15                              // Abbrev [15] 0xef:0x1 DW_TAG_pointer_type
	.byte	5                               // Abbrev [5] 0xf0:0x5 DW_TAG_pointer_type
	.long	245                             // DW_AT_type
	.byte	10                              // Abbrev [10] 0xf5:0xb DW_TAG_typedef
	.long	77                              // DW_AT_type
	.long	.Linfo_string18                 // DW_AT_name
	.byte	2                               // DW_AT_decl_file
	.byte	29                              // DW_AT_decl_line
	.byte	5                               // Abbrev [5] 0x100:0x5 DW_TAG_pointer_type
	.long	261                             // DW_AT_type
	.byte	16                              // Abbrev [16] 0x105:0x1 DW_TAG_const_type
	.byte	17                              // Abbrev [17] 0x106:0x58 DW_TAG_subprogram
	.long	.Lfunc_begin0                   // DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       // DW_AT_high_pc
	.byte	1                               // DW_AT_frame_base
	.byte	102
                                        // DW_AT_GNU_all_call_sites
	.long	.Linfo_string26                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	18                              // DW_AT_decl_line
                                        // DW_AT_prototyped
                                        // DW_AT_external
	.byte	18                              // Abbrev [18] 0x117:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc0                    // DW_AT_location
	.long	.Linfo_string29                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	18                              // DW_AT_decl_line
	.long	240                             // DW_AT_type
	.byte	18                              // Abbrev [18] 0x126:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc1                    // DW_AT_location
	.long	.Linfo_string30                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	18                              // DW_AT_decl_line
	.long	240                             // DW_AT_type
	.byte	18                              // Abbrev [18] 0x135:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc2                    // DW_AT_location
	.long	.Linfo_string31                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	18                              // DW_AT_decl_line
	.long	172                             // DW_AT_type
	.byte	19                              // Abbrev [19] 0x144:0x19 DW_TAG_lexical_block
	.long	.Lfunc_begin0                   // DW_AT_low_pc
	.long	.Ltmp2-.Lfunc_begin0            // DW_AT_high_pc
	.byte	20                              // Abbrev [20] 0x14d:0xf DW_TAG_variable
	.long	.Ldebug_loc3                    // DW_AT_location
	.long	.Linfo_string32                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	19                              // DW_AT_decl_line
	.long	172                             // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	21                              // Abbrev [21] 0x15e:0xc DW_TAG_subprogram
	.long	.Linfo_string19                 // DW_AT_name
	.byte	4                               // DW_AT_decl_file
	.byte	33                              // DW_AT_decl_line
	.long	362                             // DW_AT_type
	.byte	1                               // DW_AT_inline
	.byte	10                              // Abbrev [10] 0x16a:0xb DW_TAG_typedef
	.long	172                             // DW_AT_type
	.long	.Linfo_string20                 // DW_AT_name
	.byte	6                               // DW_AT_decl_file
	.byte	27                              // DW_AT_decl_line
	.byte	22                              // Abbrev [22] 0x175:0x2a DW_TAG_subprogram
	.long	.Linfo_string21                 // DW_AT_name
	.byte	5                               // DW_AT_decl_file
	.byte	33                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	.byte	1                               // DW_AT_inline
	.byte	23                              // Abbrev [23] 0x17d:0xb DW_TAG_formal_parameter
	.long	.Linfo_string22                 // DW_AT_name
	.byte	5                               // DW_AT_decl_file
	.byte	33                              // DW_AT_decl_line
	.long	256                             // DW_AT_type
	.byte	23                              // Abbrev [23] 0x188:0xb DW_TAG_formal_parameter
	.long	.Linfo_string23                 // DW_AT_name
	.byte	5                               // DW_AT_decl_file
	.byte	33                              // DW_AT_decl_line
	.long	239                             // DW_AT_type
	.byte	23                              // Abbrev [23] 0x193:0xb DW_TAG_formal_parameter
	.long	.Linfo_string24                 // DW_AT_name
	.byte	5                               // DW_AT_decl_file
	.byte	33                              // DW_AT_decl_line
	.long	172                             // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	22                              // Abbrev [22] 0x19f:0x2a DW_TAG_subprogram
	.long	.Linfo_string25                 // DW_AT_name
	.byte	5                               // DW_AT_decl_file
	.byte	51                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	.byte	1                               // DW_AT_inline
	.byte	23                              // Abbrev [23] 0x1a7:0xb DW_TAG_formal_parameter
	.long	.Linfo_string22                 // DW_AT_name
	.byte	5                               // DW_AT_decl_file
	.byte	51                              // DW_AT_decl_line
	.long	256                             // DW_AT_type
	.byte	23                              // Abbrev [23] 0x1b2:0xb DW_TAG_formal_parameter
	.long	.Linfo_string23                 // DW_AT_name
	.byte	5                               // DW_AT_decl_file
	.byte	51                              // DW_AT_decl_line
	.long	239                             // DW_AT_type
	.byte	23                              // Abbrev [23] 0x1bd:0xb DW_TAG_formal_parameter
	.long	.Linfo_string24                 // DW_AT_name
	.byte	5                               // DW_AT_decl_file
	.byte	51                              // DW_AT_decl_line
	.long	172                             // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	24                              // Abbrev [24] 0x1c9:0x151 DW_TAG_subprogram
	.long	.Lfunc_begin1                   // DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1       // DW_AT_high_pc
	.byte	1                               // DW_AT_frame_base
	.byte	102
                                        // DW_AT_GNU_all_call_sites
	.long	.Linfo_string27                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	37                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	.long	77                              // DW_AT_type
                                        // DW_AT_external
	.byte	20                              // Abbrev [20] 0x1de:0xf DW_TAG_variable
	.long	.Ldebug_loc4                    // DW_AT_location
	.long	.Linfo_string33                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	38                              // DW_AT_decl_line
	.long	172                             // DW_AT_type
	.byte	20                              // Abbrev [20] 0x1ed:0xf DW_TAG_variable
	.long	.Ldebug_loc5                    // DW_AT_location
	.long	.Linfo_string34                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	48                              // DW_AT_decl_line
	.long	161                             // DW_AT_type
	.byte	20                              // Abbrev [20] 0x1fc:0xf DW_TAG_variable
	.long	.Ldebug_loc6                    // DW_AT_location
	.long	.Linfo_string35                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	49                              // DW_AT_decl_line
	.long	161                             // DW_AT_type
	.byte	20                              // Abbrev [20] 0x20b:0xf DW_TAG_variable
	.long	.Ldebug_loc7                    // DW_AT_location
	.long	.Linfo_string36                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	54                              // DW_AT_decl_line
	.long	161                             // DW_AT_type
	.byte	20                              // Abbrev [20] 0x21a:0xf DW_TAG_variable
	.long	.Ldebug_loc8                    // DW_AT_location
	.long	.Linfo_string37                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	52                              // DW_AT_decl_line
	.long	161                             // DW_AT_type
	.byte	20                              // Abbrev [20] 0x229:0xf DW_TAG_variable
	.long	.Ldebug_loc9                    // DW_AT_location
	.long	.Linfo_string38                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	57                              // DW_AT_decl_line
	.long	240                             // DW_AT_type
	.byte	25                              // Abbrev [25] 0x238:0xb DW_TAG_variable
	.long	.Linfo_string39                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	53                              // DW_AT_decl_line
	.long	161                             // DW_AT_type
	.byte	20                              // Abbrev [20] 0x243:0xf DW_TAG_variable
	.long	.Ldebug_loc10                   // DW_AT_location
	.long	.Linfo_string40                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	58                              // DW_AT_decl_line
	.long	240                             // DW_AT_type
	.byte	26                              // Abbrev [26] 0x252:0x10 DW_TAG_inlined_subroutine
	.long	350                             // DW_AT_abstract_origin
	.long	.Ltmp4                          // DW_AT_low_pc
	.long	.Ltmp6-.Ltmp4                   // DW_AT_high_pc
	.byte	1                               // DW_AT_call_file
	.byte	38                              // DW_AT_call_line
	.byte	31                              // DW_AT_call_column
	.byte	27                              // Abbrev [27] 0x262:0x94 DW_TAG_lexical_block
	.long	.Ldebug_ranges1                 // DW_AT_ranges
	.byte	28                              // Abbrev [28] 0x267:0xd DW_TAG_variable
	.byte	1                               // DW_AT_location
	.byte	97
	.long	.Linfo_string41                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	60                              // DW_AT_decl_line
	.long	172                             // DW_AT_type
	.byte	27                              // Abbrev [27] 0x274:0x81 DW_TAG_lexical_block
	.long	.Ldebug_ranges0                 // DW_AT_ranges
	.byte	25                              // Abbrev [25] 0x279:0xb DW_TAG_variable
	.long	.Linfo_string42                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	63                              // DW_AT_decl_line
	.long	161                             // DW_AT_type
	.byte	29                              // Abbrev [29] 0x284:0x26 DW_TAG_inlined_subroutine
	.long	373                             // DW_AT_abstract_origin
	.long	.Ltmp21                         // DW_AT_low_pc
	.long	.Ltmp23-.Ltmp21                 // DW_AT_high_pc
	.byte	1                               // DW_AT_call_file
	.byte	66                              // DW_AT_call_line
	.byte	9                               // DW_AT_call_column
	.byte	30                              // Abbrev [30] 0x294:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	81
	.long	381                             // DW_AT_abstract_origin
	.byte	31                              // Abbrev [31] 0x29b:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc11                   // DW_AT_location
	.long	392                             // DW_AT_abstract_origin
	.byte	32                              // Abbrev [32] 0x2a4:0x5 DW_TAG_formal_parameter
	.long	403                             // DW_AT_abstract_origin
	.byte	0                               // End Of Children Mark
	.byte	29                              // Abbrev [29] 0x2aa:0x28 DW_TAG_inlined_subroutine
	.long	373                             // DW_AT_abstract_origin
	.long	.Ltmp25                         // DW_AT_low_pc
	.long	.Ltmp27-.Ltmp25                 // DW_AT_high_pc
	.byte	1                               // DW_AT_call_file
	.byte	67                              // DW_AT_call_line
	.byte	9                               // DW_AT_call_column
	.byte	31                              // Abbrev [31] 0x2ba:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc13                   // DW_AT_location
	.long	381                             // DW_AT_abstract_origin
	.byte	31                              // Abbrev [31] 0x2c3:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc12                   // DW_AT_location
	.long	392                             // DW_AT_abstract_origin
	.byte	32                              // Abbrev [32] 0x2cc:0x5 DW_TAG_formal_parameter
	.long	403                             // DW_AT_abstract_origin
	.byte	0                               // End Of Children Mark
	.byte	29                              // Abbrev [29] 0x2d2:0x22 DW_TAG_inlined_subroutine
	.long	415                             // DW_AT_abstract_origin
	.long	.Ltmp28                         // DW_AT_low_pc
	.long	.Ltmp29-.Ltmp28                 // DW_AT_high_pc
	.byte	1                               // DW_AT_call_file
	.byte	73                              // DW_AT_call_line
	.byte	9                               // DW_AT_call_column
	.byte	30                              // Abbrev [30] 0x2e2:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	95
	.long	423                             // DW_AT_abstract_origin
	.byte	32                              // Abbrev [32] 0x2e9:0x5 DW_TAG_formal_parameter
	.long	434                             // DW_AT_abstract_origin
	.byte	32                              // Abbrev [32] 0x2ee:0x5 DW_TAG_formal_parameter
	.long	445                             // DW_AT_abstract_origin
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	33                              // Abbrev [33] 0x2f6:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp7                          // DW_AT_low_pc
	.byte	33                              // Abbrev [33] 0x2fd:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp8                          // DW_AT_low_pc
	.byte	33                              // Abbrev [33] 0x304:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp12                         // DW_AT_low_pc
	.byte	33                              // Abbrev [33] 0x30b:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp14                         // DW_AT_low_pc
	.byte	33                              // Abbrev [33] 0x312:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp28                         // DW_AT_low_pc
	.byte	0                               // End Of Children Mark
	.byte	24                              // Abbrev [24] 0x31a:0x1d DW_TAG_subprogram
	.long	.Lfunc_begin2                   // DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2       // DW_AT_high_pc
	.byte	1                               // DW_AT_frame_base
	.byte	102
                                        // DW_AT_GNU_all_call_sites
	.long	.Linfo_string28                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	31                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	.long	77                              // DW_AT_type
                                        // DW_AT_external
	.byte	33                              // Abbrev [33] 0x32f:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp39                         // DW_AT_low_pc
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.Ltmp19
	.long	.Ltmp29
	.long	.Ltmp32
	.long	.Ltmp34
	.long	0
	.long	0
.Ldebug_ranges1:
	.long	.Ltmp15
	.long	.Ltmp16
	.long	.Ltmp17
	.long	.Ltmp34
	.long	0
	.long	0
.Ldebug_ranges2:
	.long	.Lfunc_begin0
	.long	.Lfunc_end0
	.long	.Lfunc_begin1
	.long	.Lfunc_end1
	.long	.Lfunc_begin2
	.long	.Lfunc_end2
	.long	0
	.long	0
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 12.0.0 (https://github.com/upmem/llvm-project.git d36425841d9a4d1420b7aa155675f6ae8bcf9f08)" // string offset=0
.Linfo_string1:
	.asciz	"dpu/task.c"                    // string offset=106
.Linfo_string2:
	.asciz	"/root/uPIMulator_frontend/benchmark/VA" // string offset=117
.Linfo_string3:
	.asciz	"kernels"                       // string offset=156
.Linfo_string4:
	.asciz	"int"                           // string offset=164
.Linfo_string5:
	.asciz	"__ARRAY_SIZE_TYPE__"           // string offset=168
.Linfo_string6:
	.asciz	"DPU_INPUT_ARGUMENTS"           // string offset=188
.Linfo_string7:
	.asciz	"size"                          // string offset=208
.Linfo_string8:
	.asciz	"unsigned int"                  // string offset=213
.Linfo_string9:
	.asciz	"uint32_t"                      // string offset=226
.Linfo_string10:
	.asciz	"transfer_size"                 // string offset=235
.Linfo_string11:
	.asciz	"kernel"                        // string offset=249
.Linfo_string12:
	.asciz	"kernel1"                       // string offset=256
.Linfo_string13:
	.asciz	"nr_kernels"                    // string offset=264
.Linfo_string14:
	.asciz	"dpu_arguments_t"               // string offset=275
.Linfo_string15:
	.asciz	"__atomic_bit_barrier_my_barrier" // string offset=291
.Linfo_string16:
	.asciz	"unsigned char"                 // string offset=323
.Linfo_string17:
	.asciz	"uint8_t"                       // string offset=337
.Linfo_string18:
	.asciz	"int32_t"                       // string offset=345
.Linfo_string19:
	.asciz	"me"                            // string offset=353
.Linfo_string20:
	.asciz	"sysname_t"                     // string offset=356
.Linfo_string21:
	.asciz	"mram_read"                     // string offset=366
.Linfo_string22:
	.asciz	"from"                          // string offset=376
.Linfo_string23:
	.asciz	"to"                            // string offset=381
.Linfo_string24:
	.asciz	"nb_of_bytes"                   // string offset=384
.Linfo_string25:
	.asciz	"mram_write"                    // string offset=396
.Linfo_string26:
	.asciz	"vector_addition"               // string offset=407
.Linfo_string27:
	.asciz	"main_kernel1"                  // string offset=423
.Linfo_string28:
	.asciz	"main"                          // string offset=436
.Linfo_string29:
	.asciz	"bufferB"                       // string offset=441
.Linfo_string30:
	.asciz	"bufferA"                       // string offset=449
.Linfo_string31:
	.asciz	"l_size"                        // string offset=457
.Linfo_string32:
	.asciz	"i"                             // string offset=464
.Linfo_string33:
	.asciz	"tasklet_id"                    // string offset=466
.Linfo_string34:
	.asciz	"input_size_dpu_bytes"          // string offset=477
.Linfo_string35:
	.asciz	"input_size_dpu_bytes_transfer" // string offset=498
.Linfo_string36:
	.asciz	"mram_base_addr_B"              // string offset=528
.Linfo_string37:
	.asciz	"base_tasklet"                  // string offset=545
.Linfo_string38:
	.asciz	"cache_A"                       // string offset=558
.Linfo_string39:
	.asciz	"mram_base_addr_A"              // string offset=566
.Linfo_string40:
	.asciz	"cache_B"                       // string offset=583
.Linfo_string41:
	.asciz	"byte_index"                    // string offset=591
.Linfo_string42:
	.asciz	"l_size_bytes"                  // string offset=602
	.addrsig
	.addrsig_sym main_kernel1
	.addrsig_sym DPU_INPUT_ARGUMENTS
	.addrsig_sym my_barrier
	.addrsig_sym __sys_used_mram_end
	.section	.debug_line,"",@progbits
.Lline_table_start0:
