	.text
	.file	"task.c"
	.file	1 "/root" "upmem-2021.3.0-Linux-x86_64/bin/../share/upmem/include/stdlib/stdint.h"
	.file	2 "/root/uPIMulator_frontend/benchmark/TEST1" "dpu/task.c"
	.section	.text.loop,"ax",@progbits
	.globl	loop                            // -- Begin function loop
	.type	loop,@function
loop:                                   // @loop
.Lfunc_begin0:
	.loc	2 13 0                          // dpu/task.c:13:0
	.cfi_sections .debug_frame
	.cfi_startproc
// %bb.0:
	.cfi_def_cfa_offset 0
	//DEBUG_VALUE: loop:a <- [DW_OP_plus_uconst 287, DW_OP_stack_value] undef
	move r0, 10
.Ltmp0:
	.loc	2 18 5 prologue_end             // dpu/task.c:18:5
	jump r23
.Ltmp1:
.Lfunc_end0:
	.size	loop, .Lfunc_end0-loop
	.cfi_endproc
	.section	.stack_sizes,"o",@progbits,.text.loop
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.loop,"ax",@progbits
                                        // -- End function
	.section	.text.main,"ax",@progbits
	.globl	main                            // -- Begin function main
	.type	main,@function
main:                                   // @main
.Lfunc_begin1:
	.loc	2 21 0                          // dpu/task.c:21:0
	.cfi_startproc
// %bb.0:
	.cfi_def_cfa_offset 0
	//DEBUG_VALUE: main:a <- undef
	.loc	2 23 22 prologue_end            // dpu/task.c:23:22
	move r0, nb_loop
	move r1, 255
	add r2, id8, __sw_cache_buffer
	ldma r2, r0, 0
	and r3, r0, 7
	add r2, r2, r3
	sb r2, 0, r1
	sdma r2, r0, 0
	.loc	2 27 23                         // dpu/task.c:27:23
	sw r22, 0, 10
.Ltmp2:
	//DEBUG_VALUE: mram_write:nb_of_bytes <- 8
	.file	3 "/root" "upmem-2021.3.0-Linux-x86_64/bin/../share/upmem/include/syslib/mram.h"
	.loc	3 53 24                         // upmem-2021.3.0-Linux-x86_64/bin/../share/upmem/include/syslib/mram.h:53:24
	move r1, __sys_used_mram_end
	add r2, r22, 0
.Ltmp3:
	//DEBUG_VALUE: mram_write:from <- $r22
	.loc	3 0 24 is_stmt 0                // upmem-2021.3.0-Linux-x86_64/bin/../share/upmem/include/syslib/mram.h:0:24
	move r0, 0
	.loc	3 53 24                         // upmem-2021.3.0-Linux-x86_64/bin/../share/upmem/include/syslib/mram.h:53:24
	sdma r2, r1, 0
.Ltmp4:
	.loc	2 31 5 is_stmt 1                // dpu/task.c:31:5
	jump r23
.Ltmp5:
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
	.section	.stack_sizes,"o",@progbits,.text.main
	.long	.Lfunc_begin1
	.byte	8
	.section	.text.main,"ax",@progbits
                                        // -- End function
	.type	nb_loop,@object                 // @nb_loop
	.section	.mram,"aw",@progbits
	.globl	nb_loop
	.p2align	3
nb_loop:
	.asciz	"\003\000\000\000\000\000\000"
	.size	nb_loop, 8

	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.long	-1
	.long	.Lfunc_begin1                   //   base address
	.long	.Ltmp3-.Lfunc_begin1
	.long	.Lfunc_end1-.Lfunc_begin1
	.short	1                               // Loc expr size
	.byte	102                             // DW_OP_reg22
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
	.ascii	"\210\001"                      // DW_AT_alignment
	.byte	15                              // DW_FORM_udata
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
	.byte	6                               // Abbreviation Code
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
	.byte	7                               // Abbreviation Code
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
	.byte	8                               // Abbreviation Code
	.byte	15                              // DW_TAG_pointer_type
	.byte	0                               // DW_CHILDREN_no
	.byte	73                              // DW_AT_type
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	9                               // Abbreviation Code
	.byte	15                              // DW_TAG_pointer_type
	.byte	0                               // DW_CHILDREN_no
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	10                              // Abbreviation Code
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
	.byte	11                              // Abbreviation Code
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
	.byte	12                              // Abbreviation Code
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
	.byte	13                              // Abbreviation Code
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
	.byte	14                              // Abbreviation Code
	.byte	38                              // DW_TAG_const_type
	.byte	0                               // DW_CHILDREN_no
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	15                              // Abbreviation Code
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
	.byte	16                              // Abbreviation Code
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
	.byte	17                              // Abbreviation Code
	.byte	5                               // DW_TAG_formal_parameter
	.byte	0                               // DW_CHILDREN_no
	.byte	2                               // DW_AT_location
	.byte	23                              // DW_FORM_sec_offset
	.byte	49                              // DW_AT_abstract_origin
	.byte	19                              // DW_FORM_ref4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	18                              // Abbreviation Code
	.byte	5                               // DW_TAG_formal_parameter
	.byte	0                               // DW_CHILDREN_no
	.byte	28                              // DW_AT_const_value
	.byte	15                              // DW_FORM_udata
	.byte	49                              // DW_AT_abstract_origin
	.byte	19                              // DW_FORM_ref4
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
	.byte	1                               // Abbrev [1] 0xb:0x11d DW_TAG_compile_unit
	.long	.Linfo_string0                  // DW_AT_producer
	.short	12                              // DW_AT_language
	.long	.Linfo_string1                  // DW_AT_name
	.long	.Lline_table_start0             // DW_AT_stmt_list
	.long	.Linfo_string2                  // DW_AT_comp_dir
	.long	0                               // DW_AT_low_pc
	.long	.Ldebug_ranges0                 // DW_AT_ranges
	.byte	2                               // Abbrev [2] 0x26:0x12 DW_TAG_variable
	.long	.Linfo_string3                  // DW_AT_name
	.long	56                              // DW_AT_type
                                        // DW_AT_external
	.byte	2                               // DW_AT_decl_file
	.byte	11                              // DW_AT_decl_line
	.byte	8                               // DW_AT_alignment
	.byte	5                               // DW_AT_location
	.byte	3
	.long	nb_loop
	.byte	3                               // Abbrev [3] 0x38:0xc DW_TAG_array_type
	.long	68                              // DW_AT_type
	.byte	4                               // Abbrev [4] 0x3d:0x6 DW_TAG_subrange_type
	.long	86                              // DW_AT_type
	.byte	8                               // DW_AT_count
	.byte	0                               // End Of Children Mark
	.byte	5                               // Abbrev [5] 0x44:0xb DW_TAG_typedef
	.long	79                              // DW_AT_type
	.long	.Linfo_string5                  // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	40                              // DW_AT_decl_line
	.byte	6                               // Abbrev [6] 0x4f:0x7 DW_TAG_base_type
	.long	.Linfo_string4                  // DW_AT_name
	.byte	8                               // DW_AT_encoding
	.byte	1                               // DW_AT_byte_size
	.byte	7                               // Abbrev [7] 0x56:0x7 DW_TAG_base_type
	.long	.Linfo_string6                  // DW_AT_name
	.byte	8                               // DW_AT_byte_size
	.byte	7                               // DW_AT_encoding
	.byte	8                               // Abbrev [8] 0x5d:0x5 DW_TAG_pointer_type
	.long	98                              // DW_AT_type
	.byte	5                               // Abbrev [5] 0x62:0xb DW_TAG_typedef
	.long	109                             // DW_AT_type
	.long	.Linfo_string8                  // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	29                              // DW_AT_decl_line
	.byte	6                               // Abbrev [6] 0x6d:0x7 DW_TAG_base_type
	.long	.Linfo_string7                  // DW_AT_name
	.byte	5                               // DW_AT_encoding
	.byte	4                               // DW_AT_byte_size
	.byte	9                               // Abbrev [9] 0x74:0x1 DW_TAG_pointer_type
	.byte	5                               // Abbrev [5] 0x75:0xb DW_TAG_typedef
	.long	128                             // DW_AT_type
	.long	.Linfo_string10                 // DW_AT_name
	.byte	1                               // DW_AT_decl_file
	.byte	48                              // DW_AT_decl_line
	.byte	6                               // Abbrev [6] 0x80:0x7 DW_TAG_base_type
	.long	.Linfo_string9                  // DW_AT_name
	.byte	7                               // DW_AT_encoding
	.byte	4                               // DW_AT_byte_size
	.byte	10                              // Abbrev [10] 0x87:0x21 DW_TAG_subprogram
	.long	.Lfunc_begin0                   // DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       // DW_AT_high_pc
	.byte	1                               // DW_AT_frame_base
	.byte	102
                                        // DW_AT_GNU_all_call_sites
	.long	.Linfo_string15                 // DW_AT_name
	.byte	2                               // DW_AT_decl_file
	.byte	13                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	.long	98                              // DW_AT_type
                                        // DW_AT_external
	.byte	11                              // Abbrev [11] 0x9c:0xb DW_TAG_variable
	.long	.Linfo_string17                 // DW_AT_name
	.byte	2                               // DW_AT_decl_file
	.byte	14                              // DW_AT_decl_line
	.long	109                             // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	12                              // Abbrev [12] 0xa8:0x2a DW_TAG_subprogram
	.long	.Linfo_string11                 // DW_AT_name
	.byte	3                               // DW_AT_decl_file
	.byte	51                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	.byte	1                               // DW_AT_inline
	.byte	13                              // Abbrev [13] 0xb0:0xb DW_TAG_formal_parameter
	.long	.Linfo_string12                 // DW_AT_name
	.byte	3                               // DW_AT_decl_file
	.byte	51                              // DW_AT_decl_line
	.long	210                             // DW_AT_type
	.byte	13                              // Abbrev [13] 0xbb:0xb DW_TAG_formal_parameter
	.long	.Linfo_string13                 // DW_AT_name
	.byte	3                               // DW_AT_decl_file
	.byte	51                              // DW_AT_decl_line
	.long	116                             // DW_AT_type
	.byte	13                              // Abbrev [13] 0xc6:0xb DW_TAG_formal_parameter
	.long	.Linfo_string14                 // DW_AT_name
	.byte	3                               // DW_AT_decl_file
	.byte	51                              // DW_AT_decl_line
	.long	128                             // DW_AT_type
	.byte	0                               // End Of Children Mark
	.byte	8                               // Abbrev [8] 0xd2:0x5 DW_TAG_pointer_type
	.long	215                             // DW_AT_type
	.byte	14                              // Abbrev [14] 0xd7:0x1 DW_TAG_const_type
	.byte	10                              // Abbrev [10] 0xd8:0x4f DW_TAG_subprogram
	.long	.Lfunc_begin1                   // DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1       // DW_AT_high_pc
	.byte	1                               // DW_AT_frame_base
	.byte	102
                                        // DW_AT_GNU_all_call_sites
	.long	.Linfo_string16                 // DW_AT_name
	.byte	2                               // DW_AT_decl_file
	.byte	21                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	.long	109                             // DW_AT_type
                                        // DW_AT_external
	.byte	15                              // Abbrev [15] 0xed:0xe DW_TAG_variable
	.byte	2                               // DW_AT_location
	.byte	145
	.byte	0
	.long	.Linfo_string18                 // DW_AT_name
	.byte	2                               // DW_AT_decl_file
	.byte	26                              // DW_AT_decl_line
	.long	56                              // DW_AT_type
	.byte	11                              // Abbrev [11] 0xfb:0xb DW_TAG_variable
	.long	.Linfo_string17                 // DW_AT_name
	.byte	2                               // DW_AT_decl_file
	.byte	22                              // DW_AT_decl_line
	.long	117                             // DW_AT_type
	.byte	16                              // Abbrev [16] 0x106:0x20 DW_TAG_inlined_subroutine
	.long	168                             // DW_AT_abstract_origin
	.long	.Ltmp2                          // DW_AT_low_pc
	.long	.Ltmp4-.Ltmp2                   // DW_AT_high_pc
	.byte	2                               // DW_AT_call_file
	.byte	29                              // DW_AT_call_line
	.byte	5                               // DW_AT_call_column
	.byte	17                              // Abbrev [17] 0x116:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc0                    // DW_AT_location
	.long	176                             // DW_AT_abstract_origin
	.byte	18                              // Abbrev [18] 0x11f:0x6 DW_TAG_formal_parameter
	.byte	8                               // DW_AT_const_value
	.long	198                             // DW_AT_abstract_origin
	.byte	0                               // End Of Children Mark
	.byte	0                               // End Of Children Mark
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
	.asciz	"clang version 12.0.0 (https://github.com/upmem/llvm-project.git d36425841d9a4d1420b7aa155675f6ae8bcf9f08)" // string offset=0
.Linfo_string1:
	.asciz	"dpu/task.c"                    // string offset=106
.Linfo_string2:
	.asciz	"/root/uPIMulator_frontend/benchmark/TEST1" // string offset=117
.Linfo_string3:
	.asciz	"nb_loop"                       // string offset=159
.Linfo_string4:
	.asciz	"unsigned char"                 // string offset=167
.Linfo_string5:
	.asciz	"uint8_t"                       // string offset=181
.Linfo_string6:
	.asciz	"__ARRAY_SIZE_TYPE__"           // string offset=189
.Linfo_string7:
	.asciz	"int"                           // string offset=209
.Linfo_string8:
	.asciz	"int32_t"                       // string offset=213
.Linfo_string9:
	.asciz	"unsigned int"                  // string offset=221
.Linfo_string10:
	.asciz	"uint32_t"                      // string offset=234
.Linfo_string11:
	.asciz	"mram_write"                    // string offset=243
.Linfo_string12:
	.asciz	"from"                          // string offset=254
.Linfo_string13:
	.asciz	"to"                            // string offset=259
.Linfo_string14:
	.asciz	"nb_of_bytes"                   // string offset=262
.Linfo_string15:
	.asciz	"loop"                          // string offset=274
.Linfo_string16:
	.asciz	"main"                          // string offset=279
.Linfo_string17:
	.asciz	"a"                             // string offset=284
.Linfo_string18:
	.asciz	"buffer"                        // string offset=286
	.addrsig
	.addrsig_sym nb_loop
	.addrsig_sym __sys_used_mram_end
	.section	.debug_line,"",@progbits
.Lline_table_start0:
