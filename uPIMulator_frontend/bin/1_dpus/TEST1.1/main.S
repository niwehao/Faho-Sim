	$text,
	$file,	"crt0.c"
	$file,	1 "/root" "uPIMulator_frontend/sdk/stdlib/stdint.h"
	$file,	2 "/root" "uPIMulator_frontend/sdk/misc/crt0.c"
	$file,	3 "/root" "uPIMulator_frontend/sdk/syslib/dpuruntime.h"
	$section,	%text, __bootstrap,"ax",@progbits
	$globl,	__bootstrap                     //  -  -  Begin function __bootstrap
	$type,	__bootstrap,@function
__bootstrap:                            // @__bootstrap
crt0..Lfunc_begin0:
	$loc,	2 33 0                          // uPIMulator_frontend/sdk/misc/crt0.c:33:0
	$cfi_sections, %debug_frame
	$cfi_startproc,
// %bb.0:
	$loc,	2 35 5 prologue_end             // uPIMulator_frontend/sdk/misc/crt0.c:35:5
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
crt0..Ltmp2:
crt0..Lfunc_end0:
	$size,	__bootstrap, crt0..Lfunc_end0 - __bootstrap
	$cfi_endproc,
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

	$section,	%debug_abbrev,"",@progbits
	$byte,	1                               // Abbreviation Code
	$byte,	17                              // DW_TAG_compile_unit
	$byte,	1                               // DW_CHILDREN_yes
	$byte,	37                              // DW_AT_producer
	$byte,	14                              // DW_FORM_strp
	$byte,	19                              // DW_AT_language
	$byte,	5                               // DW_FORM_data2
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	16                              // DW_AT_stmt_list
	$byte,	23                              // DW_FORM_sec_offset
	$byte,	27                              // DW_AT_comp_dir
	$byte,	14                              // DW_FORM_strp
	$byte,	17                              // DW_AT_low_pc
	$byte,	1                               // DW_FORM_addr
	$byte,	18                              // DW_AT_high_pc
	$byte,	6                               // DW_FORM_data4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	2                               // Abbreviation Code
	$byte,	52                              // DW_TAG_variable
	$byte,	0                               // DW_CHILDREN_no
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	63                              // DW_AT_external
	$byte,	25                              // DW_FORM_flag_present
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	2                               // DW_AT_location
	$byte,	24                              // DW_FORM_exprloc
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	3                               // Abbreviation Code
	$byte,	22                              // DW_TAG_typedef
	$byte,	0                               // DW_CHILDREN_no
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	4                               // Abbreviation Code
	$byte,	36                              // DW_TAG_base_type
	$byte,	0                               // DW_CHILDREN_no
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	62                              // DW_AT_encoding
	$byte,	11                              // DW_FORM_data1
	$byte,	11                              // DW_AT_byte_size
	$byte,	11                              // DW_FORM_data1
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	5                               // Abbreviation Code
	$byte,	52                              // DW_TAG_variable
	$byte,	0                               // DW_CHILDREN_no
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	63                              // DW_AT_external
	$byte,	25                              // DW_FORM_flag_present
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$ascii,	"\210\001"                      // DW_AT_alignment
	$byte,	15                              // DW_FORM_udata
	$byte,	2                               // DW_AT_location
	$byte,	24                              // DW_FORM_exprloc
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	6                               // Abbreviation Code
	$byte,	1                               // DW_TAG_array_type
	$byte,	1                               // DW_CHILDREN_yes
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	7                               // Abbreviation Code
	$byte,	33                              // DW_TAG_subrange_type
	$byte,	0                               // DW_CHILDREN_no
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	55                              // DW_AT_count
	$byte,	11                              // DW_FORM_data1
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	8                               // Abbreviation Code
	$byte,	19                              // DW_TAG_structure_type
	$byte,	1                               // DW_CHILDREN_yes
	$byte,	11                              // DW_AT_byte_size
	$byte,	11                              // DW_FORM_data1
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	9                               // Abbreviation Code
	$byte,	13                              // DW_TAG_member
	$byte,	0                               // DW_CHILDREN_no
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	56                              // DW_AT_data_member_location
	$byte,	11                              // DW_FORM_data1
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	10                              // Abbreviation Code
	$byte,	36                              // DW_TAG_base_type
	$byte,	0                               // DW_CHILDREN_no
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	11                              // DW_AT_byte_size
	$byte,	11                              // DW_FORM_data1
	$byte,	62                              // DW_AT_encoding
	$byte,	11                              // DW_FORM_data1
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	11                              // Abbreviation Code
	$byte,	38                              // DW_TAG_const_type
	$byte,	0                               // DW_CHILDREN_no
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	12                              // Abbreviation Code
	$byte,	53                              // DW_TAG_volatile_type
	$byte,	0                               // DW_CHILDREN_no
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	13                              // Abbreviation Code
	$byte,	46                              // DW_TAG_subprogram
	$byte,	0                               // DW_CHILDREN_no
	$byte,	17                              // DW_AT_low_pc
	$byte,	1                               // DW_FORM_addr
	$byte,	18                              // DW_AT_high_pc
	$byte,	6                               // DW_FORM_data4
	$byte,	64                              // DW_AT_frame_base
	$byte,	24                              // DW_FORM_exprloc
	$ascii,	"\227B"                         // DW_AT_GNU_all_call_sites
	$byte,	25                              // DW_FORM_flag_present
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	63                              // DW_AT_external
	$byte,	25                              // DW_FORM_flag_present
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	0                               // EOM(3)
	$section,	%debug_info,"",@progbits
crt0..Lcu_begin0:
	$long,	crt0..Ldebug_info_end0 - crt0..Ldebug_info_start0 // Length of Unit
crt0..Ldebug_info_start0:
	$short,	4                               // DWARF version number
	$long,	%debug_abbrev                   // Offset Into Abbrev. Section
	$byte,	4                               // Address Size (in bytes)
	$byte,	1                               // Abbrev [1] 0xb:0x13b DW_TAG_compile_unit
	$long,	crt0..Linfo_string0                  // DW_AT_producer
	$short,	12                              // DW_AT_language
	$long,	crt0..Linfo_string1                  // DW_AT_name
	$long,	crt0..Lline_table_start0             // DW_AT_stmt_list
	$long,	crt0..Linfo_string2                  // DW_AT_comp_dir
	$long,	crt0..Lfunc_begin0                   // DW_AT_low_pc
	$long,	crt0..Lfunc_end0 - crt0..Lfunc_begin0       // DW_AT_high_pc
	$byte,	2                               // Abbrev [2] 0x26:0x11 DW_TAG_variable
	$long,	crt0..Linfo_string3                  // DW_AT_name
	$long,	55                              // DW_AT_type
                                        // DW_AT_external
	$byte,	2                               // DW_AT_decl_file
	$byte,	13                              // DW_AT_decl_line
	$byte,	5                               // DW_AT_location
	$byte,	3
	$long,	__sys_null_pointer
	$byte,	3                               // Abbrev [3] 0x37:0xb DW_TAG_typedef
	$long,	66                              // DW_AT_type
	$long,	crt0..Linfo_string5                  // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	53                              // DW_AT_decl_line
	$byte,	4                               // Abbrev [4] 0x42:0x7 DW_TAG_base_type
	$long,	crt0..Linfo_string4                  // DW_AT_name
	$byte,	7                               // DW_AT_encoding
	$byte,	8                               // DW_AT_byte_size
	$byte,	5                               // Abbrev [5] 0x49:0x12 DW_TAG_variable
	$long,	crt0..Linfo_string6                  // DW_AT_name
	$long,	91                              // DW_AT_type
                                        // DW_AT_external
	$byte,	2                               // DW_AT_decl_file
	$byte,	26                              // DW_AT_decl_line
	$byte,	8                               // DW_AT_alignment
	$byte,	5                               // DW_AT_location
	$byte,	3
	$long,	__sys_thread_stack_table_ptr
	$byte,	6                               // Abbrev [6] 0x5b:0xc DW_TAG_array_type
	$long,	103                             // DW_AT_type
	$byte,	7                               // Abbrev [7] 0x60:0x6 DW_TAG_subrange_type
	$long,	161                             // DW_AT_type
	$byte,	24                              // DW_AT_count
	$byte,	0                               // End Of Children Mark
	$byte,	3                               // Abbrev [3] 0x67:0xb DW_TAG_typedef
	$long,	114                             // DW_AT_type
	$long,	crt0..Linfo_string11                 // DW_AT_name
	$byte,	3                               // DW_AT_decl_file
	$byte,	27                              // DW_AT_decl_line
	$byte,	8                               // Abbrev [8] 0x72:0x1d DW_TAG_structure_type
	$byte,	8                               // DW_AT_byte_size
	$byte,	3                               // DW_AT_decl_file
	$byte,	24                              // DW_AT_decl_line
	$byte,	9                               // Abbrev [9] 0x76:0xc DW_TAG_member
	$long,	crt0..Linfo_string7                  // DW_AT_name
	$long,	143                             // DW_AT_type
	$byte,	3                               // DW_AT_decl_file
	$byte,	25                              // DW_AT_decl_line
	$byte,	0                               // DW_AT_data_member_location
	$byte,	9                               // Abbrev [9] 0x82:0xc DW_TAG_member
	$long,	crt0..Linfo_string10                 // DW_AT_name
	$long,	143                             // DW_AT_type
	$byte,	3                               // DW_AT_decl_file
	$byte,	26                              // DW_AT_decl_line
	$byte,	4                               // DW_AT_data_member_location
	$byte,	0                               // End Of Children Mark
	$byte,	3                               // Abbrev [3] 0x8f:0xb DW_TAG_typedef
	$long,	154                             // DW_AT_type
	$long,	crt0..Linfo_string9                  // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	48                              // DW_AT_decl_line
	$byte,	4                               // Abbrev [4] 0x9a:0x7 DW_TAG_base_type
	$long,	crt0..Linfo_string8                  // DW_AT_name
	$byte,	7                               // DW_AT_encoding
	$byte,	4                               // DW_AT_byte_size
	$byte,	10                              // Abbrev [10] 0xa1:0x7 DW_TAG_base_type
	$long,	crt0..Linfo_string12                 // DW_AT_name
	$byte,	8                               // DW_AT_byte_size
	$byte,	7                               // DW_AT_encoding
	$byte,	5                               // Abbrev [5] 0xa8:0x12 DW_TAG_variable
	$long,	crt0..Linfo_string13                 // DW_AT_name
	$long,	186                             // DW_AT_type
                                        // DW_AT_external
	$byte,	2                               // DW_AT_decl_file
	$byte,	11                              // DW_AT_decl_line
	$byte,	8                               // DW_AT_alignment
	$byte,	5                               // DW_AT_location
	$byte,	3
	$long,	__sys_used_mram_end
	$byte,	6                               // Abbrev [6] 0xba:0xc DW_TAG_array_type
	$long,	198                             // DW_AT_type
	$byte,	7                               // Abbrev [7] 0xbf:0x6 DW_TAG_subrange_type
	$long,	161                             // DW_AT_type
	$byte,	0                               // DW_AT_count
	$byte,	0                               // End Of Children Mark
	$byte,	3                               // Abbrev [3] 0xc6:0xb DW_TAG_typedef
	$long,	209                             // DW_AT_type
	$long,	crt0..Linfo_string15                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	40                              // DW_AT_decl_line
	$byte,	4                               // Abbrev [4] 0xd1:0x7 DW_TAG_base_type
	$long,	crt0..Linfo_string14                 // DW_AT_name
	$byte,	8                               // DW_AT_encoding
	$byte,	1                               // DW_AT_byte_size
	$byte,	2                               // Abbrev [2] 0xd8:0x11 DW_TAG_variable
	$long,	crt0..Linfo_string16                 // DW_AT_name
	$long,	233                             // DW_AT_type
                                        // DW_AT_external
	$byte,	2                               // DW_AT_decl_file
	$byte,	15                              // DW_AT_decl_line
	$byte,	5                               // DW_AT_location
	$byte,	3
	$long,	thread_profiling
	$byte,	6                               // Abbrev [6] 0xe9:0xc DW_TAG_array_type
	$long,	143                             // DW_AT_type
	$byte,	7                               // Abbrev [7] 0xee:0x6 DW_TAG_subrange_type
	$long,	161                             // DW_AT_type
	$byte,	24                              // DW_AT_count
	$byte,	0                               // End Of Children Mark
	$byte,	2                               // Abbrev [2] 0xf5:0x11 DW_TAG_variable
	$long,	crt0..Linfo_string17                 // DW_AT_name
	$long,	143                             // DW_AT_type
                                        // DW_AT_external
	$byte,	2                               // DW_AT_decl_file
	$byte,	16                              // DW_AT_decl_line
	$byte,	5                               // DW_AT_location
	$byte,	3
	$long,	perfcounter_end_value
	$byte,	5                               // Abbrev [5] 0x106:0x12 DW_TAG_variable
	$long,	crt0..Linfo_string18                 // DW_AT_name
	$long,	280                             // DW_AT_type
                                        // DW_AT_external
	$byte,	2                               // DW_AT_decl_file
	$byte,	28                              // DW_AT_decl_line
	$byte,	8                               // DW_AT_alignment
	$byte,	5                               // DW_AT_location
	$byte,	3
	$long,	CLOCKS_PER_SEC
	$byte,	11                              // Abbrev [11] 0x118:0x5 DW_TAG_const_type
	$long,	285                             // DW_AT_type
	$byte,	12                              // Abbrev [12] 0x11d:0x5 DW_TAG_volatile_type
	$long,	143                             // DW_AT_type
	$byte,	5                               // Abbrev [5] 0x122:0x12 DW_TAG_variable
	$long,	crt0..Linfo_string19                 // DW_AT_name
	$long,	280                             // DW_AT_type
                                        // DW_AT_external
	$byte,	2                               // DW_AT_decl_file
	$byte,	30                              // DW_AT_decl_line
	$byte,	8                               // DW_AT_alignment
	$byte,	5                               // DW_AT_location
	$byte,	3
	$long,	error_storage
	$byte,	13                              // Abbrev [13] 0x134:0x11 DW_TAG_subprogram
	$long,	crt0..Lfunc_begin0                   // DW_AT_low_pc
	$long,	crt0..Lfunc_end0 - crt0..Lfunc_begin0       // DW_AT_high_pc
	$byte,	1                               // DW_AT_frame_base
	$byte,	102
                                        // DW_AT_GNU_all_call_sites
	$long,	crt0..Linfo_string20                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	32                              // DW_AT_decl_line
                                        // DW_AT_external
	$byte,	0                               // End Of Children Mark
crt0..Ldebug_info_end0:
	$section,	%debug_str,"MS",@progbits,1
crt0..Linfo_string0:
	$asciz,	"clang version 12.0.0 (https://github.com/upmem/llvm - project.git d36425841d9a4d1420b7aa155675f6ae8bcf9f08)" // string offset=0
crt0..Linfo_string1:
	$asciz,	"/root/uPIMulator_frontend/sdk/misc/crt0.c" // string offset=106
crt0..Linfo_string2:
	$asciz,	"/root/upmem_compiler"          // string offset=148
crt0..Linfo_string3:
	$asciz,	"__sys_null_pointer"            // string offset=169
crt0..Linfo_string4:
	$asciz,	"long unsigned int"             // string offset=188
crt0..Linfo_string5:
	$asciz,	"uint64_t"                      // string offset=206
crt0..Linfo_string6:
	$asciz,	"__sys_thread_stack_table_ptr"  // string offset=215
crt0..Linfo_string7:
	$asciz,	"stack_size"                    // string offset=244
crt0..Linfo_string8:
	$asciz,	"unsigned int"                  // string offset=255
crt0..Linfo_string9:
	$asciz,	"uint32_t"                      // string offset=268
crt0..Linfo_string10:
	$asciz,	"stack_ptr"                     // string offset=277
crt0..Linfo_string11:
	$asciz,	"thread_stack_t"                // string offset=287
crt0..Linfo_string12:
	$asciz,	"__ARRAY_SIZE_TYPE__"           // string offset=302
crt0..Linfo_string13:
	$asciz,	"__sys_used_mram_end"           // string offset=322
crt0..Linfo_string14:
	$asciz,	"unsigned char"                 // string offset=342
crt0..Linfo_string15:
	$asciz,	"uint8_t"                       // string offset=356
crt0..Linfo_string16:
	$asciz,	"thread_profiling"              // string offset=364
crt0..Linfo_string17:
	$asciz,	"perfcounter_end_value"         // string offset=381
crt0..Linfo_string18:
	$asciz,	"CLOCKS_PER_SEC"                // string offset=403
crt0..Linfo_string19:
	$asciz,	"error_storage"                 // string offset=418
crt0..Linfo_string20:
	$asciz,	"__bootstrap"                   // string offset=432
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
	$section,	%debug_line,"",@progbits
crt0..Lline_table_start0:
	$text,
	$file,	"memset.c"
	$file,	1 "/root" "uPIMulator_frontend/sdk/stdlib/stdint.h"
	$file,	2 "/root" "uPIMulator_frontend/sdk/stdlib/memset.c"
	$section,	%text, __memset_wram_4align,"ax",@progbits
	$globl,	__memset_wram_4align            //  -  -  Begin function __memset_wram_4align
	$type,	__memset_wram_4align,@function
__memset_wram_4align:                   // @__memset_wram_4align
memset..Lfunc_begin0:
	$loc,	2 27 0                          // uPIMulator_frontend/sdk/stdlib/memset.c:27:0
	$cfi_sections, %debug_frame
	$cfi_startproc,
// %bb.0:
	//DEBUG_VALUE: __memset_wram_4align:dest < -  $r0
	//DEBUG_VALUE: __memset_wram_4align:dest < -  $r0
	//DEBUG_VALUE: __memset_wram_4align:c < -  $r1
	//DEBUG_VALUE: __memset_wram_4align:c < -  $r1
	//DEBUG_VALUE: __memset_wram_4align:c < -  [DW_OP_constu 255, DW_OP_and, DW_OP_stack_value] $r1
	//DEBUG_VALUE: __memset_wram_4align:len < -  $r2
	//DEBUG_VALUE: __memset_wram_4align:len < -  $r2
	$cfi_def_cfa_offset, 0
	//DEBUG_VALUE: __memset_wram_4align:dest32 < -  $r0
	//DEBUG_VALUE: __memset_wram_4align:dest32 < -  $r0
	//DEBUG_VALUE: __memset_wram_4align:cccc < -  undef
	//DEBUG_VALUE: i < -  0
	$loc,	2 34 34 prologue_end            // uPIMulator_frontend/sdk/stdlib/memset.c:34:34
	$lsr , r2, r2, 2, z, memset..LBB0_3
memset..Ltmp0:
// %bb.1:
	//DEBUG_VALUE: __memset_wram_4align:c < -  [DW_OP_constu 255, DW_OP_and, DW_OP_stack_value] $r1
	//DEBUG_VALUE: __memset_wram_4align:dest32 < -  $r0
	//DEBUG_VALUE: __memset_wram_4align:dest < -  $r0
	//DEBUG_VALUE: i < -  0
	$loc,	2 0 34 is_stmt 0                // uPIMulator_frontend/sdk/stdlib/memset.c:0:34
	$and , r3, r1, 255
	$lsl_add , r1, r3, r1, 24
memset..Ltmp1:
	$lsl_add , r1, r1, r3, 8
	$lsl_add , r1, r1, r3, 16
memset..Ltmp2:
	//DEBUG_VALUE: __memset_wram_4align:cccc < -  $r1
	$move , r3, r0
memset..Ltmp3:
memset..LBB0_2:                                // =>This Inner Loop Header: Depth=1
	//DEBUG_VALUE: __memset_wram_4align:cccc < -  $r1
	//DEBUG_VALUE: __memset_wram_4align:dest32 < -  $r0
	//DEBUG_VALUE: __memset_wram_4align:dest < -  $r0
	//DEBUG_VALUE: i < -  undef
	$loc,	2 35 19 is_stmt 1               // uPIMulator_frontend/sdk/stdlib/memset.c:35:19
	$sw , r3, 0, r1
memset..Ltmp4:
	//DEBUG_VALUE: i < -  [DW_OP_plus_uconst 1, DW_OP_stack_value] undef
	$loc,	2 34 28                         // uPIMulator_frontend/sdk/stdlib/memset.c:34:28
	$add , r3, r3, 4
	$add , r2, r2,  - 1, nz, memset..LBB0_2
memset..Ltmp5:
memset..LBB0_3:
	//DEBUG_VALUE: __memset_wram_4align:dest32 < -  $r0
	//DEBUG_VALUE: __memset_wram_4align:dest < -  $r0
	$loc,	2 38 5                          // uPIMulator_frontend/sdk/stdlib/memset.c:38:5
	$jump , r23
memset..Ltmp6:
memset..Lfunc_end0:
	$size,	__memset_wram_4align, memset..Lfunc_end0 - __memset_wram_4align
	$cfi_endproc,
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
	$loc,	2 43 0                          // uPIMulator_frontend/sdk/stdlib/memset.c:43:0
	$cfi_startproc,
// %bb.0:
	//DEBUG_VALUE: memset:dest < -  $r0
	//DEBUG_VALUE: memset:dest < -  $r0
	//DEBUG_VALUE: memset:c < -  $r1
	//DEBUG_VALUE: memset:c < -  $r1
	//DEBUG_VALUE: memset:len < -  $r2
	//DEBUG_VALUE: memset:len < -  $r2
	$cfi_def_cfa_offset, 0
	//DEBUG_VALUE: memset:align < -  4
	//DEBUG_VALUE: memset:align_off_mask < -  3
	//DEBUG_VALUE: memset:d < -  $r0
	//DEBUG_VALUE: memset:align_offset < -  $r3
	$loc,	2 46 47 prologue_end            // uPIMulator_frontend/sdk/stdlib/memset.c:46:47
	$and , r3, r0, 3, z, memset..LBB1_1
memset..Ltmp7:
// %bb.2:
	//DEBUG_VALUE: memset:len < -  $r2
	//DEBUG_VALUE: memset:c < -  $r1
	//DEBUG_VALUE: memset:d < -  $r0
	//DEBUG_VALUE: memset:dest < -  $r0
	//DEBUG_VALUE: memset:align_off_mask < -  3
	//DEBUG_VALUE: memset:align < -  4
	$loc,	2 51 33                         // uPIMulator_frontend/sdk/stdlib/memset.c:51:33
	$sub , r4, 4, r3
memset..Ltmp8:
	//DEBUG_VALUE: head_len < -  $r4
	$loc,	2 52 13                         // uPIMulator_frontend/sdk/stdlib/memset.c:52:13
	$move , r3, r2
	$jgtu , r4, r2, memset..LBB1_4
memset..Ltmp9:
// %bb.3:
	//DEBUG_VALUE: head_len < -  $r4
	//DEBUG_VALUE: memset:len < -  $r2
	//DEBUG_VALUE: memset:c < -  $r1
	//DEBUG_VALUE: memset:d < -  $r0
	//DEBUG_VALUE: memset:dest < -  $r0
	//DEBUG_VALUE: memset:align_off_mask < -  3
	//DEBUG_VALUE: memset:align < -  4
	$move , r3, r4
memset..Ltmp10:
memset..LBB1_4:
	//DEBUG_VALUE: head_len < -  $r4
	//DEBUG_VALUE: memset:len < -  $r2
	//DEBUG_VALUE: memset:c < -  $r1
	//DEBUG_VALUE: memset:d < -  $r0
	//DEBUG_VALUE: memset:dest < -  $r0
	//DEBUG_VALUE: memset:align_off_mask < -  3
	//DEBUG_VALUE: memset:align < -  4
	//DEBUG_VALUE: head_len < -  $r3
	//DEBUG_VALUE: __memset_wram_1align:dest < -  $r0
	//DEBUG_VALUE: __memset_wram_1align:c < -  $r1
	//DEBUG_VALUE: __memset_wram_1align:len < -  $r3
	//DEBUG_VALUE: __memset_wram_1align:dest8 < -  $r0
	//DEBUG_VALUE: i < -  0
	$loc,	2 15 5                          // uPIMulator_frontend/sdk/stdlib/memset.c:15:5
	$jeq , r3, 0, memset..LBB1_7
memset..Ltmp11:
// %bb.5:
	//DEBUG_VALUE: __memset_wram_1align:len < -  $r3
	//DEBUG_VALUE: head_len < -  $r3
	//DEBUG_VALUE: memset:len < -  $r2
	//DEBUG_VALUE: __memset_wram_1align:c < -  $r1
	//DEBUG_VALUE: memset:c < -  $r1
	//DEBUG_VALUE: __memset_wram_1align:dest8 < -  $r0
	//DEBUG_VALUE: __memset_wram_1align:dest < -  $r0
	//DEBUG_VALUE: memset:d < -  $r0
	//DEBUG_VALUE: memset:dest < -  $r0
	//DEBUG_VALUE: i < -  0
	//DEBUG_VALUE: memset:align_off_mask < -  3
	//DEBUG_VALUE: memset:align < -  4
	$loc,	2 0 5 is_stmt 0                 // uPIMulator_frontend/sdk/stdlib/memset.c:0:5
	$move , r4, r0
	$move , r5, r3
memset..Ltmp12:
memset..LBB1_6:                                // =>This Inner Loop Header: Depth=1
	//DEBUG_VALUE: __memset_wram_1align:len < -  $r3
	//DEBUG_VALUE: head_len < -  $r3
	//DEBUG_VALUE: memset:len < -  $r2
	//DEBUG_VALUE: __memset_wram_1align:c < -  $r1
	//DEBUG_VALUE: memset:c < -  $r1
	//DEBUG_VALUE: __memset_wram_1align:dest8 < -  $r0
	//DEBUG_VALUE: __memset_wram_1align:dest < -  $r0
	//DEBUG_VALUE: memset:d < -  $r0
	//DEBUG_VALUE: memset:dest < -  $r0
	//DEBUG_VALUE: memset:align_off_mask < -  3
	//DEBUG_VALUE: memset:align < -  4
	//DEBUG_VALUE: i < -  undef
	$loc,	2 16 18 is_stmt 1               // uPIMulator_frontend/sdk/stdlib/memset.c:16:18
	$sb , r4, 0, r1
memset..Ltmp13:
	//DEBUG_VALUE: i < -  [DW_OP_plus_uconst 1, DW_OP_stack_value] undef
	$loc,	2 15 28                         // uPIMulator_frontend/sdk/stdlib/memset.c:15:28
	$add , r4, r4, 1
	$add , r5, r5,  - 1, nz, memset..LBB1_6
memset..Ltmp14:
memset..LBB1_7:
	//DEBUG_VALUE: head_len < -  $r3
	//DEBUG_VALUE: memset:len < -  $r2
	//DEBUG_VALUE: memset:c < -  $r1
	//DEBUG_VALUE: memset:d < -  $r0
	//DEBUG_VALUE: memset:dest < -  $r0
	//DEBUG_VALUE: memset:align_off_mask < -  3
	//DEBUG_VALUE: memset:align < -  4
	$loc,	2 58 13                         // uPIMulator_frontend/sdk/stdlib/memset.c:58:13
	$sub , r2, r2, r3
memset..Ltmp15:
	//DEBUG_VALUE: memset:len < -  $r2
	$loc,	2 59 11                         // uPIMulator_frontend/sdk/stdlib/memset.c:59:11
	$add , r3, r0, r3
memset..Ltmp16:
	//DEBUG_VALUE: memset:d < -  $r3
	//DEBUG_VALUE: memset:len < -  $r2
	//DEBUG_VALUE: memset:d < -  $r3
	$loc,	2 63 9                          // uPIMulator_frontend/sdk/stdlib/memset.c:63:9
	$jgeu , r2, 4, memset..LBB1_9
memset..Ltmp17:
memset..LBB1_12:
	//DEBUG_VALUE: memset:d < -  $r3
	//DEBUG_VALUE: memset:len < -  $r2
	//DEBUG_VALUE: memset:c < -  $r1
	//DEBUG_VALUE: memset:dest < -  $r0
	//DEBUG_VALUE: memset:align_off_mask < -  3
	//DEBUG_VALUE: memset:align < -  4
	//DEBUG_VALUE: memset:len < -  $r2
	//DEBUG_VALUE: memset:d < -  $r3
	$loc,	2 73 9                          // uPIMulator_frontend/sdk/stdlib/memset.c:73:9
	$jeq , r2, 0, memset..LBB1_14
memset..Ltmp18:
memset..LBB1_13:                               // =>This Inner Loop Header: Depth=1
	//DEBUG_VALUE: memset:c < -  $r1
	//DEBUG_VALUE: memset:dest < -  $r0
	//DEBUG_VALUE: memset:align_off_mask < -  3
	//DEBUG_VALUE: memset:align < -  4
	//DEBUG_VALUE: i < -  undef
	$loc,	2 16 18                         // uPIMulator_frontend/sdk/stdlib/memset.c:16:18
	$sb , r3, 0, r1
memset..Ltmp19:
	//DEBUG_VALUE: i < -  [DW_OP_plus_uconst 1, DW_OP_stack_value] undef
	$loc,	2 15 28                         // uPIMulator_frontend/sdk/stdlib/memset.c:15:28
	$add , r3, r3, 1
	$add , r2, r2,  - 1, nz, memset..LBB1_13
memset..Ltmp20:
memset..LBB1_14:
	//DEBUG_VALUE: memset:c < -  $r1
	//DEBUG_VALUE: memset:dest < -  $r0
	//DEBUG_VALUE: memset:align_off_mask < -  3
	//DEBUG_VALUE: memset:align < -  4
	$loc,	2 77 5                          // uPIMulator_frontend/sdk/stdlib/memset.c:77:5
	$jump , r23
memset..Ltmp21:
memset..LBB1_1:
	//DEBUG_VALUE: memset:len < -  $r2
	//DEBUG_VALUE: memset:c < -  $r1
	//DEBUG_VALUE: memset:d < -  $r0
	//DEBUG_VALUE: memset:dest < -  $r0
	//DEBUG_VALUE: memset:align_off_mask < -  3
	//DEBUG_VALUE: memset:align < -  4
	$loc,	2 0 0 is_stmt 0                 // uPIMulator_frontend/sdk/stdlib/memset.c:0:0
	$move , r3, r0
	//DEBUG_VALUE: memset:len < -  $r2
memset..Ltmp22:
	//DEBUG_VALUE: memset:d < -  $r3
	$loc,	2 63 9 is_stmt 1                // uPIMulator_frontend/sdk/stdlib/memset.c:63:9
	$jltu , r2, 4, memset..LBB1_12
memset..Ltmp23:
memset..LBB1_9:
	//DEBUG_VALUE: memset:d < -  $r3
	//DEBUG_VALUE: memset:len < -  $r2
	//DEBUG_VALUE: memset:c < -  $r1
	//DEBUG_VALUE: memset:dest < -  $r0
	//DEBUG_VALUE: memset:align_off_mask < -  3
	//DEBUG_VALUE: memset:align < -  4
	$loc,	2 64 31                         // uPIMulator_frontend/sdk/stdlib/memset.c:64:31
	$and , r4, r2,  - 4
memset..Ltmp24:
	//DEBUG_VALUE: __memset_wram_4align:dest32 < -  $r3
	//DEBUG_VALUE: __memset_wram_4align:len < -  [DW_OP_constu 18446744073709551612, DW_OP_and, DW_OP_stack_value] $r2
	//DEBUG_VALUE: __memset_wram_4align:c < -  $r1
	//DEBUG_VALUE: __memset_wram_4align:dest < -  $r3
	//DEBUG_VALUE: body_len < -  [DW_OP_constu 18446744073709551612, DW_OP_and, DW_OP_stack_value] $r2
	$loc,	2 31 7                          // uPIMulator_frontend/sdk/stdlib/memset.c:31:7
	$and , r5, r1, 255
memset..Ltmp25:
	//DEBUG_VALUE: __memset_wram_4align:c < -  [DW_OP_constu 255, DW_OP_and, DW_OP_stack_value] $r1
	$loc,	2 32 14                         // uPIMulator_frontend/sdk/stdlib/memset.c:32:14
	$lsl_add , r6, r5, r1, 24
	$loc,	2 32 25 is_stmt 0               // uPIMulator_frontend/sdk/stdlib/memset.c:32:25
	$lsl_add , r6, r6, r5, 8
	$loc,	2 32 37                         // uPIMulator_frontend/sdk/stdlib/memset.c:32:37
	$lsl_add , r5, r6, r5, 16
memset..Ltmp26:
	//DEBUG_VALUE: i < -  0
	//DEBUG_VALUE: __memset_wram_4align:cccc < -  $r5
	$loc,	2 34 34 is_stmt 1               // uPIMulator_frontend/sdk/stdlib/memset.c:34:34
	$lsr , r6, r2, 2
	$move , r7, r3
memset..Ltmp27:
memset..LBB1_10:                               // =>This Inner Loop Header: Depth=1
	//DEBUG_VALUE: __memset_wram_4align:cccc < -  $r5
	//DEBUG_VALUE: __memset_wram_4align:dest < -  $r3
	//DEBUG_VALUE: __memset_wram_4align:dest32 < -  $r3
	//DEBUG_VALUE: memset:d < -  $r3
	//DEBUG_VALUE: body_len < -  [DW_OP_constu 18446744073709551612, DW_OP_and, DW_OP_stack_value] $r2
	//DEBUG_VALUE: __memset_wram_4align:len < -  [DW_OP_constu 18446744073709551612, DW_OP_and, DW_OP_stack_value] $r2
	//DEBUG_VALUE: memset:len < -  $r2
	//DEBUG_VALUE: __memset_wram_4align:c < -  [DW_OP_constu 255, DW_OP_and, DW_OP_stack_value] $r1
	//DEBUG_VALUE: memset:c < -  $r1
	//DEBUG_VALUE: memset:dest < -  $r0
	//DEBUG_VALUE: memset:align_off_mask < -  3
	//DEBUG_VALUE: memset:align < -  4
	//DEBUG_VALUE: i < -  undef
	$loc,	2 35 19                         // uPIMulator_frontend/sdk/stdlib/memset.c:35:19
	$sw , r7, 0, r5
memset..Ltmp28:
	//DEBUG_VALUE: i < -  [DW_OP_plus_uconst 1, DW_OP_stack_value] undef
	$loc,	2 34 28                         // uPIMulator_frontend/sdk/stdlib/memset.c:34:28
	$add , r7, r7, 4
	$add , r6, r6,  - 1, nz, memset..LBB1_10
memset..Ltmp29:
// %bb.11:
	//DEBUG_VALUE: memset:d < -  $r3
	//DEBUG_VALUE: body_len < -  [DW_OP_constu 18446744073709551612, DW_OP_and, DW_OP_stack_value] $r2
	//DEBUG_VALUE: memset:len < -  $r2
	//DEBUG_VALUE: memset:c < -  $r1
	//DEBUG_VALUE: memset:dest < -  $r0
	//DEBUG_VALUE: memset:align_off_mask < -  3
	//DEBUG_VALUE: memset:align < -  4
	$loc,	2 68 13                         // uPIMulator_frontend/sdk/stdlib/memset.c:68:13
	$and , r2, r2, 3
memset..Ltmp30:
	//DEBUG_VALUE: memset:len < -  $r2
	$loc,	2 69 11                         // uPIMulator_frontend/sdk/stdlib/memset.c:69:11
	$add , r3, r3, r4
memset..Ltmp31:
	//DEBUG_VALUE: memset:d < -  $r3
	//DEBUG_VALUE: memset:len < -  $r2
	//DEBUG_VALUE: memset:d < -  $r3
	$loc,	2 73 9                          // uPIMulator_frontend/sdk/stdlib/memset.c:73:9
	$jneq , r2, 0, memset..LBB1_13
	$jump , memset..LBB1_14
memset..Ltmp32:
memset..Lfunc_end1:
	$size,	memset, memset..Lfunc_end1 - memset
	$cfi_endproc,
	$file,	3 "/root" "uPIMulator_frontend/sdk/stdlib/stddef.h"
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
	$loc,	2 87 0                          // uPIMulator_frontend/sdk/stdlib/memset.c:87:0
	$cfi_startproc,
// %bb.0:
	//DEBUG_VALUE: __memset_mram_8align:dest < -  $r0
	//DEBUG_VALUE: __memset_mram_8align:dest < -  $r0
	//DEBUG_VALUE: __memset_mram_8align:c < -  $r1
	//DEBUG_VALUE: __memset_mram_8align:c < -  $r1
	//DEBUG_VALUE: __memset_mram_8align:len < -  $r2
	//DEBUG_VALUE: __memset_mram_8align:len < -  $r2
	//DEBUG_VALUE: __memset_wram_4align:dest < -  undef
	//DEBUG_VALUE: __memset_wram_4align:c < -  $r1
	//DEBUG_VALUE: __memset_wram_4align:len < -  8
	$cfi_def_cfa_offset, 0
	//DEBUG_VALUE: __memset_mram_8align:cache < -  undef
	//DEBUG_VALUE: __memset_wram_4align:dest32 < -  undef
	$loc,	2 31 7 prologue_end             // uPIMulator_frontend/sdk/stdlib/memset.c:31:7
	$and , r3, r1, 255
memset..Ltmp33:
	//DEBUG_VALUE: __memset_wram_4align:c < -  [DW_OP_constu 255, DW_OP_and, DW_OP_stack_value] $r1
	$loc,	2 32 14                         // uPIMulator_frontend/sdk/stdlib/memset.c:32:14
	$lsl_add , r1, r3, r1, 24
memset..Ltmp34:
	$loc,	2 32 25 is_stmt 0               // uPIMulator_frontend/sdk/stdlib/memset.c:32:25
	$lsl_add , r1, r1, r3, 8
	$loc,	2 32 37                         // uPIMulator_frontend/sdk/stdlib/memset.c:32:37
	$lsl_add , r1, r1, r3, 16
memset..Ltmp35:
	//DEBUG_VALUE: i < -  0
	//DEBUG_VALUE: __memset_wram_4align:cccc < -  $r1
	$loc,	2 35 19 is_stmt 1               // uPIMulator_frontend/sdk/stdlib/memset.c:35:19
	$sw , r22, 0, r1
memset..Ltmp36:
	//DEBUG_VALUE: i < -  1
	$sw , r22, 4, r1
memset..Ltmp37:
	//DEBUG_VALUE: idx < -  0
	//DEBUG_VALUE: i < -  2
	$loc,	2 93 5                          // uPIMulator_frontend/sdk/stdlib/memset.c:93:5
	$jeq , r2, 0, memset..LBB2_3
memset..Ltmp38:
// %bb.1:
	//DEBUG_VALUE: __memset_mram_8align:len < -  $r2
	//DEBUG_VALUE: __memset_wram_4align:cccc < -  $r1
	//DEBUG_VALUE: __memset_mram_8align:dest < -  $r0
	//DEBUG_VALUE: i < -  2
	//DEBUG_VALUE: idx < -  0
	//DEBUG_VALUE: __memset_wram_4align:len < -  8
	$loc,	2 0 5 is_stmt 0                 // uPIMulator_frontend/sdk/stdlib/memset.c:0:5
	$move , r1, 0
memset..Ltmp39:
memset..LBB2_2:                                // =>This Inner Loop Header: Depth=1
	//DEBUG_VALUE: __memset_mram_8align:len < -  $r2
	//DEBUG_VALUE: __memset_mram_8align:dest < -  $r0
	//DEBUG_VALUE: idx < -  $r1
	//DEBUG_VALUE: mram_write:to < -  undef
	//DEBUG_VALUE: mram_write:nb_of_bytes < -  8
	$file,	4 "/root" "uPIMulator_frontend/sdk/syslib/mram.h"
	$loc,	4 53 24 is_stmt 1               // uPIMulator_frontend/sdk/syslib/mram.h:53:24
	$add , r3, r0, r1
	$add , r4, r22, 0
memset..Ltmp40:
	$loc,	2 93 43                         // uPIMulator_frontend/sdk/stdlib/memset.c:93:43
	$add , r1, r1, 8
memset..Ltmp41:
	//DEBUG_VALUE: mram_write:from < -  $r22
	//DEBUG_VALUE: idx < -  $r1
	$loc,	4 53 24                         // uPIMulator_frontend/sdk/syslib/mram.h:53:24
	$sdma , r4, r3, 0
memset..Ltmp42:
	//DEBUG_VALUE: mram_write:nb_of_bytes < -  8
	$loc,	2 93 5                          // uPIMulator_frontend/sdk/stdlib/memset.c:93:5
	$jltu , r1, r2, memset..LBB2_2
memset..Ltmp43:
memset..LBB2_3:
	//DEBUG_VALUE: __memset_mram_8align:len < -  $r2
	//DEBUG_VALUE: __memset_mram_8align:dest < -  $r0
	$loc,	2 97 5                          // uPIMulator_frontend/sdk/stdlib/memset.c:97:5
	$jump , r23
memset..Ltmp44:
memset..Lfunc_end2:
	$size,	__memset_mram_8align, memset..Lfunc_end2 - __memset_mram_8align
	$cfi_endproc,
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
	$loc,	2 102 0                         // uPIMulator_frontend/sdk/stdlib/memset.c:102:0
	$cfi_startproc,
// %bb.0:
	//DEBUG_VALUE: __memset_mram:dest < -  $r0
	//DEBUG_VALUE: __memset_mram:dest < -  $r0
	//DEBUG_VALUE: __memset_mram:c < -  $r1
	//DEBUG_VALUE: __memset_mram:c < -  $r1
	//DEBUG_VALUE: __memset_mram:len < -  $r2
	//DEBUG_VALUE: __memset_mram:len < -  $r2
	$cfi_def_cfa_offset, 0
	//DEBUG_VALUE: __memset_mram:cache < -  undef
	$loc,	2 105 68 prologue_end           // uPIMulator_frontend/sdk/stdlib/memset.c:105:68
	$and , r3, r0,  - 8
memset..Ltmp45:
	//DEBUG_VALUE: __memset_mram:d < -  $r3
	//DEBUG_VALUE: __memset_mram:align_offset < -  $r6
	$loc,	2 106 47                        // uPIMulator_frontend/sdk/stdlib/memset.c:106:47
	$and , r6, r0, 7, z, memset..LBB3_7
memset..Ltmp46:
// %bb.1:
	//DEBUG_VALUE: __memset_mram:d < -  $r3
	//DEBUG_VALUE: __memset_mram:len < -  $r2
	//DEBUG_VALUE: __memset_mram:c < -  $r1
	//DEBUG_VALUE: __memset_mram:dest < -  $r0
	$loc,	2 110 50                        // uPIMulator_frontend/sdk/stdlib/memset.c:110:50
	$sub , r5, 8, r6
memset..Ltmp47:
	//DEBUG_VALUE: head_len < -  $r5
	$loc,	2 111 13                        // uPIMulator_frontend/sdk/stdlib/memset.c:111:13
	$move , r4, r2
	$jgtu , r5, r2, memset..LBB3_3
memset..Ltmp48:
// %bb.2:
	//DEBUG_VALUE: head_len < -  $r5
	//DEBUG_VALUE: __memset_mram:d < -  $r3
	//DEBUG_VALUE: __memset_mram:len < -  $r2
	//DEBUG_VALUE: __memset_mram:c < -  $r1
	//DEBUG_VALUE: __memset_mram:dest < -  $r0
	$move , r4, r5
memset..Ltmp49:
memset..LBB3_3:
	//DEBUG_VALUE: head_len < -  $r5
	//DEBUG_VALUE: __memset_mram:d < -  $r3
	//DEBUG_VALUE: __memset_mram:len < -  $r2
	//DEBUG_VALUE: __memset_mram:c < -  $r1
	//DEBUG_VALUE: __memset_mram:dest < -  $r0
	//DEBUG_VALUE: head_len < -  $r4
	$loc,	2 0 13 is_stmt 0                // uPIMulator_frontend/sdk/stdlib/memset.c:0:13
	$add , r5, r22, 8
memset..Ltmp50:
	//DEBUG_VALUE: mram_read:nb_of_bytes < -  8
	//DEBUG_VALUE: mram_read:from < -  $r3
	$loc,	4 35 24 is_stmt 1               // uPIMulator_frontend/sdk/syslib/mram.h:35:24
	$ldma , r5, r3, 0
memset..Ltmp51:
	//DEBUG_VALUE: mram_read:to < -  [DW_OP_plus_uconst 8, DW_OP_stack_value] $r22
	//DEBUG_VALUE: i < -  0
	//DEBUG_VALUE: __memset_wram_1align:dest8 < -  undef
	//DEBUG_VALUE: __memset_wram_1align:len < -  $r4
	//DEBUG_VALUE: __memset_wram_1align:c < -  $r1
	//DEBUG_VALUE: __memset_wram_1align:dest < -  undef
	$loc,	2 15 5                          // uPIMulator_frontend/sdk/stdlib/memset.c:15:5
	$jeq , r4, 0, memset..LBB3_6
memset..Ltmp52:
// %bb.4:
	//DEBUG_VALUE: __memset_wram_1align:len < -  $r4
	//DEBUG_VALUE: head_len < -  $r4
	//DEBUG_VALUE: __memset_mram:d < -  $r3
	//DEBUG_VALUE: __memset_mram:len < -  $r2
	//DEBUG_VALUE: __memset_wram_1align:c < -  $r1
	//DEBUG_VALUE: __memset_mram:c < -  $r1
	//DEBUG_VALUE: __memset_mram:dest < -  $r0
	//DEBUG_VALUE: i < -  0
	$or , r6, r5, r6
	$move , r7, r4
memset..Ltmp53:
memset..LBB3_5:                                // =>This Inner Loop Header: Depth=1
	//DEBUG_VALUE: __memset_wram_1align:len < -  $r4
	//DEBUG_VALUE: head_len < -  $r4
	//DEBUG_VALUE: __memset_mram:d < -  $r3
	//DEBUG_VALUE: __memset_mram:len < -  $r2
	//DEBUG_VALUE: __memset_wram_1align:c < -  $r1
	//DEBUG_VALUE: __memset_mram:c < -  $r1
	//DEBUG_VALUE: __memset_mram:dest < -  $r0
	//DEBUG_VALUE: i < -  undef
	$loc,	2 16 18                         // uPIMulator_frontend/sdk/stdlib/memset.c:16:18
	$sb , r6, 0, r1
memset..Ltmp54:
	//DEBUG_VALUE: i < -  [DW_OP_plus_uconst 1, DW_OP_stack_value] undef
	$loc,	2 15 28                         // uPIMulator_frontend/sdk/stdlib/memset.c:15:28
	$add , r6, r6, 1
	$add , r7, r7,  - 1, nz, memset..LBB3_5
memset..Ltmp55:
memset..LBB3_6:
	//DEBUG_VALUE: head_len < -  $r4
	//DEBUG_VALUE: __memset_mram:d < -  $r3
	//DEBUG_VALUE: __memset_mram:len < -  $r2
	//DEBUG_VALUE: __memset_mram:c < -  $r1
	//DEBUG_VALUE: __memset_mram:dest < -  $r0
	//DEBUG_VALUE: mram_write:to < -  $r3
	//DEBUG_VALUE: mram_write:nb_of_bytes < -  8
	$loc,	4 53 24                         // uPIMulator_frontend/sdk/syslib/mram.h:53:24
	$sdma , r5, r3, 0
memset..Ltmp56:
	$loc,	2 119 13                        // uPIMulator_frontend/sdk/stdlib/memset.c:119:13
	$sub , r2, r2, r4
memset..Ltmp57:
	//DEBUG_VALUE: __memset_mram:len < -  $r2
	$loc,	2 120 11                        // uPIMulator_frontend/sdk/stdlib/memset.c:120:11
	$add , r3, r3, 8
memset..Ltmp58:
	//DEBUG_VALUE: mram_write:from < -  [DW_OP_plus_uconst 8, DW_OP_stack_value] $r22
	//DEBUG_VALUE: __memset_mram:d < -  $r3
memset..LBB3_7:
	//DEBUG_VALUE: __memset_mram:d < -  $r3
	//DEBUG_VALUE: __memset_mram:len < -  $r2
	//DEBUG_VALUE: __memset_mram:c < -  $r1
	//DEBUG_VALUE: __memset_mram:dest < -  $r0
	//DEBUG_VALUE: __memset_mram:len < -  $r2
	//DEBUG_VALUE: __memset_mram:d < -  $r3
	$loc,	2 124 9                         // uPIMulator_frontend/sdk/stdlib/memset.c:124:9
	$jltu , r2, 8, memset..LBB3_12
memset..Ltmp59:
// %bb.8:
	//DEBUG_VALUE: __memset_mram:d < -  $r3
	//DEBUG_VALUE: __memset_mram:len < -  $r2
	//DEBUG_VALUE: __memset_mram:c < -  $r1
	//DEBUG_VALUE: __memset_mram:dest < -  $r0
	$loc,	2 31 7                          // uPIMulator_frontend/sdk/stdlib/memset.c:31:7
	$and , r4, r1, 255
memset..Ltmp60:
	//DEBUG_VALUE: __memset_wram_4align:c < -  [DW_OP_constu 255, DW_OP_and, DW_OP_stack_value] $r1
	$loc,	2 32 14                         // uPIMulator_frontend/sdk/stdlib/memset.c:32:14
	$lsl_add , r5, r4, r1, 24
	$loc,	2 32 25 is_stmt 0               // uPIMulator_frontend/sdk/stdlib/memset.c:32:25
	$lsl_add , r5, r5, r4, 8
	$loc,	2 32 37                         // uPIMulator_frontend/sdk/stdlib/memset.c:32:37
	$lsl_add , r4, r5, r4, 16
memset..Ltmp61:
	//DEBUG_VALUE: i < -  0
	//DEBUG_VALUE: __memset_wram_4align:cccc < -  $r4
	$loc,	2 35 19 is_stmt 1               // uPIMulator_frontend/sdk/stdlib/memset.c:35:19
	$sw , r22, 0, r4
memset..Ltmp62:
	//DEBUG_VALUE: i < -  1
	$sw , r22, 4, r4
memset..Ltmp63:
	//DEBUG_VALUE: i < -  2
	//DEBUG_VALUE: __memset_wram_4align:dest32 < -  undef
	//DEBUG_VALUE: __memset_wram_4align:len < -  8
	//DEBUG_VALUE: __memset_wram_4align:dest < -  undef
	//DEBUG_VALUE: __memset_mram_8align:cache < -  undef
	//DEBUG_VALUE: __memset_mram_8align:c < -  $r1
	//DEBUG_VALUE: __memset_mram_8align:dest < -  $r3
	//DEBUG_VALUE: __memset_mram_8align:len < -  $r4
	//DEBUG_VALUE: body_len < -  $r4
	//DEBUG_VALUE: idx < -  0
	//DEBUG_VALUE: __memset_wram_4align:c < -  $r1
	$loc,	2 125 31                        // uPIMulator_frontend/sdk/stdlib/memset.c:125:31
	$and , r4, r2,  - 8, z, memset..LBB3_11
memset..Ltmp64:
// %bb.9:
	//DEBUG_VALUE: __memset_mram_8align:dest < -  $r3
	//DEBUG_VALUE: __memset_mram:d < -  $r3
	//DEBUG_VALUE: __memset_mram:len < -  $r2
	//DEBUG_VALUE: __memset_wram_4align:c < -  $r1
	//DEBUG_VALUE: __memset_mram_8align:c < -  $r1
	//DEBUG_VALUE: __memset_mram:c < -  $r1
	//DEBUG_VALUE: __memset_mram:dest < -  $r0
	//DEBUG_VALUE: idx < -  0
	//DEBUG_VALUE: __memset_wram_4align:len < -  8
	//DEBUG_VALUE: i < -  2
	$loc,	2 0 31 is_stmt 0                // uPIMulator_frontend/sdk/stdlib/memset.c:0:31
	$move , r5, 0
memset..Ltmp65:
memset..LBB3_10:                               // =>This Inner Loop Header: Depth=1
	//DEBUG_VALUE: __memset_mram_8align:dest < -  $r3
	//DEBUG_VALUE: __memset_mram:d < -  $r3
	//DEBUG_VALUE: __memset_mram:len < -  $r2
	//DEBUG_VALUE: __memset_mram_8align:c < -  $r1
	//DEBUG_VALUE: __memset_mram:c < -  $r1
	//DEBUG_VALUE: __memset_mram:dest < -  $r0
	//DEBUG_VALUE: idx < -  $r5
	//DEBUG_VALUE: mram_write:to < -  undef
	//DEBUG_VALUE: mram_write:nb_of_bytes < -  8
	$loc,	4 53 24 is_stmt 1               // uPIMulator_frontend/sdk/syslib/mram.h:53:24
	$add , r6, r3, r5
	$add , r7, r22, 0
memset..Ltmp66:
	$loc,	2 93 43                         // uPIMulator_frontend/sdk/stdlib/memset.c:93:43
	$add , r5, r5, 8
memset..Ltmp67:
	//DEBUG_VALUE: mram_write:from < -  $r22
	//DEBUG_VALUE: idx < -  $r5
	$loc,	4 53 24                         // uPIMulator_frontend/sdk/syslib/mram.h:53:24
	$sdma , r7, r6, 0
memset..Ltmp68:
	//DEBUG_VALUE: mram_write:nb_of_bytes < -  8
	$loc,	2 93 5                          // uPIMulator_frontend/sdk/stdlib/memset.c:93:5
	$jltu , r5, r4, memset..LBB3_10
memset..Ltmp69:
memset..LBB3_11:
	//DEBUG_VALUE: __memset_mram:d < -  $r3
	//DEBUG_VALUE: __memset_mram:len < -  $r2
	//DEBUG_VALUE: __memset_mram:c < -  $r1
	//DEBUG_VALUE: __memset_mram:dest < -  $r0
	$loc,	2 129 13                        // uPIMulator_frontend/sdk/stdlib/memset.c:129:13
	$and , r2, r2, 7
memset..Ltmp70:
	//DEBUG_VALUE: __memset_mram:len < -  $r2
	$loc,	2 130 11                        // uPIMulator_frontend/sdk/stdlib/memset.c:130:11
	$add , r3, r3, r4
memset..Ltmp71:
	//DEBUG_VALUE: __memset_mram:d < -  $r3
memset..LBB3_12:
	//DEBUG_VALUE: __memset_mram:d < -  $r3
	//DEBUG_VALUE: __memset_mram:len < -  $r2
	//DEBUG_VALUE: __memset_mram:c < -  $r1
	//DEBUG_VALUE: __memset_mram:dest < -  $r0
	//DEBUG_VALUE: __memset_mram:len < -  $r2
	//DEBUG_VALUE: __memset_mram:d < -  $r3
	$loc,	2 134 9                         // uPIMulator_frontend/sdk/stdlib/memset.c:134:9
	$jeq , r2, 0, memset..LBB3_16
memset..Ltmp72:
// %bb.13:
	//DEBUG_VALUE: __memset_mram:d < -  $r3
	//DEBUG_VALUE: __memset_mram:len < -  $r2
	//DEBUG_VALUE: __memset_mram:c < -  $r1
	//DEBUG_VALUE: __memset_mram:dest < -  $r0
	$loc,	2 0 9 is_stmt 0                 // uPIMulator_frontend/sdk/stdlib/memset.c:0:9
	$add , r4, r22, 8
memset..Ltmp73:
	//DEBUG_VALUE: mram_read:nb_of_bytes < -  8
	//DEBUG_VALUE: mram_read:from < -  $r3
	$loc,	4 35 24 is_stmt 1               // uPIMulator_frontend/sdk/syslib/mram.h:35:24
	$ldma , r4, r3, 0
memset..Ltmp74:
	//DEBUG_VALUE: __memset_wram_1align:dest8 < -  [DW_OP_plus_uconst 8, DW_OP_stack_value] $r22
	//DEBUG_VALUE: __memset_wram_1align:dest < -  [DW_OP_plus_uconst 8, DW_OP_stack_value] $r22
	//DEBUG_VALUE: mram_read:to < -  [DW_OP_plus_uconst 8, DW_OP_stack_value] $r22
	//DEBUG_VALUE: i < -  0
	//DEBUG_VALUE: __memset_wram_1align:len < -  $r2
	//DEBUG_VALUE: __memset_wram_1align:c < -  $r1
memset..LBB3_14:                               // =>This Inner Loop Header: Depth=1
	//DEBUG_VALUE: __memset_wram_1align:dest < -  [DW_OP_plus_uconst 8, DW_OP_stack_value] $r22
	//DEBUG_VALUE: __memset_wram_1align:dest8 < -  [DW_OP_plus_uconst 8, DW_OP_stack_value] $r22
	//DEBUG_VALUE: __memset_mram:d < -  $r3
	//DEBUG_VALUE: __memset_wram_1align:c < -  $r1
	//DEBUG_VALUE: __memset_mram:c < -  $r1
	//DEBUG_VALUE: __memset_mram:dest < -  $r0
	//DEBUG_VALUE: i < -  undef
	$loc,	2 16 18                         // uPIMulator_frontend/sdk/stdlib/memset.c:16:18
	$sb , r4, 0, r1
memset..Ltmp75:
	//DEBUG_VALUE: i < -  [DW_OP_plus_uconst 1, DW_OP_stack_value] undef
	$loc,	2 15 28                         // uPIMulator_frontend/sdk/stdlib/memset.c:15:28
	$add , r4, r4, 1
	$add , r2, r2,  - 1, nz, memset..LBB3_14
memset..Ltmp76:
// %bb.15:
	//DEBUG_VALUE: __memset_mram:d < -  $r3
	//DEBUG_VALUE: __memset_mram:c < -  $r1
	//DEBUG_VALUE: __memset_mram:dest < -  $r0
	$loc,	2 0 28 is_stmt 0                // uPIMulator_frontend/sdk/stdlib/memset.c:0:28
	$add , r1, r22, 8
memset..Ltmp77:
	//DEBUG_VALUE: mram_write:nb_of_bytes < -  8
	//DEBUG_VALUE: mram_write:to < -  $r3
	$loc,	4 53 24 is_stmt 1               // uPIMulator_frontend/sdk/syslib/mram.h:53:24
	$sdma , r1, r3, 0
memset..Ltmp78:
	//DEBUG_VALUE: mram_write:from < -  [DW_OP_plus_uconst 8, DW_OP_stack_value] $r22
memset..LBB3_16:
	//DEBUG_VALUE: __memset_mram:d < -  $r3
	//DEBUG_VALUE: __memset_mram:dest < -  $r0
	$loc,	2 140 5                         // uPIMulator_frontend/sdk/stdlib/memset.c:140:5
	$jump , r23
memset..Ltmp79:
memset..Lfunc_end3:
	$size,	__memset_mram, memset..Lfunc_end3 - __memset_mram
	$cfi_endproc,
	$section,	%stack_sizes,"o",@progbits,%text, __memset_mram
	$long,	memset..Lfunc_begin3
	$byte,	16
	$section,	%text, __memset_mram,"ax",@progbits
                                        //  -  -  End function
	$section,	%debug_loc,"",@progbits
memset..Ldebug_loc0:
	$long,	 - 1
	$long,	memset..Lfunc_begin0                   //   base address
	$long,	memset..Lfunc_begin0 - memset..Lfunc_begin0
	$long,	memset..Ltmp1 - memset..Lfunc_begin0
	$short,	7                               // Loc expr size
	$byte,	113                             // DW_OP_breg1
	$byte,	0                               // 0
	$byte,	16                              // DW_OP_constu
	$byte,	255                             // 255
	$byte,	1                               // 
	$byte,	26                              // DW_OP_and
	$byte,	159                             // DW_OP_stack_value
	$long,	0
	$long,	0
memset..Ldebug_loc1:
	$long,	 - 1
	$long,	memset..Lfunc_begin0                   //   base address
	$long,	memset..Lfunc_begin0 - memset..Lfunc_begin0
	$long,	memset..Ltmp0 - memset..Lfunc_begin0
	$short,	1                               // Loc expr size
	$byte,	82                              // DW_OP_reg2
	$long,	0
	$long,	0
memset..Ldebug_loc2:
	$long,	 - 1
	$long,	memset..Lfunc_begin0                   //   base address
	$long,	memset..Ltmp2 - memset..Lfunc_begin0
	$long,	memset..Ltmp5 - memset..Lfunc_begin0
	$short,	1                               // Loc expr size
	$byte,	81                              // DW_OP_reg1
	$long,	0
	$long,	0
memset..Ldebug_loc3:
	$long,	 - 1
	$long,	memset..Lfunc_begin0                   //   base address
	$long,	memset..Lfunc_begin0 - memset..Lfunc_begin0
	$long,	memset..Ltmp3 - memset..Lfunc_begin0
	$short,	2                               // Loc expr size
	$byte,	48                              // DW_OP_lit0
	$byte,	159                             // DW_OP_stack_value
	$long,	0
	$long,	0
memset..Ldebug_loc4:
	$long,	 - 1
	$long,	memset..Lfunc_begin1                   //   base address
	$long,	memset..Lfunc_begin1 - memset..Lfunc_begin1
	$long,	memset..Ltmp18 - memset..Lfunc_begin1
	$short,	1                               // Loc expr size
	$byte,	82                              // DW_OP_reg2
	$long,	memset..Ltmp21 - memset..Lfunc_begin1
	$long,	memset..Lfunc_end1 - memset..Lfunc_begin1
	$short,	1                               // Loc expr size
	$byte,	82                              // DW_OP_reg2
	$long,	0
	$long,	0
memset..Ldebug_loc5:
	$long,	 - 1
	$long,	memset..Lfunc_begin1                   //   base address
	$long,	memset..Lfunc_begin1 - memset..Lfunc_begin1
	$long,	memset..Ltmp16 - memset..Lfunc_begin1
	$short,	1                               // Loc expr size
	$byte,	80                              // DW_OP_reg0
	$long,	memset..Ltmp16 - memset..Lfunc_begin1
	$long,	memset..Ltmp18 - memset..Lfunc_begin1
	$short,	1                               // Loc expr size
	$byte,	83                              // DW_OP_reg3
	$long,	memset..Ltmp21 - memset..Lfunc_begin1
	$long,	memset..Ltmp22 - memset..Lfunc_begin1
	$short,	1                               // Loc expr size
	$byte,	80                              // DW_OP_reg0
	$long,	memset..Ltmp22 - memset..Lfunc_begin1
	$long,	memset..Lfunc_end1 - memset..Lfunc_begin1
	$short,	1                               // Loc expr size
	$byte,	83                              // DW_OP_reg3
	$long,	0
	$long,	0
memset..Ldebug_loc6:
	$long,	 - 1
	$long,	memset..Lfunc_begin1                   //   base address
	$long,	memset..Lfunc_begin1 - memset..Lfunc_begin1
	$long,	memset..Ltmp7 - memset..Lfunc_begin1
	$short,	1                               // Loc expr size
	$byte,	83                              // DW_OP_reg3
	$long,	0
	$long,	0
memset..Ldebug_loc7:
	$long,	 - 1
	$long,	memset..Lfunc_begin1                   //   base address
	$long,	memset..Ltmp8 - memset..Lfunc_begin1
	$long,	memset..Ltmp10 - memset..Lfunc_begin1
	$short,	1                               // Loc expr size
	$byte,	84                              // DW_OP_reg4
	$long,	memset..Ltmp10 - memset..Lfunc_begin1
	$long,	memset..Ltmp16 - memset..Lfunc_begin1
	$short,	1                               // Loc expr size
	$byte,	83                              // DW_OP_reg3
	$long,	0
	$long,	0
memset..Ldebug_loc8:
	$long,	 - 1
	$long,	memset..Lfunc_begin1                   //   base address
	$long,	memset..Ltmp10 - memset..Lfunc_begin1
	$long,	memset..Ltmp12 - memset..Lfunc_begin1
	$short,	2                               // Loc expr size
	$byte,	48                              // DW_OP_lit0
	$byte,	159                             // DW_OP_stack_value
	$long,	0
	$long,	0
memset..Ldebug_loc9:
	$long,	 - 1
	$long,	memset..Lfunc_begin1                   //   base address
	$long,	memset..Ltmp24 - memset..Lfunc_begin1
	$long,	memset..Ltmp25 - memset..Lfunc_begin1
	$short,	1                               // Loc expr size
	$byte,	81                              // DW_OP_reg1
	$long,	memset..Ltmp25 - memset..Lfunc_begin1
	$long,	memset..Ltmp29 - memset..Lfunc_begin1
	$short,	7                               // Loc expr size
	$byte,	113                             // DW_OP_breg1
	$byte,	0                               // 0
	$byte,	16                              // DW_OP_constu
	$byte,	255                             // 255
	$byte,	1                               // 
	$byte,	26                              // DW_OP_and
	$byte,	159                             // DW_OP_stack_value
	$long,	0
	$long,	0
memset..Ldebug_loc10:
	$long,	 - 1
	$long,	memset..Lfunc_begin1                   //   base address
	$long,	memset..Ltmp24 - memset..Lfunc_begin1
	$long,	memset..Ltmp30 - memset..Lfunc_begin1
	$short,	15                              // Loc expr size
	$byte,	114                             // DW_OP_breg2
	$byte,	0                               // 0
	$byte,	16                              // DW_OP_constu
	$byte,	252                             // 18446744073709551612
	$byte,	255                             // 
	$byte,	255                             // 
	$byte,	255                             // 
	$byte,	255                             // 
	$byte,	255                             // 
	$byte,	255                             // 
	$byte,	255                             // 
	$byte,	255                             // 
	$byte,	1                               // 
	$byte,	26                              // DW_OP_and
	$byte,	159                             // DW_OP_stack_value
	$long,	0
	$long,	0
memset..Ldebug_loc11:
	$long,	 - 1
	$long,	memset..Lfunc_begin1                   //   base address
	$long,	memset..Ltmp26 - memset..Lfunc_begin1
	$long,	memset..Ltmp27 - memset..Lfunc_begin1
	$short,	2                               // Loc expr size
	$byte,	48                              // DW_OP_lit0
	$byte,	159                             // DW_OP_stack_value
	$long,	0
	$long,	0
memset..Ldebug_loc12:
	$long,	 - 1
	$long,	memset..Lfunc_begin1                   //   base address
	$long,	memset..Ltmp26 - memset..Lfunc_begin1
	$long,	memset..Ltmp29 - memset..Lfunc_begin1
	$short,	1                               // Loc expr size
	$byte,	85                              // DW_OP_reg5
	$long,	0
	$long,	0
memset..Ldebug_loc13:
	$long,	 - 1
	$long,	memset..Lfunc_begin2                   //   base address
	$long,	memset..Lfunc_begin2 - memset..Lfunc_begin2
	$long,	memset..Ltmp34 - memset..Lfunc_begin2
	$short,	1                               // Loc expr size
	$byte,	81                              // DW_OP_reg1
	$long,	0
	$long,	0
memset..Ldebug_loc14:
	$long,	 - 1
	$long,	memset..Lfunc_begin2                   //   base address
	$long,	memset..Lfunc_begin2 - memset..Lfunc_begin2
	$long,	memset..Ltmp33 - memset..Lfunc_begin2
	$short,	1                               // Loc expr size
	$byte,	81                              // DW_OP_reg1
	$long,	memset..Ltmp33 - memset..Lfunc_begin2
	$long,	memset..Ltmp34 - memset..Lfunc_begin2
	$short,	7                               // Loc expr size
	$byte,	113                             // DW_OP_breg1
	$byte,	0                               // 0
	$byte,	16                              // DW_OP_constu
	$byte,	255                             // 255
	$byte,	1                               // 
	$byte,	26                              // DW_OP_and
	$byte,	159                             // DW_OP_stack_value
	$long,	0
	$long,	0
memset..Ldebug_loc15:
	$long,	 - 1
	$long,	memset..Lfunc_begin2                   //   base address
	$long,	memset..Ltmp35 - memset..Lfunc_begin2
	$long,	memset..Ltmp36 - memset..Lfunc_begin2
	$short,	2                               // Loc expr size
	$byte,	48                              // DW_OP_lit0
	$byte,	159                             // DW_OP_stack_value
	$long,	memset..Ltmp36 - memset..Lfunc_begin2
	$long,	memset..Ltmp37 - memset..Lfunc_begin2
	$short,	2                               // Loc expr size
	$byte,	49                              // DW_OP_lit1
	$byte,	159                             // DW_OP_stack_value
	$long,	memset..Ltmp37 - memset..Lfunc_begin2
	$long,	memset..Ltmp38 - memset..Lfunc_begin2
	$short,	2                               // Loc expr size
	$byte,	50                              // DW_OP_lit2
	$byte,	159                             // DW_OP_stack_value
	$long,	0
	$long,	0
memset..Ldebug_loc16:
	$long,	 - 1
	$long,	memset..Lfunc_begin2                   //   base address
	$long,	memset..Ltmp35 - memset..Lfunc_begin2
	$long,	memset..Ltmp38 - memset..Lfunc_begin2
	$short,	1                               // Loc expr size
	$byte,	81                              // DW_OP_reg1
	$long,	0
	$long,	0
memset..Ldebug_loc17:
	$long,	 - 1
	$long,	memset..Lfunc_begin2                   //   base address
	$long,	memset..Ltmp37 - memset..Lfunc_begin2
	$long,	memset..Ltmp39 - memset..Lfunc_begin2
	$short,	2                               // Loc expr size
	$byte,	48                              // DW_OP_lit0
	$byte,	159                             // DW_OP_stack_value
	$long,	memset..Ltmp39 - memset..Lfunc_begin2
	$long,	memset..Ltmp43 - memset..Lfunc_begin2
	$short,	1                               // Loc expr size
	$byte,	81                              // DW_OP_reg1
	$long,	0
	$long,	0
memset..Ldebug_loc18:
	$long,	 - 1
	$long,	memset..Lfunc_begin2                   //   base address
	$long,	memset..Ltmp41 - memset..Lfunc_begin2
	$long,	memset..Ltmp43 - memset..Lfunc_begin2
	$short,	1                               // Loc expr size
	$byte,	102                             // DW_OP_reg22
	$long,	0
	$long,	0
memset..Ldebug_loc19:
	$long,	 - 1
	$long,	memset..Lfunc_begin3                   //   base address
	$long,	memset..Lfunc_begin3 - memset..Lfunc_begin3
	$long,	memset..Ltmp77 - memset..Lfunc_begin3
	$short,	1                               // Loc expr size
	$byte,	81                              // DW_OP_reg1
	$long,	0
	$long,	0
memset..Ldebug_loc20:
	$long,	 - 1
	$long,	memset..Lfunc_begin3                   //   base address
	$long,	memset..Lfunc_begin3 - memset..Lfunc_begin3
	$long,	memset..Ltmp74 - memset..Lfunc_begin3
	$short,	1                               // Loc expr size
	$byte,	82                              // DW_OP_reg2
	$long,	0
	$long,	0
memset..Ldebug_loc21:
	$long,	 - 1
	$long,	memset..Lfunc_begin3                   //   base address
	$long,	memset..Ltmp45 - memset..Lfunc_begin3
	$long,	memset..Lfunc_end3 - memset..Lfunc_begin3
	$short,	1                               // Loc expr size
	$byte,	83                              // DW_OP_reg3
	$long,	0
	$long,	0
memset..Ldebug_loc22:
	$long,	 - 1
	$long,	memset..Lfunc_begin3                   //   base address
	$long,	memset..Ltmp45 - memset..Lfunc_begin3
	$long,	memset..Ltmp46 - memset..Lfunc_begin3
	$short,	1                               // Loc expr size
	$byte,	86                              // DW_OP_reg6
	$long,	0
	$long,	0
memset..Ldebug_loc23:
	$long,	 - 1
	$long,	memset..Lfunc_begin3                   //   base address
	$long,	memset..Ltmp47 - memset..Lfunc_begin3
	$long,	memset..Ltmp49 - memset..Lfunc_begin3
	$short,	1                               // Loc expr size
	$byte,	85                              // DW_OP_reg5
	$long,	memset..Ltmp49 - memset..Lfunc_begin3
	$long,	memset..Ltmp58 - memset..Lfunc_begin3
	$short,	1                               // Loc expr size
	$byte,	84                              // DW_OP_reg4
	$long,	0
	$long,	0
memset..Ldebug_loc24:
	$long,	 - 1
	$long,	memset..Lfunc_begin3                   //   base address
	$long,	memset..Ltmp51 - memset..Lfunc_begin3
	$long,	memset..Ltmp53 - memset..Lfunc_begin3
	$short,	2                               // Loc expr size
	$byte,	48                              // DW_OP_lit0
	$byte,	159                             // DW_OP_stack_value
	$long,	0
	$long,	0
memset..Ldebug_loc25:
	$long,	 - 1
	$long,	memset..Lfunc_begin3                   //   base address
	$long,	memset..Ltmp60 - memset..Lfunc_begin3
	$long,	memset..Ltmp63 - memset..Lfunc_begin3
	$short,	7                               // Loc expr size
	$byte,	113                             // DW_OP_breg1
	$byte,	0                               // 0
	$byte,	16                              // DW_OP_constu
	$byte,	255                             // 255
	$byte,	1                               // 
	$byte,	26                              // DW_OP_and
	$byte,	159                             // DW_OP_stack_value
	$long,	memset..Ltmp63 - memset..Lfunc_begin3
	$long,	memset..Ltmp64 - memset..Lfunc_begin3
	$short,	1                               // Loc expr size
	$byte,	81                              // DW_OP_reg1
	$long,	0
	$long,	0
memset..Ldebug_loc26:
	$long,	 - 1
	$long,	memset..Lfunc_begin3                   //   base address
	$long,	memset..Ltmp61 - memset..Lfunc_begin3
	$long,	memset..Ltmp62 - memset..Lfunc_begin3
	$short,	2                               // Loc expr size
	$byte,	48                              // DW_OP_lit0
	$byte,	159                             // DW_OP_stack_value
	$long,	memset..Ltmp62 - memset..Lfunc_begin3
	$long,	memset..Ltmp63 - memset..Lfunc_begin3
	$short,	2                               // Loc expr size
	$byte,	49                              // DW_OP_lit1
	$byte,	159                             // DW_OP_stack_value
	$long,	memset..Ltmp63 - memset..Lfunc_begin3
	$long,	memset..Ltmp64 - memset..Lfunc_begin3
	$short,	2                               // Loc expr size
	$byte,	50                              // DW_OP_lit2
	$byte,	159                             // DW_OP_stack_value
	$long,	0
	$long,	0
memset..Ldebug_loc27:
	$long,	 - 1
	$long,	memset..Lfunc_begin3                   //   base address
	$long,	memset..Ltmp61 - memset..Lfunc_begin3
	$long,	memset..Ltmp64 - memset..Lfunc_begin3
	$short,	1                               // Loc expr size
	$byte,	84                              // DW_OP_reg4
	$long,	0
	$long,	0
memset..Ldebug_loc28:
	$long,	 - 1
	$long,	memset..Lfunc_begin3                   //   base address
	$long,	memset..Ltmp65 - memset..Lfunc_begin3
	$long,	memset..Ltmp69 - memset..Lfunc_begin3
	$short,	1                               // Loc expr size
	$byte,	81                              // DW_OP_reg1
	$long,	0
	$long,	0
memset..Ldebug_loc29:
	$long,	 - 1
	$long,	memset..Lfunc_begin3                   //   base address
	$long,	memset..Ltmp65 - memset..Lfunc_begin3
	$long,	memset..Ltmp69 - memset..Lfunc_begin3
	$short,	1                               // Loc expr size
	$byte,	83                              // DW_OP_reg3
	$long,	0
	$long,	0
memset..Ldebug_loc30:
	$long,	 - 1
	$long,	memset..Lfunc_begin3                   //   base address
	$long,	memset..Ltmp63 - memset..Lfunc_begin3
	$long,	memset..Ltmp64 - memset..Lfunc_begin3
	$short,	1                               // Loc expr size
	$byte,	84                              // DW_OP_reg4
	$long,	0
	$long,	0
memset..Ldebug_loc31:
	$long,	 - 1
	$long,	memset..Lfunc_begin3                   //   base address
	$long,	memset..Ltmp67 - memset..Lfunc_begin3
	$long,	memset..Ltmp69 - memset..Lfunc_begin3
	$short,	1                               // Loc expr size
	$byte,	102                             // DW_OP_reg22
	$long,	0
	$long,	0
	$section,	%debug_abbrev,"",@progbits
	$byte,	1                               // Abbreviation Code
	$byte,	17                              // DW_TAG_compile_unit
	$byte,	1                               // DW_CHILDREN_yes
	$byte,	37                              // DW_AT_producer
	$byte,	14                              // DW_FORM_strp
	$byte,	19                              // DW_AT_language
	$byte,	5                               // DW_FORM_data2
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	16                              // DW_AT_stmt_list
	$byte,	23                              // DW_FORM_sec_offset
	$byte,	27                              // DW_AT_comp_dir
	$byte,	14                              // DW_FORM_strp
	$byte,	17                              // DW_AT_low_pc
	$byte,	1                               // DW_FORM_addr
	$byte,	85                              // DW_AT_ranges
	$byte,	23                              // DW_FORM_sec_offset
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	2                               // Abbreviation Code
	$byte,	15                              // DW_TAG_pointer_type
	$byte,	0                               // DW_CHILDREN_no
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	3                               // Abbreviation Code
	$byte,	22                              // DW_TAG_typedef
	$byte,	0                               // DW_CHILDREN_no
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	4                               // Abbreviation Code
	$byte,	36                              // DW_TAG_base_type
	$byte,	0                               // DW_CHILDREN_no
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	62                              // DW_AT_encoding
	$byte,	11                              // DW_FORM_data1
	$byte,	11                              // DW_AT_byte_size
	$byte,	11                              // DW_FORM_data1
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	5                               // Abbreviation Code
	$byte,	15                              // DW_TAG_pointer_type
	$byte,	0                               // DW_CHILDREN_no
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	6                               // Abbreviation Code
	$byte,	46                              // DW_TAG_subprogram
	$byte,	1                               // DW_CHILDREN_yes
	$byte,	17                              // DW_AT_low_pc
	$byte,	1                               // DW_FORM_addr
	$byte,	18                              // DW_AT_high_pc
	$byte,	6                               // DW_FORM_data4
	$byte,	64                              // DW_AT_frame_base
	$byte,	24                              // DW_FORM_exprloc
	$ascii,	"\227B"                         // DW_AT_GNU_all_call_sites
	$byte,	25                              // DW_FORM_flag_present
	$byte,	49                              // DW_AT_abstract_origin
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	7                               // Abbreviation Code
	$byte,	5                               // DW_TAG_formal_parameter
	$byte,	0                               // DW_CHILDREN_no
	$byte,	2                               // DW_AT_location
	$byte,	24                              // DW_FORM_exprloc
	$byte,	49                              // DW_AT_abstract_origin
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	8                               // Abbreviation Code
	$byte,	5                               // DW_TAG_formal_parameter
	$byte,	0                               // DW_CHILDREN_no
	$byte,	2                               // DW_AT_location
	$byte,	23                              // DW_FORM_sec_offset
	$byte,	49                              // DW_AT_abstract_origin
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	9                               // Abbreviation Code
	$byte,	52                              // DW_TAG_variable
	$byte,	0                               // DW_CHILDREN_no
	$byte,	2                               // DW_AT_location
	$byte,	24                              // DW_FORM_exprloc
	$byte,	49                              // DW_AT_abstract_origin
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	10                              // Abbreviation Code
	$byte,	52                              // DW_TAG_variable
	$byte,	0                               // DW_CHILDREN_no
	$byte,	2                               // DW_AT_location
	$byte,	23                              // DW_FORM_sec_offset
	$byte,	49                              // DW_AT_abstract_origin
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	11                              // Abbreviation Code
	$byte,	11                              // DW_TAG_lexical_block
	$byte,	1                               // DW_CHILDREN_yes
	$byte,	17                              // DW_AT_low_pc
	$byte,	1                               // DW_FORM_addr
	$byte,	18                              // DW_AT_high_pc
	$byte,	6                               // DW_FORM_data4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	12                              // Abbreviation Code
	$byte,	46                              // DW_TAG_subprogram
	$byte,	1                               // DW_CHILDREN_yes
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	39                              // DW_AT_prototyped
	$byte,	25                              // DW_FORM_flag_present
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	32                              // DW_AT_inline
	$byte,	11                              // DW_FORM_data1
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	13                              // Abbreviation Code
	$byte,	5                               // DW_TAG_formal_parameter
	$byte,	0                               // DW_CHILDREN_no
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	14                              // Abbreviation Code
	$byte,	52                              // DW_TAG_variable
	$byte,	0                               // DW_CHILDREN_no
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	15                              // Abbreviation Code
	$byte,	11                              // DW_TAG_lexical_block
	$byte,	1                               // DW_CHILDREN_yes
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	16                              // Abbreviation Code
	$byte,	46                              // DW_TAG_subprogram
	$byte,	1                               // DW_CHILDREN_yes
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	39                              // DW_AT_prototyped
	$byte,	25                              // DW_FORM_flag_present
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	63                              // DW_AT_external
	$byte,	25                              // DW_FORM_flag_present
	$byte,	32                              // DW_AT_inline
	$byte,	11                              // DW_FORM_data1
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	17                              // Abbreviation Code
	$byte,	46                              // DW_TAG_subprogram
	$byte,	1                               // DW_CHILDREN_yes
	$byte,	17                              // DW_AT_low_pc
	$byte,	1                               // DW_FORM_addr
	$byte,	18                              // DW_AT_high_pc
	$byte,	6                               // DW_FORM_data4
	$byte,	64                              // DW_AT_frame_base
	$byte,	24                              // DW_FORM_exprloc
	$ascii,	"\227B"                         // DW_AT_GNU_all_call_sites
	$byte,	25                              // DW_FORM_flag_present
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	39                              // DW_AT_prototyped
	$byte,	25                              // DW_FORM_flag_present
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	63                              // DW_AT_external
	$byte,	25                              // DW_FORM_flag_present
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	18                              // Abbreviation Code
	$byte,	5                               // DW_TAG_formal_parameter
	$byte,	0                               // DW_CHILDREN_no
	$byte,	2                               // DW_AT_location
	$byte,	24                              // DW_FORM_exprloc
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	19                              // Abbreviation Code
	$byte,	5                               // DW_TAG_formal_parameter
	$byte,	0                               // DW_CHILDREN_no
	$byte,	2                               // DW_AT_location
	$byte,	23                              // DW_FORM_sec_offset
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	20                              // Abbreviation Code
	$byte,	52                              // DW_TAG_variable
	$byte,	0                               // DW_CHILDREN_no
	$byte,	28                              // DW_AT_const_value
	$byte,	15                              // DW_FORM_udata
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	21                              // Abbreviation Code
	$byte,	52                              // DW_TAG_variable
	$byte,	0                               // DW_CHILDREN_no
	$byte,	2                               // DW_AT_location
	$byte,	23                              // DW_FORM_sec_offset
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	22                              // Abbreviation Code
	$byte,	29                              // DW_TAG_inlined_subroutine
	$byte,	1                               // DW_CHILDREN_yes
	$byte,	49                              // DW_AT_abstract_origin
	$byte,	19                              // DW_FORM_ref4
	$byte,	17                              // DW_AT_low_pc
	$byte,	1                               // DW_FORM_addr
	$byte,	18                              // DW_AT_high_pc
	$byte,	6                               // DW_FORM_data4
	$byte,	88                              // DW_AT_call_file
	$byte,	11                              // DW_FORM_data1
	$byte,	89                              // DW_AT_call_line
	$byte,	11                              // DW_FORM_data1
	$byte,	87                              // DW_AT_call_column
	$byte,	11                              // DW_FORM_data1
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	23                              // Abbreviation Code
	$byte,	52                              // DW_TAG_variable
	$byte,	0                               // DW_CHILDREN_no
	$byte,	49                              // DW_AT_abstract_origin
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	24                              // Abbreviation Code
	$byte,	46                              // DW_TAG_subprogram
	$byte,	1                               // DW_CHILDREN_yes
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	39                              // DW_AT_prototyped
	$byte,	25                              // DW_FORM_flag_present
	$byte,	32                              // DW_AT_inline
	$byte,	11                              // DW_FORM_data1
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	25                              // Abbreviation Code
	$byte,	38                              // DW_TAG_const_type
	$byte,	0                               // DW_CHILDREN_no
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	26                              // Abbreviation Code
	$byte,	5                               // DW_TAG_formal_parameter
	$byte,	0                               // DW_CHILDREN_no
	$byte,	49                              // DW_AT_abstract_origin
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	27                              // Abbreviation Code
	$byte,	5                               // DW_TAG_formal_parameter
	$byte,	0                               // DW_CHILDREN_no
	$byte,	28                              // DW_AT_const_value
	$byte,	15                              // DW_FORM_udata
	$byte,	49                              // DW_AT_abstract_origin
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	28                              // Abbreviation Code
	$byte,	29                              // DW_TAG_inlined_subroutine
	$byte,	1                               // DW_CHILDREN_yes
	$byte,	49                              // DW_AT_abstract_origin
	$byte,	19                              // DW_FORM_ref4
	$byte,	85                              // DW_AT_ranges
	$byte,	23                              // DW_FORM_sec_offset
	$byte,	88                              // DW_AT_call_file
	$byte,	11                              // DW_FORM_data1
	$byte,	89                              // DW_AT_call_line
	$byte,	11                              // DW_FORM_data1
	$byte,	87                              // DW_AT_call_column
	$byte,	11                              // DW_FORM_data1
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	29                              // Abbreviation Code
	$byte,	52                              // DW_TAG_variable
	$byte,	0                               // DW_CHILDREN_no
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$ascii,	"\210\001"                      // DW_AT_alignment
	$byte,	15                              // DW_FORM_udata
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	30                              // Abbreviation Code
	$byte,	1                               // DW_TAG_array_type
	$byte,	1                               // DW_CHILDREN_yes
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	31                              // Abbreviation Code
	$byte,	33                              // DW_TAG_subrange_type
	$byte,	0                               // DW_CHILDREN_no
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	55                              // DW_AT_count
	$byte,	11                              // DW_FORM_data1
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	32                              // Abbreviation Code
	$byte,	36                              // DW_TAG_base_type
	$byte,	0                               // DW_CHILDREN_no
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	11                              // DW_AT_byte_size
	$byte,	11                              // DW_FORM_data1
	$byte,	62                              // DW_AT_encoding
	$byte,	11                              // DW_FORM_data1
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	33                              // Abbreviation Code
	$byte,	52                              // DW_TAG_variable
	$byte,	0                               // DW_CHILDREN_no
	$byte,	2                               // DW_AT_location
	$byte,	24                              // DW_FORM_exprloc
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$ascii,	"\210\001"                      // DW_AT_alignment
	$byte,	15                              // DW_FORM_udata
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	34                              // Abbreviation Code
	$byte,	38                              // DW_TAG_const_type
	$byte,	0                               // DW_CHILDREN_no
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	0                               // EOM(3)
	$section,	%debug_info,"",@progbits
memset..Lcu_begin0:
	$long,	memset..Ldebug_info_end0 - memset..Ldebug_info_start0 // Length of Unit
memset..Ldebug_info_start0:
	$short,	4                               // DWARF version number
	$long,	%debug_abbrev                   // Offset Into Abbrev. Section
	$byte,	4                               // Address Size (in bytes)
	$byte,	1                               // Abbrev [1] 0xb:0x659 DW_TAG_compile_unit
	$long,	memset..Linfo_string0                  // DW_AT_producer
	$short,	12                              // DW_AT_language
	$long,	memset..Linfo_string1                  // DW_AT_name
	$long,	memset..Lline_table_start0             // DW_AT_stmt_list
	$long,	memset..Linfo_string2                  // DW_AT_comp_dir
	$long,	0                               // DW_AT_low_pc
	$long,	memset..Ldebug_ranges3                 // DW_AT_ranges
	$byte,	2                               // Abbrev [2] 0x26:0x5 DW_TAG_pointer_type
	$long,	43                              // DW_AT_type
	$byte,	3                               // Abbrev [3] 0x2b:0xb DW_TAG_typedef
	$long,	54                              // DW_AT_type
	$long,	memset..Linfo_string5                  // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	21                              // DW_AT_decl_line
	$byte,	3                               // Abbrev [3] 0x36:0xb DW_TAG_typedef
	$long,	65                              // DW_AT_type
	$long,	memset..Linfo_string4                  // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	48                              // DW_AT_decl_line
	$byte,	4                               // Abbrev [4] 0x41:0x7 DW_TAG_base_type
	$long,	memset..Linfo_string3                  // DW_AT_name
	$byte,	7                               // DW_AT_encoding
	$byte,	4                               // DW_AT_byte_size
	$byte,	3                               // Abbrev [3] 0x48:0xb DW_TAG_typedef
	$long,	65                              // DW_AT_type
	$long,	memset..Linfo_string6                  // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	144                             // DW_AT_decl_line
	$byte,	2                               // Abbrev [2] 0x53:0x5 DW_TAG_pointer_type
	$long,	88                              // DW_AT_type
	$byte,	3                               // Abbrev [3] 0x58:0xb DW_TAG_typedef
	$long,	99                              // DW_AT_type
	$long,	memset..Linfo_string8                  // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	40                              // DW_AT_decl_line
	$byte,	4                               // Abbrev [4] 0x63:0x7 DW_TAG_base_type
	$long,	memset..Linfo_string7                  // DW_AT_name
	$byte,	8                               // DW_AT_encoding
	$byte,	1                               // DW_AT_byte_size
	$byte,	5                               // Abbrev [5] 0x6a:0x1 DW_TAG_pointer_type
	$byte,	6                               // Abbrev [6] 0x6b:0x4c DW_TAG_subprogram
	$long,	memset..Lfunc_begin0                   // DW_AT_low_pc
	$long,	memset..Lfunc_end0 - memset..Lfunc_begin0       // DW_AT_high_pc
	$byte,	1                               // DW_AT_frame_base
	$byte,	102
                                        // DW_AT_GNU_all_call_sites
	$long,	271                             // DW_AT_abstract_origin
	$byte,	7                               // Abbrev [7] 0x7a:0x7 DW_TAG_formal_parameter
	$byte,	1                               // DW_AT_location
	$byte,	80
	$long,	283                             // DW_AT_abstract_origin
	$byte,	8                               // Abbrev [8] 0x81:0x9 DW_TAG_formal_parameter
	$long,	memset..Ldebug_loc0                    // DW_AT_location
	$long,	294                             // DW_AT_abstract_origin
	$byte,	8                               // Abbrev [8] 0x8a:0x9 DW_TAG_formal_parameter
	$long,	memset..Ldebug_loc1                    // DW_AT_location
	$long,	305                             // DW_AT_abstract_origin
	$byte,	9                               // Abbrev [9] 0x93:0x7 DW_TAG_variable
	$byte,	1                               // DW_AT_location
	$byte,	80
	$long,	316                             // DW_AT_abstract_origin
	$byte,	10                              // Abbrev [10] 0x9a:0x9 DW_TAG_variable
	$long,	memset..Ldebug_loc2                    // DW_AT_location
	$long,	327                             // DW_AT_abstract_origin
	$byte,	11                              // Abbrev [11] 0xa3:0x13 DW_TAG_lexical_block
	$long,	memset..Lfunc_begin0                   // DW_AT_low_pc
	$long,	memset..Ltmp5 - memset..Lfunc_begin0            // DW_AT_high_pc
	$byte,	10                              // Abbrev [10] 0xac:0x9 DW_TAG_variable
	$long,	memset..Ldebug_loc3                    // DW_AT_location
	$long,	339                             // DW_AT_abstract_origin
	$byte,	0                               // End Of Children Mark
	$byte,	0                               // End Of Children Mark
	$byte,	12                              // Abbrev [12] 0xb7:0x46 DW_TAG_subprogram
	$long,	memset..Linfo_string9                  // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	12                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	$long,	106                             // DW_AT_type
	$byte,	1                               // DW_AT_inline
	$byte,	13                              // Abbrev [13] 0xc3:0xb DW_TAG_formal_parameter
	$long,	memset..Linfo_string10                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	12                              // DW_AT_decl_line
	$long,	106                             // DW_AT_type
	$byte,	13                              // Abbrev [13] 0xce:0xb DW_TAG_formal_parameter
	$long,	memset..Linfo_string11                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	12                              // DW_AT_decl_line
	$long,	253                             // DW_AT_type
	$byte,	13                              // Abbrev [13] 0xd9:0xb DW_TAG_formal_parameter
	$long,	memset..Linfo_string13                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	12                              // DW_AT_decl_line
	$long,	260                             // DW_AT_type
	$byte,	14                              // Abbrev [14] 0xe4:0xb DW_TAG_variable
	$long,	memset..Linfo_string15                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	14                              // DW_AT_decl_line
	$long,	83                              // DW_AT_type
	$byte,	15                              // Abbrev [15] 0xef:0xd DW_TAG_lexical_block
	$byte,	14                              // Abbrev [14] 0xf0:0xb DW_TAG_variable
	$long,	memset..Linfo_string16                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	15                              // DW_AT_decl_line
	$long,	54                              // DW_AT_type
	$byte,	0                               // End Of Children Mark
	$byte,	0                               // End Of Children Mark
	$byte,	4                               // Abbrev [4] 0xfd:0x7 DW_TAG_base_type
	$long,	memset..Linfo_string12                 // DW_AT_name
	$byte,	5                               // DW_AT_encoding
	$byte,	4                               // DW_AT_byte_size
	$byte,	3                               // Abbrev [3] 0x104:0xb DW_TAG_typedef
	$long,	65                              // DW_AT_type
	$long,	memset..Linfo_string14                 // DW_AT_name
	$byte,	3                               // DW_AT_decl_file
	$byte,	26                              // DW_AT_decl_line
	$byte,	16                              // Abbrev [16] 0x10f:0x51 DW_TAG_subprogram
	$long,	memset..Linfo_string17                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	26                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	$long,	106                             // DW_AT_type
                                        // DW_AT_external
	$byte,	1                               // DW_AT_inline
	$byte,	13                              // Abbrev [13] 0x11b:0xb DW_TAG_formal_parameter
	$long,	memset..Linfo_string10                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	26                              // DW_AT_decl_line
	$long,	106                             // DW_AT_type
	$byte,	13                              // Abbrev [13] 0x126:0xb DW_TAG_formal_parameter
	$long,	memset..Linfo_string11                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	26                              // DW_AT_decl_line
	$long,	253                             // DW_AT_type
	$byte,	13                              // Abbrev [13] 0x131:0xb DW_TAG_formal_parameter
	$long,	memset..Linfo_string13                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	26                              // DW_AT_decl_line
	$long,	260                             // DW_AT_type
	$byte,	14                              // Abbrev [14] 0x13c:0xb DW_TAG_variable
	$long,	memset..Linfo_string18                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	29                              // DW_AT_decl_line
	$long,	38                              // DW_AT_type
	$byte,	14                              // Abbrev [14] 0x147:0xb DW_TAG_variable
	$long,	memset..Linfo_string19                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	28                              // DW_AT_decl_line
	$long,	54                              // DW_AT_type
	$byte,	15                              // Abbrev [15] 0x152:0xd DW_TAG_lexical_block
	$byte,	14                              // Abbrev [14] 0x153:0xb DW_TAG_variable
	$long,	memset..Linfo_string16                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	34                              // DW_AT_decl_line
	$long,	54                              // DW_AT_type
	$byte,	0                               // End Of Children Mark
	$byte,	0                               // End Of Children Mark
	$byte,	17                              // Abbrev [17] 0x160:0x160 DW_TAG_subprogram
	$long,	memset..Lfunc_begin1                   // DW_AT_low_pc
	$long,	memset..Lfunc_end1 - memset..Lfunc_begin1       // DW_AT_high_pc
	$byte,	1                               // DW_AT_frame_base
	$byte,	102
                                        // DW_AT_GNU_all_call_sites
	$long,	memset..Linfo_string30                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	42                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	$long,	106                             // DW_AT_type
                                        // DW_AT_external
	$byte,	18                              // Abbrev [18] 0x175:0xd DW_TAG_formal_parameter
	$byte,	1                               // DW_AT_location
	$byte,	80
	$long,	memset..Linfo_string10                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	42                              // DW_AT_decl_line
	$long,	106                             // DW_AT_type
	$byte,	18                              // Abbrev [18] 0x182:0xd DW_TAG_formal_parameter
	$byte,	1                               // DW_AT_location
	$byte,	81
	$long,	memset..Linfo_string11                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	42                              // DW_AT_decl_line
	$long,	253                             // DW_AT_type
	$byte,	19                              // Abbrev [19] 0x18f:0xf DW_TAG_formal_parameter
	$long,	memset..Ldebug_loc4                    // DW_AT_location
	$long,	memset..Linfo_string13                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	42                              // DW_AT_decl_line
	$long,	260                             // DW_AT_type
	$byte,	20                              // Abbrev [20] 0x19e:0xc DW_TAG_variable
	$byte,	4                               // DW_AT_const_value
	$long,	memset..Linfo_string32                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	44                              // DW_AT_decl_line
	$long,	1630                            // DW_AT_type
	$byte,	20                              // Abbrev [20] 0x1aa:0xc DW_TAG_variable
	$byte,	3                               // DW_AT_const_value
	$long,	memset..Linfo_string33                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	45                              // DW_AT_decl_line
	$long,	1630                            // DW_AT_type
	$byte,	21                              // Abbrev [21] 0x1b6:0xf DW_TAG_variable
	$long,	memset..Ldebug_loc5                    // DW_AT_location
	$long,	memset..Linfo_string34                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	47                              // DW_AT_decl_line
	$long,	83                              // DW_AT_type
	$byte,	21                              // Abbrev [21] 0x1c5:0xf DW_TAG_variable
	$long,	memset..Ldebug_loc6                    // DW_AT_location
	$long,	memset..Linfo_string35                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	46                              // DW_AT_decl_line
	$long,	54                              // DW_AT_type
	$byte,	11                              // Abbrev [11] 0x1d4:0x59 DW_TAG_lexical_block
	$long,	memset..Ltmp7                          // DW_AT_low_pc
	$long,	memset..Ltmp16 - memset..Ltmp7                  // DW_AT_high_pc
	$byte,	21                              // Abbrev [21] 0x1dd:0xf DW_TAG_variable
	$long,	memset..Ldebug_loc7                    // DW_AT_location
	$long,	memset..Linfo_string36                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	51                              // DW_AT_decl_line
	$long,	260                             // DW_AT_type
	$byte,	22                              // Abbrev [22] 0x1ec:0x40 DW_TAG_inlined_subroutine
	$long,	183                             // DW_AT_abstract_origin
	$long,	memset..Ltmp10                         // DW_AT_low_pc
	$long,	memset..Ltmp14 - memset..Ltmp10                 // DW_AT_high_pc
	$byte,	2                               // DW_AT_call_file
	$byte,	56                              // DW_AT_call_line
	$byte,	9                               // DW_AT_call_column
	$byte,	7                               // Abbrev [7] 0x1fc:0x7 DW_TAG_formal_parameter
	$byte,	1                               // DW_AT_location
	$byte,	80
	$long,	195                             // DW_AT_abstract_origin
	$byte,	7                               // Abbrev [7] 0x203:0x7 DW_TAG_formal_parameter
	$byte,	1                               // DW_AT_location
	$byte,	81
	$long,	206                             // DW_AT_abstract_origin
	$byte,	7                               // Abbrev [7] 0x20a:0x7 DW_TAG_formal_parameter
	$byte,	1                               // DW_AT_location
	$byte,	83
	$long,	217                             // DW_AT_abstract_origin
	$byte,	9                               // Abbrev [9] 0x211:0x7 DW_TAG_variable
	$byte,	1                               // DW_AT_location
	$byte,	80
	$long,	228                             // DW_AT_abstract_origin
	$byte,	11                              // Abbrev [11] 0x218:0x13 DW_TAG_lexical_block
	$long,	memset..Ltmp10                         // DW_AT_low_pc
	$long,	memset..Ltmp14 - memset..Ltmp10                 // DW_AT_high_pc
	$byte,	10                              // Abbrev [10] 0x221:0x9 DW_TAG_variable
	$long,	memset..Ldebug_loc8                    // DW_AT_location
	$long,	240                             // DW_AT_abstract_origin
	$byte,	0                               // End Of Children Mark
	$byte,	0                               // End Of Children Mark
	$byte,	0                               // End Of Children Mark
	$byte,	22                              // Abbrev [22] 0x22d:0x20 DW_TAG_inlined_subroutine
	$long,	183                             // DW_AT_abstract_origin
	$long,	memset..Ltmp18                         // DW_AT_low_pc
	$long,	memset..Ltmp20 - memset..Ltmp18                 // DW_AT_high_pc
	$byte,	2                               // DW_AT_call_file
	$byte,	74                              // DW_AT_call_line
	$byte,	9                               // DW_AT_call_column
	$byte,	11                              // Abbrev [11] 0x23d:0xf DW_TAG_lexical_block
	$long,	memset..Ltmp18                         // DW_AT_low_pc
	$long,	memset..Ltmp20 - memset..Ltmp18                 // DW_AT_high_pc
	$byte,	23                              // Abbrev [23] 0x246:0x5 DW_TAG_variable
	$long,	240                             // DW_AT_abstract_origin
	$byte,	0                               // End Of Children Mark
	$byte,	0                               // End Of Children Mark
	$byte,	11                              // Abbrev [11] 0x24d:0x72 DW_TAG_lexical_block
	$long,	memset..Ltmp23                         // DW_AT_low_pc
	$long,	memset..Ltmp31 - memset..Ltmp23                 // DW_AT_high_pc
	$byte,	21                              // Abbrev [21] 0x256:0xf DW_TAG_variable
	$long,	memset..Ldebug_loc10                   // DW_AT_location
	$long,	memset..Linfo_string37                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	64                              // DW_AT_decl_line
	$long,	260                             // DW_AT_type
	$byte,	22                              // Abbrev [22] 0x265:0x59 DW_TAG_inlined_subroutine
	$long,	271                             // DW_AT_abstract_origin
	$long,	memset..Ltmp24                         // DW_AT_low_pc
	$long,	memset..Ltmp29 - memset..Ltmp24                 // DW_AT_high_pc
	$byte,	2                               // DW_AT_call_file
	$byte,	66                              // DW_AT_call_line
	$byte,	9                               // DW_AT_call_column
	$byte,	7                               // Abbrev [7] 0x275:0x7 DW_TAG_formal_parameter
	$byte,	1                               // DW_AT_location
	$byte,	83
	$long,	283                             // DW_AT_abstract_origin
	$byte,	8                               // Abbrev [8] 0x27c:0x9 DW_TAG_formal_parameter
	$long,	memset..Ldebug_loc9                    // DW_AT_location
	$long,	294                             // DW_AT_abstract_origin
	$byte,	7                               // Abbrev [7] 0x285:0x15 DW_TAG_formal_parameter
	$byte,	15                              // DW_AT_location
	$byte,	114
	$byte,	0
	$byte,	16
	$ascii,	"\374\377\377\377\377\377\377\377\377\001"
	$byte,	26
	$byte,	159
	$long,	305                             // DW_AT_abstract_origin
	$byte,	9                               // Abbrev [9] 0x29a:0x7 DW_TAG_variable
	$byte,	1                               // DW_AT_location
	$byte,	83
	$long,	316                             // DW_AT_abstract_origin
	$byte,	10                              // Abbrev [10] 0x2a1:0x9 DW_TAG_variable
	$long,	memset..Ldebug_loc12                   // DW_AT_location
	$long,	327                             // DW_AT_abstract_origin
	$byte,	11                              // Abbrev [11] 0x2aa:0x13 DW_TAG_lexical_block
	$long,	memset..Ltmp26                         // DW_AT_low_pc
	$long,	memset..Ltmp29 - memset..Ltmp26                 // DW_AT_high_pc
	$byte,	10                              // Abbrev [10] 0x2b3:0x9 DW_TAG_variable
	$long,	memset..Ldebug_loc11                   // DW_AT_location
	$long,	339                             // DW_AT_abstract_origin
	$byte,	0                               // End Of Children Mark
	$byte,	0                               // End Of Children Mark
	$byte,	0                               // End Of Children Mark
	$byte,	0                               // End Of Children Mark
	$byte,	24                              // Abbrev [24] 0x2c0:0x2a DW_TAG_subprogram
	$long,	memset..Linfo_string20                 // DW_AT_name
	$byte,	4                               // DW_AT_decl_file
	$byte,	51                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	$byte,	1                               // DW_AT_inline
	$byte,	13                              // Abbrev [13] 0x2c8:0xb DW_TAG_formal_parameter
	$long,	memset..Linfo_string21                 // DW_AT_name
	$byte,	4                               // DW_AT_decl_file
	$byte,	51                              // DW_AT_decl_line
	$long,	746                             // DW_AT_type
	$byte,	13                              // Abbrev [13] 0x2d3:0xb DW_TAG_formal_parameter
	$long,	memset..Linfo_string22                 // DW_AT_name
	$byte,	4                               // DW_AT_decl_file
	$byte,	51                              // DW_AT_decl_line
	$long,	106                             // DW_AT_type
	$byte,	13                              // Abbrev [13] 0x2de:0xb DW_TAG_formal_parameter
	$long,	memset..Linfo_string23                 // DW_AT_name
	$byte,	4                               // DW_AT_decl_file
	$byte,	51                              // DW_AT_decl_line
	$long,	65                              // DW_AT_type
	$byte,	0                               // End Of Children Mark
	$byte,	2                               // Abbrev [2] 0x2ea:0x5 DW_TAG_pointer_type
	$long,	751                             // DW_AT_type
	$byte,	25                              // Abbrev [25] 0x2ef:0x1 DW_TAG_const_type
	$byte,	6                               // Abbrev [6] 0x2f0:0xae DW_TAG_subprogram
	$long,	memset..Lfunc_begin2                   // DW_AT_low_pc
	$long,	memset..Lfunc_end2 - memset..Lfunc_begin2       // DW_AT_high_pc
	$byte,	1                               // DW_AT_frame_base
	$byte,	102
                                        // DW_AT_GNU_all_call_sites
	$long,	968                             // DW_AT_abstract_origin
	$byte,	7                               // Abbrev [7] 0x2ff:0x7 DW_TAG_formal_parameter
	$byte,	1                               // DW_AT_location
	$byte,	80
	$long,	980                             // DW_AT_abstract_origin
	$byte,	8                               // Abbrev [8] 0x306:0x9 DW_TAG_formal_parameter
	$long,	memset..Ldebug_loc13                   // DW_AT_location
	$long,	991                             // DW_AT_abstract_origin
	$byte,	7                               // Abbrev [7] 0x30f:0x7 DW_TAG_formal_parameter
	$byte,	1                               // DW_AT_location
	$byte,	82
	$long,	1002                            // DW_AT_abstract_origin
	$byte,	9                               // Abbrev [9] 0x316:0x8 DW_TAG_variable
	$byte,	2                               // DW_AT_location
	$byte,	145
	$byte,	0
	$long,	1013                            // DW_AT_abstract_origin
	$byte,	23                              // Abbrev [23] 0x31e:0x5 DW_TAG_variable
	$long,	1025                            // DW_AT_abstract_origin
	$byte,	22                              // Abbrev [22] 0x323:0x46 DW_TAG_inlined_subroutine
	$long,	271                             // DW_AT_abstract_origin
	$long,	memset..Lfunc_begin2                   // DW_AT_low_pc
	$long,	memset..Ltmp37 - memset..Lfunc_begin2           // DW_AT_high_pc
	$byte,	2                               // DW_AT_call_file
	$byte,	91                              // DW_AT_call_line
	$byte,	5                               // DW_AT_call_column
	$byte,	26                              // Abbrev [26] 0x333:0x5 DW_TAG_formal_parameter
	$long,	283                             // DW_AT_abstract_origin
	$byte,	8                               // Abbrev [8] 0x338:0x9 DW_TAG_formal_parameter
	$long,	memset..Ldebug_loc14                   // DW_AT_location
	$long,	294                             // DW_AT_abstract_origin
	$byte,	27                              // Abbrev [27] 0x341:0x6 DW_TAG_formal_parameter
	$byte,	8                               // DW_AT_const_value
	$long,	305                             // DW_AT_abstract_origin
	$byte,	23                              // Abbrev [23] 0x347:0x5 DW_TAG_variable
	$long,	316                             // DW_AT_abstract_origin
	$byte,	10                              // Abbrev [10] 0x34c:0x9 DW_TAG_variable
	$long,	memset..Ldebug_loc16                   // DW_AT_location
	$long,	327                             // DW_AT_abstract_origin
	$byte,	11                              // Abbrev [11] 0x355:0x13 DW_TAG_lexical_block
	$long,	memset..Ltmp35                         // DW_AT_low_pc
	$long,	memset..Ltmp37 - memset..Ltmp35                 // DW_AT_high_pc
	$byte,	10                              // Abbrev [10] 0x35e:0x9 DW_TAG_variable
	$long,	memset..Ldebug_loc15                   // DW_AT_location
	$long,	339                             // DW_AT_abstract_origin
	$byte,	0                               // End Of Children Mark
	$byte,	0                               // End Of Children Mark
	$byte,	11                              // Abbrev [11] 0x369:0x34 DW_TAG_lexical_block
	$long,	memset..Ltmp37                         // DW_AT_low_pc
	$long,	memset..Ltmp43 - memset..Ltmp37                 // DW_AT_high_pc
	$byte,	10                              // Abbrev [10] 0x372:0x9 DW_TAG_variable
	$long,	memset..Ldebug_loc17                   // DW_AT_location
	$long,	1037                            // DW_AT_abstract_origin
	$byte,	28                              // Abbrev [28] 0x37b:0x21 DW_TAG_inlined_subroutine
	$long,	704                             // DW_AT_abstract_origin
	$long,	memset..Ldebug_ranges0                 // DW_AT_ranges
	$byte,	2                               // DW_AT_call_file
	$byte,	94                              // DW_AT_call_line
	$byte,	9                               // DW_AT_call_column
	$byte,	8                               // Abbrev [8] 0x387:0x9 DW_TAG_formal_parameter
	$long,	memset..Ldebug_loc18                   // DW_AT_location
	$long,	712                             // DW_AT_abstract_origin
	$byte,	26                              // Abbrev [26] 0x390:0x5 DW_TAG_formal_parameter
	$long,	723                             // DW_AT_abstract_origin
	$byte,	27                              // Abbrev [27] 0x395:0x6 DW_TAG_formal_parameter
	$byte,	8                               // DW_AT_const_value
	$long,	734                             // DW_AT_abstract_origin
	$byte,	0                               // End Of Children Mark
	$byte,	0                               // End Of Children Mark
	$byte,	0                               // End Of Children Mark
	$byte,	24                              // Abbrev [24] 0x39e:0x2a DW_TAG_subprogram
	$long,	memset..Linfo_string24                 // DW_AT_name
	$byte,	4                               // DW_AT_decl_file
	$byte,	33                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	$byte,	1                               // DW_AT_inline
	$byte,	13                              // Abbrev [13] 0x3a6:0xb DW_TAG_formal_parameter
	$long,	memset..Linfo_string21                 // DW_AT_name
	$byte,	4                               // DW_AT_decl_file
	$byte,	33                              // DW_AT_decl_line
	$long,	746                             // DW_AT_type
	$byte,	13                              // Abbrev [13] 0x3b1:0xb DW_TAG_formal_parameter
	$long,	memset..Linfo_string22                 // DW_AT_name
	$byte,	4                               // DW_AT_decl_file
	$byte,	33                              // DW_AT_decl_line
	$long,	106                             // DW_AT_type
	$byte,	13                              // Abbrev [13] 0x3bc:0xb DW_TAG_formal_parameter
	$long,	memset..Linfo_string23                 // DW_AT_name
	$byte,	4                               // DW_AT_decl_file
	$byte,	33                              // DW_AT_decl_line
	$long,	65                              // DW_AT_type
	$byte,	0                               // End Of Children Mark
	$byte,	16                              // Abbrev [16] 0x3c8:0x52 DW_TAG_subprogram
	$long,	memset..Linfo_string25                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	86                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	$long,	106                             // DW_AT_type
                                        // DW_AT_external
	$byte,	1                               // DW_AT_inline
	$byte,	13                              // Abbrev [13] 0x3d4:0xb DW_TAG_formal_parameter
	$long,	memset..Linfo_string10                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	86                              // DW_AT_decl_line
	$long,	106                             // DW_AT_type
	$byte,	13                              // Abbrev [13] 0x3df:0xb DW_TAG_formal_parameter
	$long,	memset..Linfo_string11                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	86                              // DW_AT_decl_line
	$long,	253                             // DW_AT_type
	$byte,	13                              // Abbrev [13] 0x3ea:0xb DW_TAG_formal_parameter
	$long,	memset..Linfo_string13                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	86                              // DW_AT_decl_line
	$long,	260                             // DW_AT_type
	$byte,	29                              // Abbrev [29] 0x3f5:0xc DW_TAG_variable
	$long,	memset..Linfo_string26                 // DW_AT_name
	$byte,	8                               // DW_AT_alignment
	$byte,	2                               // DW_AT_decl_file
	$byte,	88                              // DW_AT_decl_line
	$long,	1050                            // DW_AT_type
	$byte,	14                              // Abbrev [14] 0x401:0xb DW_TAG_variable
	$long,	memset..Linfo_string28                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	89                              // DW_AT_decl_line
	$long,	106                             // DW_AT_type
	$byte,	15                              // Abbrev [15] 0x40c:0xd DW_TAG_lexical_block
	$byte,	14                              // Abbrev [14] 0x40d:0xb DW_TAG_variable
	$long,	memset..Linfo_string29                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	93                              // DW_AT_decl_line
	$long,	54                              // DW_AT_type
	$byte,	0                               // End Of Children Mark
	$byte,	0                               // End Of Children Mark
	$byte,	30                              // Abbrev [30] 0x41a:0xc DW_TAG_array_type
	$long,	88                              // DW_AT_type
	$byte,	31                              // Abbrev [31] 0x41f:0x6 DW_TAG_subrange_type
	$long,	1062                            // DW_AT_type
	$byte,	8                               // DW_AT_count
	$byte,	0                               // End Of Children Mark
	$byte,	32                              // Abbrev [32] 0x426:0x7 DW_TAG_base_type
	$long,	memset..Linfo_string27                 // DW_AT_name
	$byte,	8                               // DW_AT_byte_size
	$byte,	7                               // DW_AT_encoding
	$byte,	17                              // Abbrev [17] 0x42d:0x231 DW_TAG_subprogram
	$long,	memset..Lfunc_begin3                   // DW_AT_low_pc
	$long,	memset..Lfunc_end3 - memset..Lfunc_begin3       // DW_AT_high_pc
	$byte,	1                               // DW_AT_frame_base
	$byte,	102
                                        // DW_AT_GNU_all_call_sites
	$long,	memset..Linfo_string31                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	101                             // DW_AT_decl_line
                                        // DW_AT_prototyped
	$long,	106                             // DW_AT_type
                                        // DW_AT_external
	$byte,	18                              // Abbrev [18] 0x442:0xd DW_TAG_formal_parameter
	$byte,	1                               // DW_AT_location
	$byte,	80
	$long,	memset..Linfo_string10                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	101                             // DW_AT_decl_line
	$long,	106                             // DW_AT_type
	$byte,	19                              // Abbrev [19] 0x44f:0xf DW_TAG_formal_parameter
	$long,	memset..Ldebug_loc19                   // DW_AT_location
	$long,	memset..Linfo_string11                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	101                             // DW_AT_decl_line
	$long,	253                             // DW_AT_type
	$byte,	19                              // Abbrev [19] 0x45e:0xf DW_TAG_formal_parameter
	$long,	memset..Ldebug_loc20                   // DW_AT_location
	$long,	memset..Linfo_string13                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	101                             // DW_AT_decl_line
	$long,	260                             // DW_AT_type
	$byte,	33                              // Abbrev [33] 0x46d:0xf DW_TAG_variable
	$byte,	2                               // DW_AT_location
	$byte,	145
	$byte,	8
	$long,	memset..Linfo_string26                 // DW_AT_name
	$byte,	8                               // DW_AT_alignment
	$byte,	2                               // DW_AT_decl_file
	$byte,	103                             // DW_AT_decl_line
	$long,	1050                            // DW_AT_type
	$byte,	14                              // Abbrev [14] 0x47c:0xb DW_TAG_variable
	$long,	memset..Linfo_string28                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	104                             // DW_AT_decl_line
	$long,	106                             // DW_AT_type
	$byte,	21                              // Abbrev [21] 0x487:0xf DW_TAG_variable
	$long,	memset..Ldebug_loc21                   // DW_AT_location
	$long,	memset..Linfo_string34                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	105                             // DW_AT_decl_line
	$long,	83                              // DW_AT_type
	$byte,	21                              // Abbrev [21] 0x496:0xf DW_TAG_variable
	$long,	memset..Ldebug_loc22                   // DW_AT_location
	$long,	memset..Linfo_string35                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	106                             // DW_AT_decl_line
	$long,	54                              // DW_AT_type
	$byte,	11                              // Abbrev [11] 0x4a5:0x91 DW_TAG_lexical_block
	$long,	memset..Ltmp46                         // DW_AT_low_pc
	$long,	memset..Ltmp58 - memset..Ltmp46                 // DW_AT_high_pc
	$byte,	21                              // Abbrev [21] 0x4ae:0xf DW_TAG_variable
	$long,	memset..Ldebug_loc23                   // DW_AT_location
	$long,	memset..Linfo_string36                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	110                             // DW_AT_decl_line
	$long,	260                             // DW_AT_type
	$byte,	22                              // Abbrev [22] 0x4bd:0x1e DW_TAG_inlined_subroutine
	$long,	926                             // DW_AT_abstract_origin
	$long,	memset..Ltmp50                         // DW_AT_low_pc
	$long,	memset..Ltmp51 - memset..Ltmp50                 // DW_AT_high_pc
	$byte,	2                               // DW_AT_call_file
	$byte,	115                             // DW_AT_call_line
	$byte,	9                               // DW_AT_call_column
	$byte,	7                               // Abbrev [7] 0x4cd:0x7 DW_TAG_formal_parameter
	$byte,	1                               // DW_AT_location
	$byte,	83
	$long,	934                             // DW_AT_abstract_origin
	$byte,	27                              // Abbrev [27] 0x4d4:0x6 DW_TAG_formal_parameter
	$byte,	8                               // DW_AT_const_value
	$long,	956                             // DW_AT_abstract_origin
	$byte,	0                               // End Of Children Mark
	$byte,	22                              // Abbrev [22] 0x4db:0x3c DW_TAG_inlined_subroutine
	$long,	183                             // DW_AT_abstract_origin
	$long,	memset..Ltmp51                         // DW_AT_low_pc
	$long,	memset..Ltmp55 - memset..Ltmp51                 // DW_AT_high_pc
	$byte,	2                               // DW_AT_call_file
	$byte,	116                             // DW_AT_call_line
	$byte,	9                               // DW_AT_call_column
	$byte,	26                              // Abbrev [26] 0x4eb:0x5 DW_TAG_formal_parameter
	$long,	195                             // DW_AT_abstract_origin
	$byte,	7                               // Abbrev [7] 0x4f0:0x7 DW_TAG_formal_parameter
	$byte,	1                               // DW_AT_location
	$byte,	81
	$long,	206                             // DW_AT_abstract_origin
	$byte,	7                               // Abbrev [7] 0x4f7:0x7 DW_TAG_formal_parameter
	$byte,	1                               // DW_AT_location
	$byte,	84
	$long,	217                             // DW_AT_abstract_origin
	$byte,	23                              // Abbrev [23] 0x4fe:0x5 DW_TAG_variable
	$long,	228                             // DW_AT_abstract_origin
	$byte,	11                              // Abbrev [11] 0x503:0x13 DW_TAG_lexical_block
	$long,	memset..Ltmp51                         // DW_AT_low_pc
	$long,	memset..Ltmp55 - memset..Ltmp51                 // DW_AT_high_pc
	$byte,	10                              // Abbrev [10] 0x50c:0x9 DW_TAG_variable
	$long,	memset..Ldebug_loc24                   // DW_AT_location
	$long,	240                             // DW_AT_abstract_origin
	$byte,	0                               // End Of Children Mark
	$byte,	0                               // End Of Children Mark
	$byte,	22                              // Abbrev [22] 0x517:0x1e DW_TAG_inlined_subroutine
	$long,	704                             // DW_AT_abstract_origin
	$long,	memset..Ltmp55                         // DW_AT_low_pc
	$long,	memset..Ltmp56 - memset..Ltmp55                 // DW_AT_high_pc
	$byte,	2                               // DW_AT_call_file
	$byte,	117                             // DW_AT_call_line
	$byte,	9                               // DW_AT_call_column
	$byte,	7                               // Abbrev [7] 0x527:0x7 DW_TAG_formal_parameter
	$byte,	1                               // DW_AT_location
	$byte,	83
	$long,	723                             // DW_AT_abstract_origin
	$byte,	27                              // Abbrev [27] 0x52e:0x6 DW_TAG_formal_parameter
	$byte,	8                               // DW_AT_const_value
	$long,	734                             // DW_AT_abstract_origin
	$byte,	0                               // End Of Children Mark
	$byte,	0                               // End Of Children Mark
	$byte,	11                              // Abbrev [11] 0x536:0xa8 DW_TAG_lexical_block
	$long,	memset..Ltmp59                         // DW_AT_low_pc
	$long,	memset..Ltmp71 - memset..Ltmp59                 // DW_AT_high_pc
	$byte,	21                              // Abbrev [21] 0x53f:0xf DW_TAG_variable
	$long,	memset..Ldebug_loc30                   // DW_AT_location
	$long,	memset..Linfo_string37                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	125                             // DW_AT_decl_line
	$long,	260                             // DW_AT_type
	$byte,	28                              // Abbrev [28] 0x54e:0x8f DW_TAG_inlined_subroutine
	$long,	968                             // DW_AT_abstract_origin
	$long,	memset..Ldebug_ranges1                 // DW_AT_ranges
	$byte,	2                               // DW_AT_call_file
	$byte,	127                             // DW_AT_call_line
	$byte,	9                               // DW_AT_call_column
	$byte,	8                               // Abbrev [8] 0x55a:0x9 DW_TAG_formal_parameter
	$long,	memset..Ldebug_loc29                   // DW_AT_location
	$long,	980                             // DW_AT_abstract_origin
	$byte,	8                               // Abbrev [8] 0x563:0x9 DW_TAG_formal_parameter
	$long,	memset..Ldebug_loc28                   // DW_AT_location
	$long,	991                             // DW_AT_abstract_origin
	$byte,	9                               // Abbrev [9] 0x56c:0x8 DW_TAG_variable
	$byte,	2                               // DW_AT_location
	$byte,	145
	$byte,	0
	$long,	1013                            // DW_AT_abstract_origin
	$byte,	22                              // Abbrev [22] 0x574:0x36 DW_TAG_inlined_subroutine
	$long,	271                             // DW_AT_abstract_origin
	$long,	memset..Ltmp59                         // DW_AT_low_pc
	$long,	memset..Ltmp63 - memset..Ltmp59                 // DW_AT_high_pc
	$byte,	2                               // DW_AT_call_file
	$byte,	91                              // DW_AT_call_line
	$byte,	5                               // DW_AT_call_column
	$byte,	8                               // Abbrev [8] 0x584:0x9 DW_TAG_formal_parameter
	$long,	memset..Ldebug_loc25                   // DW_AT_location
	$long,	294                             // DW_AT_abstract_origin
	$byte,	10                              // Abbrev [10] 0x58d:0x9 DW_TAG_variable
	$long,	memset..Ldebug_loc27                   // DW_AT_location
	$long,	327                             // DW_AT_abstract_origin
	$byte,	11                              // Abbrev [11] 0x596:0x13 DW_TAG_lexical_block
	$long,	memset..Ltmp61                         // DW_AT_low_pc
	$long,	memset..Ltmp63 - memset..Ltmp61                 // DW_AT_high_pc
	$byte,	10                              // Abbrev [10] 0x59f:0x9 DW_TAG_variable
	$long,	memset..Ldebug_loc26                   // DW_AT_location
	$long,	339                             // DW_AT_abstract_origin
	$byte,	0                               // End Of Children Mark
	$byte,	0                               // End Of Children Mark
	$byte,	11                              // Abbrev [11] 0x5aa:0x32 DW_TAG_lexical_block
	$long,	memset..Ltmp65                         // DW_AT_low_pc
	$long,	memset..Ltmp69 - memset..Ltmp65                 // DW_AT_high_pc
	$byte,	9                               // Abbrev [9] 0x5b3:0x7 DW_TAG_variable
	$byte,	1                               // DW_AT_location
	$byte,	85
	$long,	1037                            // DW_AT_abstract_origin
	$byte,	28                              // Abbrev [28] 0x5ba:0x21 DW_TAG_inlined_subroutine
	$long,	704                             // DW_AT_abstract_origin
	$long,	memset..Ldebug_ranges2                 // DW_AT_ranges
	$byte,	2                               // DW_AT_call_file
	$byte,	94                              // DW_AT_call_line
	$byte,	9                               // DW_AT_call_column
	$byte,	8                               // Abbrev [8] 0x5c6:0x9 DW_TAG_formal_parameter
	$long,	memset..Ldebug_loc31                   // DW_AT_location
	$long,	712                             // DW_AT_abstract_origin
	$byte,	26                              // Abbrev [26] 0x5cf:0x5 DW_TAG_formal_parameter
	$long,	723                             // DW_AT_abstract_origin
	$byte,	27                              // Abbrev [27] 0x5d4:0x6 DW_TAG_formal_parameter
	$byte,	8                               // DW_AT_const_value
	$long,	734                             // DW_AT_abstract_origin
	$byte,	0                               // End Of Children Mark
	$byte,	0                               // End Of Children Mark
	$byte,	0                               // End Of Children Mark
	$byte,	0                               // End Of Children Mark
	$byte,	22                              // Abbrev [22] 0x5de:0x23 DW_TAG_inlined_subroutine
	$long,	926                             // DW_AT_abstract_origin
	$long,	memset..Ltmp73                         // DW_AT_low_pc
	$long,	memset..Ltmp74 - memset..Ltmp73                 // DW_AT_high_pc
	$byte,	2                               // DW_AT_call_file
	$byte,	135                             // DW_AT_call_line
	$byte,	9                               // DW_AT_call_column
	$byte,	7                               // Abbrev [7] 0x5ee:0x7 DW_TAG_formal_parameter
	$byte,	1                               // DW_AT_location
	$byte,	83
	$long,	934                             // DW_AT_abstract_origin
	$byte,	26                              // Abbrev [26] 0x5f5:0x5 DW_TAG_formal_parameter
	$long,	945                             // DW_AT_abstract_origin
	$byte,	27                              // Abbrev [27] 0x5fa:0x6 DW_TAG_formal_parameter
	$byte,	8                               // DW_AT_const_value
	$long,	956                             // DW_AT_abstract_origin
	$byte,	0                               // End Of Children Mark
	$byte,	22                              // Abbrev [22] 0x601:0x39 DW_TAG_inlined_subroutine
	$long,	183                             // DW_AT_abstract_origin
	$long,	memset..Ltmp74                         // DW_AT_low_pc
	$long,	memset..Ltmp76 - memset..Ltmp74                 // DW_AT_high_pc
	$byte,	2                               // DW_AT_call_file
	$byte,	136                             // DW_AT_call_line
	$byte,	9                               // DW_AT_call_column
	$byte,	7                               // Abbrev [7] 0x611:0x9 DW_TAG_formal_parameter
	$byte,	3                               // DW_AT_location
	$byte,	145
	$byte,	8
	$byte,	159
	$long,	195                             // DW_AT_abstract_origin
	$byte,	7                               // Abbrev [7] 0x61a:0x7 DW_TAG_formal_parameter
	$byte,	1                               // DW_AT_location
	$byte,	81
	$long,	206                             // DW_AT_abstract_origin
	$byte,	9                               // Abbrev [9] 0x621:0x9 DW_TAG_variable
	$byte,	3                               // DW_AT_location
	$byte,	145
	$byte,	8
	$byte,	159
	$long,	228                             // DW_AT_abstract_origin
	$byte,	11                              // Abbrev [11] 0x62a:0xf DW_TAG_lexical_block
	$long,	memset..Ltmp74                         // DW_AT_low_pc
	$long,	memset..Ltmp76 - memset..Ltmp74                 // DW_AT_high_pc
	$byte,	23                              // Abbrev [23] 0x633:0x5 DW_TAG_variable
	$long,	240                             // DW_AT_abstract_origin
	$byte,	0                               // End Of Children Mark
	$byte,	0                               // End Of Children Mark
	$byte,	22                              // Abbrev [22] 0x63a:0x23 DW_TAG_inlined_subroutine
	$long,	704                             // DW_AT_abstract_origin
	$long,	memset..Ltmp77                         // DW_AT_low_pc
	$long,	memset..Ltmp78 - memset..Ltmp77                 // DW_AT_high_pc
	$byte,	2                               // DW_AT_call_file
	$byte,	137                             // DW_AT_call_line
	$byte,	9                               // DW_AT_call_column
	$byte,	26                              // Abbrev [26] 0x64a:0x5 DW_TAG_formal_parameter
	$long,	712                             // DW_AT_abstract_origin
	$byte,	7                               // Abbrev [7] 0x64f:0x7 DW_TAG_formal_parameter
	$byte,	1                               // DW_AT_location
	$byte,	83
	$long,	723                             // DW_AT_abstract_origin
	$byte,	27                              // Abbrev [27] 0x656:0x6 DW_TAG_formal_parameter
	$byte,	8                               // DW_AT_const_value
	$long,	734                             // DW_AT_abstract_origin
	$byte,	0                               // End Of Children Mark
	$byte,	0                               // End Of Children Mark
	$byte,	34                              // Abbrev [34] 0x65e:0x5 DW_TAG_const_type
	$long,	54                              // DW_AT_type
	$byte,	0                               // End Of Children Mark
memset..Ldebug_info_end0:
	$section,	%debug_ranges,"",@progbits
memset..Ldebug_ranges0:
	$long,	memset..Ltmp39
	$long,	memset..Ltmp40
	$long,	memset..Ltmp41
	$long,	memset..Ltmp42
	$long,	0
	$long,	0
memset..Ldebug_ranges1:
	$long,	memset..Ltmp59
	$long,	memset..Ltmp63
	$long,	memset..Ltmp65
	$long,	memset..Ltmp69
	$long,	0
	$long,	0
memset..Ldebug_ranges2:
	$long,	memset..Ltmp65
	$long,	memset..Ltmp66
	$long,	memset..Ltmp67
	$long,	memset..Ltmp68
	$long,	0
	$long,	0
memset..Ldebug_ranges3:
	$long,	memset..Lfunc_begin0
	$long,	memset..Lfunc_end0
	$long,	memset..Lfunc_begin1
	$long,	memset..Lfunc_end1
	$long,	memset..Lfunc_begin2
	$long,	memset..Lfunc_end2
	$long,	memset..Lfunc_begin3
	$long,	memset..Lfunc_end3
	$long,	0
	$long,	0
	$section,	%debug_str,"MS",@progbits,1
memset..Linfo_string0:
	$asciz,	"clang version 12.0.0 (https://github.com/upmem/llvm - project.git d36425841d9a4d1420b7aa155675f6ae8bcf9f08)" // string offset=0
memset..Linfo_string1:
	$asciz,	"/root/uPIMulator_frontend/sdk/stdlib/memset.c" // string offset=106
memset..Linfo_string2:
	$asciz,	"/root/upmem_compiler"          // string offset=152
memset..Linfo_string3:
	$asciz,	"unsigned int"                  // string offset=173
memset..Linfo_string4:
	$asciz,	"uint32_t"                      // string offset=186
memset..Linfo_string5:
	$asciz,	"memset_wram_t"                 // string offset=195
memset..Linfo_string6:
	$asciz,	"uintptr_t"                     // string offset=209
memset..Linfo_string7:
	$asciz,	"unsigned char"                 // string offset=219
memset..Linfo_string8:
	$asciz,	"uint8_t"                       // string offset=233
memset..Linfo_string9:
	$asciz,	"__memset_wram_1align"          // string offset=241
memset..Linfo_string10:
	$asciz,	"dest"                          // string offset=262
memset..Linfo_string11:
	$asciz,	"c"                             // string offset=267
memset..Linfo_string12:
	$asciz,	"int"                           // string offset=269
memset..Linfo_string13:
	$asciz,	"len"                           // string offset=273
memset..Linfo_string14:
	$asciz,	"size_t"                        // string offset=277
memset..Linfo_string15:
	$asciz,	"dest8"                         // string offset=284
memset..Linfo_string16:
	$asciz,	"i"                             // string offset=290
memset..Linfo_string17:
	$asciz,	"__memset_wram_4align"          // string offset=292
memset..Linfo_string18:
	$asciz,	"dest32"                        // string offset=313
memset..Linfo_string19:
	$asciz,	"cccc"                          // string offset=320
memset..Linfo_string20:
	$asciz,	"mram_write"                    // string offset=325
memset..Linfo_string21:
	$asciz,	"from"                          // string offset=336
memset..Linfo_string22:
	$asciz,	"to"                            // string offset=341
memset..Linfo_string23:
	$asciz,	"nb_of_bytes"                   // string offset=344
memset..Linfo_string24:
	$asciz,	"mram_read"                     // string offset=356
memset..Linfo_string25:
	$asciz,	"__memset_mram_8align"          // string offset=366
memset..Linfo_string26:
	$asciz,	"cache64"                       // string offset=387
memset..Linfo_string27:
	$asciz,	"__ARRAY_SIZE_TYPE__"           // string offset=395
memset..Linfo_string28:
	$asciz,	"cache"                         // string offset=415
memset..Linfo_string29:
	$asciz,	"idx"                           // string offset=421
memset..Linfo_string30:
	$asciz,	"memset"                        // string offset=425
memset..Linfo_string31:
	$asciz,	"__memset_mram"                 // string offset=432
memset..Linfo_string32:
	$asciz,	"align"                         // string offset=446
memset..Linfo_string33:
	$asciz,	"align_off_mask"                // string offset=452
memset..Linfo_string34:
	$asciz,	"d"                             // string offset=467
memset..Linfo_string35:
	$asciz,	"align_offset"                  // string offset=469
memset..Linfo_string36:
	$asciz,	"head_len"                      // string offset=482
memset..Linfo_string37:
	$asciz,	"body_len"                      // string offset=491
	$addrsig,
	$addrsig_sym, __memset_wram_4align
	$addrsig_sym, __memset_mram_8align
	$addrsig_sym, __memset_mram
	$section,	%debug_line,"",@progbits
memset..Lline_table_start0:
	$text,
	$file,	"task2.c"
	$section,	%text, load_prg_memory,"ax",@progbits
	$globl,	load_prg_memory                 //  -  -  Begin function load_prg_memory
	$type,	load_prg_memory,@function
load_prg_memory:                        // @load_prg_memory
.Lfunc_begin0:
	$file,	1 "/mnt/d/Upmen/uPIMulator/python_cpp/uPIMulator_frontend/benchmark/TEST1" "dpu/task2.c"
	$loc,	1 10 0                          // dpu/task2.c:10:0
	$cfi_sections, %debug_frame
	$cfi_startproc,
// %bb.0:
	//DEBUG_VALUE: load_prg_memory:size_text < -  $r0
	$cfi_def_cfa_offset, 0
	//DEBUG_VALUE: load_prg_memory:temp < -  $r0
	$move , r1, 0
.Ltmp0:
	//DEBUG_VALUE: load_prg_memory:off < -  0
	//DEBUG_VALUE: load_prg_memory:temp < -  $r0
	//DEBUG_VALUE: load_prg_memory:size_text < -  $r0
	$loc,	1 15 5 prologue_end             // dpu/task2.c:15:5
	$lsr , r2, r0, 11, z, .LBB0_3
.Ltmp1:
// %bb.1:
	//DEBUG_VALUE: load_prg_memory:temp < -  $r0
	//DEBUG_VALUE: load_prg_memory:size_text < -  $r0
	//DEBUG_VALUE: load_prg_memory:off < -  0
	$loc,	1 0 5 is_stmt 0                 // dpu/task2.c:0:5
	$move , r1, 0
.Ltmp2:
.LBB0_2:                                // =>This Inner Loop Header: Depth=1
	//DEBUG_VALUE: load_prg_memory:temp < -  $r0
	//DEBUG_VALUE: load_prg_memory:temp < -  $r0
	//DEBUG_VALUE: load_prg_memory:off < -  $r1
	$loc,	1 17 12 is_stmt 1               // dpu/task2.c:17:12
	$add , r0, r0,  - 2048
.Ltmp3:
	//DEBUG_VALUE: load_prg_memory:temp < -  $r0
	$loc,	1 18 29                         // dpu/task2.c:18:29
	$or , r2, r1,  - 16777216
.Ltmp4:
	//DEBUG_VALUE: ra < -  $r2
	$loc,	1 20 7                          // dpu/task2.c:20:7
	// inline asm
	$ldmai , r2, r1, 0

	// inline asm
	$loc,	1 25 11                         // dpu/task2.c:25:11
	$add , r1, r1, 2048
.Ltmp5:
	//DEBUG_VALUE: load_prg_memory:off < -  $r1
	$loc,	1 15 5                          // dpu/task2.c:15:5
	$lsr , r2, r0, 11, nz, .LBB0_2
.Ltmp6:
.LBB0_3:
	//DEBUG_VALUE: load_prg_memory:temp < -  $r0
	$loc,	1 28 14                         // dpu/task2.c:28:14
	$and , r2, r0, 8, z, .LBB0_4
.Ltmp7:
// %bb.5:
	//DEBUG_VALUE: load_prg_memory:temp < -  $r0
	$loc,	1 0 14 is_stmt 0                // dpu/task2.c:0:14
	$lsl , r0, r0, 21
.Ltmp8:
	$and , r0, r0,  - 16777216
	$or , r0, r0, r1
.Ltmp9:
	//DEBUG_VALUE: load_prg_memory:ra < -  $r0
	$loc,	1 32 5 is_stmt 1                // dpu/task2.c:32:5
	// inline asm
	$ldmai , r0, r1, 0

	// inline asm
	$loc,	1 37 3                          // dpu/task2.c:37:3
	$jump , r23
.Ltmp10:
.LBB0_4:
	//DEBUG_VALUE: load_prg_memory:temp < -  $r0
	$loc,	1 0 3 is_stmt 0                 // dpu/task2.c:0:3
	$move , r2,  - 16777216
	$lsl_add , r0, r2, r0, 21
.Ltmp11:
	$and , r0, r0,  - 16777216
	$or , r0, r0, r1
.Ltmp12:
	//DEBUG_VALUE: load_prg_memory:ra < -  $r0
	$loc,	1 32 5 is_stmt 1                // dpu/task2.c:32:5
	// inline asm
	$ldmai , r0, r1, 0

	// inline asm
	$loc,	1 37 3                          // dpu/task2.c:37:3
	$jump , r23
.Ltmp13:
.Lfunc_end0:
	$size,	load_prg_memory, .Lfunc_end0 - load_prg_memory
	$cfi_endproc,
	$section,	%stack_sizes,"o",@progbits,%text, load_prg_memory
	$long,	.Lfunc_begin0
	$byte,	0
	$section,	%text, load_prg_memory,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, main,"ax",@progbits
	$globl,	main                            //  -  -  Begin function main
	$type,	main,@function
main:                                   // @main
.Lfunc_begin1:
	$loc,	1 38 0                          // dpu/task2.c:38:0
	$cfi_startproc,
// %bb.0:
	$cfi_def_cfa_offset, 0
	$loc,	1 39 32 prologue_end            // dpu/task2.c:39:32
	$sd , r22, 0, 0
	$move , r1, 65536
	$add , r2, r22, 0
.Ltmp14:
	//DEBUG_VALUE: mram_write:nb_of_bytes < -  8
	//DEBUG_VALUE: mram_write:from < -  undef
	//DEBUG_VALUE: mram_write:to < -  $r1
	$file,	2 "/usr/bin/../share/upmem/include/syslib" "mram.h"
	$loc,	2 66 24                         // /usr/bin/../share/upmem/include/syslib/mram.h:66:24
	$sdma , r2, r1, 0
	$move , r5, 1
	$move , r4, 2
.Ltmp15:
	$loc,	1 42 9                          // dpu/task2.c:42:9
	$sd , r22, 0, d4
.Ltmp16:
	//DEBUG_VALUE: mram_write:from < -  undef
	$loc,	1 0 9 is_stmt 0                 // dpu/task2.c:0:9
	$move , r0, 0
.Ltmp17:
	//DEBUG_VALUE: mram_write:nb_of_bytes < -  8
	//DEBUG_VALUE: mram_write:to < -  $r1
	$loc,	2 66 24 is_stmt 1               // /usr/bin/../share/upmem/include/syslib/mram.h:66:24
	$sdma , r2, r1, 0
.Ltmp18:
	$loc,	1 45 5                          // dpu/task2.c:45:5
	$jump , r23
.Ltmp19:
.Lfunc_end1:
	$size,	main, .Lfunc_end1 - main
	$cfi_endproc,
	$section,	%stack_sizes,"o",@progbits,%text, main
	$long,	.Lfunc_begin1
	$byte,	8
	$section,	%text, main,"ax",@progbits
                                        //  -  -  End function
	$section,	%debug_loc,"",@progbits
.Ldebug_loc0:
	$long,	 - 1
	$long,	.Lfunc_begin0                   //   base address
	$long,	.Lfunc_begin0 - .Lfunc_begin0
	$long,	.Ltmp2 - .Lfunc_begin0
	$short,	1                               // Loc expr size
	$byte,	80                              // DW_OP_reg0
	$long,	0
	$long,	0
.Ldebug_loc1:
	$long,	 - 1
	$long,	.Lfunc_begin0                   //   base address
	$long,	.Lfunc_begin0 - .Lfunc_begin0
	$long,	.Ltmp8 - .Lfunc_begin0
	$short,	1                               // Loc expr size
	$byte,	80                              // DW_OP_reg0
	$long,	.Ltmp10 - .Lfunc_begin0
	$long,	.Ltmp11 - .Lfunc_begin0
	$short,	1                               // Loc expr size
	$byte,	80                              // DW_OP_reg0
	$long,	0
	$long,	0
.Ldebug_loc2:
	$long,	 - 1
	$long,	.Lfunc_begin0                   //   base address
	$long,	.Ltmp0 - .Lfunc_begin0
	$long,	.Ltmp2 - .Lfunc_begin0
	$short,	2                               // Loc expr size
	$byte,	48                              // DW_OP_lit0
	$byte,	159                             // DW_OP_stack_value
	$long,	.Ltmp2 - .Lfunc_begin0
	$long,	.Ltmp6 - .Lfunc_begin0
	$short,	1                               // Loc expr size
	$byte,	81                              // DW_OP_reg1
	$long,	0
	$long,	0
.Ldebug_loc3:
	$long,	 - 1
	$long,	.Lfunc_begin0                   //   base address
	$long,	.Ltmp4 - .Lfunc_begin0
	$long,	.Ltmp6 - .Lfunc_begin0
	$short,	1                               // Loc expr size
	$byte,	82                              // DW_OP_reg2
	$long,	0
	$long,	0
.Ldebug_loc4:
	$long,	 - 1
	$long,	.Lfunc_begin0                   //   base address
	$long,	.Ltmp9 - .Lfunc_begin0
	$long,	.Ltmp10 - .Lfunc_begin0
	$short,	1                               // Loc expr size
	$byte,	80                              // DW_OP_reg0
	$long,	.Ltmp12 - .Lfunc_begin0
	$long,	.Lfunc_end0 - .Lfunc_begin0
	$short,	1                               // Loc expr size
	$byte,	80                              // DW_OP_reg0
	$long,	0
	$long,	0
	$section,	%debug_abbrev,"",@progbits
	$byte,	1                               // Abbreviation Code
	$byte,	17                              // DW_TAG_compile_unit
	$byte,	1                               // DW_CHILDREN_yes
	$byte,	37                              // DW_AT_producer
	$byte,	14                              // DW_FORM_strp
	$byte,	19                              // DW_AT_language
	$byte,	5                               // DW_FORM_data2
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	16                              // DW_AT_stmt_list
	$byte,	23                              // DW_FORM_sec_offset
	$byte,	27                              // DW_AT_comp_dir
	$byte,	14                              // DW_FORM_strp
	$byte,	17                              // DW_AT_low_pc
	$byte,	1                               // DW_FORM_addr
	$byte,	85                              // DW_AT_ranges
	$byte,	23                              // DW_FORM_sec_offset
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	2                               // Abbreviation Code
	$byte,	15                              // DW_TAG_pointer_type
	$byte,	0                               // DW_CHILDREN_no
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	3                               // Abbreviation Code
	$byte,	46                              // DW_TAG_subprogram
	$byte,	1                               // DW_CHILDREN_yes
	$byte,	17                              // DW_AT_low_pc
	$byte,	1                               // DW_FORM_addr
	$byte,	18                              // DW_AT_high_pc
	$byte,	6                               // DW_FORM_data4
	$byte,	64                              // DW_AT_frame_base
	$byte,	24                              // DW_FORM_exprloc
	$ascii,	"\227B"                         // DW_AT_GNU_all_call_sites
	$byte,	25                              // DW_FORM_flag_present
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	39                              // DW_AT_prototyped
	$byte,	25                              // DW_FORM_flag_present
	$byte,	63                              // DW_AT_external
	$byte,	25                              // DW_FORM_flag_present
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	4                               // Abbreviation Code
	$byte,	5                               // DW_TAG_formal_parameter
	$byte,	0                               // DW_CHILDREN_no
	$byte,	2                               // DW_AT_location
	$byte,	23                              // DW_FORM_sec_offset
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	5                               // Abbreviation Code
	$byte,	52                              // DW_TAG_variable
	$byte,	0                               // DW_CHILDREN_no
	$byte,	2                               // DW_AT_location
	$byte,	23                              // DW_FORM_sec_offset
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	6                               // Abbreviation Code
	$byte,	11                              // DW_TAG_lexical_block
	$byte,	1                               // DW_CHILDREN_yes
	$byte,	17                              // DW_AT_low_pc
	$byte,	1                               // DW_FORM_addr
	$byte,	18                              // DW_AT_high_pc
	$byte,	6                               // DW_FORM_data4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	7                               // Abbreviation Code
	$byte,	46                              // DW_TAG_subprogram
	$byte,	1                               // DW_CHILDREN_yes
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	39                              // DW_AT_prototyped
	$byte,	25                              // DW_FORM_flag_present
	$byte,	32                              // DW_AT_inline
	$byte,	11                              // DW_FORM_data1
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	8                               // Abbreviation Code
	$byte,	5                               // DW_TAG_formal_parameter
	$byte,	0                               // DW_CHILDREN_no
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	9                               // Abbreviation Code
	$byte,	15                              // DW_TAG_pointer_type
	$byte,	0                               // DW_CHILDREN_no
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	10                              // Abbreviation Code
	$byte,	38                              // DW_TAG_const_type
	$byte,	0                               // DW_CHILDREN_no
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	11                              // Abbreviation Code
	$byte,	36                              // DW_TAG_base_type
	$byte,	0                               // DW_CHILDREN_no
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	62                              // DW_AT_encoding
	$byte,	11                              // DW_FORM_data1
	$byte,	11                              // DW_AT_byte_size
	$byte,	11                              // DW_FORM_data1
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	12                              // Abbreviation Code
	$byte,	46                              // DW_TAG_subprogram
	$byte,	1                               // DW_CHILDREN_yes
	$byte,	17                              // DW_AT_low_pc
	$byte,	1                               // DW_FORM_addr
	$byte,	18                              // DW_AT_high_pc
	$byte,	6                               // DW_FORM_data4
	$byte,	64                              // DW_AT_frame_base
	$byte,	24                              // DW_FORM_exprloc
	$ascii,	"\227B"                         // DW_AT_GNU_all_call_sites
	$byte,	25                              // DW_FORM_flag_present
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	39                              // DW_AT_prototyped
	$byte,	25                              // DW_FORM_flag_present
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	63                              // DW_AT_external
	$byte,	25                              // DW_FORM_flag_present
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	13                              // Abbreviation Code
	$byte,	52                              // DW_TAG_variable
	$byte,	0                               // DW_CHILDREN_no
	$byte,	2                               // DW_AT_location
	$byte,	24                              // DW_FORM_exprloc
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$ascii,	"\210\001"                      // DW_AT_alignment
	$byte,	15                              // DW_FORM_udata
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	14                              // Abbreviation Code
	$byte,	29                              // DW_TAG_inlined_subroutine
	$byte,	1                               // DW_CHILDREN_yes
	$byte,	49                              // DW_AT_abstract_origin
	$byte,	19                              // DW_FORM_ref4
	$byte,	17                              // DW_AT_low_pc
	$byte,	1                               // DW_FORM_addr
	$byte,	18                              // DW_AT_high_pc
	$byte,	6                               // DW_FORM_data4
	$byte,	88                              // DW_AT_call_file
	$byte,	11                              // DW_FORM_data1
	$byte,	89                              // DW_AT_call_line
	$byte,	11                              // DW_FORM_data1
	$byte,	87                              // DW_AT_call_column
	$byte,	11                              // DW_FORM_data1
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	15                              // Abbreviation Code
	$byte,	5                               // DW_TAG_formal_parameter
	$byte,	0                               // DW_CHILDREN_no
	$byte,	49                              // DW_AT_abstract_origin
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	16                              // Abbreviation Code
	$byte,	5                               // DW_TAG_formal_parameter
	$byte,	0                               // DW_CHILDREN_no
	$byte,	2                               // DW_AT_location
	$byte,	24                              // DW_FORM_exprloc
	$byte,	49                              // DW_AT_abstract_origin
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	17                              // Abbreviation Code
	$byte,	5                               // DW_TAG_formal_parameter
	$byte,	0                               // DW_CHILDREN_no
	$byte,	28                              // DW_AT_const_value
	$byte,	15                              // DW_FORM_udata
	$byte,	49                              // DW_AT_abstract_origin
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	18                              // Abbreviation Code
	$byte,	1                               // DW_TAG_array_type
	$byte,	1                               // DW_CHILDREN_yes
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	19                              // Abbreviation Code
	$byte,	33                              // DW_TAG_subrange_type
	$byte,	0                               // DW_CHILDREN_no
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	55                              // DW_AT_count
	$byte,	11                              // DW_FORM_data1
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	20                              // Abbreviation Code
	$byte,	36                              // DW_TAG_base_type
	$byte,	0                               // DW_CHILDREN_no
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	11                              // DW_AT_byte_size
	$byte,	11                              // DW_FORM_data1
	$byte,	62                              // DW_AT_encoding
	$byte,	11                              // DW_FORM_data1
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	0                               // EOM(3)
	$section,	%debug_info,"",@progbits
.Lcu_begin0:
	$long,	.Ldebug_info_end0 - .Ldebug_info_start0 // Length of Unit
.Ldebug_info_start0:
	$short,	4                               // DWARF version number
	$long,	%debug_abbrev                   // Offset Into Abbrev. Section
	$byte,	4                               // Address Size (in bytes)
	$byte,	1                               // Abbrev [1] 0xb:0x140 DW_TAG_compile_unit
	$long,	.Linfo_string0                  // DW_AT_producer
	$short,	12                              // DW_AT_language
	$long,	.Linfo_string1                  // DW_AT_name
	$long,	.Lline_table_start0             // DW_AT_stmt_list
	$long,	.Linfo_string2                  // DW_AT_comp_dir
	$long,	0                               // DW_AT_low_pc
	$long,	.Ldebug_ranges0                 // DW_AT_ranges
	$byte,	2                               // Abbrev [2] 0x26:0x1 DW_TAG_pointer_type
	$byte,	3                               // Abbrev [3] 0x27:0x67 DW_TAG_subprogram
	$long,	.Lfunc_begin0                   // DW_AT_low_pc
	$long,	.Lfunc_end0 - .Lfunc_begin0       // DW_AT_high_pc
	$byte,	1                               // DW_AT_frame_base
	$byte,	102
                                        // DW_AT_GNU_all_call_sites
	$long,	.Linfo_string8                  // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	10                              // DW_AT_decl_line
                                        // DW_AT_prototyped
                                        // DW_AT_external
	$byte,	4                               // Abbrev [4] 0x38:0xf DW_TAG_formal_parameter
	$long,	.Ldebug_loc0                    // DW_AT_location
	$long,	.Linfo_string11                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	10                              // DW_AT_decl_line
	$long,	190                             // DW_AT_type
	$byte,	5                               // Abbrev [5] 0x47:0xf DW_TAG_variable
	$long,	.Ldebug_loc1                    // DW_AT_location
	$long,	.Linfo_string12                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	12                              // DW_AT_decl_line
	$long,	190                             // DW_AT_type
	$byte,	5                               // Abbrev [5] 0x56:0xf DW_TAG_variable
	$long,	.Ldebug_loc2                    // DW_AT_location
	$long,	.Linfo_string13                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	14                              // DW_AT_decl_line
	$long,	190                             // DW_AT_type
	$byte,	5                               // Abbrev [5] 0x65:0xf DW_TAG_variable
	$long,	.Ldebug_loc4                    // DW_AT_location
	$long,	.Linfo_string14                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	27                              // DW_AT_decl_line
	$long,	190                             // DW_AT_type
	$byte,	6                               // Abbrev [6] 0x74:0x19 DW_TAG_lexical_block
	$long,	.Ltmp2                          // DW_AT_low_pc
	$long,	.Ltmp5 - .Ltmp2                   // DW_AT_high_pc
	$byte,	5                               // Abbrev [5] 0x7d:0xf DW_TAG_variable
	$long,	.Ldebug_loc3                    // DW_AT_location
	$long,	.Linfo_string14                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	18                              // DW_AT_decl_line
	$long,	190                             // DW_AT_type
	$byte,	0                               // End Of Children Mark
	$byte,	0                               // End Of Children Mark
	$byte,	7                               // Abbrev [7] 0x8e:0x2a DW_TAG_subprogram
	$long,	.Linfo_string3                  // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	60                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	$byte,	1                               // DW_AT_inline
	$byte,	8                               // Abbrev [8] 0x96:0xb DW_TAG_formal_parameter
	$long,	.Linfo_string4                  // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	60                              // DW_AT_decl_line
	$long,	184                             // DW_AT_type
	$byte,	8                               // Abbrev [8] 0xa1:0xb DW_TAG_formal_parameter
	$long,	.Linfo_string5                  // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	60                              // DW_AT_decl_line
	$long,	38                              // DW_AT_type
	$byte,	8                               // Abbrev [8] 0xac:0xb DW_TAG_formal_parameter
	$long,	.Linfo_string6                  // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	60                              // DW_AT_decl_line
	$long,	190                             // DW_AT_type
	$byte,	0                               // End Of Children Mark
	$byte,	9                               // Abbrev [9] 0xb8:0x5 DW_TAG_pointer_type
	$long,	189                             // DW_AT_type
	$byte,	10                              // Abbrev [10] 0xbd:0x1 DW_TAG_const_type
	$byte,	11                              // Abbrev [11] 0xbe:0x7 DW_TAG_base_type
	$long,	.Linfo_string7                  // DW_AT_name
	$byte,	7                               // DW_AT_encoding
	$byte,	4                               // DW_AT_byte_size
	$byte,	12                              // Abbrev [12] 0xc5:0x6b DW_TAG_subprogram
	$long,	.Lfunc_begin1                   // DW_AT_low_pc
	$long,	.Lfunc_end1 - .Lfunc_begin1       // DW_AT_high_pc
	$byte,	1                               // DW_AT_frame_base
	$byte,	102
                                        // DW_AT_GNU_all_call_sites
	$long,	.Linfo_string9                  // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	38                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	$long,	304                             // DW_AT_type
                                        // DW_AT_external
	$byte,	13                              // Abbrev [13] 0xda:0xf DW_TAG_variable
	$byte,	2                               // DW_AT_location
	$byte,	145
	$byte,	0
	$long,	.Linfo_string15                 // DW_AT_name
	$byte,	8                               // DW_AT_alignment
	$byte,	1                               // DW_AT_decl_file
	$byte,	39                              // DW_AT_decl_line
	$long,	311                             // DW_AT_type
	$byte,	14                              // Abbrev [14] 0xe9:0x23 DW_TAG_inlined_subroutine
	$long,	142                             // DW_AT_abstract_origin
	$long,	.Ltmp14                         // DW_AT_low_pc
	$long,	.Ltmp15 - .Ltmp14                 // DW_AT_high_pc
	$byte,	1                               // DW_AT_call_file
	$byte,	40                              // DW_AT_call_line
	$byte,	5                               // DW_AT_call_column
	$byte,	15                              // Abbrev [15] 0xf9:0x5 DW_TAG_formal_parameter
	$long,	150                             // DW_AT_abstract_origin
	$byte,	16                              // Abbrev [16] 0xfe:0x7 DW_TAG_formal_parameter
	$byte,	1                               // DW_AT_location
	$byte,	81
	$long,	161                             // DW_AT_abstract_origin
	$byte,	17                              // Abbrev [17] 0x105:0x6 DW_TAG_formal_parameter
	$byte,	8                               // DW_AT_const_value
	$long,	172                             // DW_AT_abstract_origin
	$byte,	0                               // End Of Children Mark
	$byte,	14                              // Abbrev [14] 0x10c:0x23 DW_TAG_inlined_subroutine
	$long,	142                             // DW_AT_abstract_origin
	$long,	.Ltmp17                         // DW_AT_low_pc
	$long,	.Ltmp18 - .Ltmp17                 // DW_AT_high_pc
	$byte,	1                               // DW_AT_call_file
	$byte,	44                              // DW_AT_call_line
	$byte,	5                               // DW_AT_call_column
	$byte,	15                              // Abbrev [15] 0x11c:0x5 DW_TAG_formal_parameter
	$long,	150                             // DW_AT_abstract_origin
	$byte,	16                              // Abbrev [16] 0x121:0x7 DW_TAG_formal_parameter
	$byte,	1                               // DW_AT_location
	$byte,	81
	$long,	161                             // DW_AT_abstract_origin
	$byte,	17                              // Abbrev [17] 0x128:0x6 DW_TAG_formal_parameter
	$byte,	8                               // DW_AT_const_value
	$long,	172                             // DW_AT_abstract_origin
	$byte,	0                               // End Of Children Mark
	$byte,	0                               // End Of Children Mark
	$byte,	11                              // Abbrev [11] 0x130:0x7 DW_TAG_base_type
	$long,	.Linfo_string10                 // DW_AT_name
	$byte,	5                               // DW_AT_encoding
	$byte,	4                               // DW_AT_byte_size
	$byte,	18                              // Abbrev [18] 0x137:0xc DW_TAG_array_type
	$long,	190                             // DW_AT_type
	$byte,	19                              // Abbrev [19] 0x13c:0x6 DW_TAG_subrange_type
	$long,	323                             // DW_AT_type
	$byte,	2                               // DW_AT_count
	$byte,	0                               // End Of Children Mark
	$byte,	20                              // Abbrev [20] 0x143:0x7 DW_TAG_base_type
	$long,	.Linfo_string16                 // DW_AT_name
	$byte,	8                               // DW_AT_byte_size
	$byte,	7                               // DW_AT_encoding
	$byte,	0                               // End Of Children Mark
.Ldebug_info_end0:
	$section,	%debug_ranges,"",@progbits
.Ldebug_ranges0:
	$long,	.Lfunc_begin0
	$long,	.Lfunc_end0
	$long,	.Lfunc_begin1
	$long,	.Lfunc_end1
	$long,	0
	$long,	0
	$section,	%debug_str,"MS",@progbits,1
.Linfo_string0:
	$asciz,	"clang version 12.0.0 (https://github.com/upmem/llvm - project.git 02a1f3ffa0f15d3c21b60ffc12196131c3e3cffa)" // string offset=0
.Linfo_string1:
	$asciz,	"dpu/task2.c"                   // string offset=106
.Linfo_string2:
	$asciz,	"/mnt/d/Upmen/uPIMulator/python_cpp/uPIMulator_frontend/benchmark/TEST1" // string offset=118
.Linfo_string3:
	$asciz,	"mram_write"                    // string offset=189
.Linfo_string4:
	$asciz,	"from"                          // string offset=200
.Linfo_string5:
	$asciz,	"to"                            // string offset=205
.Linfo_string6:
	$asciz,	"nb_of_bytes"                   // string offset=208
.Linfo_string7:
	$asciz,	"unsigned int"                  // string offset=220
.Linfo_string8:
	$asciz,	"load_prg_memory"               // string offset=233
.Linfo_string9:
	$asciz,	"main"                          // string offset=249
.Linfo_string10:
	$asciz,	"int"                           // string offset=254
.Linfo_string11:
	$asciz,	"size_text"                     // string offset=258
.Linfo_string12:
	$asciz,	"temp"                          // string offset=268
.Linfo_string13:
	$asciz,	"off"                           // string offset=273
.Linfo_string14:
	$asciz,	"ra"                            // string offset=277
.Linfo_string15:
	$asciz,	"a"                             // string offset=280
.Linfo_string16:
	$asciz,	"__ARRAY_SIZE_TYPE__"           // string offset=282
	$addrsig,
	$section,	%debug_line,"",@progbits
.Lline_table_start0:
	$text,
	$file,	"stdio.c"
	$file,	1 "/root" "uPIMulator_frontend/sdk/stdlib/stdio.c"
	$file,	2 "/root" "uPIMulator_frontend/sdk/stdlib/stdint.h"
	$section,	%text, printf,"ax",@progbits
	$globl,	printf                          //  -  -  Begin function printf
	$type,	printf,@function
printf:                                 // @printf
stdio..Lfunc_begin0:
	$loc,	1 102 0                         // uPIMulator_frontend/sdk/stdlib/stdio.c:102:0
	$cfi_sections, %debug_frame
	$cfi_startproc,
// %bb.0:
	//DEBUG_VALUE: printf:format < -  $r0
	$cfi_def_cfa_offset,  - 48
	$cfi_offset, 23,  - 8
	$cfi_offset, 22,  - 4
	$sd , r22, 40, d22
	$add , r22, r22, 48
	$cfi_offset, 15,  - 32
	$cfi_offset, 14,  - 28
	$sd , r22,  - 32, d14
	$cfi_offset, 17,  - 40
	$cfi_offset, 16,  - 36
	$sd , r22,  - 40, d16
	$cfi_offset, 19,  - 48
	$cfi_offset, 18,  - 44
	$sd , r22,  - 48, d18
	$move , r14, r0
stdio..Ltmp0:
	//DEBUG_VALUE: printf:current_format_char_ptr < -  undef
	//DEBUG_VALUE: printf:insert_string_arg_end_character < -  0
	//DEBUG_VALUE: printf:insert_string_arg < -  1
	//DEBUG_VALUE: printf:format < -  $r14
	$loc,	1 107 5 prologue_end            // uPIMulator_frontend/sdk/stdlib/stdio.c:107:5
	$call , r23, stdio.__open_print_sequence
stdio..Ltmp1:
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	$loc,	1 110 5                         // uPIMulator_frontend/sdk/stdlib/stdio.c:110:5
	$sub , r0, r22, 56, false
	$sw , r22,  - 24, r0
	$move , r0, 1
	$loc,	1 0 0 is_stmt 0                 // uPIMulator_frontend/sdk/stdlib/stdio.c:0:0
	$move , r15, r14, true, stdio..LBB0_1
stdio..Ltmp2:
stdio..LBB0_19:                               //   in Loop: Header=BB0_1 Depth=1
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r15
	//DEBUG_VALUE: printf:format < -  $r14
	//DEBUG_VALUE: printf:insert_string_arg_end_character < -  0
	//DEBUG_VALUE: printf:insert_string_arg < -  undef
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r15
	$loc,	1 112 46 is_stmt 1              // uPIMulator_frontend/sdk/stdlib/stdio.c:112:46
	$add , r15, r15, 1
stdio..Ltmp3:
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r15
	$loc,	1 0 46 is_stmt 0                // uPIMulator_frontend/sdk/stdlib/stdio.c:0:46
	$move , r0, r16
stdio..Ltmp4:
stdio..LBB0_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_9 Depth 2
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:format < -  $r14
	//DEBUG_VALUE: printf:insert_string_arg_end_character < -  0
	//DEBUG_VALUE: printf:insert_string_arg < -  undef
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r15
	$loc,	1 112 12                        // uPIMulator_frontend/sdk/stdlib/stdio.c:112:12
	$lbu , r1, r15, 0
stdio..Ltmp5:
	$loc,	1 112 5                         // uPIMulator_frontend/sdk/stdlib/stdio.c:112:5
	$jeq , r1, 37, stdio..LBB0_6
stdio..Ltmp6:
// %bb.2:                               //   in Loop: Header=BB0_1 Depth=1
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r15
	//DEBUG_VALUE: printf:format < -  $r14
	//DEBUG_VALUE: printf:insert_string_arg_end_character < -  0
	$loc,	1 0 5                           // uPIMulator_frontend/sdk/stdlib/stdio.c:0:5
	$jneq , r1, 0, stdio..LBB0_3
	$jump , stdio..LBB0_20
stdio..Ltmp7:
stdio..LBB0_6:                                //   in Loop: Header=BB0_1 Depth=1
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r15
	//DEBUG_VALUE: printf:format < -  $r14
	//DEBUG_VALUE: printf:insert_string_arg_end_character < -  0
	$loc,	1 115 17 is_stmt 1              // uPIMulator_frontend/sdk/stdlib/stdio.c:115:17
	$lbu , r1, r15, 1
stdio..Ltmp8:
	$loc,	1 114 13                        // uPIMulator_frontend/sdk/stdlib/stdio.c:114:13
	$add , r15, r15, 1
stdio..Ltmp9:
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r15
	$loc,	1 115 17                        // uPIMulator_frontend/sdk/stdlib/stdio.c:115:17
	$jeq , r1, 37, stdio..LBB0_3
stdio..Ltmp10:
// %bb.7:                               //   in Loop: Header=BB0_1 Depth=1
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r15
	//DEBUG_VALUE: printf:format < -  $r14
	//DEBUG_VALUE: printf:insert_string_arg_end_character < -  0
	$jeq , r1, 0, stdio..LBB0_20
stdio..Ltmp11:
// %bb.8:                               //   in Loop: Header=BB0_1 Depth=1
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r15
	//DEBUG_VALUE: printf:format < -  $r14
	//DEBUG_VALUE: printf:insert_string_arg_end_character < -  0
	$loc,	1 0 17 is_stmt 0                // uPIMulator_frontend/sdk/stdlib/stdio.c:0:17
	$move , r0, 37
	$loc,	1 120 13 is_stmt 1              // uPIMulator_frontend/sdk/stdlib/stdio.c:120:13
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..Ltmp12:
	$loc,	1 0 13 is_stmt 0                // uPIMulator_frontend/sdk/stdlib/stdio.c:0:13
	$jump , stdio..LBB0_9
stdio..Ltmp13:
stdio..LBB0_18:                               //   in Loop: Header=BB0_9 Depth=2
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r15
	//DEBUG_VALUE: printf:format < -  $r14
	//DEBUG_VALUE: printf:insert_string_arg_end_character < -  0
	$loc,	1 136 17 is_stmt 1              // uPIMulator_frontend/sdk/stdlib/stdio.c:136:17
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..Ltmp14:
	$loc,	1 138 23                        // uPIMulator_frontend/sdk/stdlib/stdio.c:138:23
	$lbu , r0, r15, 0
	$loc,	1 138 56 is_stmt 0              // uPIMulator_frontend/sdk/stdlib/stdio.c:138:56
	$and , r0, r0, 223
	$add , r0, r0,  - 65
	$and , r0, r0, 255
	$jltu , r0, 26, stdio..LBB0_19
stdio..Ltmp15:
stdio..LBB0_17:                               //   in Loop: Header=BB0_9 Depth=2
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:format < -  $r14
	//DEBUG_VALUE: printf:insert_string_arg_end_character < -  0
	$loc,	1 0 0                           // uPIMulator_frontend/sdk/stdlib/stdio.c:0:0
	$add , r15, r15, 1
stdio..Ltmp16:
stdio..LBB0_9:                                //   Parent Loop BB0_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:format < -  $r14
	//DEBUG_VALUE: printf:insert_string_arg_end_character < -  0
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r15
	$loc,	1 122 20 is_stmt 1              // uPIMulator_frontend/sdk/stdlib/stdio.c:122:20
	$lbu , r0, r15, 0
	$move , r16, 1
	$loc,	1 122 13 is_stmt 0              // uPIMulator_frontend/sdk/stdlib/stdio.c:122:13
	$jles , r0, 107, stdio..LBB0_10
stdio..Ltmp17:
// %bb.14:                              //   in Loop: Header=BB0_9 Depth=2
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r15
	//DEBUG_VALUE: printf:format < -  $r14
	//DEBUG_VALUE: printf:insert_string_arg_end_character < -  0
	$jeq , r0, 122, stdio..LBB0_17
stdio..Ltmp18:
// %bb.15:                              //   in Loop: Header=BB0_9 Depth=2
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r15
	//DEBUG_VALUE: printf:format < -  $r14
	//DEBUG_VALUE: printf:insert_string_arg_end_character < -  0
	$jneq , r0, 108, stdio..LBB0_18
stdio..Ltmp19:
// %bb.16:                              //   in Loop: Header=BB0_9 Depth=2
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r15
	//DEBUG_VALUE: printf:format < -  $r14
	//DEBUG_VALUE: printf:insert_string_arg_end_character < -  0
	$loc,	1 0 13                          // uPIMulator_frontend/sdk/stdlib/stdio.c:0:13
	$move , r0, 108
stdio..Ltmp20:
	$loc,	1 124 21 is_stmt 1              // uPIMulator_frontend/sdk/stdlib/stdio.c:124:21
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..Ltmp21:
	//DEBUG_VALUE: printf:current_format_char_ptr < -  [DW_OP_plus_uconst 1, DW_OP_stack_value] $r15
	$loc,	1 0 21 is_stmt 0                // uPIMulator_frontend/sdk/stdlib/stdio.c:0:21
	$jump , stdio..LBB0_17
stdio..Ltmp22:
stdio..LBB0_10:                               //   in Loop: Header=BB0_9 Depth=2
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r15
	//DEBUG_VALUE: printf:format < -  $r14
	//DEBUG_VALUE: printf:insert_string_arg_end_character < -  0
	$loc,	1 122 13 is_stmt 1              // uPIMulator_frontend/sdk/stdlib/stdio.c:122:13
	$jeq , r0, 76, stdio..LBB0_17
stdio..Ltmp23:
// %bb.11:                              //   in Loop: Header=BB0_9 Depth=2
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r15
	//DEBUG_VALUE: printf:format < -  $r14
	//DEBUG_VALUE: printf:insert_string_arg_end_character < -  0
	$jeq , r0, 0, stdio..LBB0_19
stdio..Ltmp24:
// %bb.12:                              //   in Loop: Header=BB0_9 Depth=2
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r15
	//DEBUG_VALUE: printf:format < -  $r14
	//DEBUG_VALUE: printf:insert_string_arg_end_character < -  0
	$jneq , r0, 105, stdio..LBB0_18
stdio..Ltmp25:
// %bb.13:                              //   in Loop: Header=BB0_1 Depth=1
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r15
	//DEBUG_VALUE: printf:format < -  $r14
	//DEBUG_VALUE: printf:insert_string_arg_end_character < -  0
	$loc,	1 0 13 is_stmt 0                // uPIMulator_frontend/sdk/stdlib/stdio.c:0:13
	$move , r0, 100
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..Ltmp26:
	//DEBUG_VALUE: printf:insert_string_arg < -  0
	$jump , stdio..LBB0_19
stdio..Ltmp27:
stdio..LBB0_3:                                //   in Loop: Header=BB0_1 Depth=1
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r15
	//DEBUG_VALUE: printf:format < -  $r14
	//DEBUG_VALUE: printf:insert_string_arg_end_character < -  0
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r15
	//DEBUG_LABEL: standard_character_format_process
	$move , r16, 0
stdio..Ltmp28:
	$loc,	1 149 17 is_stmt 1              // uPIMulator_frontend/sdk/stdlib/stdio.c:149:17
	$and , r0, r0, 1, z, stdio..LBB0_19
stdio..Ltmp29:
// %bb.4:                               //   in Loop: Header=BB0_1 Depth=1
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r15
	//DEBUG_VALUE: printf:format < -  $r14
	//DEBUG_VALUE: printf:insert_string_arg_end_character < -  0
	$loc,	1 0 17 is_stmt 0                // uPIMulator_frontend/sdk/stdlib/stdio.c:0:17
	$move , r0, 37
stdio..Ltmp30:
	$loc,	1 150 17 is_stmt 1              // uPIMulator_frontend/sdk/stdlib/stdio.c:150:17
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..Ltmp31:
	$loc,	1 0 17 is_stmt 0                // uPIMulator_frontend/sdk/stdlib/stdio.c:0:17
	$move , r0, 115
stdio..Ltmp32:
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..Ltmp33:
	//DEBUG_VALUE: printf:insert_string_arg < -  0
	$jump , stdio..LBB0_19
stdio..Ltmp34:
stdio..LBB0_20:
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r15
	//DEBUG_VALUE: printf:format < -  $r14
	//DEBUG_VALUE: printf:insert_string_arg_end_character < -  0
	$move , r15, 0
stdio..Ltmp35:
	$loc,	1 157 5 is_stmt 1               // uPIMulator_frontend/sdk/stdlib/stdio.c:157:5
	$move , r0, r15
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..Ltmp36:
	$loc,	1 0 5 is_stmt 0                 // uPIMulator_frontend/sdk/stdlib/stdio.c:0:5
	$add , r0, r22,  - 16
stdio..Ltmp37:
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	$loc,	1 160 5 is_stmt 1               // uPIMulator_frontend/sdk/stdlib/stdio.c:160:5
	$or , r16, r0, 1, true, stdio..LBB0_21
stdio..Ltmp38:
stdio..LBB0_22:                               //   in Loop: Header=BB0_21 Depth=1
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	$loc,	1 160 5 is_stmt 0               // uPIMulator_frontend/sdk/stdlib/stdio.c:160:5
	$jeq , r0, 0, stdio..LBB0_52
stdio..Ltmp39:
stdio..LBB0_23:                               //   in Loop: Header=BB0_21 Depth=1
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	//DEBUG_LABEL: standard_character_process
	$loc,	1 243 13 is_stmt 1              // uPIMulator_frontend/sdk/stdlib/stdio.c:243:13
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..Ltmp40:
	$loc,	1 0 13 is_stmt 0                // uPIMulator_frontend/sdk/stdlib/stdio.c:0:13
	$move , r15, 1
stdio..Ltmp41:
	//DEBUG_VALUE: printf:insert_string_arg_end_character < -  undef
	$loc,	1 160 46 is_stmt 1              // uPIMulator_frontend/sdk/stdlib/stdio.c:160:46
	$add , r14, r14, 1
stdio..Ltmp42:
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
stdio..LBB0_21:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_30 Depth 2
                                        //     Child Loop BB0_41 Depth 2
                                        //     Child Loop BB0_50 Depth 2
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:insert_string_arg_end_character < -  undef
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	$loc,	1 160 12 is_stmt 0              // uPIMulator_frontend/sdk/stdlib/stdio.c:160:12
	$lbu , r0, r14, 0
stdio..Ltmp43:
	$loc,	1 160 5                         // uPIMulator_frontend/sdk/stdlib/stdio.c:160:5
	$jneq , r0, 37, stdio..LBB0_22
stdio..Ltmp44:
// %bb.24:                              //   in Loop: Header=BB0_21 Depth=1
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	$loc,	1 164 17 is_stmt 1              // uPIMulator_frontend/sdk/stdlib/stdio.c:164:17
	$lbu , r1, r14, 1
stdio..Ltmp45:
	$loc,	1 162 13                        // uPIMulator_frontend/sdk/stdlib/stdio.c:162:13
	$add , r14, r14, 1
stdio..Ltmp46:
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	$loc,	1 164 17                        // uPIMulator_frontend/sdk/stdlib/stdio.c:164:17
	$jeq , r1, 37, stdio..LBB0_23
stdio..Ltmp47:
// %bb.25:                              //   in Loop: Header=BB0_21 Depth=1
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	$jeq , r1, 0, stdio..LBB0_52
stdio..Ltmp48:
// %bb.26:                              //   in Loop: Header=BB0_21 Depth=1
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	$loc,	1 169 17                        // uPIMulator_frontend/sdk/stdlib/stdio.c:169:17
	$and , r0, r15, 1, z, stdio..LBB0_28
stdio..Ltmp49:
// %bb.27:                              //   in Loop: Header=BB0_21 Depth=1
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	//DEBUG_VALUE: printf:insert_string_arg_end_character < -  0
	$loc,	1 0 17 is_stmt 0                // uPIMulator_frontend/sdk/stdlib/stdio.c:0:17
	$move , r0, 0
stdio..Ltmp50:
	$loc,	1 171 17 is_stmt 1              // uPIMulator_frontend/sdk/stdlib/stdio.c:171:17
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..Ltmp51:
stdio..LBB0_28:                               //   in Loop: Header=BB0_21 Depth=1
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	$loc,	1 0 17 is_stmt 0                // uPIMulator_frontend/sdk/stdlib/stdio.c:0:17
	$move , r0, 0
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
stdio..Ltmp52:
	//DEBUG_VALUE: arg_is_64_bits < -  undef
	$loc,	1 176 20 is_stmt 1              // uPIMulator_frontend/sdk/stdlib/stdio.c:176:20
	$lbu , r1, r14, 0
	$loc,	1 176 13 is_stmt 0              // uPIMulator_frontend/sdk/stdlib/stdio.c:176:13
	$jgts , r1, 121, stdio..LBB0_35
	$jump , stdio..LBB0_30
stdio..Ltmp53:
stdio..LBB0_36:                               //   in Loop: Header=BB0_21 Depth=1
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	$loc,	1 186 56 is_stmt 1              // uPIMulator_frontend/sdk/stdlib/stdio.c:186:56
	$and , r2, r1, 223
	$add , r2, r2,  - 65
	$and , r2, r2, 255
	$jleu , r2, 25, stdio..LBB0_37
stdio..Ltmp54:
stdio..LBB0_34:                               //   in Loop: Header=BB0_21 Depth=1
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	$loc,	1 0 0 is_stmt 0                 // uPIMulator_frontend/sdk/stdlib/stdio.c:0:0
	$add , r14, r14, 1
stdio..Ltmp55:
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	//DEBUG_VALUE: arg_is_64_bits < -  undef
	$loc,	1 176 20 is_stmt 1              // uPIMulator_frontend/sdk/stdlib/stdio.c:176:20
	$lbu , r1, r14, 0
	$loc,	1 176 13 is_stmt 0              // uPIMulator_frontend/sdk/stdlib/stdio.c:176:13
	$jles , r1, 121, stdio..LBB0_30
stdio..Ltmp56:
stdio..LBB0_35:                               //   in Loop: Header=BB0_21 Depth=1
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	$loc,	1 0 13                          // uPIMulator_frontend/sdk/stdlib/stdio.c:0:13
	$jeq , r1, 122, stdio..LBB0_34
	$jump , stdio..LBB0_36
stdio..Ltmp57:
stdio..LBB0_30:                               //   Parent Loop BB0_21 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	$loc,	1 176 13                        // uPIMulator_frontend/sdk/stdlib/stdio.c:176:13
	$jeq , r1, 0, stdio..LBB0_46
stdio..Ltmp58:
// %bb.31:                              //   in Loop: Header=BB0_30 Depth=2
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	$jeq , r1, 76, stdio..LBB0_33
stdio..Ltmp59:
// %bb.32:                              //   in Loop: Header=BB0_30 Depth=2
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	$jneq , r1, 108, stdio..LBB0_36
stdio..Ltmp60:
stdio..LBB0_33:                               //   in Loop: Header=BB0_30 Depth=2
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	//DEBUG_VALUE: printf:current_format_char_ptr < -  [DW_OP_plus_uconst 1, DW_OP_stack_value] $r14
	//DEBUG_VALUE: arg_is_64_bits < -  1
	$loc,	1 180 21 is_stmt 1              // uPIMulator_frontend/sdk/stdlib/stdio.c:180:21
	$add , r14, r14, 1
stdio..Ltmp61:
	$loc,	1 0 21 is_stmt 0                // uPIMulator_frontend/sdk/stdlib/stdio.c:0:21
	$move , r0, 1
stdio..Ltmp62:
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	//DEBUG_VALUE: arg_is_64_bits < -  undef
	$loc,	1 176 20 is_stmt 1              // uPIMulator_frontend/sdk/stdlib/stdio.c:176:20
	$lbu , r1, r14, 0
	$loc,	1 176 13 is_stmt 0              // uPIMulator_frontend/sdk/stdlib/stdio.c:176:13
	$jgts , r1, 121, stdio..LBB0_35
	$jump , stdio..LBB0_30
stdio..Ltmp63:
stdio..LBB0_37:                               //   in Loop: Header=BB0_21 Depth=1
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	$loc,	1 193 13 is_stmt 1              // uPIMulator_frontend/sdk/stdlib/stdio.c:193:13
	$add , r1, r1,  - 69
	$jgtu , r1, 46, stdio..LBB0_46
stdio..Ltmp64:
// %bb.38:                              //   in Loop: Header=BB0_21 Depth=1
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	$loc,	1 0 13 is_stmt 0                // uPIMulator_frontend/sdk/stdlib/stdio.c:0:13
	$lsl , r1, r1, 2
	$lw , r1, r1, stdio..LJTI0_0
	$jump , r1
stdio..Ltmp65:
stdio..LBB0_45:                               //   in Loop: Header=BB0_21 Depth=1
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	$loc,	1 213 21 is_stmt 1              // uPIMulator_frontend/sdk/stdlib/stdio.c:213:21
	// inline asm
	$nop ,
	// inline asm
	$loc,	1 214 34                        // uPIMulator_frontend/sdk/stdlib/stdio.c:214:34
	$lw , r0, r22,  - 24
	$add , r0, r0,  - 8
	$and , r0, r0,  - 8
	$sw , r22,  - 24, r0
	$ld , d18, r0, 0
stdio..Ltmp66:
	//DEBUG_VALUE: i < -  0
	//DEBUG_VALUE: arg < -  undef
	//DEBUG_VALUE: val < -  undef
	$loc,	1 218 25                        // uPIMulator_frontend/sdk/stdlib/stdio.c:218:25
	$and , r0, r19, 255
stdio..Ltmp67:
	//DEBUG_VALUE: arg_byte < -  $r0
	//DEBUG_VALUE: i < -  3
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..Ltmp68:
	//DEBUG_VALUE: i < -  1
	$lsr , r0, r19, 8
stdio..Ltmp69:
	$and , r0, r0, 255
stdio..Ltmp70:
	//DEBUG_VALUE: arg_byte < -  $r0
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..Ltmp71:
	//DEBUG_VALUE: i < -  2
	$lsr , r0, r19, 16
stdio..Ltmp72:
	$and , r0, r0, 255
stdio..Ltmp73:
	//DEBUG_VALUE: arg_byte < -  $r0
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..Ltmp74:
	$lsr , r0, r19, 24
stdio..Ltmp75:
	//DEBUG_VALUE: arg_byte < -  $r0
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..Ltmp76:
	//DEBUG_VALUE: i < -  4
	$and , r0, r18, 255
stdio..Ltmp77:
	//DEBUG_VALUE: arg_byte < -  $r0
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..Ltmp78:
	//DEBUG_VALUE: i < -  5
	$loc,	1 217 41                        // uPIMulator_frontend/sdk/stdlib/stdio.c:217:41
	$lsr .u, d0, r18, 8
stdio..Ltmp79:
	$loc,	1 218 25                        // uPIMulator_frontend/sdk/stdlib/stdio.c:218:25
	$and , r0, r1, 255
stdio..Ltmp80:
	//DEBUG_VALUE: arg_byte < -  $r0
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..Ltmp81:
	//DEBUG_VALUE: i < -  6
	$loc,	1 217 41                        // uPIMulator_frontend/sdk/stdlib/stdio.c:217:41
	$lsr .u, d0, r18, 16
stdio..Ltmp82:
	$loc,	1 218 25                        // uPIMulator_frontend/sdk/stdlib/stdio.c:218:25
	$and , r0, r1, 255
stdio..Ltmp83:
	//DEBUG_VALUE: arg_byte < -  $r0
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..Ltmp84:
	//DEBUG_VALUE: i < -  7
	$loc,	1 217 41                        // uPIMulator_frontend/sdk/stdlib/stdio.c:217:41
	$lsr .u, d0, r18, 24
stdio..Ltmp85:
	//DEBUG_VALUE: arg_byte < -  undef
	$loc,	1 218 25                        // uPIMulator_frontend/sdk/stdlib/stdio.c:218:25
	$move , r0, r1
stdio..Ltmp86:
	$loc,	1 0 0 is_stmt 0                 // uPIMulator_frontend/sdk/stdlib/stdio.c:0:0
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..Ltmp87:
	$jump , stdio..LBB0_51
stdio..Ltmp88:
stdio..LBB0_46:                               //   in Loop: Header=BB0_21 Depth=1
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	$loc,	1 226 25 is_stmt 1              // uPIMulator_frontend/sdk/stdlib/stdio.c:226:25
	$and , r0, r0, 1, z, stdio..LBB0_48
stdio..Ltmp89:
// %bb.47:                              //   in Loop: Header=BB0_21 Depth=1
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	$loc,	1 227 31                        // uPIMulator_frontend/sdk/stdlib/stdio.c:227:31
	$lw , r0, r22,  - 24
	$add , r0, r0,  - 8
	$and , r0, r0,  - 8
	$sw , r22,  - 24, r0
	$ld , d0, r0, 0
stdio..Ltmp90:
	//DEBUG_VALUE: val < -  $d0
	//DEBUG_VALUE: arg_size_in_bytes < -  8
	$loc,	1 0 31 is_stmt 0                // uPIMulator_frontend/sdk/stdlib/stdio.c:0:31
	$move , r15, 8, true, stdio..LBB0_49
stdio..Ltmp91:
stdio..LBB0_48:                               //   in Loop: Header=BB0_21 Depth=1
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	$loc,	1 230 37 is_stmt 1              // uPIMulator_frontend/sdk/stdlib/stdio.c:230:37
	$lw , r0, r22,  - 24
	$add , r1, r0,  - 4
	$sw , r22,  - 24, r1
	$lw .s, d0, r0,  - 4
stdio..Ltmp92:
	//DEBUG_VALUE: val < -  $d0
	$loc,	1 0 37 is_stmt 0                // uPIMulator_frontend/sdk/stdlib/stdio.c:0:37
	$move , r15, 4
stdio..Ltmp93:
	//DEBUG_VALUE: arg_size_in_bytes < -  4
stdio..LBB0_49:                               //   in Loop: Header=BB0_21 Depth=1
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	//DEBUG_VALUE: val < -  $d0
	$sd , r22,  - 16, d0
stdio..Ltmp94:
	//DEBUG_VALUE: i < -  0
	//DEBUG_VALUE: arg < -  [DW_OP_constu 16, DW_OP_minus, DW_OP_stack_value] $r22
	//DEBUG_VALUE: arg_size_in_bytes < -  $r15
	$loc,	1 237 25 is_stmt 1              // uPIMulator_frontend/sdk/stdlib/stdio.c:237:25
	$and , r0, r1, 255
stdio..Ltmp95:
	//DEBUG_VALUE: arg_byte < -  $r0
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..Ltmp96:
	//DEBUG_VALUE: i < -  1
	$loc,	1 235 21                        // uPIMulator_frontend/sdk/stdlib/stdio.c:235:21
	$add , r15, r15,  - 1
stdio..Ltmp97:
	$loc,	1 0 21 is_stmt 0                // uPIMulator_frontend/sdk/stdlib/stdio.c:0:21
	$move , r17, r16
stdio..Ltmp98:
stdio..LBB0_50:                               //   Parent Loop BB0_21 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	//DEBUG_VALUE: arg < -  [DW_OP_constu 16, DW_OP_minus, DW_OP_stack_value] $r22
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	$loc,	1 236 41 is_stmt 1              // uPIMulator_frontend/sdk/stdlib/stdio.c:236:41
	$lbu , r0, r17, 0
stdio..Ltmp99:
	//DEBUG_VALUE: arg_byte < -  undef
	//DEBUG_VALUE: i < -  undef
	$loc,	1 237 25                        // uPIMulator_frontend/sdk/stdlib/stdio.c:237:25
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..Ltmp100:
	//DEBUG_VALUE: i < -  [DW_OP_plus_uconst 1, DW_OP_stack_value] undef
	$loc,	1 235 48                        // uPIMulator_frontend/sdk/stdlib/stdio.c:235:48
	$add , r17, r17, 1
	$add , r15, r15,  - 1, nz, stdio..LBB0_50
stdio..Ltmp101:
stdio..LBB0_51:                               //   in Loop: Header=BB0_21 Depth=1
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	$loc,	1 0 48 is_stmt 0                // uPIMulator_frontend/sdk/stdlib/stdio.c:0:48
	$move , r15, 0
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
stdio..Ltmp102:
	//DEBUG_VALUE: printf:insert_string_arg_end_character < -  undef
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	$loc,	1 160 46 is_stmt 1              // uPIMulator_frontend/sdk/stdlib/stdio.c:160:46
	$add , r14, r14, 1, true, stdio..LBB0_21
stdio..Ltmp103:
stdio..LBB0_43:                               //   in Loop: Header=BB0_21 Depth=1
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	$loc,	1 204 46                        // uPIMulator_frontend/sdk/stdlib/stdio.c:204:46
	$lw , r0, r22,  - 24
	$add , r1, r0,  - 4
	$sw , r22,  - 24, r1
	$lbu , r0, r0,  - 4
stdio..Ltmp104:
	//DEBUG_VALUE: arg_as_char < -  $r0
	$loc,	1 0 0 is_stmt 0                 // uPIMulator_frontend/sdk/stdlib/stdio.c:0:0
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..Ltmp105:
	$jump , stdio..LBB0_51
stdio..Ltmp106:
stdio..LBB0_39:                               //   in Loop: Header=BB0_21 Depth=1
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	$loc,	1 195 41 is_stmt 1              // uPIMulator_frontend/sdk/stdlib/stdio.c:195:41
	$lw , r0, r22,  - 24
	$add , r1, r0,  - 4
	$sw , r22,  - 24, r1
	$lw , r1, r0,  - 4
stdio..Ltmp107:
	//DEBUG_VALUE: arg < -  $r1
	$loc,	1 196 28                        // uPIMulator_frontend/sdk/stdlib/stdio.c:196:28
	$lbu , r0, r1, 0
	$loc,	1 196 21 is_stmt 0              // uPIMulator_frontend/sdk/stdlib/stdio.c:196:21
	$jeq , r0, 0, stdio..LBB0_42
stdio..Ltmp108:
// %bb.40:                              //   in Loop: Header=BB0_21 Depth=1
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	//DEBUG_VALUE: arg < -  $r1
	$add , r15, r1, 1
stdio..Ltmp109:
stdio..LBB0_41:                               //   Parent Loop BB0_21 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	//DEBUG_VALUE: arg < -  [DW_OP_constu 1, DW_OP_minus, DW_OP_stack_value] $r15
	$loc,	1 197 25 is_stmt 1              // uPIMulator_frontend/sdk/stdlib/stdio.c:197:25
	$and , r0, r0, 255
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..Ltmp110:
	//DEBUG_VALUE: arg < -  $r15
	$loc,	1 196 28                        // uPIMulator_frontend/sdk/stdlib/stdio.c:196:28
	$lbu , r0, r15, 0
	$loc,	1 196 21 is_stmt 0              // uPIMulator_frontend/sdk/stdlib/stdio.c:196:21
	$add , r15, r15, 1
stdio..Ltmp111:
	$jneq , r0, 0, stdio..LBB0_41
stdio..Ltmp112:
stdio..LBB0_42:                               //   in Loop: Header=BB0_21 Depth=1
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	$loc,	1 0 21                          // uPIMulator_frontend/sdk/stdlib/stdio.c:0:21
	$move , r15, 0
	$loc,	1 200 21 is_stmt 1              // uPIMulator_frontend/sdk/stdlib/stdio.c:200:21
	$move , r0, r15
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..Ltmp113:
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	//DEBUG_VALUE: printf:insert_string_arg_end_character < -  undef
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	$loc,	1 160 46                        // uPIMulator_frontend/sdk/stdlib/stdio.c:160:46
	$add , r14, r14, 1, true, stdio..LBB0_21
stdio..Ltmp114:
stdio..LBB0_52:
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	$loc,	1 248 9                         // uPIMulator_frontend/sdk/stdlib/stdio.c:248:9
	$and , r0, r15, 1, z, stdio..LBB0_54
stdio..Ltmp115:
// %bb.53:
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	$loc,	1 0 9 is_stmt 0                 // uPIMulator_frontend/sdk/stdlib/stdio.c:0:9
	$move , r0, 0
stdio..Ltmp116:
	$loc,	1 249 9 is_stmt 1               // uPIMulator_frontend/sdk/stdlib/stdio.c:249:9
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..Ltmp117:
stdio..LBB0_54:
	//DEBUG_VALUE: printf:args < -  [DW_OP_plus_uconst 24, DW_OP_deref] $r22
	//DEBUG_VALUE: printf:current_format_char_ptr < -  $r14
	//DEBUG_VALUE: printf:args < -  [DW_OP_constu 24, DW_OP_minus, DW_OP_deref] $r22
	$loc,	1 254 5                         // uPIMulator_frontend/sdk/stdlib/stdio.c:254:5
	$call , r23, stdio.__finalized_print_sequence
stdio..Ltmp118:
	$loc,	1 255 5                         // uPIMulator_frontend/sdk/stdlib/stdio.c:255:5
	$call , r23, stdio.__close_print_sequence
stdio..Ltmp119:
	$loc,	1 256 1                         // uPIMulator_frontend/sdk/stdlib/stdio.c:256:1
	$ld , d18, r22,  - 48
	$ld , d16, r22,  - 40
	$ld , d14, r22,  - 32
stdio..Ltmp120:
	$ld , d22, r22,  - 8
stdio..Ltmp121:
	$jump , r23
stdio..Ltmp122:
stdio..Lfunc_end0:
	$size,	printf, stdio..Lfunc_end0 - printf
	$cfi_endproc,
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
	$loc,	1 64 0                          // uPIMulator_frontend/sdk/stdlib/stdio.c:64:0
	$cfi_startproc,
// %bb.0:
	//DEBUG_VALUE: stdio.__write_byte_and_flush_if_needed:byte < -  $r0
	$cfi_def_cfa_offset,  - 8
	$cfi_offset, 23,  - 8
	$cfi_offset, 22,  - 4
	$sd , r22, 0, d22
	$add , r22, r22, 8
stdio..Ltmp123:
	$loc,	1 65 53 prologue_end            // uPIMulator_frontend/sdk/stdlib/stdio.c:65:53
	$lw , r1, zero, stdio.__stdout_cache_write_index
	//DEBUG_VALUE: stdio.__write_byte_and_flush_if_needed:byte < -  $r0
	$loc,	1 65 57 is_stmt 0               // uPIMulator_frontend/sdk/stdlib/stdio.c:65:57
	$sb , r1, stdio.__stdout_cache_buffer, r0
	$loc,	1 65 53                         // uPIMulator_frontend/sdk/stdlib/stdio.c:65:53
	$add , r0, r1, 1
stdio..Ltmp124:
	$sw , zero, stdio.__stdout_cache_write_index, r0
	$loc,	1 66 9 is_stmt 1                // uPIMulator_frontend/sdk/stdlib/stdio.c:66:9
	$jneq , r0, 8, stdio..LBB1_2
// %bb.1:
stdio..Ltmp125:
	$loc,	1 67 9                          // uPIMulator_frontend/sdk/stdlib/stdio.c:67:9
	$call , r23, stdio.__transfer_cache_to_mram
stdio..Ltmp126:
	$loc,	1 68 36                         // uPIMulator_frontend/sdk/stdlib/stdio.c:68:36
	$move , r0, stdio.__stdout_cache_write_index
	$sw , r0, 0, 0
stdio..Ltmp127:
stdio..LBB1_2:
	$loc,	1 70 1                          // uPIMulator_frontend/sdk/stdlib/stdio.c:70:1
	$ld , d22, r22,  - 8
	$jump , r23
stdio..Ltmp128:
stdio..Lfunc_end1:
	$size,	stdio.__write_byte_and_flush_if_needed, stdio..Lfunc_end1 - stdio.__write_byte_and_flush_if_needed
	$cfi_endproc,
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
	$loc,	1 260 0                         // uPIMulator_frontend/sdk/stdlib/stdio.c:260:0
	$cfi_startproc,
// %bb.0:
	//DEBUG_VALUE: puts:str < -  $r0
	$cfi_def_cfa_offset,  - 16
	$cfi_offset, 23,  - 8
	$cfi_offset, 22,  - 4
	$sd , r22, 8, d22
	$add , r22, r22, 16
	$cfi_offset, 15,  - 16
	$cfi_offset, 14,  - 12
	$sd , r22,  - 16, d14
	$move , r14, r0
stdio..Ltmp129:
	//DEBUG_VALUE: puts:str < -  $r14
	$loc,	1 261 5 prologue_end            // uPIMulator_frontend/sdk/stdlib/stdio.c:261:5
	$call , r23, stdio.__open_print_sequence
stdio..Ltmp130:
	$loc,	1 0 5 is_stmt 0                 // uPIMulator_frontend/sdk/stdlib/stdio.c:0:5
	$move , r0, 37
	$loc,	1 263 5 is_stmt 1               // uPIMulator_frontend/sdk/stdlib/stdio.c:263:5
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..Ltmp131:
	$loc,	1 0 5 is_stmt 0                 // uPIMulator_frontend/sdk/stdlib/stdio.c:0:5
	$move , r0, 115
	$loc,	1 264 5 is_stmt 1               // uPIMulator_frontend/sdk/stdlib/stdio.c:264:5
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..Ltmp132:
	$loc,	1 0 5 is_stmt 0                 // uPIMulator_frontend/sdk/stdlib/stdio.c:0:5
	$move , r0, 0
	$loc,	1 265 5 is_stmt 1               // uPIMulator_frontend/sdk/stdlib/stdio.c:265:5
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..Ltmp133:
	//DEBUG_VALUE: current_char_ptr < -  $r14
	$loc,	1 267 48                        // uPIMulator_frontend/sdk/stdlib/stdio.c:267:48
	$lbu , r0, r14, 0
stdio..Ltmp134:
	$loc,	1 267 5 is_stmt 0               // uPIMulator_frontend/sdk/stdlib/stdio.c:267:5
	$jeq , r0, 0, stdio..LBB2_3
stdio..Ltmp135:
// %bb.1:
	//DEBUG_VALUE: current_char_ptr < -  $r14
	//DEBUG_VALUE: puts:str < -  $r14
	$add , r14, r14, 1
stdio..Ltmp136:
stdio..LBB2_2:                                // =>This Inner Loop Header: Depth=1
	//DEBUG_VALUE: current_char_ptr < -  [DW_OP_constu 1, DW_OP_minus, DW_OP_stack_value] $r14
	$loc,	1 268 9 is_stmt 1               // uPIMulator_frontend/sdk/stdlib/stdio.c:268:9
	$and , r0, r0, 255
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..Ltmp137:
	//DEBUG_VALUE: current_char_ptr < -  $r14
	$loc,	1 267 48                        // uPIMulator_frontend/sdk/stdlib/stdio.c:267:48
	$lbu , r0, r14, 0
stdio..Ltmp138:
	$loc,	1 267 5 is_stmt 0               // uPIMulator_frontend/sdk/stdlib/stdio.c:267:5
	$add , r14, r14, 1
stdio..Ltmp139:
	$jneq , r0, 0, stdio..LBB2_2
stdio..Ltmp140:
stdio..LBB2_3:
	$loc,	1 0 5                           // uPIMulator_frontend/sdk/stdlib/stdio.c:0:5
	$move , r0, 10
	$loc,	1 271 5 is_stmt 1               // uPIMulator_frontend/sdk/stdlib/stdio.c:271:5
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..Ltmp141:
	$loc,	1 0 5 is_stmt 0                 // uPIMulator_frontend/sdk/stdlib/stdio.c:0:5
	$move , r0, 0
	$loc,	1 272 5 is_stmt 1               // uPIMulator_frontend/sdk/stdlib/stdio.c:272:5
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..Ltmp142:
	$loc,	1 274 5                         // uPIMulator_frontend/sdk/stdlib/stdio.c:274:5
	$call , r23, stdio.__finalized_print_sequence
stdio..Ltmp143:
	$loc,	1 275 5                         // uPIMulator_frontend/sdk/stdlib/stdio.c:275:5
	$call , r23, stdio.__close_print_sequence
stdio..Ltmp144:
	$loc,	1 276 1                         // uPIMulator_frontend/sdk/stdlib/stdio.c:276:1
	$ld , d14, r22,  - 16
	$ld , d22, r22,  - 8
	$jump , r23
stdio..Ltmp145:
stdio..Lfunc_end2:
	$size,	puts, stdio..Lfunc_end2 - puts
	$cfi_endproc,
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
	$loc,	1 280 0                         // uPIMulator_frontend/sdk/stdlib/stdio.c:280:0
	$cfi_startproc,
// %bb.0:
	//DEBUG_VALUE: putchar:c < -  $r0
	$cfi_def_cfa_offset,  - 16
	$cfi_offset, 23,  - 8
	$cfi_offset, 22,  - 4
	$sd , r22, 8, d22
	$add , r22, r22, 16
	$cfi_offset, 15,  - 16
	$cfi_offset, 14,  - 12
	$sd , r22,  - 16, d14
	$move , r14, r0
stdio..Ltmp146:
	//DEBUG_VALUE: putchar:c < -  $r14
	$loc,	1 281 5 prologue_end            // uPIMulator_frontend/sdk/stdlib/stdio.c:281:5
	$call , r23, stdio.__open_print_sequence
stdio..Ltmp147:
	$loc,	1 0 5 is_stmt 0                 // uPIMulator_frontend/sdk/stdlib/stdio.c:0:5
	$move , r0, 37
	$loc,	1 283 5 is_stmt 1               // uPIMulator_frontend/sdk/stdlib/stdio.c:283:5
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..Ltmp148:
	$loc,	1 0 5 is_stmt 0                 // uPIMulator_frontend/sdk/stdlib/stdio.c:0:5
	$move , r0, 99
	$loc,	1 284 5 is_stmt 1               // uPIMulator_frontend/sdk/stdlib/stdio.c:284:5
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..Ltmp149:
	$loc,	1 0 5 is_stmt 0                 // uPIMulator_frontend/sdk/stdlib/stdio.c:0:5
	$move , r0, 0
	$loc,	1 285 5 is_stmt 1               // uPIMulator_frontend/sdk/stdlib/stdio.c:285:5
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..Ltmp150:
	$loc,	1 288 5                         // uPIMulator_frontend/sdk/stdlib/stdio.c:288:5
	$and , r0, r14, 255
stdio..Ltmp151:
	//DEBUG_VALUE: putchar:arg_as_char < -  $r0
	$call , r23, stdio.__write_byte_and_flush_if_needed
stdio..Ltmp152:
	$loc,	1 290 5                         // uPIMulator_frontend/sdk/stdlib/stdio.c:290:5
	$call , r23, stdio.__finalized_print_sequence
stdio..Ltmp153:
	$loc,	1 291 5                         // uPIMulator_frontend/sdk/stdlib/stdio.c:291:5
	$call , r23, stdio.__close_print_sequence
stdio..Ltmp154:
	$loc,	1 292 1                         // uPIMulator_frontend/sdk/stdlib/stdio.c:292:1
	$ld , d14, r22,  - 16
stdio..Ltmp155:
	$ld , d22, r22,  - 8
	$jump , r23
stdio..Ltmp156:
stdio..Lfunc_end3:
	$size,	putchar, stdio..Lfunc_end3 - putchar
	$cfi_endproc,
	$section,	%stack_sizes,"o",@progbits,%text, putchar
	$long,	stdio..Lfunc_begin3
	$byte,	16
	$section,	%text, putchar,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, stdio.__open_print_sequence,"ax",@progbits
	$type,	stdio.__open_print_sequence,@function //  -  -  Begin function stdio.__open_print_sequence
stdio.__open_print_sequence:                  // @stdio.__open_print_sequence
stdio..Lfunc_begin4:
	$loc,	1 85 0                          // uPIMulator_frontend/sdk/stdlib/stdio.c:85:0
	$cfi_startproc,
// %bb.0:
	$cfi_def_cfa_offset, 0
	$loc,	1 86 5 prologue_end             // uPIMulator_frontend/sdk/stdlib/stdio.c:86:5
	// inline asm
stdio..Ltmp157:
	$acquire , zero, __atomic_bit___stdout_buffer_lock, nz, stdio..Ltmp157
	// inline asm
	$loc,	1 87 32                         // uPIMulator_frontend/sdk/stdlib/stdio.c:87:32
	$move , r0, stdio.__stdout_cache_write_index
	$loc,	1 89 67                         // uPIMulator_frontend/sdk/stdlib/stdio.c:89:67
	$lw , r1, zero, __stdout_buffer_state
	$loc,	1 87 32                         // uPIMulator_frontend/sdk/stdlib/stdio.c:87:32
	$sw , r0, 0, 0
	$loc,	1 88 29                         // uPIMulator_frontend/sdk/stdlib/stdio.c:88:29
	$move , r0, stdio.__stdout_nr_of_wrapping
	$sw , r0, 0, 0
	$loc,	1 89 43                         // uPIMulator_frontend/sdk/stdlib/stdio.c:89:43
	$sw , zero, stdio.__stdout_buffer_write_pointer_initial, r1
	$loc,	1 90 1                          // uPIMulator_frontend/sdk/stdlib/stdio.c:90:1
	$jump , r23
stdio..Ltmp158:
stdio..Lfunc_end4:
	$size,	stdio.__open_print_sequence, stdio..Lfunc_end4 - stdio.__open_print_sequence
	$cfi_endproc,
	$section,	%stack_sizes,"o",@progbits,%text, stdio.__open_print_sequence
	$long,	stdio..Lfunc_begin4
	$byte,	0
	$section,	%text, stdio.__open_print_sequence,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, stdio.__transfer_cache_to_mram,"ax",@progbits
	$type,	stdio.__transfer_cache_to_mram,@function //  -  -  Begin function stdio.__transfer_cache_to_mram
stdio.__transfer_cache_to_mram:               // @stdio.__transfer_cache_to_mram
stdio..Lfunc_begin5:
	$loc,	1 47 0                          // uPIMulator_frontend/sdk/stdlib/stdio.c:47:0
	$cfi_startproc,
// %bb.0:
	$cfi_def_cfa_offset, 0
	$loc,	1 48 81 prologue_end            // uPIMulator_frontend/sdk/stdlib/stdio.c:48:81
	$lw , r0, zero, __stdout_buffer_state
stdio..Ltmp159:
	//DEBUG_VALUE: stdio.__transfer_cache_to_mram:offset_in_mram < -  undef
	$loc,	1 51 37                         // uPIMulator_frontend/sdk/stdlib/stdio.c:51:37
	$lw , r1, zero, stdio.__stdout_buffer_size
stdio..Ltmp160:
	$loc,	1 50 30                         // uPIMulator_frontend/sdk/stdlib/stdio.c:50:30
	$add , r2, r0, 8
	$sw , zero, __stdout_buffer_state, r2
	$loc,	1 51 9                          // uPIMulator_frontend/sdk/stdlib/stdio.c:51:9
	$jltu , r2, r1, stdio..LBB5_2
stdio..Ltmp161:
// %bb.1:
	$loc,	1 54 32                         // uPIMulator_frontend/sdk/stdlib/stdio.c:54:32
	$lw , r1, zero, stdio.__stdout_nr_of_wrapping
	$move , r3, 0
	$move , r2, 1
	$loc,	1 52 34                         // uPIMulator_frontend/sdk/stdlib/stdio.c:52:34
	$sd , zero, __stdout_buffer_state, d2
	$loc,	1 54 32                         // uPIMulator_frontend/sdk/stdlib/stdio.c:54:32
	$add , r1, r1, 1
	$sw , zero, stdio.__stdout_nr_of_wrapping, r1
stdio..Ltmp162:
stdio..LBB5_2:
	$loc,	1 48 84                         // uPIMulator_frontend/sdk/stdlib/stdio.c:48:84
	$move , r1, stdio.__stdout_buffer
	$add , r0, r0, r1
stdio..Ltmp163:
	//DEBUG_VALUE: mram_write:nb_of_bytes < -  8
	//DEBUG_VALUE: mram_write:to < -  $r0
	//DEBUG_VALUE: stdio.__transfer_cache_to_mram:offset_in_mram < -  $r0
	$file,	3 "/root" "uPIMulator_frontend/sdk/syslib/mram.h"
	$loc,	3 53 24                         // uPIMulator_frontend/sdk/syslib/mram.h:53:24
	$move , r1, stdio.__stdout_cache_buffer
stdio..Ltmp164:
	//DEBUG_VALUE: mram_write:from < -  $r1
	$sdma , r1, r0, 0
stdio..Ltmp165:
	$loc,	1 58 1                          // uPIMulator_frontend/sdk/stdlib/stdio.c:58:1
	$jump , r23
stdio..Ltmp166:
stdio..Lfunc_end5:
	$size,	stdio.__transfer_cache_to_mram, stdio..Lfunc_end5 - stdio.__transfer_cache_to_mram
	$cfi_endproc,
	$section,	%stack_sizes,"o",@progbits,%text, stdio.__transfer_cache_to_mram
	$long,	stdio..Lfunc_begin5
	$byte,	0
	$section,	%text, stdio.__transfer_cache_to_mram,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, stdio.__finalized_print_sequence,"ax",@progbits
	$type,	stdio.__finalized_print_sequence,@function //  -  -  Begin function stdio.__finalized_print_sequence
stdio.__finalized_print_sequence:             // @stdio.__finalized_print_sequence
stdio..Lfunc_begin6:
	$loc,	1 74 0                          // uPIMulator_frontend/sdk/stdlib/stdio.c:74:0
	$cfi_startproc,
// %bb.0:
	$cfi_def_cfa_offset,  - 8
	$cfi_offset, 23,  - 8
	$cfi_offset, 22,  - 4
	$sd , r22, 0, d22
	$add , r22, r22, 8
stdio..Ltmp167:
	$loc,	1 75 36 prologue_end            // uPIMulator_frontend/sdk/stdlib/stdio.c:75:36
	$lw , r1, zero, stdio.__stdout_cache_write_index
	$loc,	1 75 34 is_stmt 0               // uPIMulator_frontend/sdk/stdlib/stdio.c:75:34
	$move , r0, stdio.__stdout_cache_buffer
	$add , r0, r0, r1
	$loc,	1 75 92                         // uPIMulator_frontend/sdk/stdlib/stdio.c:75:92
	$sub , r2, 8, r1
	$move , r1, 0
	$loc,	1 75 5                          // uPIMulator_frontend/sdk/stdlib/stdio.c:75:5
	$call , r23, memset
stdio..Ltmp168:
	$loc,	1 76 5 is_stmt 1                // uPIMulator_frontend/sdk/stdlib/stdio.c:76:5
	$call , r23, stdio.__transfer_cache_to_mram
stdio..Ltmp169:
	$loc,	1 78 9                          // uPIMulator_frontend/sdk/stdlib/stdio.c:78:9
	$lw , r0, zero, stdio.__stdout_nr_of_wrapping
	$loc,	1 79 9                          // uPIMulator_frontend/sdk/stdlib/stdio.c:79:9
	$jgtu , r0, 1, stdio..LBB6_3
// %bb.1:
	$loc,	1 79 42 is_stmt 0               // uPIMulator_frontend/sdk/stdlib/stdio.c:79:42
	$jneq , r0, 1, stdio..LBB6_4
// %bb.2:
	$loc,	1 79 67                         // uPIMulator_frontend/sdk/stdlib/stdio.c:79:67
	$lw , r0, zero, __stdout_buffer_state
	$loc,	1 79 72                         // uPIMulator_frontend/sdk/stdlib/stdio.c:79:72
	$lw , r1, zero, stdio.__stdout_buffer_write_pointer_initial
stdio..Ltmp170:
	$loc,	1 78 9 is_stmt 1                // uPIMulator_frontend/sdk/stdlib/stdio.c:78:9
	$jleu , r0, r1, stdio..LBB6_4
stdio..LBB6_3:
stdio..Ltmp171:
	$loc,	1 80 9                          // uPIMulator_frontend/sdk/stdlib/stdio.c:80:9
	// inline asm
	$fault , 5
	// inline asm
stdio..Ltmp172:
stdio..LBB6_4:
	$loc,	1 81 1                          // uPIMulator_frontend/sdk/stdlib/stdio.c:81:1
	$ld , d22, r22,  - 8
	$jump , r23
stdio..Ltmp173:
stdio..Lfunc_end6:
	$size,	stdio.__finalized_print_sequence, stdio..Lfunc_end6 - stdio.__finalized_print_sequence
	$cfi_endproc,
	$section,	%stack_sizes,"o",@progbits,%text, stdio.__finalized_print_sequence
	$long,	stdio..Lfunc_begin6
	$byte,	8
	$section,	%text, stdio.__finalized_print_sequence,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, stdio.__close_print_sequence,"ax",@progbits
	$type,	stdio.__close_print_sequence,@function //  -  -  Begin function stdio.__close_print_sequence
stdio.__close_print_sequence:                 // @stdio.__close_print_sequence
stdio..Lfunc_begin7:
	$loc,	1 96 0                          // uPIMulator_frontend/sdk/stdlib/stdio.c:96:0
	$cfi_startproc,
// %bb.0:
	$cfi_def_cfa_offset, 0
	$loc,	1 97 5 prologue_end             // uPIMulator_frontend/sdk/stdlib/stdio.c:97:5
	// inline asm
stdio..Ltmp174:
	$release , zero, __atomic_bit___stdout_buffer_lock, nz, stdio..Ltmp174 + 1
	// inline asm
	$loc,	1 98 1                          // uPIMulator_frontend/sdk/stdlib/stdio.c:98:1
	$jump , r23
stdio..Ltmp175:
stdio..Lfunc_end7:
	$size,	stdio.__close_print_sequence, stdio..Lfunc_end7 - stdio.__close_print_sequence
	$cfi_endproc,
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

	$file,	4 "/root" "uPIMulator_frontend/sdk/stdlib/stdarg.h"
	$section,	%debug_loc,"",@progbits
stdio..Ldebug_loc0:
	$long,	 - 1
	$long,	stdio..Lfunc_begin0                   //   base address
	$long,	stdio..Lfunc_begin0 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp0 - stdio..Lfunc_begin0
	$short,	1                               // Loc expr size
	$byte,	80                              // DW_OP_reg0
	$long,	stdio..Ltmp0 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp38 - stdio..Lfunc_begin0
	$short,	1                               // Loc expr size
	$byte,	94                              // DW_OP_reg14
	$long,	0
	$long,	0
stdio..Ldebug_loc1:
	$long,	 - 1
	$long,	stdio..Lfunc_begin0                   //   base address
	$long,	stdio..Ltmp2 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp15 - stdio..Lfunc_begin0
	$short,	1                               // Loc expr size
	$byte,	95                              // DW_OP_reg15
	$long,	stdio..Ltmp16 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp21 - stdio..Lfunc_begin0
	$short,	1                               // Loc expr size
	$byte,	95                              // DW_OP_reg15
	$long,	stdio..Ltmp21 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp22 - stdio..Lfunc_begin0
	$short,	3                               // Loc expr size
	$byte,	127                             // DW_OP_breg15
	$byte,	1                               // 1
	$byte,	159                             // DW_OP_stack_value
	$long,	stdio..Ltmp22 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp35 - stdio..Lfunc_begin0
	$short,	1                               // Loc expr size
	$byte,	95                              // DW_OP_reg15
	$long,	stdio..Ltmp37 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp60 - stdio..Lfunc_begin0
	$short,	1                               // Loc expr size
	$byte,	94                              // DW_OP_reg14
	$long,	stdio..Ltmp60 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp61 - stdio..Lfunc_begin0
	$short,	3                               // Loc expr size
	$byte,	126                             // DW_OP_breg14
	$byte,	1                               // 1
	$byte,	159                             // DW_OP_stack_value
	$long,	stdio..Ltmp62 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp120 - stdio..Lfunc_begin0
	$short,	1                               // Loc expr size
	$byte,	94                              // DW_OP_reg14
	$long,	0
	$long,	0
stdio..Ldebug_loc2:
	$long,	 - 1
	$long,	stdio..Lfunc_begin0                   //   base address
	$long,	stdio..Ltmp0 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp38 - stdio..Lfunc_begin0
	$short,	2                               // Loc expr size
	$byte,	48                              // DW_OP_lit0
	$byte,	159                             // DW_OP_stack_value
	$long,	stdio..Ltmp49 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp51 - stdio..Lfunc_begin0
	$short,	2                               // Loc expr size
	$byte,	48                              // DW_OP_lit0
	$byte,	159                             // DW_OP_stack_value
	$long,	0
	$long,	0
stdio..Ldebug_loc3:
	$long,	 - 1
	$long,	stdio..Lfunc_begin0                   //   base address
	$long,	stdio..Ltmp0 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp2 - stdio..Lfunc_begin0
	$short,	2                               // Loc expr size
	$byte,	49                              // DW_OP_lit1
	$byte,	159                             // DW_OP_stack_value
	$long,	stdio..Ltmp26 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp27 - stdio..Lfunc_begin0
	$short,	2                               // Loc expr size
	$byte,	48                              // DW_OP_lit0
	$byte,	159                             // DW_OP_stack_value
	$long,	stdio..Ltmp33 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp34 - stdio..Lfunc_begin0
	$short,	2                               // Loc expr size
	$byte,	48                              // DW_OP_lit0
	$byte,	159                             // DW_OP_stack_value
	$long,	0
	$long,	0
stdio..Ldebug_loc4:
	$long,	 - 1
	$long,	stdio..Lfunc_begin0                   //   base address
	$long,	stdio..Ltmp1 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp117 - stdio..Lfunc_begin0
	$short,	2                               // Loc expr size
	$byte,	134                             // DW_OP_breg22
	$byte,	24                              // 24
	$long,	stdio..Ltmp117 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp121 - stdio..Lfunc_begin0
	$short,	2                               // Loc expr size
	$byte,	134                             // DW_OP_breg22
	$byte,	104                             //  - 24
	$long,	0
	$long,	0
stdio..Ldebug_loc5:
	$long,	 - 1
	$long,	stdio..Lfunc_begin0                   //   base address
	$long,	stdio..Ltmp60 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp62 - stdio..Lfunc_begin0
	$short,	2                               // Loc expr size
	$byte,	49                              // DW_OP_lit1
	$byte,	159                             // DW_OP_stack_value
	$long,	0
	$long,	0
stdio..Ldebug_loc6:
	$long,	 - 1
	$long,	stdio..Lfunc_begin0                   //   base address
	$long,	stdio..Ltmp66 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp67 - stdio..Lfunc_begin0
	$short,	3                               // Loc expr size
	$byte,	17                              // DW_OP_consts
	$byte,	0                               // 0
	$byte,	159                             // DW_OP_stack_value
	$long,	stdio..Ltmp67 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp68 - stdio..Lfunc_begin0
	$short,	3                               // Loc expr size
	$byte,	17                              // DW_OP_consts
	$byte,	3                               // 3
	$byte,	159                             // DW_OP_stack_value
	$long,	stdio..Ltmp68 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp71 - stdio..Lfunc_begin0
	$short,	3                               // Loc expr size
	$byte,	17                              // DW_OP_consts
	$byte,	1                               // 1
	$byte,	159                             // DW_OP_stack_value
	$long,	stdio..Ltmp71 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp76 - stdio..Lfunc_begin0
	$short,	3                               // Loc expr size
	$byte,	17                              // DW_OP_consts
	$byte,	2                               // 2
	$byte,	159                             // DW_OP_stack_value
	$long,	stdio..Ltmp76 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp78 - stdio..Lfunc_begin0
	$short,	3                               // Loc expr size
	$byte,	17                              // DW_OP_consts
	$byte,	4                               // 4
	$byte,	159                             // DW_OP_stack_value
	$long,	stdio..Ltmp78 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp81 - stdio..Lfunc_begin0
	$short,	3                               // Loc expr size
	$byte,	17                              // DW_OP_consts
	$byte,	5                               // 5
	$byte,	159                             // DW_OP_stack_value
	$long,	stdio..Ltmp81 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp84 - stdio..Lfunc_begin0
	$short,	3                               // Loc expr size
	$byte,	17                              // DW_OP_consts
	$byte,	6                               // 6
	$byte,	159                             // DW_OP_stack_value
	$long,	stdio..Ltmp84 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp88 - stdio..Lfunc_begin0
	$short,	3                               // Loc expr size
	$byte,	17                              // DW_OP_consts
	$byte,	7                               // 7
	$byte,	159                             // DW_OP_stack_value
	$long,	0
	$long,	0
stdio..Ldebug_loc7:
	$long,	 - 1
	$long,	stdio..Lfunc_begin0                   //   base address
	$long,	stdio..Ltmp67 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp69 - stdio..Lfunc_begin0
	$short,	1                               // Loc expr size
	$byte,	80                              // DW_OP_reg0
	$long,	stdio..Ltmp70 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp72 - stdio..Lfunc_begin0
	$short,	1                               // Loc expr size
	$byte,	80                              // DW_OP_reg0
	$long,	stdio..Ltmp73 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp79 - stdio..Lfunc_begin0
	$short,	1                               // Loc expr size
	$byte,	80                              // DW_OP_reg0
	$long,	stdio..Ltmp80 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp82 - stdio..Lfunc_begin0
	$short,	1                               // Loc expr size
	$byte,	80                              // DW_OP_reg0
	$long,	stdio..Ltmp83 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp85 - stdio..Lfunc_begin0
	$short,	1                               // Loc expr size
	$byte,	80                              // DW_OP_reg0
	$long,	0
	$long,	0
stdio..Ldebug_loc8:
	$long,	 - 1
	$long,	stdio..Lfunc_begin0                   //   base address
	$long,	stdio..Ltmp90 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp91 - stdio..Lfunc_begin0
	$short,	6                               // Loc expr size
	$byte,	81                              // sub - register DW_OP_reg1
	$byte,	147                             // DW_OP_piece
	$byte,	4                               // 4
	$byte,	80                              // sub - register DW_OP_reg0
	$byte,	147                             // DW_OP_piece
	$byte,	4                               // 4
	$long,	stdio..Ltmp92 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp95 - stdio..Lfunc_begin0
	$short,	6                               // Loc expr size
	$byte,	81                              // sub - register DW_OP_reg1
	$byte,	147                             // DW_OP_piece
	$byte,	4                               // 4
	$byte,	80                              // sub - register DW_OP_reg0
	$byte,	147                             // DW_OP_piece
	$byte,	4                               // 4
	$long,	0
	$long,	0
stdio..Ldebug_loc9:
	$long,	 - 1
	$long,	stdio..Lfunc_begin0                   //   base address
	$long,	stdio..Ltmp90 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp91 - stdio..Lfunc_begin0
	$short,	2                               // Loc expr size
	$byte,	56                              // DW_OP_lit8
	$byte,	159                             // DW_OP_stack_value
	$long,	stdio..Ltmp94 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp97 - stdio..Lfunc_begin0
	$short,	1                               // Loc expr size
	$byte,	95                              // DW_OP_reg15
	$long,	0
	$long,	0
stdio..Ldebug_loc10:
	$long,	 - 1
	$long,	stdio..Lfunc_begin0                   //   base address
	$long,	stdio..Ltmp94 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp96 - stdio..Lfunc_begin0
	$short,	2                               // Loc expr size
	$byte,	48                              // DW_OP_lit0
	$byte,	159                             // DW_OP_stack_value
	$long,	stdio..Ltmp96 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp98 - stdio..Lfunc_begin0
	$short,	2                               // Loc expr size
	$byte,	49                              // DW_OP_lit1
	$byte,	159                             // DW_OP_stack_value
	$long,	0
	$long,	0
stdio..Ldebug_loc11:
	$long,	 - 1
	$long,	stdio..Lfunc_begin0                   //   base address
	$long,	stdio..Ltmp94 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp101 - stdio..Lfunc_begin0
	$short,	3                               // Loc expr size
	$byte,	134                             // DW_OP_breg22
	$byte,	112                             //  - 16
	$byte,	159                             // DW_OP_stack_value
	$long,	0
	$long,	0
stdio..Ldebug_loc12:
	$long,	 - 1
	$long,	stdio..Lfunc_begin0                   //   base address
	$long,	stdio..Ltmp95 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp98 - stdio..Lfunc_begin0
	$short,	1                               // Loc expr size
	$byte,	80                              // DW_OP_reg0
	$long,	0
	$long,	0
stdio..Ldebug_loc13:
	$long,	 - 1
	$long,	stdio..Lfunc_begin0                   //   base address
	$long,	stdio..Ltmp107 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp109 - stdio..Lfunc_begin0
	$short,	1                               // Loc expr size
	$byte,	81                              // DW_OP_reg1
	$long,	stdio..Ltmp109 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp110 - stdio..Lfunc_begin0
	$short,	3                               // Loc expr size
	$byte,	127                             // DW_OP_breg15
	$byte,	127                             //  - 1
	$byte,	159                             // DW_OP_stack_value
	$long,	stdio..Ltmp110 - stdio..Lfunc_begin0
	$long,	stdio..Ltmp111 - stdio..Lfunc_begin0
	$short,	1                               // Loc expr size
	$byte,	95                              // DW_OP_reg15
	$long,	0
	$long,	0
stdio..Ldebug_loc14:
	$long,	 - 1
	$long,	stdio..Lfunc_begin1                   //   base address
	$long,	stdio..Lfunc_begin1 - stdio..Lfunc_begin1
	$long,	stdio..Ltmp124 - stdio..Lfunc_begin1
	$short,	1                               // Loc expr size
	$byte,	80                              // DW_OP_reg0
	$long,	0
	$long,	0
stdio..Ldebug_loc15:
	$long,	 - 1
	$long,	stdio..Lfunc_begin2                   //   base address
	$long,	stdio..Lfunc_begin2 - stdio..Lfunc_begin2
	$long,	stdio..Ltmp129 - stdio..Lfunc_begin2
	$short,	1                               // Loc expr size
	$byte,	80                              // DW_OP_reg0
	$long,	stdio..Ltmp129 - stdio..Lfunc_begin2
	$long,	stdio..Ltmp136 - stdio..Lfunc_begin2
	$short,	1                               // Loc expr size
	$byte,	94                              // DW_OP_reg14
	$long,	0
	$long,	0
stdio..Ldebug_loc16:
	$long,	 - 1
	$long,	stdio..Lfunc_begin2                   //   base address
	$long,	stdio..Ltmp133 - stdio..Lfunc_begin2
	$long,	stdio..Ltmp136 - stdio..Lfunc_begin2
	$short,	1                               // Loc expr size
	$byte,	94                              // DW_OP_reg14
	$long,	stdio..Ltmp136 - stdio..Lfunc_begin2
	$long,	stdio..Ltmp137 - stdio..Lfunc_begin2
	$short,	3                               // Loc expr size
	$byte,	126                             // DW_OP_breg14
	$byte,	127                             //  - 1
	$byte,	159                             // DW_OP_stack_value
	$long,	stdio..Ltmp137 - stdio..Lfunc_begin2
	$long,	stdio..Ltmp139 - stdio..Lfunc_begin2
	$short,	1                               // Loc expr size
	$byte,	94                              // DW_OP_reg14
	$long,	0
	$long,	0
stdio..Ldebug_loc17:
	$long,	 - 1
	$long,	stdio..Lfunc_begin3                   //   base address
	$long,	stdio..Lfunc_begin3 - stdio..Lfunc_begin3
	$long,	stdio..Ltmp146 - stdio..Lfunc_begin3
	$short,	1                               // Loc expr size
	$byte,	80                              // DW_OP_reg0
	$long,	stdio..Ltmp146 - stdio..Lfunc_begin3
	$long,	stdio..Ltmp155 - stdio..Lfunc_begin3
	$short,	1                               // Loc expr size
	$byte,	94                              // DW_OP_reg14
	$long,	0
	$long,	0
stdio..Ldebug_loc18:
	$long,	 - 1
	$long,	stdio..Lfunc_begin3                   //   base address
	$long,	stdio..Ltmp151 - stdio..Lfunc_begin3
	$long,	stdio..Lfunc_end3 - stdio..Lfunc_begin3
	$short,	1                               // Loc expr size
	$byte,	80                              // DW_OP_reg0
	$long,	0
	$long,	0
stdio..Ldebug_loc19:
	$long,	 - 1
	$long,	stdio..Lfunc_begin5                   //   base address
	$long,	stdio..Ltmp163 - stdio..Lfunc_begin5
	$long,	stdio..Lfunc_end5 - stdio..Lfunc_begin5
	$short,	1                               // Loc expr size
	$byte,	80                              // DW_OP_reg0
	$long,	0
	$long,	0
stdio..Ldebug_loc20:
	$long,	 - 1
	$long,	stdio..Lfunc_begin5                   //   base address
	$long,	stdio..Ltmp164 - stdio..Lfunc_begin5
	$long,	stdio..Lfunc_end5 - stdio..Lfunc_begin5
	$short,	1                               // Loc expr size
	$byte,	81                              // DW_OP_reg1
	$long,	0
	$long,	0
	$section,	%debug_abbrev,"",@progbits
	$byte,	1                               // Abbreviation Code
	$byte,	17                              // DW_TAG_compile_unit
	$byte,	1                               // DW_CHILDREN_yes
	$byte,	37                              // DW_AT_producer
	$byte,	14                              // DW_FORM_strp
	$byte,	19                              // DW_AT_language
	$byte,	5                               // DW_FORM_data2
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	16                              // DW_AT_stmt_list
	$byte,	23                              // DW_FORM_sec_offset
	$byte,	27                              // DW_AT_comp_dir
	$byte,	14                              // DW_FORM_strp
	$byte,	17                              // DW_AT_low_pc
	$byte,	1                               // DW_FORM_addr
	$byte,	85                              // DW_AT_ranges
	$byte,	23                              // DW_FORM_sec_offset
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	2                               // Abbreviation Code
	$byte,	52                              // DW_TAG_variable
	$byte,	0                               // DW_CHILDREN_no
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	63                              // DW_AT_external
	$byte,	25                              // DW_FORM_flag_present
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	2                               // DW_AT_location
	$byte,	24                              // DW_FORM_exprloc
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	3                               // Abbreviation Code
	$byte,	36                              // DW_TAG_base_type
	$byte,	0                               // DW_CHILDREN_no
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	62                              // DW_AT_encoding
	$byte,	11                              // DW_FORM_data1
	$byte,	11                              // DW_AT_byte_size
	$byte,	11                              // DW_FORM_data1
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	4                               // Abbreviation Code
	$byte,	52                              // DW_TAG_variable
	$byte,	0                               // DW_CHILDREN_no
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	63                              // DW_AT_external
	$byte,	25                              // DW_FORM_flag_present
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$ascii,	"\210\001"                      // DW_AT_alignment
	$byte,	15                              // DW_FORM_udata
	$byte,	2                               // DW_AT_location
	$byte,	24                              // DW_FORM_exprloc
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	5                               // Abbreviation Code
	$byte,	1                               // DW_TAG_array_type
	$byte,	1                               // DW_CHILDREN_yes
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	6                               // Abbreviation Code
	$byte,	33                              // DW_TAG_subrange_type
	$byte,	0                               // DW_CHILDREN_no
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	55                              // DW_AT_count
	$byte,	6                               // DW_FORM_data4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	7                               // Abbreviation Code
	$byte,	36                              // DW_TAG_base_type
	$byte,	0                               // DW_CHILDREN_no
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	11                              // DW_AT_byte_size
	$byte,	11                              // DW_FORM_data1
	$byte,	62                              // DW_AT_encoding
	$byte,	11                              // DW_FORM_data1
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	8                               // Abbreviation Code
	$byte,	19                              // DW_TAG_structure_type
	$byte,	1                               // DW_CHILDREN_yes
	$byte,	11                              // DW_AT_byte_size
	$byte,	11                              // DW_FORM_data1
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	9                               // Abbreviation Code
	$byte,	13                              // DW_TAG_member
	$byte,	0                               // DW_CHILDREN_no
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	56                              // DW_AT_data_member_location
	$byte,	11                              // DW_FORM_data1
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	10                              // Abbreviation Code
	$byte,	22                              // DW_TAG_typedef
	$byte,	0                               // DW_CHILDREN_no
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	11                              // Abbreviation Code
	$byte,	52                              // DW_TAG_variable
	$byte,	0                               // DW_CHILDREN_no
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	2                               // DW_AT_location
	$byte,	24                              // DW_FORM_exprloc
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	12                              // Abbreviation Code
	$byte,	52                              // DW_TAG_variable
	$byte,	0                               // DW_CHILDREN_no
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$ascii,	"\210\001"                      // DW_AT_alignment
	$byte,	15                              // DW_FORM_udata
	$byte,	2                               // DW_AT_location
	$byte,	24                              // DW_FORM_exprloc
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	13                              // Abbreviation Code
	$byte,	33                              // DW_TAG_subrange_type
	$byte,	0                               // DW_CHILDREN_no
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	55                              // DW_AT_count
	$byte,	11                              // DW_FORM_data1
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	14                              // Abbreviation Code
	$byte,	15                              // DW_TAG_pointer_type
	$byte,	0                               // DW_CHILDREN_no
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	15                              // Abbreviation Code
	$byte,	15                              // DW_TAG_pointer_type
	$byte,	0                               // DW_CHILDREN_no
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	16                              // Abbreviation Code
	$byte,	46                              // DW_TAG_subprogram
	$byte,	1                               // DW_CHILDREN_yes
	$byte,	17                              // DW_AT_low_pc
	$byte,	1                               // DW_FORM_addr
	$byte,	18                              // DW_AT_high_pc
	$byte,	6                               // DW_FORM_data4
	$byte,	64                              // DW_AT_frame_base
	$byte,	24                              // DW_FORM_exprloc
	$ascii,	"\227B"                         // DW_AT_GNU_all_call_sites
	$byte,	25                              // DW_FORM_flag_present
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	39                              // DW_AT_prototyped
	$byte,	25                              // DW_FORM_flag_present
	$byte,	63                              // DW_AT_external
	$byte,	25                              // DW_FORM_flag_present
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	17                              // Abbreviation Code
	$byte,	5                               // DW_TAG_formal_parameter
	$byte,	0                               // DW_CHILDREN_no
	$byte,	2                               // DW_AT_location
	$byte,	23                              // DW_FORM_sec_offset
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	18                              // Abbreviation Code
	$byte,	52                              // DW_TAG_variable
	$byte,	0                               // DW_CHILDREN_no
	$byte,	2                               // DW_AT_location
	$byte,	23                              // DW_FORM_sec_offset
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	19                              // Abbreviation Code
	$byte,	10                              // DW_TAG_label
	$byte,	0                               // DW_CHILDREN_no
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	17                              // DW_AT_low_pc
	$byte,	1                               // DW_FORM_addr
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	20                              // Abbreviation Code
	$byte,	11                              // DW_TAG_lexical_block
	$byte,	1                               // DW_CHILDREN_yes
	$byte,	85                              // DW_AT_ranges
	$byte,	23                              // DW_FORM_sec_offset
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	21                              // Abbreviation Code
	$byte,	11                              // DW_TAG_lexical_block
	$byte,	1                               // DW_CHILDREN_yes
	$byte,	17                              // DW_AT_low_pc
	$byte,	1                               // DW_FORM_addr
	$byte,	18                              // DW_AT_high_pc
	$byte,	6                               // DW_FORM_data4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	22                              // Abbreviation Code
	$byte,	52                              // DW_TAG_variable
	$byte,	0                               // DW_CHILDREN_no
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	23                              // Abbreviation Code
	$byte,	24                              // DW_TAG_unspecified_parameters
	$byte,	0                               // DW_CHILDREN_no
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	24                              // Abbreviation Code
	$ascii,	"\211\202\001"                  // DW_TAG_GNU_call_site
	$byte,	0                               // DW_CHILDREN_no
	$ascii,	"\223B"                         // DW_AT_GNU_call_site_target
	$byte,	24                              // DW_FORM_exprloc
	$byte,	17                              // DW_AT_low_pc
	$byte,	1                               // DW_FORM_addr
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	25                              // Abbreviation Code
	$byte,	46                              // DW_TAG_subprogram
	$byte,	1                               // DW_CHILDREN_yes
	$byte,	17                              // DW_AT_low_pc
	$byte,	1                               // DW_FORM_addr
	$byte,	18                              // DW_AT_high_pc
	$byte,	6                               // DW_FORM_data4
	$byte,	64                              // DW_AT_frame_base
	$byte,	24                              // DW_FORM_exprloc
	$ascii,	"\227B"                         // DW_AT_GNU_all_call_sites
	$byte,	25                              // DW_FORM_flag_present
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	39                              // DW_AT_prototyped
	$byte,	25                              // DW_FORM_flag_present
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	26                              // Abbreviation Code
	$byte,	46                              // DW_TAG_subprogram
	$byte,	1                               // DW_CHILDREN_yes
	$byte,	17                              // DW_AT_low_pc
	$byte,	1                               // DW_FORM_addr
	$byte,	18                              // DW_AT_high_pc
	$byte,	6                               // DW_FORM_data4
	$byte,	64                              // DW_AT_frame_base
	$byte,	24                              // DW_FORM_exprloc
	$ascii,	"\227B"                         // DW_AT_GNU_all_call_sites
	$byte,	25                              // DW_FORM_flag_present
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	5                               // DW_FORM_data2
	$byte,	39                              // DW_AT_prototyped
	$byte,	25                              // DW_FORM_flag_present
	$byte,	63                              // DW_AT_external
	$byte,	25                              // DW_FORM_flag_present
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	27                              // Abbreviation Code
	$byte,	5                               // DW_TAG_formal_parameter
	$byte,	0                               // DW_CHILDREN_no
	$byte,	2                               // DW_AT_location
	$byte,	23                              // DW_FORM_sec_offset
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	5                               // DW_FORM_data2
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	28                              // Abbreviation Code
	$byte,	52                              // DW_TAG_variable
	$byte,	0                               // DW_CHILDREN_no
	$byte,	2                               // DW_AT_location
	$byte,	23                              // DW_FORM_sec_offset
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	5                               // DW_FORM_data2
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	29                              // Abbreviation Code
	$byte,	46                              // DW_TAG_subprogram
	$byte,	0                               // DW_CHILDREN_no
	$byte,	17                              // DW_AT_low_pc
	$byte,	1                               // DW_FORM_addr
	$byte,	18                              // DW_AT_high_pc
	$byte,	6                               // DW_FORM_data4
	$byte,	64                              // DW_AT_frame_base
	$byte,	24                              // DW_FORM_exprloc
	$ascii,	"\227B"                         // DW_AT_GNU_all_call_sites
	$byte,	25                              // DW_FORM_flag_present
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	30                              // Abbreviation Code
	$byte,	46                              // DW_TAG_subprogram
	$byte,	1                               // DW_CHILDREN_yes
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	39                              // DW_AT_prototyped
	$byte,	25                              // DW_FORM_flag_present
	$byte,	32                              // DW_AT_inline
	$byte,	11                              // DW_FORM_data1
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	31                              // Abbreviation Code
	$byte,	5                               // DW_TAG_formal_parameter
	$byte,	0                               // DW_CHILDREN_no
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	32                              // Abbreviation Code
	$byte,	38                              // DW_TAG_const_type
	$byte,	0                               // DW_CHILDREN_no
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	33                              // Abbreviation Code
	$byte,	46                              // DW_TAG_subprogram
	$byte,	1                               // DW_CHILDREN_yes
	$byte,	17                              // DW_AT_low_pc
	$byte,	1                               // DW_FORM_addr
	$byte,	18                              // DW_AT_high_pc
	$byte,	6                               // DW_FORM_data4
	$byte,	64                              // DW_AT_frame_base
	$byte,	24                              // DW_FORM_exprloc
	$ascii,	"\227B"                         // DW_AT_GNU_all_call_sites
	$byte,	25                              // DW_FORM_flag_present
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	58                              // DW_AT_decl_file
	$byte,	11                              // DW_FORM_data1
	$byte,	59                              // DW_AT_decl_line
	$byte,	11                              // DW_FORM_data1
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	34                              // Abbreviation Code
	$byte,	29                              // DW_TAG_inlined_subroutine
	$byte,	1                               // DW_CHILDREN_yes
	$byte,	49                              // DW_AT_abstract_origin
	$byte,	19                              // DW_FORM_ref4
	$byte,	17                              // DW_AT_low_pc
	$byte,	1                               // DW_FORM_addr
	$byte,	18                              // DW_AT_high_pc
	$byte,	6                               // DW_FORM_data4
	$byte,	88                              // DW_AT_call_file
	$byte,	11                              // DW_FORM_data1
	$byte,	89                              // DW_AT_call_line
	$byte,	11                              // DW_FORM_data1
	$byte,	87                              // DW_AT_call_column
	$byte,	11                              // DW_FORM_data1
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	35                              // Abbreviation Code
	$byte,	5                               // DW_TAG_formal_parameter
	$byte,	0                               // DW_CHILDREN_no
	$byte,	2                               // DW_AT_location
	$byte,	23                              // DW_FORM_sec_offset
	$byte,	49                              // DW_AT_abstract_origin
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	36                              // Abbreviation Code
	$byte,	5                               // DW_TAG_formal_parameter
	$byte,	0                               // DW_CHILDREN_no
	$byte,	2                               // DW_AT_location
	$byte,	24                              // DW_FORM_exprloc
	$byte,	49                              // DW_AT_abstract_origin
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	37                              // Abbreviation Code
	$byte,	5                               // DW_TAG_formal_parameter
	$byte,	0                               // DW_CHILDREN_no
	$byte,	28                              // DW_AT_const_value
	$byte,	15                              // DW_FORM_udata
	$byte,	49                              // DW_AT_abstract_origin
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	38                              // Abbreviation Code
	$byte,	55                              // DW_TAG_restrict_type
	$byte,	0                               // DW_CHILDREN_no
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	39                              // Abbreviation Code
	$byte,	38                              // DW_TAG_const_type
	$byte,	0                               // DW_CHILDREN_no
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	40                              // Abbreviation Code
	$byte,	22                              // DW_TAG_typedef
	$byte,	0                               // DW_CHILDREN_no
	$byte,	73                              // DW_AT_type
	$byte,	19                              // DW_FORM_ref4
	$byte,	3                               // DW_AT_name
	$byte,	14                              // DW_FORM_strp
	$byte,	0                               // EOM(1)
	$byte,	0                               // EOM(2)
	$byte,	0                               // EOM(3)
	$section,	%debug_info,"",@progbits
stdio..Lcu_begin0:
	$long,	stdio..Ldebug_info_end0 - stdio..Ldebug_info_start0 // Length of Unit
stdio..Ldebug_info_start0:
	$short,	4                               // DWARF version number
	$long,	%debug_abbrev                   // Offset Into Abbrev. Section
	$byte,	4                               // Address Size (in bytes)
	$byte,	1                               // Abbrev [1] 0xb:0x547 DW_TAG_compile_unit
	$long,	stdio..Linfo_string0                  // DW_AT_producer
	$short,	12                              // DW_AT_language
	$long,	stdio..Linfo_string1                  // DW_AT_name
	$long,	stdio..Lline_table_start0             // DW_AT_stmt_list
	$long,	stdio..Linfo_string2                  // DW_AT_comp_dir
	$long,	0                               // DW_AT_low_pc
	$long,	stdio..Ldebug_ranges2                 // DW_AT_ranges
	$byte,	2                               // Abbrev [2] 0x26:0x11 DW_TAG_variable
	$long,	stdio..Linfo_string3                  // DW_AT_name
	$long,	55                              // DW_AT_type
                                        // DW_AT_external
	$byte,	1                               // DW_AT_decl_file
	$byte,	19                              // DW_AT_decl_line
	$byte,	5                               // DW_AT_location
	$byte,	3
	$long,	stdio.__stdout_buffer_size
	$byte,	3                               // Abbrev [3] 0x37:0x7 DW_TAG_base_type
	$long,	stdio..Linfo_string4                  // DW_AT_name
	$byte,	7                               // DW_AT_encoding
	$byte,	4                               // DW_AT_byte_size
	$byte,	4                               // Abbrev [4] 0x3e:0x12 DW_TAG_variable
	$long,	stdio..Linfo_string5                  // DW_AT_name
	$long,	80                              // DW_AT_type
                                        // DW_AT_external
	$byte,	1                               // DW_AT_decl_file
	$byte,	18                              // DW_AT_decl_line
	$byte,	8                               // DW_AT_alignment
	$byte,	5                               // DW_AT_location
	$byte,	3
	$long,	stdio.__stdout_buffer
	$byte,	5                               // Abbrev [5] 0x50:0xf DW_TAG_array_type
	$long,	95                              // DW_AT_type
	$byte,	6                               // Abbrev [6] 0x55:0x9 DW_TAG_subrange_type
	$long,	102                             // DW_AT_type
	$long,	1048576                         // DW_AT_count
	$byte,	0                               // End Of Children Mark
	$byte,	3                               // Abbrev [3] 0x5f:0x7 DW_TAG_base_type
	$long,	stdio..Linfo_string6                  // DW_AT_name
	$byte,	8                               // DW_AT_encoding
	$byte,	1                               // DW_AT_byte_size
	$byte,	7                               // Abbrev [7] 0x66:0x7 DW_TAG_base_type
	$long,	stdio..Linfo_string7                  // DW_AT_name
	$byte,	8                               // DW_AT_byte_size
	$byte,	7                               // DW_AT_encoding
	$byte,	4                               // Abbrev [4] 0x6d:0x12 DW_TAG_variable
	$long,	stdio..Linfo_string8                  // DW_AT_name
	$long,	127                             // DW_AT_type
                                        // DW_AT_external
	$byte,	1                               // DW_AT_decl_file
	$byte,	31                              // DW_AT_decl_line
	$byte,	8                               // DW_AT_alignment
	$byte,	5                               // DW_AT_location
	$byte,	3
	$long,	__stdout_buffer_state
	$byte,	8                               // Abbrev [8] 0x7f:0x1d DW_TAG_structure_type
	$byte,	8                               // DW_AT_byte_size
	$byte,	1                               // DW_AT_decl_file
	$byte,	28                              // DW_AT_decl_line
	$byte,	9                               // Abbrev [9] 0x83:0xc DW_TAG_member
	$long,	stdio..Linfo_string9                  // DW_AT_name
	$long,	156                             // DW_AT_type
	$byte,	1                               // DW_AT_decl_file
	$byte,	29                              // DW_AT_decl_line
	$byte,	0                               // DW_AT_data_member_location
	$byte,	9                               // Abbrev [9] 0x8f:0xc DW_TAG_member
	$long,	stdio..Linfo_string11                 // DW_AT_name
	$long,	156                             // DW_AT_type
	$byte,	1                               // DW_AT_decl_file
	$byte,	30                              // DW_AT_decl_line
	$byte,	4                               // DW_AT_data_member_location
	$byte,	0                               // End Of Children Mark
	$byte,	10                              // Abbrev [10] 0x9c:0xb DW_TAG_typedef
	$long,	55                              // DW_AT_type
	$long,	stdio..Linfo_string10                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	48                              // DW_AT_decl_line
	$byte,	2                               // Abbrev [2] 0xa7:0x11 DW_TAG_variable
	$long,	stdio..Linfo_string12                 // DW_AT_name
	$long,	184                             // DW_AT_type
                                        // DW_AT_external
	$byte,	1                               // DW_AT_decl_file
	$byte,	43                              // DW_AT_decl_line
	$byte,	5                               // DW_AT_location
	$byte,	3
	$long,	__atomic_bit___stdout_buffer_lock
	$byte,	10                              // Abbrev [10] 0xb8:0xb DW_TAG_typedef
	$long,	95                              // DW_AT_type
	$long,	stdio..Linfo_string13                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	40                              // DW_AT_decl_line
	$byte,	11                              // Abbrev [11] 0xc3:0x11 DW_TAG_variable
	$long,	stdio..Linfo_string14                 // DW_AT_name
	$long,	55                              // DW_AT_type
	$byte,	1                               // DW_AT_decl_file
	$byte,	41                              // DW_AT_decl_line
	$byte,	5                               // DW_AT_location
	$byte,	3
	$long,	stdio.__stdout_cache_write_index
	$byte,	11                              // Abbrev [11] 0xd4:0x11 DW_TAG_variable
	$long,	stdio..Linfo_string15                 // DW_AT_name
	$long,	156                             // DW_AT_type
	$byte,	1                               // DW_AT_decl_file
	$byte,	34                              // DW_AT_decl_line
	$byte,	5                               // DW_AT_location
	$byte,	3
	$long,	stdio.__stdout_nr_of_wrapping
	$byte,	11                              // Abbrev [11] 0xe5:0x11 DW_TAG_variable
	$long,	stdio..Linfo_string16                 // DW_AT_name
	$long,	156                             // DW_AT_type
	$byte,	1                               // DW_AT_decl_file
	$byte,	33                              // DW_AT_decl_line
	$byte,	5                               // DW_AT_location
	$byte,	3
	$long,	stdio.__stdout_buffer_write_pointer_initial
	$byte,	12                              // Abbrev [12] 0xf6:0x12 DW_TAG_variable
	$long,	stdio..Linfo_string17                 // DW_AT_name
	$long,	264                             // DW_AT_type
	$byte,	1                               // DW_AT_decl_file
	$byte,	40                              // DW_AT_decl_line
	$byte,	8                               // DW_AT_alignment
	$byte,	5                               // DW_AT_location
	$byte,	3
	$long,	stdio.__stdout_cache_buffer
	$byte,	5                               // Abbrev [5] 0x108:0xc DW_TAG_array_type
	$long,	276                             // DW_AT_type
	$byte,	13                              // Abbrev [13] 0x10d:0x6 DW_TAG_subrange_type
	$long,	102                             // DW_AT_type
	$byte,	8                               // DW_AT_count
	$byte,	0                               // End Of Children Mark
	$byte,	3                               // Abbrev [3] 0x114:0x7 DW_TAG_base_type
	$long,	stdio..Linfo_string18                 // DW_AT_name
	$byte,	6                               // DW_AT_encoding
	$byte,	1                               // DW_AT_byte_size
	$byte,	14                              // Abbrev [14] 0x11b:0x5 DW_TAG_pointer_type
	$long,	276                             // DW_AT_type
	$byte,	3                               // Abbrev [3] 0x120:0x7 DW_TAG_base_type
	$long,	stdio..Linfo_string19                 // DW_AT_name
	$byte,	5                               // DW_AT_encoding
	$byte,	8                               // DW_AT_byte_size
	$byte,	15                              // Abbrev [15] 0x127:0x1 DW_TAG_pointer_type
	$byte,	10                              // Abbrev [10] 0x128:0xb DW_TAG_typedef
	$long,	55                              // DW_AT_type
	$long,	stdio..Linfo_string20                 // DW_AT_name
	$byte,	2                               // DW_AT_decl_file
	$byte,	144                             // DW_AT_decl_line
	$byte,	16                              // Abbrev [16] 0x133:0x224 DW_TAG_subprogram
	$long,	stdio..Lfunc_begin0                   // DW_AT_low_pc
	$long,	stdio..Lfunc_end0 - stdio..Lfunc_begin0       // DW_AT_high_pc
	$byte,	1                               // DW_AT_frame_base
	$byte,	102
                                        // DW_AT_GNU_all_call_sites
	$long,	stdio..Linfo_string25                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	101                             // DW_AT_decl_line
                                        // DW_AT_prototyped
                                        // DW_AT_external
	$byte,	17                              // Abbrev [17] 0x144:0xf DW_TAG_formal_parameter
	$long,	stdio..Ldebug_loc0                    // DW_AT_location
	$long,	stdio..Linfo_string33                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	101                             // DW_AT_decl_line
	$long,	1305                            // DW_AT_type
	$byte,	18                              // Abbrev [18] 0x153:0xf DW_TAG_variable
	$long,	stdio..Ldebug_loc1                    // DW_AT_location
	$long,	stdio..Linfo_string34                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	105                             // DW_AT_decl_line
	$long,	283                             // DW_AT_type
	$byte,	18                              // Abbrev [18] 0x162:0xf DW_TAG_variable
	$long,	stdio..Ldebug_loc2                    // DW_AT_location
	$long,	stdio..Linfo_string35                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	104                             // DW_AT_decl_line
	$long,	1320                            // DW_AT_type
	$byte,	18                              // Abbrev [18] 0x171:0xf DW_TAG_variable
	$long,	stdio..Ldebug_loc3                    // DW_AT_location
	$long,	stdio..Linfo_string37                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	103                             // DW_AT_decl_line
	$long,	1320                            // DW_AT_type
	$byte,	18                              // Abbrev [18] 0x180:0xf DW_TAG_variable
	$long,	stdio..Ldebug_loc4                    // DW_AT_location
	$long,	stdio..Linfo_string38                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	109                             // DW_AT_decl_line
	$long,	1327                            // DW_AT_type
	$byte,	19                              // Abbrev [19] 0x18f:0xb DW_TAG_label
	$long,	stdio..Linfo_string49                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	148                             // DW_AT_decl_line
	$long,	stdio..Ltmp27                         // DW_AT_low_pc
	$byte,	19                              // Abbrev [19] 0x19a:0xb DW_TAG_label
	$long,	stdio..Linfo_string50                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	242                             // DW_AT_decl_line
	$long,	stdio..Ltmp39                         // DW_AT_low_pc
	$byte,	20                              // Abbrev [20] 0x1a5:0xfa DW_TAG_lexical_block
	$long,	stdio..Ldebug_ranges1                 // DW_AT_ranges
	$byte,	18                              // Abbrev [18] 0x1aa:0xf DW_TAG_variable
	$long,	stdio..Ldebug_loc5                    // DW_AT_location
	$long,	stdio..Linfo_string41                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	174                             // DW_AT_decl_line
	$long,	1320                            // DW_AT_type
	$byte,	21                              // Abbrev [21] 0x1b9:0x52 DW_TAG_lexical_block
	$long,	stdio..Ltmp65                         // DW_AT_low_pc
	$long,	stdio..Ltmp86 - stdio..Ltmp65                 // DW_AT_high_pc
	$byte,	22                              // Abbrev [22] 0x1c2:0xb DW_TAG_variable
	$long,	stdio..Linfo_string44                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	215                             // DW_AT_decl_line
	$long,	283                             // DW_AT_type
	$byte,	22                              // Abbrev [22] 0x1cd:0xb DW_TAG_variable
	$long,	stdio..Linfo_string45                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	214                             // DW_AT_decl_line
	$long,	1354                            // DW_AT_type
	$byte,	21                              // Abbrev [21] 0x1d8:0x32 DW_TAG_lexical_block
	$long,	stdio..Ltmp66                         // DW_AT_low_pc
	$long,	stdio..Ltmp86 - stdio..Ltmp66                 // DW_AT_high_pc
	$byte,	18                              // Abbrev [18] 0x1e1:0xf DW_TAG_variable
	$long,	stdio..Ldebug_loc6                    // DW_AT_location
	$long,	stdio..Linfo_string42                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	216                             // DW_AT_decl_line
	$long,	1347                            // DW_AT_type
	$byte,	21                              // Abbrev [21] 0x1f0:0x19 DW_TAG_lexical_block
	$long,	stdio..Ltmp66                         // DW_AT_low_pc
	$long,	stdio..Ltmp86 - stdio..Ltmp66                 // DW_AT_high_pc
	$byte,	18                              // Abbrev [18] 0x1f9:0xf DW_TAG_variable
	$long,	stdio..Ldebug_loc7                    // DW_AT_location
	$long,	stdio..Linfo_string47                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	217                             // DW_AT_decl_line
	$long,	276                             // DW_AT_type
	$byte,	0                               // End Of Children Mark
	$byte,	0                               // End Of Children Mark
	$byte,	0                               // End Of Children Mark
	$byte,	21                              // Abbrev [21] 0x20b:0x65 DW_TAG_lexical_block
	$long,	stdio..Ltmp88                         // DW_AT_low_pc
	$long,	stdio..Ltmp101 - stdio..Ltmp88                // DW_AT_high_pc
	$byte,	18                              // Abbrev [18] 0x214:0xf DW_TAG_variable
	$long,	stdio..Ldebug_loc8                    // DW_AT_location
	$long,	stdio..Linfo_string45                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	224                             // DW_AT_decl_line
	$long,	288                             // DW_AT_type
	$byte,	18                              // Abbrev [18] 0x223:0xf DW_TAG_variable
	$long,	stdio..Ldebug_loc9                    // DW_AT_location
	$long,	stdio..Linfo_string48                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	223                             // DW_AT_decl_line
	$long,	55                              // DW_AT_type
	$byte,	18                              // Abbrev [18] 0x232:0xf DW_TAG_variable
	$long,	stdio..Ldebug_loc11                   // DW_AT_location
	$long,	stdio..Linfo_string44                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	234                             // DW_AT_decl_line
	$long,	283                             // DW_AT_type
	$byte,	21                              // Abbrev [21] 0x241:0x2e DW_TAG_lexical_block
	$long,	stdio..Ltmp94                         // DW_AT_low_pc
	$long,	stdio..Ltmp101 - stdio..Ltmp94                // DW_AT_high_pc
	$byte,	18                              // Abbrev [18] 0x24a:0xf DW_TAG_variable
	$long,	stdio..Ldebug_loc10                   // DW_AT_location
	$long,	stdio..Linfo_string42                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	235                             // DW_AT_decl_line
	$long,	55                              // DW_AT_type
	$byte,	20                              // Abbrev [20] 0x259:0x15 DW_TAG_lexical_block
	$long,	stdio..Ldebug_ranges0                 // DW_AT_ranges
	$byte,	18                              // Abbrev [18] 0x25e:0xf DW_TAG_variable
	$long,	stdio..Ldebug_loc12                   // DW_AT_location
	$long,	stdio..Linfo_string47                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	236                             // DW_AT_decl_line
	$long,	276                             // DW_AT_type
	$byte,	0                               // End Of Children Mark
	$byte,	0                               // End Of Children Mark
	$byte,	0                               // End Of Children Mark
	$byte,	21                              // Abbrev [21] 0x270:0x15 DW_TAG_lexical_block
	$long,	stdio..Ltmp103                        // DW_AT_low_pc
	$long,	stdio..Ltmp104 - stdio..Ltmp103               // DW_AT_high_pc
	$byte,	22                              // Abbrev [22] 0x279:0xb DW_TAG_variable
	$long,	stdio..Linfo_string51                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	204                             // DW_AT_decl_line
	$long,	276                             // DW_AT_type
	$byte,	0                               // End Of Children Mark
	$byte,	21                              // Abbrev [21] 0x285:0x19 DW_TAG_lexical_block
	$long,	stdio..Ltmp106                        // DW_AT_low_pc
	$long,	stdio..Ltmp113 - stdio..Ltmp106               // DW_AT_high_pc
	$byte,	18                              // Abbrev [18] 0x28e:0xf DW_TAG_variable
	$long,	stdio..Ldebug_loc13                   // DW_AT_location
	$long,	stdio..Linfo_string44                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	195                             // DW_AT_decl_line
	$long,	283                             // DW_AT_type
	$byte,	0                               // End Of Children Mark
	$byte,	0                               // End Of Children Mark
	$byte,	23                              // Abbrev [23] 0x29f:0x1 DW_TAG_unspecified_parameters
	$byte,	24                              // Abbrev [24] 0x2a0:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp1                          // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x2a7:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp12                         // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x2ae:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp14                         // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x2b5:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp21                         // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x2bc:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp26                         // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x2c3:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp31                         // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x2ca:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp33                         // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x2d1:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp36                         // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x2d8:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp40                         // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x2df:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp51                         // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x2e6:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp68                         // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x2ed:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp71                         // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x2f4:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp74                         // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x2fb:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp76                         // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x302:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp78                         // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x309:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp81                         // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x310:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp84                         // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x317:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp87                         // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x31e:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp96                         // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x325:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp100                        // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x32c:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp105                        // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x333:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp110                        // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x33a:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp113                        // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x341:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp117                        // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x348:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp118                        // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x34f:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp119                        // DW_AT_low_pc
	$byte,	0                               // End Of Children Mark
	$byte,	25                              // Abbrev [25] 0x357:0x28 DW_TAG_subprogram
	$long,	stdio..Lfunc_begin1                   // DW_AT_low_pc
	$long,	stdio..Lfunc_end1 - stdio..Lfunc_begin1       // DW_AT_high_pc
	$byte,	1                               // DW_AT_frame_base
	$byte,	102
                                        // DW_AT_GNU_all_call_sites
	$long,	stdio..Linfo_string26                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	63                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	$byte,	17                              // Abbrev [17] 0x368:0xf DW_TAG_formal_parameter
	$long,	stdio..Ldebug_loc14                   // DW_AT_location
	$long,	stdio..Linfo_string52                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	63                              // DW_AT_decl_line
	$long,	184                             // DW_AT_type
	$byte,	24                              // Abbrev [24] 0x377:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp126                        // DW_AT_low_pc
	$byte,	0                               // End Of Children Mark
	$byte,	26                              // Abbrev [26] 0x37f:0x7c DW_TAG_subprogram
	$long,	stdio..Lfunc_begin2                   // DW_AT_low_pc
	$long,	stdio..Lfunc_end2 - stdio..Lfunc_begin2       // DW_AT_high_pc
	$byte,	1                               // DW_AT_frame_base
	$byte,	102
                                        // DW_AT_GNU_all_call_sites
	$long,	stdio..Linfo_string27                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$short,	259                             // DW_AT_decl_line
                                        // DW_AT_prototyped
                                        // DW_AT_external
	$byte,	27                              // Abbrev [27] 0x391:0x10 DW_TAG_formal_parameter
	$long,	stdio..Ldebug_loc15                   // DW_AT_location
	$long,	stdio..Linfo_string53                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$short,	259                             // DW_AT_decl_line
	$long,	1310                            // DW_AT_type
	$byte,	21                              // Abbrev [21] 0x3a1:0x1a DW_TAG_lexical_block
	$long,	stdio..Ltmp133                        // DW_AT_low_pc
	$long,	stdio..Ltmp140 - stdio..Ltmp133               // DW_AT_high_pc
	$byte,	28                              // Abbrev [28] 0x3aa:0x10 DW_TAG_variable
	$long,	stdio..Ldebug_loc16                   // DW_AT_location
	$long,	stdio..Linfo_string54                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$short,	267                             // DW_AT_decl_line
	$long,	283                             // DW_AT_type
	$byte,	0                               // End Of Children Mark
	$byte,	24                              // Abbrev [24] 0x3bb:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp130                        // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x3c2:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp131                        // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x3c9:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp132                        // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x3d0:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp133                        // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x3d7:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp137                        // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x3de:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp141                        // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x3e5:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp142                        // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x3ec:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp143                        // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x3f3:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp144                        // DW_AT_low_pc
	$byte,	0                               // End Of Children Mark
	$byte,	26                              // Abbrev [26] 0x3fb:0x64 DW_TAG_subprogram
	$long,	stdio..Lfunc_begin3                   // DW_AT_low_pc
	$long,	stdio..Lfunc_end3 - stdio..Lfunc_begin3       // DW_AT_high_pc
	$byte,	1                               // DW_AT_frame_base
	$byte,	102
                                        // DW_AT_GNU_all_call_sites
	$long,	stdio..Linfo_string28                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$short,	279                             // DW_AT_decl_line
                                        // DW_AT_prototyped
                                        // DW_AT_external
	$byte,	27                              // Abbrev [27] 0x40d:0x10 DW_TAG_formal_parameter
	$long,	stdio..Ldebug_loc17                   // DW_AT_location
	$long,	stdio..Linfo_string55                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$short,	279                             // DW_AT_decl_line
	$long,	1347                            // DW_AT_type
	$byte,	28                              // Abbrev [28] 0x41d:0x10 DW_TAG_variable
	$long,	stdio..Ldebug_loc18                   // DW_AT_location
	$long,	stdio..Linfo_string51                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$short,	287                             // DW_AT_decl_line
	$long,	276                             // DW_AT_type
	$byte,	24                              // Abbrev [24] 0x42d:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp147                        // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x434:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp148                        // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x43b:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp149                        // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x442:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp150                        // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x449:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp152                        // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x450:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp153                        // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x457:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp154                        // DW_AT_low_pc
	$byte,	0                               // End Of Children Mark
	$byte,	29                              // Abbrev [29] 0x45f:0x11 DW_TAG_subprogram
	$long,	stdio..Lfunc_begin4                   // DW_AT_low_pc
	$long,	stdio..Lfunc_end4 - stdio..Lfunc_begin4       // DW_AT_high_pc
	$byte,	1                               // DW_AT_frame_base
	$byte,	102
                                        // DW_AT_GNU_all_call_sites
	$long,	stdio..Linfo_string29                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	84                              // DW_AT_decl_line
	$byte,	30                              // Abbrev [30] 0x470:0x2a DW_TAG_subprogram
	$long,	stdio..Linfo_string21                 // DW_AT_name
	$byte,	3                               // DW_AT_decl_file
	$byte,	51                              // DW_AT_decl_line
                                        // DW_AT_prototyped
	$byte,	1                               // DW_AT_inline
	$byte,	31                              // Abbrev [31] 0x478:0xb DW_TAG_formal_parameter
	$long,	stdio..Linfo_string22                 // DW_AT_name
	$byte,	3                               // DW_AT_decl_file
	$byte,	51                              // DW_AT_decl_line
	$long,	1178                            // DW_AT_type
	$byte,	31                              // Abbrev [31] 0x483:0xb DW_TAG_formal_parameter
	$long,	stdio..Linfo_string23                 // DW_AT_name
	$byte,	3                               // DW_AT_decl_file
	$byte,	51                              // DW_AT_decl_line
	$long,	295                             // DW_AT_type
	$byte,	31                              // Abbrev [31] 0x48e:0xb DW_TAG_formal_parameter
	$long,	stdio..Linfo_string24                 // DW_AT_name
	$byte,	3                               // DW_AT_decl_file
	$byte,	51                              // DW_AT_decl_line
	$long,	55                              // DW_AT_type
	$byte,	0                               // End Of Children Mark
	$byte,	14                              // Abbrev [14] 0x49a:0x5 DW_TAG_pointer_type
	$long,	1183                            // DW_AT_type
	$byte,	32                              // Abbrev [32] 0x49f:0x1 DW_TAG_const_type
	$byte,	33                              // Abbrev [33] 0x4a0:0x48 DW_TAG_subprogram
	$long,	stdio..Lfunc_begin5                   // DW_AT_low_pc
	$long,	stdio..Lfunc_end5 - stdio..Lfunc_begin5       // DW_AT_high_pc
	$byte,	1                               // DW_AT_frame_base
	$byte,	102
                                        // DW_AT_GNU_all_call_sites
	$long,	stdio..Linfo_string30                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	46                              // DW_AT_decl_line
	$byte,	18                              // Abbrev [18] 0x4b1:0xf DW_TAG_variable
	$long,	stdio..Ldebug_loc19                   // DW_AT_location
	$long,	stdio..Linfo_string56                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	48                              // DW_AT_decl_line
	$long,	295                             // DW_AT_type
	$byte,	34                              // Abbrev [34] 0x4c0:0x27 DW_TAG_inlined_subroutine
	$long,	1136                            // DW_AT_abstract_origin
	$long,	stdio..Ltmp163                        // DW_AT_low_pc
	$long,	stdio..Ltmp165 - stdio..Ltmp163               // DW_AT_high_pc
	$byte,	1                               // DW_AT_call_file
	$byte,	57                              // DW_AT_call_line
	$byte,	5                               // DW_AT_call_column
	$byte,	35                              // Abbrev [35] 0x4d0:0x9 DW_TAG_formal_parameter
	$long,	stdio..Ldebug_loc20                   // DW_AT_location
	$long,	1144                            // DW_AT_abstract_origin
	$byte,	36                              // Abbrev [36] 0x4d9:0x7 DW_TAG_formal_parameter
	$byte,	1                               // DW_AT_location
	$byte,	80
	$long,	1155                            // DW_AT_abstract_origin
	$byte,	37                              // Abbrev [37] 0x4e0:0x6 DW_TAG_formal_parameter
	$byte,	8                               // DW_AT_const_value
	$long,	1166                            // DW_AT_abstract_origin
	$byte,	0                               // End Of Children Mark
	$byte,	0                               // End Of Children Mark
	$byte,	33                              // Abbrev [33] 0x4e8:0x20 DW_TAG_subprogram
	$long,	stdio..Lfunc_begin6                   // DW_AT_low_pc
	$long,	stdio..Lfunc_end6 - stdio..Lfunc_begin6       // DW_AT_high_pc
	$byte,	1                               // DW_AT_frame_base
	$byte,	102
                                        // DW_AT_GNU_all_call_sites
	$long,	stdio..Linfo_string31                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	73                              // DW_AT_decl_line
	$byte,	24                              // Abbrev [24] 0x4f9:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp168                        // DW_AT_low_pc
	$byte,	24                              // Abbrev [24] 0x500:0x7 DW_TAG_GNU_call_site
	$byte,	1                               // DW_AT_GNU_call_site_target
	$byte,	103
	$long,	stdio..Ltmp169                        // DW_AT_low_pc
	$byte,	0                               // End Of Children Mark
	$byte,	29                              // Abbrev [29] 0x508:0x11 DW_TAG_subprogram
	$long,	stdio..Lfunc_begin7                   // DW_AT_low_pc
	$long,	stdio..Lfunc_end7 - stdio..Lfunc_begin7       // DW_AT_high_pc
	$byte,	1                               // DW_AT_frame_base
	$byte,	102
                                        // DW_AT_GNU_all_call_sites
	$long,	stdio..Linfo_string32                 // DW_AT_name
	$byte,	1                               // DW_AT_decl_file
	$byte,	95                              // DW_AT_decl_line
	$byte,	38                              // Abbrev [38] 0x519:0x5 DW_TAG_restrict_type
	$long,	1310                            // DW_AT_type
	$byte,	14                              // Abbrev [14] 0x51e:0x5 DW_TAG_pointer_type
	$long,	1315                            // DW_AT_type
	$byte,	39                              // Abbrev [39] 0x523:0x5 DW_TAG_const_type
	$long,	276                             // DW_AT_type
	$byte,	3                               // Abbrev [3] 0x528:0x7 DW_TAG_base_type
	$long,	stdio..Linfo_string36                 // DW_AT_name
	$byte,	2                               // DW_AT_encoding
	$byte,	1                               // DW_AT_byte_size
	$byte,	10                              // Abbrev [10] 0x52f:0xb DW_TAG_typedef
	$long,	1338                            // DW_AT_type
	$long,	stdio..Linfo_string40                 // DW_AT_name
	$byte,	4                               // DW_AT_decl_file
	$byte,	30                              // DW_AT_decl_line
	$byte,	40                              // Abbrev [40] 0x53a:0x9 DW_TAG_typedef
	$long,	295                             // DW_AT_type
	$long,	stdio..Linfo_string39                 // DW_AT_name
	$byte,	3                               // Abbrev [3] 0x543:0x7 DW_TAG_base_type
	$long,	stdio..Linfo_string43                 // DW_AT_name
	$byte,	5                               // DW_AT_encoding
	$byte,	4                               // DW_AT_byte_size
	$byte,	3                               // Abbrev [3] 0x54a:0x7 DW_TAG_base_type
	$long,	stdio..Linfo_string46                 // DW_AT_name
	$byte,	4                               // DW_AT_encoding
	$byte,	8                               // DW_AT_byte_size
	$byte,	0                               // End Of Children Mark
stdio..Ldebug_info_end0:
	$section,	%debug_ranges,"",@progbits
stdio..Ldebug_ranges0:
	$long,	stdio..Ltmp94
	$long,	stdio..Ltmp96
	$long,	stdio..Ltmp98
	$long,	stdio..Ltmp100
	$long,	0
	$long,	0
stdio..Ldebug_ranges1:
	$long,	stdio..Ltmp44
	$long,	stdio..Ltmp101
	$long,	stdio..Ltmp103
	$long,	stdio..Ltmp113
	$long,	0
	$long,	0
stdio..Ldebug_ranges2:
	$long,	stdio..Lfunc_begin0
	$long,	stdio..Lfunc_end0
	$long,	stdio..Lfunc_begin1
	$long,	stdio..Lfunc_end1
	$long,	stdio..Lfunc_begin2
	$long,	stdio..Lfunc_end2
	$long,	stdio..Lfunc_begin3
	$long,	stdio..Lfunc_end3
	$long,	stdio..Lfunc_begin4
	$long,	stdio..Lfunc_end4
	$long,	stdio..Lfunc_begin5
	$long,	stdio..Lfunc_end5
	$long,	stdio..Lfunc_begin6
	$long,	stdio..Lfunc_end6
	$long,	stdio..Lfunc_begin7
	$long,	stdio..Lfunc_end7
	$long,	0
	$long,	0
	$section,	%debug_str,"MS",@progbits,1
stdio..Linfo_string0:
	$asciz,	"clang version 12.0.0 (https://github.com/upmem/llvm - project.git d36425841d9a4d1420b7aa155675f6ae8bcf9f08)" // string offset=0
stdio..Linfo_string1:
	$asciz,	"/root/uPIMulator_frontend/sdk/stdlib/stdio.c" // string offset=106
stdio..Linfo_string2:
	$asciz,	"/root/upmem_compiler"          // string offset=151
stdio..Linfo_string3:
	$asciz,	"__stdout_buffer_size"          // string offset=172
stdio..Linfo_string4:
	$asciz,	"unsigned int"                  // string offset=193
stdio..Linfo_string5:
	$asciz,	"__stdout_buffer"               // string offset=206
stdio..Linfo_string6:
	$asciz,	"unsigned char"                 // string offset=222
stdio..Linfo_string7:
	$asciz,	"__ARRAY_SIZE_TYPE__"           // string offset=236
stdio..Linfo_string8:
	$asciz,	"__stdout_buffer_state"         // string offset=256
stdio..Linfo_string9:
	$asciz,	"wp"                            // string offset=278
stdio..Linfo_string10:
	$asciz,	"uint32_t"                      // string offset=281
stdio..Linfo_string11:
	$asciz,	"has_wrapped"                   // string offset=290
stdio..Linfo_string12:
	$asciz,	"__atomic_bit___stdout_buffer_lock" // string offset=302
stdio..Linfo_string13:
	$asciz,	"uint8_t"                       // string offset=336
stdio..Linfo_string14:
	$asciz,	"__stdout_cache_write_index"    // string offset=344
stdio..Linfo_string15:
	$asciz,	"__stdout_nr_of_wrapping"       // string offset=371
stdio..Linfo_string16:
	$asciz,	"__stdout_buffer_write_pointer_initial" // string offset=395
stdio..Linfo_string17:
	$asciz,	"__stdout_cache_buffer"         // string offset=433
stdio..Linfo_string18:
	$asciz,	"char"                          // string offset=455
stdio..Linfo_string19:
	$asciz,	"long int"                      // string offset=460
stdio..Linfo_string20:
	$asciz,	"uintptr_t"                     // string offset=469
stdio..Linfo_string21:
	$asciz,	"mram_write"                    // string offset=479
stdio..Linfo_string22:
	$asciz,	"from"                          // string offset=490
stdio..Linfo_string23:
	$asciz,	"to"                            // string offset=495
stdio..Linfo_string24:
	$asciz,	"nb_of_bytes"                   // string offset=498
stdio..Linfo_string25:
	$asciz,	"printf"                        // string offset=510
stdio..Linfo_string26:
	$asciz,	"__write_byte_and_flush_if_needed" // string offset=517
stdio..Linfo_string27:
	$asciz,	"puts"                          // string offset=550
stdio..Linfo_string28:
	$asciz,	"putchar"                       // string offset=555
stdio..Linfo_string29:
	$asciz,	"__open_print_sequence"         // string offset=563
stdio..Linfo_string30:
	$asciz,	"__transfer_cache_to_mram"      // string offset=585
stdio..Linfo_string31:
	$asciz,	"__finalized_print_sequence"    // string offset=610
stdio..Linfo_string32:
	$asciz,	"__close_print_sequence"        // string offset=637
stdio..Linfo_string33:
	$asciz,	"format"                        // string offset=660
stdio..Linfo_string34:
	$asciz,	"current_format_char_ptr"       // string offset=667
stdio..Linfo_string35:
	$asciz,	"insert_string_arg_end_character" // string offset=691
stdio..Linfo_string36:
	$asciz,	"_Bool"                         // string offset=723
stdio..Linfo_string37:
	$asciz,	"insert_string_arg"             // string offset=729
stdio..Linfo_string38:
	$asciz,	"args"                          // string offset=747
stdio..Linfo_string39:
	$asciz,	"__builtin_va_list"             // string offset=752
stdio..Linfo_string40:
	$asciz,	"va_list"                       // string offset=770
stdio..Linfo_string41:
	$asciz,	"arg_is_64_bits"                // string offset=778
stdio..Linfo_string42:
	$asciz,	"i"                             // string offset=793
stdio..Linfo_string43:
	$asciz,	"int"                           // string offset=795
stdio..Linfo_string44:
	$asciz,	"arg"                           // string offset=799
stdio..Linfo_string45:
	$asciz,	"val"                           // string offset=803
stdio..Linfo_string46:
	$asciz,	"double"                        // string offset=807
stdio..Linfo_string47:
	$asciz,	"arg_byte"                      // string offset=814
stdio..Linfo_string48:
	$asciz,	"arg_size_in_bytes"             // string offset=823
stdio..Linfo_string49:
	$asciz,	"standard_character_format_process" // string offset=841
stdio..Linfo_string50:
	$asciz,	"standard_character_process"    // string offset=875
stdio..Linfo_string51:
	$asciz,	"arg_as_char"                   // string offset=902
stdio..Linfo_string52:
	$asciz,	"byte"                          // string offset=914
stdio..Linfo_string53:
	$asciz,	"str"                           // string offset=919
stdio..Linfo_string54:
	$asciz,	"current_char_ptr"              // string offset=923
stdio..Linfo_string55:
	$asciz,	"c"                             // string offset=940
stdio..Linfo_string56:
	$asciz,	"offset_in_mram"                // string offset=942
	$addrsig,
	$addrsig_sym, stdio.__stdout_buffer
	$addrsig_sym, __stdout_buffer_state
	$addrsig_sym, __atomic_bit___stdout_buffer_lock
	$addrsig_sym, stdio.__stdout_cache_buffer
	$section,	%debug_line,"",@progbits
stdio..Lline_table_start0:
