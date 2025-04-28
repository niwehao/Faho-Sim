	.text
	.file	"task2.c"
	.section	.text.load_prg_memory,"ax",@progbits
	.globl	load_prg_memory                 // -- Begin function load_prg_memory
	.type	load_prg_memory,@function
load_prg_memory:                        // @load_prg_memory
.Lfunc_begin0:
	.file	1 "/mnt/d/Upmen/uPIMulator/python_cpp/uPIMulator_frontend/benchmark/TEST1" "dpu/task2.c"
	.loc	1 10 0                          // dpu/task2.c:10:0
	.cfi_sections .debug_frame
	.cfi_startproc
// %bb.0:
	//DEBUG_VALUE: load_prg_memory:size_text <- $r0
	.cfi_def_cfa_offset 0
	//DEBUG_VALUE: load_prg_memory:temp <- $r0
	move r1, 0
.Ltmp0:
	//DEBUG_VALUE: load_prg_memory:off <- 0
	//DEBUG_VALUE: load_prg_memory:temp <- $r0
	//DEBUG_VALUE: load_prg_memory:size_text <- $r0
	.loc	1 15 5 prologue_end             // dpu/task2.c:15:5
	lsr r2, r0, 11, z, .LBB0_3
.Ltmp1:
// %bb.1:
	//DEBUG_VALUE: load_prg_memory:temp <- $r0
	//DEBUG_VALUE: load_prg_memory:size_text <- $r0
	//DEBUG_VALUE: load_prg_memory:off <- 0
	.loc	1 0 5 is_stmt 0                 // dpu/task2.c:0:5
	move r1, 0
.Ltmp2:
.LBB0_2:                                // =>This Inner Loop Header: Depth=1
	//DEBUG_VALUE: load_prg_memory:temp <- $r0
	//DEBUG_VALUE: load_prg_memory:temp <- $r0
	//DEBUG_VALUE: load_prg_memory:off <- $r1
	.loc	1 17 12 is_stmt 1               // dpu/task2.c:17:12
	add r0, r0, -2048
.Ltmp3:
	//DEBUG_VALUE: load_prg_memory:temp <- $r0
	.loc	1 18 29                         // dpu/task2.c:18:29
	or r2, r1, -16777216
.Ltmp4:
	//DEBUG_VALUE: ra <- $r2
	.loc	1 20 7                          // dpu/task2.c:20:7
	// inline asm
	ldmai r2, r1, 0

	// inline asm
	.loc	1 25 11                         // dpu/task2.c:25:11
	add r1, r1, 2048
.Ltmp5:
	//DEBUG_VALUE: load_prg_memory:off <- $r1
	.loc	1 15 5                          // dpu/task2.c:15:5
	lsr r2, r0, 11, nz, .LBB0_2
.Ltmp6:
.LBB0_3:
	//DEBUG_VALUE: load_prg_memory:temp <- $r0
	.loc	1 28 14                         // dpu/task2.c:28:14
	and r2, r0, 8, z, .LBB0_4
.Ltmp7:
// %bb.5:
	//DEBUG_VALUE: load_prg_memory:temp <- $r0
	.loc	1 0 14 is_stmt 0                // dpu/task2.c:0:14
	lsl r0, r0, 21
.Ltmp8:
	and r0, r0, -16777216
	or r0, r0, r1
.Ltmp9:
	//DEBUG_VALUE: load_prg_memory:ra <- $r0
	.loc	1 32 5 is_stmt 1                // dpu/task2.c:32:5
	// inline asm
	ldmai r0, r1, 0

	// inline asm
	.loc	1 37 3                          // dpu/task2.c:37:3
	jump r23
.Ltmp10:
.LBB0_4:
	//DEBUG_VALUE: load_prg_memory:temp <- $r0
	.loc	1 0 3 is_stmt 0                 // dpu/task2.c:0:3
	move r2, -16777216
	lsl_add r0, r2, r0, 21
.Ltmp11:
	and r0, r0, -16777216
	or r0, r0, r1
.Ltmp12:
	//DEBUG_VALUE: load_prg_memory:ra <- $r0
	.loc	1 32 5 is_stmt 1                // dpu/task2.c:32:5
	// inline asm
	ldmai r0, r1, 0

	// inline asm
	.loc	1 37 3                          // dpu/task2.c:37:3
	jump r23
.Ltmp13:
.Lfunc_end0:
	.size	load_prg_memory, .Lfunc_end0-load_prg_memory
	.cfi_endproc
	.section	.stack_sizes,"o",@progbits,.text.load_prg_memory
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.load_prg_memory,"ax",@progbits
                                        // -- End function
	.section	.text.main,"ax",@progbits
	.globl	main                            // -- Begin function main
	.type	main,@function
main:                                   // @main
.Lfunc_begin1:
	.loc	1 38 0                          // dpu/task2.c:38:0
	.cfi_startproc
// %bb.0:
	.cfi_def_cfa_offset 0
	.loc	1 39 32 prologue_end            // dpu/task2.c:39:32
	sd r22, 0, 0
	move r1, 65536
	add r2, r22, 0
.Ltmp14:
	//DEBUG_VALUE: mram_write:nb_of_bytes <- 8
	//DEBUG_VALUE: mram_write:from <- undef
	//DEBUG_VALUE: mram_write:to <- $r1
	.file	2 "/usr/bin/../share/upmem/include/syslib" "mram.h"
	.loc	2 66 24                         // /usr/bin/../share/upmem/include/syslib/mram.h:66:24
	sdma r2, r1, 0
	move r5, 1
	move r4, 2
.Ltmp15:
	.loc	1 42 9                          // dpu/task2.c:42:9
	sd r22, 0, d4
.Ltmp16:
	//DEBUG_VALUE: mram_write:from <- undef
	.loc	1 0 9 is_stmt 0                 // dpu/task2.c:0:9
	move r0, 0
.Ltmp17:
	//DEBUG_VALUE: mram_write:nb_of_bytes <- 8
	//DEBUG_VALUE: mram_write:to <- $r1
	.loc	2 66 24 is_stmt 1               // /usr/bin/../share/upmem/include/syslib/mram.h:66:24
	sdma r2, r1, 0
.Ltmp18:
	.loc	1 45 5                          // dpu/task2.c:45:5
	jump r23
.Ltmp19:
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
	.section	.stack_sizes,"o",@progbits,.text.main
	.long	.Lfunc_begin1
	.byte	8
	.section	.text.main,"ax",@progbits
                                        // -- End function
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.long	-1
	.long	.Lfunc_begin0                   //   base address
	.long	.Lfunc_begin0-.Lfunc_begin0
	.long	.Ltmp2-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	0
	.long	0
.Ldebug_loc1:
	.long	-1
	.long	.Lfunc_begin0                   //   base address
	.long	.Lfunc_begin0-.Lfunc_begin0
	.long	.Ltmp8-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	.Ltmp10-.Lfunc_begin0
	.long	.Ltmp11-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	0
	.long	0
.Ldebug_loc2:
	.long	-1
	.long	.Lfunc_begin0                   //   base address
	.long	.Ltmp0-.Lfunc_begin0
	.long	.Ltmp2-.Lfunc_begin0
	.short	2                               // Loc expr size
	.byte	48                              // DW_OP_lit0
	.byte	159                             // DW_OP_stack_value
	.long	.Ltmp2-.Lfunc_begin0
	.long	.Ltmp6-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	81                              // DW_OP_reg1
	.long	0
	.long	0
.Ldebug_loc3:
	.long	-1
	.long	.Lfunc_begin0                   //   base address
	.long	.Ltmp4-.Lfunc_begin0
	.long	.Ltmp6-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	82                              // DW_OP_reg2
	.long	0
	.long	0
.Ldebug_loc4:
	.long	-1
	.long	.Lfunc_begin0                   //   base address
	.long	.Ltmp9-.Lfunc_begin0
	.long	.Ltmp10-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
	.long	.Ltmp12-.Lfunc_begin0
	.long	.Lfunc_end0-.Lfunc_begin0
	.short	1                               // Loc expr size
	.byte	80                              // DW_OP_reg0
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
	.byte	15                              // DW_TAG_pointer_type
	.byte	0                               // DW_CHILDREN_no
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	3                               // Abbreviation Code
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
	.byte	4                               // Abbreviation Code
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
	.byte	5                               // Abbreviation Code
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
	.byte	6                               // Abbreviation Code
	.byte	11                              // DW_TAG_lexical_block
	.byte	1                               // DW_CHILDREN_yes
	.byte	17                              // DW_AT_low_pc
	.byte	1                               // DW_FORM_addr
	.byte	18                              // DW_AT_high_pc
	.byte	6                               // DW_FORM_data4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	7                               // Abbreviation Code
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
	.byte	8                               // Abbreviation Code
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
	.byte	9                               // Abbreviation Code
	.byte	15                              // DW_TAG_pointer_type
	.byte	0                               // DW_CHILDREN_no
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	10                              // Abbreviation Code
	.byte	38                              // DW_TAG_const_type
	.byte	0                               // DW_CHILDREN_no
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	11                              // Abbreviation Code
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
	.byte	12                              // Abbreviation Code
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
	.byte	13                              // Abbreviation Code
	.byte	52                              // DW_TAG_variable
	.byte	0                               // DW_CHILDREN_no
	.byte	2                               // DW_AT_location
	.byte	24                              // DW_FORM_exprloc
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.ascii	"\210\001"                      // DW_AT_alignment
	.byte	15                              // DW_FORM_udata
	.byte	58                              // DW_AT_decl_file
	.byte	11                              // DW_FORM_data1
	.byte	59                              // DW_AT_decl_line
	.byte	11                              // DW_FORM_data1
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	14                              // Abbreviation Code
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
	.byte	15                              // Abbreviation Code
	.byte	5                               // DW_TAG_formal_parameter
	.byte	0                               // DW_CHILDREN_no
	.byte	49                              // DW_AT_abstract_origin
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	16                              // Abbreviation Code
	.byte	5                               // DW_TAG_formal_parameter
	.byte	0                               // DW_CHILDREN_no
	.byte	2                               // DW_AT_location
	.byte	24                              // DW_FORM_exprloc
	.byte	49                              // DW_AT_abstract_origin
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	17                              // Abbreviation Code
	.byte	5                               // DW_TAG_formal_parameter
	.byte	0                               // DW_CHILDREN_no
	.byte	28                              // DW_AT_const_value
	.byte	15                              // DW_FORM_udata
	.byte	49                              // DW_AT_abstract_origin
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	18                              // Abbreviation Code
	.byte	1                               // DW_TAG_array_type
	.byte	1                               // DW_CHILDREN_yes
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	19                              // Abbreviation Code
	.byte	33                              // DW_TAG_subrange_type
	.byte	0                               // DW_CHILDREN_no
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	55                              // DW_AT_count
	.byte	11                              // DW_FORM_data1
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	20                              // Abbreviation Code
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
	.byte	0                               // EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.long	.Ldebug_info_end0-.Ldebug_info_start0 // Length of Unit
.Ldebug_info_start0:
	.short	4                               // DWARF version number
	.long	.debug_abbrev                   // Offset Into Abbrev. Section
	.byte	4                               // Address Size (in bytes)
	.byte	1                               // Abbrev [1] 0xb:0x140 DW_TAG_compile_unit
	.long	.Linfo_string0                  // DW_AT_producer
	.short	12                              // DW_AT_language
	.long	.Linfo_string1                  // DW_AT_name
	.long	.Lline_table_start0             // DW_AT_stmt_list
	.long	.Linfo_string2                  // DW_AT_comp_dir
	.long	0                               // DW_AT_low_pc
	.long	.Ldebug_ranges0                 // DW_AT_ranges
	.byte	2                               // Abbrev [2] 0x26:0x1 DW_TAG_pointer_type
	.byte	3                               // Abbrev [3] 0x27:0x67 DW_TAG_subprogram
	.long	.Lfunc_begin0                   // DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       // DW_AT_high_pc
	.byte	1                               // DW_AT_frame_base
	.byte	102
                                        // DW_AT_GNU_all_call_sites
	.long	.Linfo_string8                  // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	10                              // DW_AT_decl_line
                                        // DW_AT_prototyped
                                        // DW_AT_external
	.byte	4                               // Abbrev [4] 0x38:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc0                    // DW_AT_location
	.long	.Linfo_string11                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	10                              // DW_AT_decl_line
	.long	190                             // DW_AT_type
	.byte	5                               // Abbrev [5] 0x47:0xf DW_TAG_variable
	.long	.Ldebug_loc1                    // DW_AT_location
	.long	.Linfo_string12                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	12                              // DW_AT_decl_line
	.long	190                             // DW_AT_type
	.byte	5                               // Abbrev [5] 0x56:0xf DW_TAG_variable
	.long	.Ldebug_loc2                    // DW_AT_location
	.long	.Linfo_string13                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	14                              // DW_AT_decl_line
	.long	190                             // DW_AT_type
	.byte	5                               // Abbrev [5] 0x65:0xf DW_TAG_variable
	.long	.Ldebug_loc4                    // DW_AT_location
	.long	.Linfo_string14                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	27                              // DW_AT_decl_line
	.long	190                             // DW_AT_type
	.byte	6                               // Abbrev [6] 0x74:0x19 DW_TAG_lexical_block
	.long	.Ltmp2                          // DW_AT_low_pc
	.long	.Ltmp5-.Ltmp2                   // DW_AT_high_pc
	.byte	5                               // Abbrev [5] 0x7d:0xf DW_TAG_variable
	.long	.Ldebug_loc3                    // DW_AT_location
	.long	.Linfo_string14                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	18                              // DW_AT_decl_line
	.long	190                             // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	7                               // Abbrev [7] 0x8e:0x2a DW_TAG_subprogram
	.long	.Linfo_string3                  // DW_AT_name
	.byte	2                               // DW_AT_decl_file
	.byte	60                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	.byte	1                               // DW_AT_inline
	.byte	8                               // Abbrev [8] 0x96:0xb DW_TAG_formal_parameter
	.long	.Linfo_string4                  // DW_AT_name
	.byte	2                               // DW_AT_decl_file
	.byte	60                              // DW_AT_decl_line
	.long	184                             // DW_AT_type
	.byte	8                               // Abbrev [8] 0xa1:0xb DW_TAG_formal_parameter
	.long	.Linfo_string5                  // DW_AT_name
	.byte	2                               // DW_AT_decl_file
	.byte	60                              // DW_AT_decl_line
	.long	38                              // DW_AT_type
	.byte	8                               // Abbrev [8] 0xac:0xb DW_TAG_formal_parameter
	.long	.Linfo_string6                  // DW_AT_name
	.byte	2                               // DW_AT_decl_file
	.byte	60                              // DW_AT_decl_line
	.long	190                             // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	9                               // Abbrev [9] 0xb8:0x5 DW_TAG_pointer_type
	.long	189                             // DW_AT_type
	.byte	10                              // Abbrev [10] 0xbd:0x1 DW_TAG_const_type
	.byte	11                              // Abbrev [11] 0xbe:0x7 DW_TAG_base_type
	.long	.Linfo_string7                  // DW_AT_name
	.byte	7                               // DW_AT_encoding
	.byte	4                               // DW_AT_byte_size
	.byte	12                              // Abbrev [12] 0xc5:0x6b DW_TAG_subprogram
	.long	.Lfunc_begin1                   // DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1       // DW_AT_high_pc
	.byte	1                               // DW_AT_frame_base
	.byte	102
                                        // DW_AT_GNU_all_call_sites
	.long	.Linfo_string9                  // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	38                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	.long	304                             // DW_AT_type
                                        // DW_AT_external
	.byte	13                              // Abbrev [13] 0xda:0xf DW_TAG_variable
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	0
	.long	.Linfo_string15                 // DW_AT_name
	.byte	8                               // DW_AT_alignment
	.byte	1                               // DW_AT_decl_file
	.byte	39                              // DW_AT_decl_line
	.long	311                             // DW_AT_type
	.byte	14                              // Abbrev [14] 0xe9:0x23 DW_TAG_inlined_subroutine
	.long	142                             // DW_AT_abstract_origin
	.long	.Ltmp14                         // DW_AT_low_pc
	.long	.Ltmp15-.Ltmp14                 // DW_AT_high_pc
	.byte	1                               // DW_AT_call_file
	.byte	40                              // DW_AT_call_line
	.byte	5                               // DW_AT_call_column
	.byte	15                              // Abbrev [15] 0xf9:0x5 DW_TAG_formal_parameter
	.long	150                             // DW_AT_abstract_origin
	.byte	16                              // Abbrev [16] 0xfe:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	81
	.long	161                             // DW_AT_abstract_origin
	.byte	17                              // Abbrev [17] 0x105:0x6 DW_TAG_formal_parameter
	.byte	8                               // DW_AT_const_value
	.long	172                             // DW_AT_abstract_origin
	.byte	0                               // End Of Children Mark
	.byte	14                              // Abbrev [14] 0x10c:0x23 DW_TAG_inlined_subroutine
	.long	142                             // DW_AT_abstract_origin
	.long	.Ltmp17                         // DW_AT_low_pc
	.long	.Ltmp18-.Ltmp17                 // DW_AT_high_pc
	.byte	1                               // DW_AT_call_file
	.byte	44                              // DW_AT_call_line
	.byte	5                               // DW_AT_call_column
	.byte	15                              // Abbrev [15] 0x11c:0x5 DW_TAG_formal_parameter
	.long	150                             // DW_AT_abstract_origin
	.byte	16                              // Abbrev [16] 0x121:0x7 DW_TAG_formal_parameter
	.byte	1                               // DW_AT_location
	.byte	81
	.long	161                             // DW_AT_abstract_origin
	.byte	17                              // Abbrev [17] 0x128:0x6 DW_TAG_formal_parameter
	.byte	8                               // DW_AT_const_value
	.long	172                             // DW_AT_abstract_origin
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
	.byte	11                              // Abbrev [11] 0x130:0x7 DW_TAG_base_type
	.long	.Linfo_string10                 // DW_AT_name
	.byte	5                               // DW_AT_encoding
	.byte	4                               // DW_AT_byte_size
	.byte	18                              // Abbrev [18] 0x137:0xc DW_TAG_array_type
	.long	190                             // DW_AT_type
	.byte	19                              // Abbrev [19] 0x13c:0x6 DW_TAG_subrange_type
	.long	323                             // DW_AT_type
	.byte	2                               // DW_AT_count
	.byte	0                               // End Of Children Mark
	.byte	20                              // Abbrev [20] 0x143:0x7 DW_TAG_base_type
	.long	.Linfo_string16                 // DW_AT_name
	.byte	8                               // DW_AT_byte_size
	.byte	7                               // DW_AT_encoding
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
	.asciz	"dpu/task2.c"                   // string offset=106
.Linfo_string2:
	.asciz	"/mnt/d/Upmen/uPIMulator/python_cpp/uPIMulator_frontend/benchmark/TEST1" // string offset=118
.Linfo_string3:
	.asciz	"mram_write"                    // string offset=189
.Linfo_string4:
	.asciz	"from"                          // string offset=200
.Linfo_string5:
	.asciz	"to"                            // string offset=205
.Linfo_string6:
	.asciz	"nb_of_bytes"                   // string offset=208
.Linfo_string7:
	.asciz	"unsigned int"                  // string offset=220
.Linfo_string8:
	.asciz	"load_prg_memory"               // string offset=233
.Linfo_string9:
	.asciz	"main"                          // string offset=249
.Linfo_string10:
	.asciz	"int"                           // string offset=254
.Linfo_string11:
	.asciz	"size_text"                     // string offset=258
.Linfo_string12:
	.asciz	"temp"                          // string offset=268
.Linfo_string13:
	.asciz	"off"                           // string offset=273
.Linfo_string14:
	.asciz	"ra"                            // string offset=277
.Linfo_string15:
	.asciz	"a"                             // string offset=280
.Linfo_string16:
	.asciz	"__ARRAY_SIZE_TYPE__"           // string offset=282
	.addrsig
	.section	.debug_line,"",@progbits
.Lline_table_start0:
