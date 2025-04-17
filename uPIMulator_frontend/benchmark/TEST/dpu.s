	.text
	.file	"dpu.c"
	.globl	fun                             // -- Begin function fun
	.type	fun,@function
fun:                                    // @fun
.Lfunc_begin0:
	.file	1 "/mnt/d/Upmen/uPIMulator/python_cpp/uPIMulator_frontend/benchmark/TEST" "dpu.c"
	.loc	1 10 0                          // dpu.c:10:0
	.cfi_sections .debug_frame
	.cfi_startproc
// %bb.0:
	.cfi_def_cfa_offset 0
	sw r22, 0, r0
.Ltmp0:
	.loc	1 11 9 prologue_end             // dpu.c:11:9
	sw r22, 4, 1
	.loc	1 12 5                          // dpu.c:12:5
	jump .LBB0_1
.LBB0_1:                                // =>This Inner Loop Header: Depth=1
	.loc	1 12 13 is_stmt 0               // dpu.c:12:13
	lw r0, r22, 0
	add r1, r0, -1
	sw r22, 0, r1
	.loc	1 12 5                          // dpu.c:12:5
	jeq r0, 0, .LBB0_3
	jump .LBB0_2
.LBB0_2:                                //   in Loop: Header=BB0_1 Depth=1
.Ltmp1:
	.loc	1 13 9 is_stmt 1                // dpu.c:13:9
	lw r1, r22, 4
	lsl r0, r1, 1
	lsl_add r0, r0, r1, 2
	sw r22, 4, r0
.Ltmp2:
	.loc	1 12 5                          // dpu.c:12:5
	jump .LBB0_1
.LBB0_3:
	.loc	1 15 12                         // dpu.c:15:12
	lw r0, r22, 4
	.loc	1 15 5 is_stmt 0                // dpu.c:15:5
	jump r23
.Ltmp3:
.Lfunc_end0:
	.size	fun, .Lfunc_end0-fun
	.cfi_endproc
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin0
	.byte	8
	.text
                                        // -- End function
	.globl	main                            // -- Begin function main
	.type	main,@function
main:                                   // @main
.Lfunc_begin1:
	.loc	1 17 0 is_stmt 1                // dpu.c:17:0
	.cfi_startproc
// %bb.0:
	.cfi_def_cfa_offset -24
	.cfi_offset 23, -8
	.cfi_offset 22, -4
	sd r22, 16, d22
	add r22, r22, 24
	move r0, 0
	sw r22, -20, r0
	move r1, 3
.Ltmp4:
	.loc	1 18 5 prologue_end             // dpu.c:18:5
	// inline asm
	time_cfg r0, r1

	// inline asm
	move r0, 5
	sw r22, -16, r0
	.loc	1 21 5                          // dpu.c:21:5
	call r23, fun
                                        // kill: def $r1 killed $r0
	.loc	1 22 18                         // dpu.c:22:18
	lw r0, r22, -16
	sw r22, -24, 0
	.loc	1 23 5                          // dpu.c:23:5
	// inline asm
	time r1

	// inline asm
	sw r22, -24, r1
	.loc	1 25 5                          // dpu.c:25:5
	call r23, fun
                                        // kill: def $r1 killed $r0
	.loc	1 26 5                          // dpu.c:26:5
	lw r0, r22, -20
	// inline asm
	time r1

	// inline asm
	sw r22, -24, r1
	.loc	1 28 3                          // dpu.c:28:3
	ld d22, r22, -8
	jump r23
.Ltmp5:
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
	.section	.stack_sizes,"o",@progbits,.text
	.long	.Lfunc_begin1
	.byte	24
	.text
                                        // -- End function
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
	.byte	18                              // DW_AT_high_pc
	.byte	6                               // DW_FORM_data4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	2                               // Abbreviation Code
	.byte	46                              // DW_TAG_subprogram
	.byte	1                               // DW_CHILDREN_yes
	.byte	17                              // DW_AT_low_pc
	.byte	1                               // DW_FORM_addr
	.byte	18                              // DW_AT_high_pc
	.byte	6                               // DW_FORM_data4
	.byte	64                              // DW_AT_frame_base
	.byte	24                              // DW_FORM_exprloc
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
	.byte	3                               // Abbreviation Code
	.byte	5                               // DW_TAG_formal_parameter
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
	.byte	4                               // Abbreviation Code
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
	.byte	5                               // Abbreviation Code
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
	.byte	0                               // EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.long	.Ldebug_info_end0-.Ldebug_info_start0 // Length of Unit
.Ldebug_info_start0:
	.short	4                               // DWARF version number
	.long	.debug_abbrev                   // Offset Into Abbrev. Section
	.byte	4                               // Address Size (in bytes)
	.byte	1                               // Abbrev [1] 0xb:0x80 DW_TAG_compile_unit
	.long	.Linfo_string0                  // DW_AT_producer
	.short	12                              // DW_AT_language
	.long	.Linfo_string1                  // DW_AT_name
	.long	.Lline_table_start0             // DW_AT_stmt_list
	.long	.Linfo_string2                  // DW_AT_comp_dir
	.long	.Lfunc_begin0                   // DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin0       // DW_AT_high_pc
	.byte	2                               // Abbrev [2] 0x26:0x32 DW_TAG_subprogram
	.long	.Lfunc_begin0                   // DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       // DW_AT_high_pc
	.byte	1                               // DW_AT_frame_base
	.byte	102
	.long	.Linfo_string3                  // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	10                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	.long	124                             // DW_AT_type
                                        // DW_AT_external
	.byte	3                               // Abbrev [3] 0x3b:0xe DW_TAG_formal_parameter
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	0
	.long	.Linfo_string6                  // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	10                              // DW_AT_decl_line
	.long	124                             // DW_AT_type
	.byte	4                               // Abbrev [4] 0x49:0xe DW_TAG_variable
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	4
	.long	.Linfo_string7                  // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	11                              // DW_AT_decl_line
	.long	124                             // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	2                               // Abbrev [2] 0x58:0x24 DW_TAG_subprogram
	.long	.Lfunc_begin1                   // DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1       // DW_AT_high_pc
	.byte	1                               // DW_AT_frame_base
	.byte	102
	.long	.Linfo_string5                  // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	17                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	.long	124                             // DW_AT_type
                                        // DW_AT_external
	.byte	4                               // Abbrev [4] 0x6d:0xe DW_TAG_variable
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	104
	.long	.Linfo_string8                  // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	22                              // DW_AT_decl_line
	.long	131                             // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	5                               // Abbrev [5] 0x7c:0x7 DW_TAG_base_type
	.long	.Linfo_string4                  // DW_AT_name
	.byte	5                               // DW_AT_encoding
	.byte	4                               // DW_AT_byte_size
	.byte	5                               // Abbrev [5] 0x83:0x7 DW_TAG_base_type
	.long	.Linfo_string9                  // DW_AT_name
	.byte	7                               // DW_AT_encoding
	.byte	4                               // DW_AT_byte_size
	.byte	0                               // End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 12.0.0 (https://github.com/upmem/llvm-project.git 02a1f3ffa0f15d3c21b60ffc12196131c3e3cffa)" // string offset=0
.Linfo_string1:
	.asciz	"dpu.c"                         // string offset=106
.Linfo_string2:
	.asciz	"/mnt/d/Upmen/uPIMulator/python_cpp/uPIMulator_frontend/benchmark/TEST" // string offset=112
.Linfo_string3:
	.asciz	"fun"                           // string offset=182
.Linfo_string4:
	.asciz	"int"                           // string offset=186
.Linfo_string5:
	.asciz	"main"                          // string offset=190
.Linfo_string6:
	.asciz	"a"                             // string offset=195
.Linfo_string7:
	.asciz	"c"                             // string offset=197
.Linfo_string8:
	.asciz	"time"                          // string offset=199
.Linfo_string9:
	.asciz	"unsigned int"                  // string offset=204
	.addrsig
	.addrsig_sym fun
	.section	.debug_line,"",@progbits
.Lline_table_start0:
