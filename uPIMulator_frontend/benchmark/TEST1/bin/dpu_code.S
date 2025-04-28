	.text
	.file	"task.c"
	.file	1 "/usr/bin/../share/upmem/include/stdlib" "stdint.h"
	.section	.text.fun,"ax",@progbits
	.globl	fun                             // -- Begin function fun
	.type	fun,@function
fun:                                    // @fun
.Lfunc_begin0:
	.file	2 "/mnt/d/Upmen/uPIMulator/python_cpp/uPIMulator_frontend/benchmark/TEST1" "dpu/task.c"
	.loc	2 9 0                           // dpu/task.c:9:0
	.cfi_sections .debug_frame
	.cfi_startproc
// %bb.0:
	//DEBUG_VALUE: fun:a <- [DW_OP_constu 1, DW_OP_minus, DW_OP_stack_value] $r0
	.cfi_def_cfa_offset 0
	//DEBUG_VALUE: fun:c <- 1
	//DEBUG_VALUE: fun:a <- [DW_OP_constu 1, DW_OP_minus, DW_OP_stack_value] $r1
	move r1, r0, z, .LBB0_1
.Ltmp0:
// %bb.2:
	//DEBUG_VALUE: fun:c <- 1
	move r0, 1
.Ltmp1:
.LBB0_3:                                // =>This Inner Loop Header: Depth=1
	//DEBUG_VALUE: fun:a <- $r1
	//DEBUG_VALUE: fun:c <- $r0
	.loc	2 12 7 prologue_end             // dpu/task.c:12:7
	lsl r2, r0, 1
	lsl_add r0, r2, r0, 2
.Ltmp2:
	//DEBUG_VALUE: fun:c <- $r0
	//DEBUG_VALUE: fun:a <- [DW_OP_constu 1, DW_OP_minus, DW_OP_stack_value] $r1
	//DEBUG_VALUE: fun:a <- $r1
	.loc	2 11 11                         // dpu/task.c:11:11
	add r1, r1, -1, nz, .LBB0_3
.Ltmp3:
// %bb.4:
	//DEBUG_VALUE: fun:c <- $r0
	.loc	2 14 3                          // dpu/task.c:14:3
	jump r23
.Ltmp4:
.LBB0_1:
	//DEBUG_VALUE: fun:c <- 1
	.loc	2 0 3 is_stmt 0                 // dpu/task.c:0:3
	move r0, 1
	.loc	2 14 3                          // dpu/task.c:14:3
	jump r23
.Ltmp5:
.Lfunc_end0:
	.size	fun, .Lfunc_end0-fun
	.cfi_endproc
	.section	.stack_sizes,"o",@progbits,.text.fun
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.fun,"ax",@progbits
                                        // -- End function
	.section	.text.main,"ax",@progbits
	.globl	main                            // -- Begin function main
	.type	main,@function
main:                                   // @main
.Lfunc_begin1:
	.loc	2 16 0 is_stmt 1                // dpu/task.c:16:0
	.cfi_startproc
// %bb.0:
	.cfi_def_cfa_offset -32
	.cfi_offset 23, -8
	.cfi_offset 22, -4
	sd r22, 24, d22
	add r22, r22, 32
	.cfi_offset 15, -32
	.cfi_offset 14, -28
	sd r22, -32, d14
	move r14, 0
	move r0, 3
.Ltmp6:
	//DEBUG_VALUE: main:time <- 0
	.loc	2 18 4 prologue_end             // dpu/task.c:18:4
	// inline asm
	time_cfg r0, r0

	// inline asm
.Ltmp7:
	//DEBUG_VALUE: main:end <- 0
	.loc	2 24 3                          // dpu/task.c:24:3
	// inline asm
	time r0

	// inline asm
.Ltmp8:
	//DEBUG_VALUE: main:time <- $r0
	.loc	2 26 3                          // dpu/task.c:26:3
	// inline asm
	time r0

	// inline asm
.Ltmp9:
	//DEBUG_VALUE: main:time <- $r0
	.loc	2 27 3                          // dpu/task.c:27:3
	// inline asm
	time r0

	// inline asm
.Ltmp10:
	//DEBUG_VALUE: main:time <- $r0
	.loc	2 29 3                          // dpu/task.c:29:3
	// inline asm
	time r0

	// inline asm
.Ltmp11:
	//DEBUG_VALUE: main:time <- $r0
	.loc	2 30 3                          // dpu/task.c:30:3
	// inline asm
	time r0

	// inline asm
.Ltmp12:
	//DEBUG_VALUE: main:time <- $r0
	.loc	2 32 3                          // dpu/task.c:32:3
	// inline asm
	time r0

	// inline asm
.Ltmp13:
	//DEBUG_VALUE: main:time <- $r0
	.loc	2 33 3                          // dpu/task.c:33:3
	// inline asm
	time r0

	// inline asm
.Ltmp14:
	//DEBUG_VALUE: main:time <- $r0
	.loc	2 35 3                          // dpu/task.c:35:3
	// inline asm
	time r0

	// inline asm
.Ltmp15:
	//DEBUG_VALUE: main:time <- $r0
	.loc	2 36 3                          // dpu/task.c:36:3
	// inline asm
	time r0

	// inline asm
.Ltmp16:
	//DEBUG_VALUE: main:time <- $r0
	.loc	2 37 11                         // dpu/task.c:37:11
	add r0, r0, 216
.Ltmp17:
	.loc	2 37 7 is_stmt 0                // dpu/task.c:37:7
	move.u d0, r0
.Ltmp18:
	//DEBUG_VALUE: main:end <- $d0
	.loc	2 37 6                          // dpu/task.c:37:6
	sd r22, -16, d0
	.loc	2 38 3 is_stmt 1                // dpu/task.c:38:3
	// inline asm
	time r0

	// inline asm
.Ltmp19:
	//DEBUG_VALUE: main:time <- $r0
	.loc	2 39 3                          // dpu/task.c:39:3
	// inline asm
	time r0

	// inline asm
.Ltmp20:
	//DEBUG_VALUE: main:time <- $r0
	.loc	2 40 3                          // dpu/task.c:40:3
	// inline asm
	time r0

	// inline asm
.Ltmp21:
	//DEBUG_VALUE: main:time <- $r0
	.loc	2 42 3                          // dpu/task.c:42:3
	// inline asm
	time r0

	// inline asm
.Ltmp22:
	//DEBUG_VALUE: main:time <- $r0
	.loc	2 43 4                          // dpu/task.c:43:4
	// inline asm
	time r0

	// inline asm
.Ltmp23:
	//DEBUG_VALUE: main:time <- $r0
	.loc	2 44 4                          // dpu/task.c:44:4
	// inline asm
	time r0

	// inline asm
.Ltmp24:
	//DEBUG_VALUE: main:time <- $r0
	.loc	2 45 4                          // dpu/task.c:45:4
	// inline asm
	time r0

	// inline asm
.Ltmp25:
	//DEBUG_VALUE: main:time <- $r0
	.loc	2 46 4                          // dpu/task.c:46:4
	// inline asm
	time r0

	// inline asm
.Ltmp26:
	//DEBUG_VALUE: main:time <- $r0
	.loc	2 48 3                          // dpu/task.c:48:3
	// inline asm
	time r0

	// inline asm
.Ltmp27:
	//DEBUG_VALUE: main:time <- $r0
	.loc	2 49 3                          // dpu/task.c:49:3
	// inline asm
	time r0

	// inline asm
.Ltmp28:
	//DEBUG_VALUE: main:time <- $r0
	.loc	2 50 3                          // dpu/task.c:50:3
	// inline asm
	time r0

	// inline asm
.Ltmp29:
	//DEBUG_VALUE: main:time <- $r0
	.loc	2 51 3                          // dpu/task.c:51:3
	// inline asm
	time r0

	// inline asm
.Ltmp30:
	//DEBUG_VALUE: main:time <- $r0
	.loc	2 52 3                          // dpu/task.c:52:3
	// inline asm
	time r0

	// inline asm
.Ltmp31:
	//DEBUG_VALUE: main:time <- $r0
	.loc	2 54 3                          // dpu/task.c:54:3
	// inline asm
	time r0

	// inline asm
.Ltmp32:
	//DEBUG_VALUE: main:time <- $r0
	.loc	2 55 4                          // dpu/task.c:55:4
	// inline asm
	time r0

	// inline asm
.Ltmp33:
	//DEBUG_VALUE: main:time <- $r0
	.loc	2 56 4                          // dpu/task.c:56:4
	// inline asm
	time r0

	// inline asm
.Ltmp34:
	//DEBUG_VALUE: main:time <- $r0
	.loc	2 57 4                          // dpu/task.c:57:4
	// inline asm
	time r0

	// inline asm
.Ltmp35:
	//DEBUG_VALUE: main:time <- $r0
	.loc	2 72 8                          // dpu/task.c:72:8
	call r23, perfcounter_get
.Ltmp36:
	//DEBUG_VALUE: main:time <- $r1
	.loc	2 72 7 is_stmt 0                // dpu/task.c:72:7
	sw r22, -24, r1
.Ltmp37:
	//DEBUG_VALUE: mram_write:nb_of_bytes <- 8
	//DEBUG_VALUE: main:time <- [DW_OP_constu 24, DW_OP_minus, DW_OP_deref] $r22
	.file	3 "/usr/bin/../share/upmem/include/syslib" "mram.h"
	.loc	3 66 24 is_stmt 1               // /usr/bin/../share/upmem/include/syslib/mram.h:66:24
	move r0, __sys_used_mram_end
.Ltmp38:
	//DEBUG_VALUE: mram_write:to <- $r0
	.loc	3 0 24 is_stmt 0                // /usr/bin/../share/upmem/include/syslib/mram.h:0:24
	add r1, r22, -24
.Ltmp39:
	//DEBUG_VALUE: mram_write:from <- [DW_OP_constu 24, DW_OP_minus, DW_OP_stack_value] $r22
	.loc	3 66 24                         // /usr/bin/../share/upmem/include/syslib/mram.h:66:24
	sdma r1, r0, 0
.Ltmp40:
	//DEBUG_VALUE: mram_write:nb_of_bytes <- 8
	//DEBUG_VALUE: main:end <- [DW_OP_constu 16, DW_OP_minus, DW_OP_deref] $r22
	.loc	3 66 24                         // /usr/bin/../share/upmem/include/syslib/mram.h:66:24
	add r0, r0, 8
.Ltmp41:
	//DEBUG_VALUE: mram_write:to <- $r0
	.loc	3 0 24                          // /usr/bin/../share/upmem/include/syslib/mram.h:0:24
	add r1, r22, -16
.Ltmp42:
	//DEBUG_VALUE: mram_write:from <- [DW_OP_constu 16, DW_OP_minus, DW_OP_stack_value] $r22
	.loc	3 66 24                         // /usr/bin/../share/upmem/include/syslib/mram.h:66:24
	sdma r1, r0, 0
.Ltmp43:
	.loc	2 78 1 is_stmt 1                // dpu/task.c:78:1
	move r0, r14
.Ltmp44:
	ld d14, r22, -32
	ld d22, r22, -8
.Ltmp45:
	jump r23
.Ltmp46:
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
	.section	.stack_sizes,"o",@progbits,.text.main
	.long	.Lfunc_begin1
	.byte	32
	.section	.text.main,"ax",@progbits
                                        // -- End function
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.long	-1
	.long	.Lfunc_begin0                   //   base address
	.long	.Lfunc_begin0-.Lfunc_begin0
	.long	.Ltmp0-.Lfunc_begin0
	.short	3                               // Loc expr size
	.byte	113                             // DW_OP_breg1
	.byte	127                             // -1
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp1-.Lfunc_begin0
	.long	.Ltmp3-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.long	0
	.long	0
.Ldebug_loc1:
	.long	-1
	.long	.Lfunc_begin0                   //   base address
	.long	.Lfunc_begin0-.Lfunc_begin0
	.long	.Ltmp1-.Lfunc_begin0
	.short	3                               // Loc expr size
	.byte	17                              // DW_OP_consts
	.byte	1                               // 1
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp1-.Lfunc_begin0
	.long	.Ltmp4-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	.Ltmp4-.Lfunc_begin0
	.long	.Lfunc_end0-.Lfunc_begin0
	.short	3                               // Loc expr size
	.byte	17                              // DW_OP_consts
	.byte	1                               // 1
	.byte	159                             // DW_OP_stack_value
	.long	0
	.long	0
.Ldebug_loc2:
	.long	-1
	.long	.Lfunc_begin1                   //   base address
	.long	.Ltmp6-.Lfunc_begin1
	.long	.Ltmp8-.Lfunc_begin1
	.short	2                               // Loc expr size
	.byte	48                              // DW_OP_lit0
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp8-.Lfunc_begin1
	.long	.Ltmp17-.Lfunc_begin1
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	.Ltmp19-.Lfunc_begin1
	.long	.Ltmp36-.Lfunc_begin1
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	.Ltmp36-.Lfunc_begin1
	.long	.Ltmp37-.Lfunc_begin1
	.short	1                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.long	.Ltmp37-.Lfunc_begin1
	.long	.Ltmp45-.Lfunc_begin1
	.short	2                               // Loc expr size
	.byte	134                             // DW_OP_breg22
	.byte	104                             // -24
	.long	0
	.long	0
.Ldebug_loc3:
	.long	-1
	.long	.Lfunc_begin1                   //   base address
	.long	.Ltmp7-.Lfunc_begin1
	.long	.Ltmp18-.Lfunc_begin1
	.short	2                               // Loc expr size
	.byte	48                              // DW_OP_lit0
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp18-.Lfunc_begin1
	.long	.Ltmp19-.Lfunc_begin1
	.short	6                               // Loc expr size
	.byte	81                              // sub-register DW_OP_reg1
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.byte	80                              // sub-register DW_OP_reg0
	.byte	147                             // DW_OP_piece
	.byte	4                               // 4
	.long	.Ltmp40-.Lfunc_begin1
	.long	.Ltmp45-.Lfunc_begin1
	.short	2                               // Loc expr size
	.byte	134                             // DW_OP_breg22
	.byte	112                             // -16
	.long	0
	.long	0
.Ldebug_loc4:
	.long	-1
	.long	.Lfunc_begin1                   //   base address
	.long	.Ltmp38-.Lfunc_begin1
	.long	.Ltmp41-.Lfunc_begin1
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	0
	.long	0
.Ldebug_loc5:
	.long	-1
	.long	.Lfunc_begin1                   //   base address
	.long	.Ltmp39-.Lfunc_begin1
	.long	.Ltmp45-.Lfunc_begin1
	.short	3                               // Loc expr size
	.byte	134                             // DW_OP_breg22
	.byte	104                             // -24
	.byte	159                             // DW_OP_stack_value
	.long	0
	.long	0
.Ldebug_loc6:
	.long	-1
	.long	.Lfunc_begin1                   //   base address
	.long	.Ltmp41-.Lfunc_begin1
	.long	.Ltmp44-.Lfunc_begin1
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	0
	.long	0
.Ldebug_loc7:
	.long	-1
	.long	.Lfunc_begin1                   //   base address
	.long	.Ltmp42-.Lfunc_begin1
	.long	.Ltmp45-.Lfunc_begin1
	.short	3                               // Loc expr size
	.byte	134                             // DW_OP_breg22
	.byte	112                             // -16
	.byte	159                             // DW_OP_stack_value
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
	.byte	3                               // Abbreviation Code
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
	.byte	4                               // Abbreviation Code
	.byte	15                              // DW_TAG_pointer_type
	.byte	0                               // DW_CHILDREN_no
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	5                               // Abbreviation Code
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
	.byte	6                               // Abbreviation Code
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
	.byte	7                               // Abbreviation Code
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
	.byte	8                               // Abbreviation Code
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
	.byte	9                               // Abbreviation Code
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
	.byte	10                              // Abbreviation Code
	.byte	15                              // DW_TAG_pointer_type
	.byte	0                               // DW_CHILDREN_no
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	11                              // Abbreviation Code
	.byte	38                              // DW_TAG_const_type
	.byte	0                               // DW_CHILDREN_no
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	12                              // Abbreviation Code
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
	.byte	13                              // Abbreviation Code
	.byte	5                               // DW_TAG_formal_parameter
	.byte	0                               // DW_CHILDREN_no
	.byte	2                               // DW_AT_location
	.byte	23                              // DW_FORM_sec_offset
	.byte	49                              // DW_AT_abstract_origin
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	14                              // Abbreviation Code
	.byte	5                               // DW_TAG_formal_parameter
	.byte	0                               // DW_CHILDREN_no
	.byte	28                              // DW_AT_const_value
	.byte	15                              // DW_FORM_udata
	.byte	49                              // DW_AT_abstract_origin
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	15                              // Abbreviation Code
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
	.byte	1                               // Abbrev [1] 0xb:0x139 DW_TAG_compile_unit
	.long	.Linfo_string0                  // DW_AT_producer
	.short	12                              // DW_AT_language
	.long	.Linfo_string1                  // DW_AT_name
	.long	.Lline_table_start0             // DW_AT_stmt_list
	.long	.Linfo_string2                  // DW_AT_comp_dir
	.long	0                               // DW_AT_low_pc
	.long	.Ldebug_ranges0                 // DW_AT_ranges
	.byte	2                               // Abbrev [2] 0x26:0xb DW_TAG_typedef
	.long	49                              // DW_AT_type
	.long	.Linfo_string4                  // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	48                              // DW_AT_decl_line
	.byte	3                               // Abbrev [3] 0x31:0x7 DW_TAG_base_type
	.long	.Linfo_string3                  // DW_AT_name
	.byte	7                               // DW_AT_encoding
	.byte	4                               // DW_AT_byte_size
	.byte	4                               // Abbrev [4] 0x38:0x1 DW_TAG_pointer_type
	.byte	5                               // Abbrev [5] 0x39:0x34 DW_TAG_subprogram
	.long	.Lfunc_begin0                   // DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       // DW_AT_high_pc
	.byte	1                               // DW_AT_frame_base
	.byte	102
                                        // DW_AT_GNU_all_call_sites
	.long	.Linfo_string9                  // DW_AT_name
	.byte	2                               // DW_AT_decl_file
	.byte	9                               // DW_AT_decl_line
                                        // DW_AT_prototyped
	.long	298                             // DW_AT_type
                                        // DW_AT_external
	.byte	6                               // Abbrev [6] 0x4e:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc0                    // DW_AT_location
	.long	.Linfo_string12                 // DW_AT_name
	.byte	2                               // DW_AT_decl_file
	.byte	9                               // DW_AT_decl_line
	.long	298                             // DW_AT_type
	.byte	7                               // Abbrev [7] 0x5d:0xf DW_TAG_variable
	.long	.Ldebug_loc1                    // DW_AT_location
	.long	.Linfo_string13                 // DW_AT_name
	.byte	2                               // DW_AT_decl_file
	.byte	10                              // DW_AT_decl_line
	.long	298                             // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	8                               // Abbrev [8] 0x6d:0x2a DW_TAG_subprogram
	.long	.Linfo_string5                  // DW_AT_name
	.byte	3                               // DW_AT_decl_file
	.byte	60                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	.byte	1                               // DW_AT_inline
	.byte	9                               // Abbrev [9] 0x75:0xb DW_TAG_formal_parameter
	.long	.Linfo_string6                  // DW_AT_name
	.byte	3                               // DW_AT_decl_file
	.byte	60                              // DW_AT_decl_line
	.long	151                             // DW_AT_type
	.byte	9                               // Abbrev [9] 0x80:0xb DW_TAG_formal_parameter
	.long	.Linfo_string7                  // DW_AT_name
	.byte	3                               // DW_AT_decl_file
	.byte	60                              // DW_AT_decl_line
	.long	56                              // DW_AT_type
	.byte	9                               // Abbrev [9] 0x8b:0xb DW_TAG_formal_parameter
	.long	.Linfo_string8                  // DW_AT_name
	.byte	3                               // DW_AT_decl_file
	.byte	60                              // DW_AT_decl_line
	.long	49                              // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	10                              // Abbrev [10] 0x97:0x5 DW_TAG_pointer_type
	.long	156                             // DW_AT_type
	.byte	11                              // Abbrev [11] 0x9c:0x1 DW_TAG_const_type
	.byte	5                               // Abbrev [5] 0x9d:0x8d DW_TAG_subprogram
	.long	.Lfunc_begin1                   // DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1       // DW_AT_high_pc
	.byte	1                               // DW_AT_frame_base
	.byte	102
                                        // DW_AT_GNU_all_call_sites
	.long	.Linfo_string11                 // DW_AT_name
	.byte	2                               // DW_AT_decl_file
	.byte	16                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	.long	298                             // DW_AT_type
                                        // DW_AT_external
	.byte	7                               // Abbrev [7] 0xb2:0xf DW_TAG_variable
	.long	.Ldebug_loc2                    // DW_AT_location
	.long	.Linfo_string14                 // DW_AT_name
	.byte	2                               // DW_AT_decl_file
	.byte	17                              // DW_AT_decl_line
	.long	38                              // DW_AT_type
	.byte	7                               // Abbrev [7] 0xc1:0xf DW_TAG_variable
	.long	.Ldebug_loc3                    // DW_AT_location
	.long	.Linfo_string15                 // DW_AT_name
	.byte	2                               // DW_AT_decl_file
	.byte	22                              // DW_AT_decl_line
	.long	305                             // DW_AT_type
	.byte	12                              // Abbrev [12] 0xd0:0x29 DW_TAG_inlined_subroutine
	.long	109                             // DW_AT_abstract_origin
	.long	.Ltmp37                         // DW_AT_low_pc
	.long	.Ltmp40-.Ltmp37                 // DW_AT_high_pc
	.byte	2                               // DW_AT_call_file
	.byte	75                              // DW_AT_call_line
	.byte	3                               // DW_AT_call_column
	.byte	13                              // Abbrev [13] 0xe0:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc5                    // DW_AT_location
	.long	117                             // DW_AT_abstract_origin
	.byte	13                              // Abbrev [13] 0xe9:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc4                    // DW_AT_location
	.long	128                             // DW_AT_abstract_origin
	.byte	14                              // Abbrev [14] 0xf2:0x6 DW_TAG_formal_parameter
	.byte	8                               // DW_AT_const_value
	.long	139                             // DW_AT_abstract_origin
	.byte	0                               // End Of Children Mark
	.byte	12                              // Abbrev [12] 0xf9:0x29 DW_TAG_inlined_subroutine
	.long	109                             // DW_AT_abstract_origin
	.long	.Ltmp40                         // DW_AT_low_pc
	.long	.Ltmp43-.Ltmp40                 // DW_AT_high_pc
	.byte	2                               // DW_AT_call_file
	.byte	76                              // DW_AT_call_line
	.byte	3                               // DW_AT_call_column
	.byte	13                              // Abbrev [13] 0x109:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc7                    // DW_AT_location
	.long	117                             // DW_AT_abstract_origin
	.byte	13                              // Abbrev [13] 0x112:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc6                    // DW_AT_location
	.long	128                             // DW_AT_abstract_origin
	.byte	14                              // Abbrev [14] 0x11b:0x6 DW_TAG_formal_parameter
	.byte	8                               // DW_AT_const_value
	.long	139                             // DW_AT_abstract_origin
	.byte	0                               // End Of Children Mark
	.byte	15                              // Abbrev [15] 0x122:0x7 DW_TAG_GNU_call_site
	.byte	1                               // DW_AT_GNU_call_site_target
	.byte	103
	.long	.Ltmp36                         // DW_AT_low_pc
	.byte	0                               // End Of Children Mark
	.byte	3                               // Abbrev [3] 0x12a:0x7 DW_TAG_base_type
	.long	.Linfo_string10                 // DW_AT_name
	.byte	5                               // DW_AT_encoding
	.byte	4                               // DW_AT_byte_size
	.byte	2                               // Abbrev [2] 0x131:0xb DW_TAG_typedef
	.long	316                             // DW_AT_type
	.long	.Linfo_string17                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	53                              // DW_AT_decl_line
	.byte	3                               // Abbrev [3] 0x13c:0x7 DW_TAG_base_type
	.long	.Linfo_string16                 // DW_AT_name
	.byte	7                               // DW_AT_encoding
	.byte	8                               // DW_AT_byte_size
	.byte	0                               // End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.Lfunc_begin0
	.long	.Lfunc_end0
	.long	.Lfunc_begin1
	.long	.Lfunc_end1
	.long	0
	.long	0
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 12.0.0 (https://github.com/upmem/llvm-project.git 02a1f3ffa0f15d3c21b60ffc12196131c3e3cffa)" // string offset=0
.Linfo_string1:
	.asciz	"dpu/task.c"                    // string offset=106
.Linfo_string2:
	.asciz	"/mnt/d/Upmen/uPIMulator/python_cpp/uPIMulator_frontend/benchmark/TEST1" // string offset=117
.Linfo_string3:
	.asciz	"unsigned int"                  // string offset=188
.Linfo_string4:
	.asciz	"uint32_t"                      // string offset=201
.Linfo_string5:
	.asciz	"mram_write"                    // string offset=210
.Linfo_string6:
	.asciz	"from"                          // string offset=221
.Linfo_string7:
	.asciz	"to"                            // string offset=226
.Linfo_string8:
	.asciz	"nb_of_bytes"                   // string offset=229
.Linfo_string9:
	.asciz	"fun"                           // string offset=241
.Linfo_string10:
	.asciz	"int"                           // string offset=245
.Linfo_string11:
	.asciz	"main"                          // string offset=249
.Linfo_string12:
	.asciz	"a"                             // string offset=254
.Linfo_string13:
	.asciz	"c"                             // string offset=256
.Linfo_string14:
	.asciz	"time"                          // string offset=258
.Linfo_string15:
	.asciz	"end"                           // string offset=263
.Linfo_string16:
	.asciz	"long unsigned int"             // string offset=267
.Linfo_string17:
	.asciz	"uint64_t"                      // string offset=285
	.addrsig
	.addrsig_sym __sys_used_mram_end
	.section	.debug_line,"",@progbits
.Lline_table_start0:
