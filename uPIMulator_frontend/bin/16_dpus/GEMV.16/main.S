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
	$file,	"mul32.c"
	$section,	%text, __mulsi3,"ax",@progbits
	$globl,	__mulsi3                        //  -  -  Begin function __mulsi3
	$type,	__mulsi3,@function
__mulsi3:                               // @__mulsi3
mul32..Lfunc_begin0:
// %bb.0:
	// inline asm
	$jgtu , r1, r0, mul32.__mulsi3_swap
	$move , r2, r0
	$move , r0, r1, true, mul32.__mulsi3_start
mul32.__mulsi3_swap:
	$move , r2, r1
	$move , r0, r0
mul32.__mulsi3_start:
	$move , r1, zero
	$mul_step , d0, r2, d0, 0, z, mul32.__mulsi3_exit
	$mul_step , d0, r2, d0, 1, z, mul32.__mulsi3_exit
	$mul_step , d0, r2, d0, 2, z, mul32.__mulsi3_exit
	$mul_step , d0, r2, d0, 3, z, mul32.__mulsi3_exit
	$mul_step , d0, r2, d0, 4, z, mul32.__mulsi3_exit
	$mul_step , d0, r2, d0, 5, z, mul32.__mulsi3_exit
	$mul_step , d0, r2, d0, 6, z, mul32.__mulsi3_exit
	$mul_step , d0, r2, d0, 7, z, mul32.__mulsi3_exit
	$mul_step , d0, r2, d0, 8, z, mul32.__mulsi3_exit
	$mul_step , d0, r2, d0, 9, z, mul32.__mulsi3_exit
	$mul_step , d0, r2, d0, 10, z, mul32.__mulsi3_exit
	$mul_step , d0, r2, d0, 11, z, mul32.__mulsi3_exit
	$mul_step , d0, r2, d0, 12, z, mul32.__mulsi3_exit
	$mul_step , d0, r2, d0, 13, z, mul32.__mulsi3_exit
	$mul_step , d0, r2, d0, 14, z, mul32.__mulsi3_exit
	$mul_step , d0, r2, d0, 15, z, mul32.__mulsi3_exit
	$mul_step , d0, r2, d0, 16, z, mul32.__mulsi3_exit
	$mul_step , d0, r2, d0, 17, z, mul32.__mulsi3_exit
	$mul_step , d0, r2, d0, 18, z, mul32.__mulsi3_exit
	$mul_step , d0, r2, d0, 19, z, mul32.__mulsi3_exit
	$mul_step , d0, r2, d0, 20, z, mul32.__mulsi3_exit
	$mul_step , d0, r2, d0, 21, z, mul32.__mulsi3_exit
	$mul_step , d0, r2, d0, 22, z, mul32.__mulsi3_exit
	$mul_step , d0, r2, d0, 23, z, mul32.__mulsi3_exit
	$mul_step , d0, r2, d0, 24, z, mul32.__mulsi3_exit
	$mul_step , d0, r2, d0, 25, z, mul32.__mulsi3_exit
	$mul_step , d0, r2, d0, 26, z, mul32.__mulsi3_exit
	$mul_step , d0, r2, d0, 27, z, mul32.__mulsi3_exit
	$mul_step , d0, r2, d0, 28, z, mul32.__mulsi3_exit
	$mul_step , d0, r2, d0, 29, z, mul32.__mulsi3_exit
	$mul_step , d0, r2, d0, 30, z, mul32.__mulsi3_exit
	$mul_step , d0, r2, d0, 31, z, mul32.__mulsi3_exit
mul32.__mulsi3_exit:
	$move , r0, r1

	// inline asm
	$jump , r23
mul32..Lfunc_end0:
	$size,	__mulsi3, mul32..Lfunc_end0 - __mulsi3
	$section,	%stack_sizes,"o",@progbits,%text, __mulsi3
	$long,	mul32..Lfunc_begin0
	$byte,	0
	$section,	%text, __mulsi3,"ax",@progbits
                                        //  -  -  End function
	$addrsig,
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
	$file,	"main.c"
$section,	%text, syscall,"ax",@progbits
	$globl,	syscall                         //  -  -  Begin function syscall
	$type,	syscall,@function
syscall:                                // @syscall
// %bb.0:
	$sw , r22, 0, r0
	$sw , r22, 4, r1
	$sw , r22, 8, r2
	$sw , r22, 12, r3
	$sw , r22, 16, r4
	// inline asm
	$jump , 0x60000
	// inline asm
	$move , r0, 0
	$jump , r23
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
	$section,	%text, socket_read,"ax",@progbits
	$globl,	socket_read                     //  -  -  Begin function socket_read
	$type,	socket_read,@function
socket_read:                            // @socket_read
.Lfunc_begin0:
// %bb.0:
	$sd , r22, 0, d22
	$add , r22, r22, 8
	$move , r3, 0
	$move , r4, 11
	$call , r23, syscall
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end0:
	$size,	socket_read, .Lfunc_end0 - socket_read
	$section,	%stack_sizes,"o",@progbits,%text, socket_read
	$long,	.Lfunc_begin0
	$byte,	8
	$section,	%text, socket_read,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, socket_write,"ax",@progbits
	$globl,	socket_write                    //  -  -  Begin function socket_write
	$type,	socket_write,@function
socket_write:                           // @socket_write
.Lfunc_begin1:
// %bb.0:
	$sd , r22, 0, d22
	$add , r22, r22, 8
	$move , r3, 0
	$move , r4, 12
	$call , r23, syscall
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end1:
	$size,	socket_write, .Lfunc_end1 - socket_write
	$section,	%stack_sizes,"o",@progbits,%text, socket_write
	$long,	.Lfunc_begin1
	$byte,	8
	$section,	%text, socket_write,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, socket_open,"ax",@progbits
	$globl,	socket_open                     //  -  -  Begin function socket_open
	$type,	socket_open,@function
socket_open:                            // @socket_open
.Lfunc_begin2:
// %bb.0:
	$sd , r22, 0, d22
	$add , r22, r22, 8
	$move , r1, 0
	$move , r4, 10
	$move , r2, r1
	$move , r3, r1
	$call , r23, syscall
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end2:
	$size,	socket_open, .Lfunc_end2 - socket_open
	$section,	%stack_sizes,"o",@progbits,%text, socket_open
	$long,	.Lfunc_begin2
	$byte,	8
	$section,	%text, socket_open,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, socket_close,"ax",@progbits
	$globl,	socket_close                    //  -  -  Begin function socket_close
	$type,	socket_close,@function
socket_close:                           // @socket_close
.Lfunc_begin3:
// %bb.0:
	$sd , r22, 0, d22
	$add , r22, r22, 8
	$move , r1, 0
	$move , r4, 13
	$move , r2, r1
	$move , r3, r1
	$call , r23, syscall
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end3:
	$size,	socket_close, .Lfunc_end3 - socket_close
	$section,	%stack_sizes,"o",@progbits,%text, socket_close
	$long,	.Lfunc_begin3
	$byte,	8
	$section,	%text, socket_close,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, get_jid,"ax",@progbits
	$globl,	get_jid                         //  -  -  Begin function get_jid
	$type,	get_jid,@function
get_jid:                                // @get_jid
.Lfunc_begin4:
// %bb.0:
	$sd , r22, 0, d22
	$add , r22, r22, 8
	$move , r0, 0
	$move , r4, 6
	$move , r1, r0
	$move , r2, r0
	$move , r3, r0
	$call , r23, syscall
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end4:
	$size,	get_jid, .Lfunc_end4 - get_jid
	$section,	%stack_sizes,"o",@progbits,%text, get_jid
	$long,	.Lfunc_begin4
	$byte,	8
	$section,	%text, get_jid,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, exit_proc,"ax",@progbits
	$globl,	exit_proc                       //  -  -  Begin function exit_proc
	$type,	exit_proc,@function
exit_proc:                              // @exit_proc
.Lfunc_begin5:
// %bb.0:
	$sd , r22, 0, d22
	$add , r22, r22, 8
	$move , r1, 0
	$move , r4, 7
	$move , r2, r1
	$move , r3, r1
	$call , r23, syscall
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end5:
	$size,	exit_proc, .Lfunc_end5 - exit_proc
	$section,	%stack_sizes,"o",@progbits,%text, exit_proc
	$long,	.Lfunc_begin5
	$byte,	8
	$section,	%text, exit_proc,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, debug,"ax",@progbits
	$globl,	debug                           //  -  -  Begin function debug
	$type,	debug,@function
debug:                                  // @debug
.Lfunc_begin6:
// %bb.0:
	$sd , r22, 0, d22
	$add , r22, r22, 8
	$move , r1, 0
	$move , r4, 8
	$move , r2, r1
	$move , r3, r1
	$call , r23, syscall
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end6:
	$size,	debug, .Lfunc_end6 - debug
	$section,	%stack_sizes,"o",@progbits,%text, debug
	$long,	.Lfunc_begin6
	$byte,	8
	$section,	%text, debug,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, debug_int,"ax",@progbits
	$globl,	debug_int                       //  -  -  Begin function debug_int
	$type,	debug_int,@function
debug_int:                              // @debug_int
.Lfunc_begin7:
// %bb.0:
	$sd , r22, 0, d22
	$add , r22, r22, 8
	$move , r1, 0
	$move , r4, 9
	$move , r2, r1
	$move , r3, r1
	$call , r23, syscall
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end7:
	$size,	debug_int, .Lfunc_end7 - debug_int
	$section,	%stack_sizes,"o",@progbits,%text, debug_int
	$long,	.Lfunc_begin7
	$byte,	8
	$section,	%text, debug_int,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, init_lock,"ax",@progbits
	$globl,	init_lock                       //  -  -  Begin function init_lock
	$type,	init_lock,@function
init_lock:                              // @init_lock
.Lfunc_begin8:
// %bb.0:
	$sd , r22, 0, d22
	$add , r22, r22, 8
	$move , r1, 0
	$move , r4, 14
	$move , r2, r1
	$move , r3, r1
	$call , r23, syscall
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end8:
	$size,	init_lock, .Lfunc_end8 - init_lock
	$section,	%stack_sizes,"o",@progbits,%text, init_lock
	$long,	.Lfunc_begin8
	$byte,	8
	$section,	%text, init_lock,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, lock,"ax",@progbits
	$globl,	lock                            //  -  -  Begin function lock
	$type,	lock,@function
lock:                                   // @lock
.Lfunc_begin9:
// %bb.0:
	$sd , r22, 0, d22
	$add , r22, r22, 8
	$move , r1, 0
	$move , r4, 15
	$move , r2, r1
	$move , r3, r1
	$call , r23, syscall
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end9:
	$size,	lock, .Lfunc_end9 - lock
	$section,	%stack_sizes,"o",@progbits,%text, lock
	$long,	.Lfunc_begin9
	$byte,	8
	$section,	%text, lock,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, try_lock,"ax",@progbits
	$globl,	try_lock                        //  -  -  Begin function try_lock
	$type,	try_lock,@function
try_lock:                               // @try_lock
.Lfunc_begin10:
// %bb.0:
	$sd , r22, 0, d22
	$add , r22, r22, 8
	$move , r1, 0
	$move , r4, 24
	$move , r2, r1
	$move , r3, r1
	$call , r23, syscall
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end10:
	$size,	try_lock, .Lfunc_end10 - try_lock
	$section,	%stack_sizes,"o",@progbits,%text, try_lock
	$long,	.Lfunc_begin10
	$byte,	8
	$section,	%text, try_lock,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, unlock,"ax",@progbits
	$globl,	unlock                          //  -  -  Begin function unlock
	$type,	unlock,@function
unlock:                                 // @unlock
.Lfunc_begin11:
// %bb.0:
	$sd , r22, 0, d22
	$add , r22, r22, 8
	$move , r1, 0
	$move , r4, 16
	$move , r2, r1
	$move , r3, r1
	$call , r23, syscall
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end11:
	$size,	unlock, .Lfunc_end11 - unlock
	$section,	%stack_sizes,"o",@progbits,%text, unlock
	$long,	.Lfunc_begin11
	$byte,	8
	$section,	%text, unlock,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, sleep,"ax",@progbits
	$globl,	sleep                           //  -  -  Begin function sleep
	$type,	sleep,@function
sleep:                                  // @sleep
.Lfunc_begin12:
// %bb.0:
	$sd , r22, 0, d22
	$add , r22, r22, 8
	$move , r2, 0
	$move , r4, 17
	$move , r3, r2
	$call , r23, syscall
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end12:
	$size,	sleep, .Lfunc_end12 - sleep
	$section,	%stack_sizes,"o",@progbits,%text, sleep
	$long,	.Lfunc_begin12
	$byte,	8
	$section,	%text, sleep,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, wakeup,"ax",@progbits
	$globl,	wakeup                          //  -  -  Begin function wakeup
	$type,	wakeup,@function
wakeup:                                 // @wakeup
.Lfunc_begin13:
// %bb.0:
	$sd , r22, 0, d22
	$add , r22, r22, 8
	$move , r1, 0
	$move , r4, 18
	$move , r2, r1
	$move , r3, r1
	$call , r23, syscall
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end13:
	$size,	wakeup, .Lfunc_end13 - wakeup
	$section,	%stack_sizes,"o",@progbits,%text, wakeup
	$long,	.Lfunc_begin13
	$byte,	8
	$section,	%text, wakeup,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, create_job,"ax",@progbits
	$globl,	create_job                      //  -  -  Begin function create_job
	$type,	create_job,@function
create_job:                             // @create_job
.Lfunc_begin14:
// %bb.0:
	$sd , r22, 0, d22
	$add , r22, r22, 8
	$move , r1, 0
	$move , r4, 20
	$move , r2, r1
	$move , r3, r1
	$call , r23, syscall
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end14:
	$size,	create_job, .Lfunc_end14 - create_job
	$section,	%stack_sizes,"o",@progbits,%text, create_job
	$long,	.Lfunc_begin14
	$byte,	8
	$section,	%text, create_job,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, join_job,"ax",@progbits
	$globl,	join_job                        //  -  -  Begin function join_job
	$type,	join_job,@function
join_job:                               // @join_job
.Lfunc_begin15:
// %bb.0:
	$sd , r22, 0, d22
	$add , r22, r22, 8
	$move , r0, 0
	$move , r4, 21
	$move , r1, r0
	$move , r2, r0
	$move , r3, r0
	$call , r23, syscall
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end15:
	$size,	join_job, .Lfunc_end15 - join_job
	$section,	%stack_sizes,"o",@progbits,%text, join_job
	$long,	.Lfunc_begin15
	$byte,	8
	$section,	%text, join_job,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, yield,"ax",@progbits
	$globl,	yield                           //  -  -  Begin function yield
	$type,	yield,@function
yield:                                  // @yield
.Lfunc_begin16:
// %bb.0:
	$sd , r22, 0, d22
	$add , r22, r22, 8
	$move , r0, 0
	$move , r4, 1
	$move , r1, r0
	$move , r2, r0
	$move , r3, r0
	$call , r23, syscall
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end16:
	$size,	yield, .Lfunc_end16 - yield
	$section,	%stack_sizes,"o",@progbits,%text, yield
	$long,	.Lfunc_begin16
	$byte,	8
	$section,	%text, yield,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, sbrk,"ax",@progbits
	$globl,	sbrk                            //  -  -  Begin function sbrk
	$type,	sbrk,@function
sbrk:                                   // @sbrk
.Lfunc_begin17:
// %bb.0:
	$sd , r22, 0, d22
	$add , r22, r22, 8
	$move , r1, 0
	$move , r4, 2
	$move , r2, r1
	$move , r3, r1
	$call , r23, syscall
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end17:
	$size,	sbrk, .Lfunc_end17 - sbrk
	$section,	%stack_sizes,"o",@progbits,%text, sbrk
	$long,	.Lfunc_begin17
	$byte,	8
	$section,	%text, sbrk,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, get_pid,"ax",@progbits
	$globl,	get_pid                         //  -  -  Begin function get_pid
	$type,	get_pid,@function
get_pid:                                // @get_pid
.Lfunc_begin18:
// %bb.0:
	$sd , r22, 0, d22
	$add , r22, r22, 8
	$move , r0, 0
	$move , r4, 3
	$move , r1, r0
	$move , r2, r0
	$move , r3, r0
	$call , r23, syscall
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end18:
	$size,	get_pid, .Lfunc_end18 - get_pid
	$section,	%stack_sizes,"o",@progbits,%text, get_pid
	$long,	.Lfunc_begin18
	$byte,	8
	$section,	%text, get_pid,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, get_role,"ax",@progbits
	$globl,	get_role                        //  -  -  Begin function get_role
	$type,	get_role,@function
get_role:                               // @get_role
.Lfunc_begin19:
// %bb.0:
	$sd , r22, 0, d22
	$add , r22, r22, 8
	$move , r0, 0
	$move , r4, 4
	$move , r1, r0
	$move , r2, r0
	$move , r3, r0
	$call , r23, syscall
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end19:
	$size,	get_role, .Lfunc_end19 - get_role
	$section,	%stack_sizes,"o",@progbits,%text, get_role
	$long,	.Lfunc_begin19
	$byte,	8
	$section,	%text, get_role,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, get_appid,"ax",@progbits
	$globl,	get_appid                       //  -  -  Begin function get_appid
	$type,	get_appid,@function
get_appid:                              // @get_appid
.Lfunc_begin20:
// %bb.0:
	$sd , r22, 0, d22
	$add , r22, r22, 8
	$move , r0, 0
	$move , r4, 5
	$move , r1, r0
	$move , r2, r0
	$move , r3, r0
	$call , r23, syscall
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end20:
	$size,	get_appid, .Lfunc_end20 - get_appid
	$section,	%stack_sizes,"o",@progbits,%text, get_appid
	$long,	.Lfunc_begin20
	$byte,	8
	$section,	%text, get_appid,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, umram_read,"ax",@progbits
	$globl,	umram_read                      //  -  -  Begin function umram_read
	$type,	umram_read,@function
umram_read:                             // @umram_read
.Lfunc_begin21:
// %bb.0:
	$sd , r22, 0, d22
	$add , r22, r22, 8
	$move , r3, 0
	$move , r4, 22
	$call , r23, syscall
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end21:
	$size,	umram_read, .Lfunc_end21 - umram_read
	$section,	%stack_sizes,"o",@progbits,%text, umram_read
	$long,	.Lfunc_begin21
	$byte,	8
	$section,	%text, umram_read,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, umram_write,"ax",@progbits
	$globl,	umram_write                     //  -  -  Begin function umram_write
	$type,	umram_write,@function
umram_write:                            // @umram_write
.Lfunc_begin22:
// %bb.0:
	$sd , r22, 0, d22
	$add , r22, r22, 8
	$move , r3, 0
	$move , r4, 23
	$call , r23, syscall
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end22:
	$size,	umram_write, .Lfunc_end22 - umram_write
	$section,	%stack_sizes,"o",@progbits,%text, umram_write
	$long,	.Lfunc_begin22
	$byte,	8
	$section,	%text, umram_write,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, init_barrier,"ax",@progbits
	$globl,	init_barrier                    //  -  -  Begin function init_barrier
	$type,	init_barrier,@function
init_barrier:                           // @init_barrier
.Lfunc_begin23:
// %bb.0:
	$sd , r22, 8, d22
	$add , r22, r22, 16
	$sd , r22,  - 16, d14
	$move , r14, r1
	$move , r15, r0
	$move , r1, 0
	$move , r4, 14
	$move , r2, r1
	$move , r3, r1
	$call , r23, syscall
	$sw , r15, 4, 0
	$sw , r15, 8, r14
	$sw , r15, 12, 0
	$ld , d14, r22,  - 16
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end23:
	$size,	init_barrier, .Lfunc_end23 - init_barrier
	$section,	%stack_sizes,"o",@progbits,%text, init_barrier
	$long,	.Lfunc_begin23
	$byte,	16
	$section,	%text, init_barrier,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, wait_barrier,"ax",@progbits
	$globl,	wait_barrier                    //  -  -  Begin function wait_barrier
	$type,	wait_barrier,@function
wait_barrier:                           // @wait_barrier
.Lfunc_begin24:
// %bb.0:
	$sd , r22, 8, d22
	$add , r22, r22, 16
	$sd , r22,  - 16, d14
	$move , r14, r0
	$move , r1, 0
	$move , r4, 15
	$move , r2, r1
	$move , r3, r1
	$call , r23, syscall
	$lw , r0, r14, 4
	$add , r0, r0, 1
	$sw , r14, 4, r0
	$lw , r1, r14, 8
	$jneq , r0, r1, .LBB24_2
// %bb.1:
	$move , r1, 0
	$move , r4, 18
	$move , r0, r14
	$move , r2, r1
	$move , r3, r1
	$call , r23, syscall
	$sw , r14, 4, 0
	$jump , .LBB24_3
.LBB24_2:
	$move , r2, 0
	$move , r4, 17
	$move , r0, r14
	$move , r1, r14
	$move , r3, r2
	$call , r23, syscall
.LBB24_3:
	$move , r1, 0
	$move , r4, 16
	$move , r0, r14
	$move , r2, r1
	$move , r3, r1
	$call , r23, syscall
	$ld , d14, r22,  - 16
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end24:
	$size,	wait_barrier, .Lfunc_end24 - wait_barrier
	$section,	%stack_sizes,"o",@progbits,%text, wait_barrier
	$long,	.Lfunc_begin24
	$byte,	16
	$section,	%text, wait_barrier,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, wait,"ax",@progbits
	$globl,	wait                            //  -  -  Begin function wait
	$type,	wait,@function
wait:                                   // @wait
.Lfunc_begin25:
// %bb.0:
	$jump , r23
.Lfunc_end25:
	$size,	wait, .Lfunc_end25 - wait
	$section,	%stack_sizes,"o",@progbits,%text, wait
	$long,	.Lfunc_begin25
	$byte,	0
	$section,	%text, wait,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, active_wait_barrier,"ax",@progbits
	$globl,	active_wait_barrier             //  -  -  Begin function active_wait_barrier
	$type,	active_wait_barrier,@function
active_wait_barrier:                    // @active_wait_barrier
.Lfunc_begin26:
// %bb.0:
	$sd , r22, 8, d22
	$add , r22, r22, 16
	$sd , r22,  - 16, d14
	$move , r14, r0
	$lw , r0, r14, 12
	$jeq , r0, 0, .LBB26_5
// %bb.1:
	$move , r0, 100, true, .LBB26_2
.LBB26_4:                               //   in Loop: Header=BB26_2 Depth=1
	$lw , r1, r14, 12
	$jeq , r1, 0, .LBB26_5
.LBB26_2:                               // =>This Inner Loop Header: Depth=1
	$add , r0, r0,  - 1, nz, .LBB26_4
// %bb.3:                               //   in Loop: Header=BB26_2 Depth=1
	$move , r0, 0
	$move , r4, 1
	$move , r1, r0
	$move , r2, r0
	$move , r3, r0
	$call , r23, syscall
	$move , r0, 100, true, .LBB26_4
.LBB26_5:                               // =>This Inner Loop Header: Depth=1
	$move , r1, 0
	$move , r4, 24
	$move , r0, r14
	$move , r2, r1
	$move , r3, r1
	$call , r23, syscall
	$jneq , r0, 0, .LBB26_5
// %bb.6:
	$lw , r0, r14, 4
	$add , r0, r0, 1
	$sw , r14, 4, r0
	$lw , r1, r14, 8
	$jneq , r0, r1, .LBB26_8
// %bb.7:
	$sw , r14, 4, 0
	$jump , .LBB26_15
.LBB26_8:
	$move , r1, 0
	$move , r4, 16
	$move , r0, r14
	$move , r2, r1
	$move , r3, r1
	$call , r23, syscall
	$lw , r0, r14, 4
	$jeq , r0, 0, .LBB26_13
// %bb.9:
	$move , r1, 100, true, .LBB26_10
.LBB26_12:                              //   in Loop: Header=BB26_10 Depth=1
	$jeq , r0, 0, .LBB26_13
.LBB26_10:                              // =>This Inner Loop Header: Depth=1
	$add , r1, r1,  - 1, nz, .LBB26_12
// %bb.11:                              //   in Loop: Header=BB26_10 Depth=1
	$move , r0, 0
	$move , r4, 1
	$move , r1, r0
	$move , r2, r0
	$move , r3, r0
	$call , r23, syscall
	$lw , r0, r14, 4
	$move , r1, 100, true, .LBB26_12
.LBB26_13:                              // =>This Inner Loop Header: Depth=1
	$move , r1, 0
	$move , r4, 24
	$move , r0, r14
	$move , r2, r1
	$move , r3, r1
	$call , r23, syscall
	$jneq , r0, 0, .LBB26_13
// %bb.14:
	$lw , r0, r14, 8
.LBB26_15:
	$lw , r1, r14, 12
	$add , r1, r1, 1
	$sw , r14, 12, r1
	$lw , r1, r14, 12
	$jneq , r1, r0, .LBB26_17
// %bb.16:
	$sw , r14, 12, 0
.LBB26_17:
	$move , r1, 0
	$move , r4, 16
	$move , r0, r14
	$move , r2, r1
	$move , r3, r1
	$call , r23, syscall
	$ld , d14, r22,  - 16
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end26:
	$size,	active_wait_barrier, .Lfunc_end26 - active_wait_barrier
	$section,	%stack_sizes,"o",@progbits,%text, active_wait_barrier
	$long,	.Lfunc_begin26
	$byte,	16
	$section,	%text, active_wait_barrier,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, init_handshake,"ax",@progbits
	$globl,	init_handshake                  //  -  -  Begin function init_handshake
	$type,	init_handshake,@function
init_handshake:                         // @init_handshake
.Lfunc_begin27:
// %bb.0:
	$sd , r22, 8, d22
	$add , r22, r22, 16
	$sd , r22,  - 16, d14
	$move , r14, r0
	$add , r0, r14, 4
	$move , r15, 0
	$move , r4, 14
	$move , r1, r15
	$move , r2, r15
	$move , r3, r15
	$call , r23, syscall
	$sb , r14, 0, 0
	$move , r0, r15
	$ld , d14, r22,  - 16
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end27:
	$size,	init_handshake, .Lfunc_end27 - init_handshake
	$section,	%stack_sizes,"o",@progbits,%text, init_handshake
	$long,	.Lfunc_begin27
	$byte,	16
	$section,	%text, init_handshake,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, handshake_wait,"ax",@progbits
	$globl,	handshake_wait                  //  -  -  Begin function handshake_wait
	$type,	handshake_wait,@function
handshake_wait:                         // @handshake_wait
.Lfunc_begin28:
// %bb.0:
	$sd , r22, 8, d22
	$add , r22, r22, 16
	$sd , r22,  - 16, d14
	$move , r15, r0
	$add , r14, r15, 4
	$move , r1, 0
	$move , r4, 15
	$move , r0, r14
	$move , r2, r1
	$move , r3, r1
.LBB28_2:                               // =>This Inner Loop Header: Depth=1
	$call , r23, syscall
	$lbu , r0, r15, 0
	$jneq , r0, 0, .LBB28_3
// %bb.1:                               //   in Loop: Header=BB28_2 Depth=1
	$move , r2, 0
	$move , r4, 17
	$move , r0, r15
	$move , r1, r14
	$move , r3, r2, true, .LBB28_2
.LBB28_3:
	$sb , r15, 0, 0
	$move , r15, 0
	$move , r4, 16
	$move , r0, r14
	$move , r1, r15
	$move , r2, r15
	$move , r3, r15
	$call , r23, syscall
	$move , r0, r15
	$ld , d14, r22,  - 16
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end28:
	$size,	handshake_wait, .Lfunc_end28 - handshake_wait
	$section,	%stack_sizes,"o",@progbits,%text, handshake_wait
	$long,	.Lfunc_begin28
	$byte,	16
	$section,	%text, handshake_wait,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, handshake_notify,"ax",@progbits
	$globl,	handshake_notify                //  -  -  Begin function handshake_notify
	$type,	handshake_notify,@function
handshake_notify:                       // @handshake_notify
.Lfunc_begin29:
// %bb.0:
	$sd , r22, 16, d22
	$add , r22, r22, 24
	$sd , r22,  - 16, d14
	$sd , r22,  - 24, d16
	$move , r14, r0
	$add , r15, r14, 4
	$move , r16, 0
	$move , r4, 15
	$move , r0, r15
	$move , r1, r16
	$move , r2, r16
	$move , r3, r16
	$call , r23, syscall
	$sb , r14, 0, 1
	$move , r4, 18
	$move , r0, r14
	$move , r1, r16
	$move , r2, r16
	$move , r3, r16
	$call , r23, syscall
	$move , r4, 16
	$move , r0, r15
	$move , r1, r16
	$move , r2, r16
	$move , r3, r16
	$call , r23, syscall
	$move , r0, r16
	$ld , d16, r22,  - 24
	$ld , d14, r22,  - 16
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end29:
	$size,	handshake_notify, .Lfunc_end29 - handshake_notify
	$section,	%stack_sizes,"o",@progbits,%text, handshake_notify
	$long,	.Lfunc_begin29
	$byte,	24
	$section,	%text, handshake_notify,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, main1,"ax",@progbits
	$globl,	main1                           //  -  -  Begin function main1
	$type,	main1,@function
main1:                                  // @main1
.Lfunc_begin30:
// %bb.0:
	$sd , r22, 112, d22
	$add , r22, r22, 120
	$sd , r22,  - 96, d14
	$sd , r22,  - 104, d16
	$sd , r22,  - 112, d18
	$sd , r22,  - 120, d20
	$move , r0, 0
	$move , r4, 6
	$move , r1, r0
	$move , r2, r0
	$move , r3, r0
	$call , r23, syscall
	$move , r17, r0, nz, .LBB30_4
// %bb.1:
	$lw , r0, zero, sd_host
	$add , r14, r22,  - 88
	$move , r15, 1
	$move , r16, 0
	$move , r4, 12
	$move , r1, r14
	$move , r2, r15
	$move , r3, r16
	$call , r23, syscall
	$lw , r0, zero, sd_host
	$move , r4, 11
	$move , r1, r14
	$move , r2, r15
	$move , r3, r16
	$call , r23, syscall
	$move , r0, DPU_INPUT_ARGUMENTS
	$move , r1, 16
	$move , r4, 22
	$move , r2, r16
	$move , r3, r16
	$call , r23, syscall
	$jgts , r0,  - 1, .LBB30_3
// %bb.2:
	$move , r0, 3
	$move , r1, 0
	$move , r4, 7
	$move , r2, r1
	$move , r3, r1
	$call , r23, syscall
.LBB30_3:
	$move , r0, 0
	$move , r1, 3
	$call , r23, print_debug
.LBB30_4:
	$move , r14, b
	$move , r1, 0
	$move , r4, 15
	$move , r0, r14
	$move , r2, r1
	$move , r3, r1
	$call , r23, syscall
	$lw , r0, r14, 4
	$add , r0, r0, 1
	$sw , r14, 4, r0
	$lw , r1, r14, 8
	$jneq , r0, r1, .LBB30_6
// %bb.5:
	$move , r1, 0
	$move , r4, 18
	$move , r0, r14
	$move , r2, r1
	$move , r3, r1
	$call , r23, syscall
	$sw , r14, 4, 0
	$jump , .LBB30_7
.LBB30_6:
	$move , r0, b
	$move , r2, 0
	$move , r4, 17
	$move , r1, r0
	$move , r3, r2
	$call , r23, syscall
.LBB30_7:
	$move , r0, b
	$move , r1, 0
	$move , r4, 16
	$move , r2, r1
	$move , r3, r1
	$call , r23, syscall
	$move , r2, DPU_INPUT_ARGUMENTS
	$lw , r4, r2, 8
	$lsr , r0, r4, 4
	$and , r0, r0, 268435454
	$and , r15, r4, 31
	$lsl , r3, r17, 1
	$add , r1, r0, 2
	$move , r6, r1
	$jltu , r3, r15, .LBB30_9
// %bb.8:
	$move , r6, r0
.LBB30_9:
	$lw , r5, zero, DPU_INPUT_ARGUMENTS
	$sw , r22,  - 40, r5
	$lw , r16, r2, 4
	$lw , r14, r2, 12
	$sw , r22,  - 44, r4
	$sw , r22,  - 16, r17
	$sw , r22,  - 80, r6
	$jeq , r15, 0, .LBB30_15
// %bb.10:
	$jgeu , r3, r15, .LBB30_11
// %bb.14:
	$move , r0, r1
.LBB30_15:
	$move , r1, r17
	$call , r23, __mulsi3
	$move , r20, r0
.LBB30_16:
	$move , r0, r16
	$move , r1, r14
	$call , r23, __mulsi3
	$move , r15, r0
	$move , r0, 2056
	$move , r14, 0
	$move , r19, 2
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$move , r4, r19
	$call , r23, syscall
	$sw , r22,  - 72, r16
	$move , r16, r0
	$move , r21, 8
	$move , r0, r21
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$move , r4, r19
	$call , r23, syscall
	$move , r17, r0
	$move , r0, 2048
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$move , r4, r19
	$call , r23, syscall
	$move , r18, r0
	$move , r0, r21
	$move , r1, r14
	$move , r2, r14
	$sw , r22,  - 76, r14
	$move , r3, r14
	$move , r4, r19
	$call , r23, syscall
	$lw , r1, r22,  - 80
	$add , r1, r20, r1
	$lw , r19, r22,  - 44
	$sw , r22,  - 24, r1
	$jgeu , r20, r1, .LBB30_22
// %bb.17:
	$move , r1, 16
	$lsl_add , r1, r1, r15, 2
	$add , r16, r16,  - 2056
	$add , r2, r17,  - 8
	$sw , r22,  - 64, r2
	$add , r18, r18,  - 2048
	$add , r15, r0,  - 8
	$lw , r0, r22,  - 72
	$add , r0, r20, r0
	$sw , r22,  - 36, r1
	$lsl_add , r17, r1, r0, 2
	$lw , r0, r22,  - 40
	$lsl , r1, r0, 2
	$sw , r22,  - 20, r1
	$add , r0, r0,  - 512
	$sw , r22,  - 72, r0
	$lw , r21, r22,  - 76
	$sw , r22,  - 68, r15
	$jump , .LBB30_18
.LBB30_50:                              //   in Loop: Header=BB30_18 Depth=1
	$move , r1, 8
	$move , r3, 0
	$move , r4, 23
	$lw , r15, r22,  - 68
	$move , r0, r15
	$lw , r17, r22,  - 28
	$move , r2, r17
	$call , r23, syscall
	$add , r20, r20, 2
	$add , r17, r17, 8
	$lw , r0, r22,  - 24
	$jgeu , r20, r0, .LBB30_22
.LBB30_18:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB30_20 Depth 2
                                        //       Child Loop BB30_30 Depth 3
                                        //         Child Loop BB30_32 Depth 4
                                        //         Child Loop BB30_35 Depth 4
                                        //       Child Loop BB30_41 Depth 3
                                        //       Child Loop BB30_47 Depth 3
	$sw , r22,  - 28, r17
	$sw , r15, 4, 0
	$sw , r15, 0, 0
	$jgeu , r20, r19, .LBB30_50
// %bb.19:                              //   in Loop: Header=BB30_18 Depth=1
	$lw , r0, r22,  - 20
	$move , r1, r20
	$call , r23, __mulsi3
	$add , r5, r0, 16
	$move , r0, 0
	$move , r2, 1
	$sw , r22,  - 32, r0
	$sw , r22,  - 80, r0
	$sw , r22,  - 48, r20
	$jump , .LBB30_20
.LBB30_49:                              //   in Loop: Header=BB30_20 Depth=2
	$lw , r0, r22,  - 56
	$lw , r1, r22,  - 60
	$add , r0, r1, r0
	$lsl_add , r0, r0, r15, 2
	$and , r21, r0, 7
	$lw , r20, r22,  - 48
	$lw , r1, r22,  - 80
	$add , r1, r1, r20
	$add , r1, r1, 1
	$lw , r19, r22,  - 44
	$sub , r1, r1, r19, ltu
	$lw , r2, r22,  - 52
	$and , r1, r2, r1
	$move , r2, 0
	$sub , r3, r21, r2, neq
	$sw , r22,  - 76, r3
	$and , r5, r0,  - 8
	$move , r0, 1
	$sw , r22,  - 80, r0
	$jz , r1, .LBB30_50
.LBB30_20:                              //   Parent Loop BB30_18 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB30_30 Depth 3
                                        //         Child Loop BB30_32 Depth 4
                                        //         Child Loop BB30_35 Depth 4
                                        //       Child Loop BB30_41 Depth 3
                                        //       Child Loop BB30_47 Depth 3
	$sw , r22,  - 56, r21
	$lw , r0, r22,  - 72
	$sw , r22,  - 52, r2
	$jlts , r0, 1, .LBB30_21
// %bb.29:                              //   in Loop: Header=BB30_20 Depth=2
	$move , r21, 0
	$lw , r20, r22,  - 36
.LBB30_30:                              //   Parent Loop BB30_18 Depth=1
                                        //     Parent Loop BB30_20 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB30_32 Depth 4
                                        //         Child Loop BB30_35 Depth 4
	$move , r19, 2048
	$move , r15, 0
	$move , r17, 22
	$move , r0, r16
	$move , r1, r19
	$move , r14, r5
	$move , r2, r5
	$move , r3, r15
	$move , r4, r17
	$call , r23, syscall
	$move , r0, r18
	$move , r1, r19
	$move , r2, r20
	$move , r3, r15
	$move , r4, r17
	$call , r23, syscall
	$lw , r0, r22,  - 76
	$jeq , r0, 0, .LBB30_34
// %bb.31:                              //   in Loop: Header=BB30_30 Depth=3
	$move , r0, 1
.LBB30_32:                              //   Parent Loop BB30_18 Depth=1
                                        //     Parent Loop BB30_20 Depth=2
                                        //       Parent Loop BB30_30 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	$lsl_add , r1, r16, r0, 2
	$lw , r2, r1, 0
	$sw , r1,  - 4, r2
	$add , r0, r0, 1
	$jneq , r0, 512, .LBB30_32
// %bb.33:                              //   in Loop: Header=BB30_30 Depth=3
	$add , r2, r14, 2048
	$move , r1, 8
	$move , r3, 0
	$move , r4, 22
	$lw , r17, r22,  - 64
	$move , r0, r17
	$call , r23, syscall
	$lw , r0, r17, 0
	$sw , r16, 2044, r0
.LBB30_34:                              //   in Loop: Header=BB30_30 Depth=3
	$lw , r0, r22,  - 68
	$lw , r1, r22,  - 80
	$lsl_add , r17, r0, r1, 2
	$lw , r19, r17, 0
.LBB30_35:                              //   Parent Loop BB30_18 Depth=1
                                        //     Parent Loop BB30_20 Depth=2
                                        //       Parent Loop BB30_30 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	$lsl_add , r0, r16, r15, 2
	$lw , r1, r0, 0
	$lsl_add , r0, r18, r15, 2
	$lw , r0, r0, 0
	$call , r23, __mulsi3
	$add , r19, r0, r19
	$sw , r17, 0, r19
	$add , r15, r15, 1
	$jneq , r15, 512, .LBB30_35
// %bb.36:                              //   in Loop: Header=BB30_30 Depth=3
	$move , r5, r14
	$add , r5, r5, 2048
	$add , r21, r21, 512
	$add , r20, r20, 2048
	$lw , r0, r22,  - 72
	$jlts , r21, r0, .LBB30_30
	$jump , .LBB30_37
.LBB30_21:                              //   in Loop: Header=BB30_20 Depth=2
	$lw , r20, r22,  - 36
	$lw , r21, r22,  - 32
.LBB30_37:                              //   in Loop: Header=BB30_20 Depth=2
	$move , r1, 2048
	$move , r3, 0
	$move , r4, 22
	$move , r0, r16
	$sw , r22,  - 60, r5
	$move , r2, r5
	$call , r23, syscall
	$jles , r0,  - 1, .LBB30_38
// %bb.39:                              //   in Loop: Header=BB30_20 Depth=2
	$lw , r0, r22,  - 76
	$jneq , r0, 0, .LBB30_40
	$jump , .LBB30_45
.LBB30_38:                              //   in Loop: Header=BB30_20 Depth=2
	$move , r1, 0
	$move , r4, 7
	$move , r2, r1
	$move , r3, r1
	$call , r23, syscall
	$lw , r0, r22,  - 76
	$jeq , r0, 0, .LBB30_45
.LBB30_40:                              //   in Loop: Header=BB30_20 Depth=2
	$move , r0, 1
.LBB30_41:                              //   Parent Loop BB30_18 Depth=1
                                        //     Parent Loop BB30_20 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	$lsl_add , r1, r16, r0, 2
	$lw , r2, r1, 0
	$sw , r1,  - 4, r2
	$add , r0, r0, 1
	$jneq , r0, 512, .LBB30_41
// %bb.42:                              //   in Loop: Header=BB30_20 Depth=2
	$lw , r0, r22,  - 60
	$add , r2, r0, 2048
	$move , r1, 8
	$move , r3, 0
	$move , r4, 22
	$lw , r14, r22,  - 64
	$move , r0, r14
	$call , r23, syscall
	$jges , r0, 0, .LBB30_44
// %bb.43:                              //   in Loop: Header=BB30_20 Depth=2
	$move , r0,  - 2
	$move , r1, 0
	$move , r4, 7
	$move , r2, r1
	$move , r3, r1
	$call , r23, syscall
.LBB30_44:                              //   in Loop: Header=BB30_20 Depth=2
	$lw , r0, r14, 0
	$sw , r16, 2044, r0
.LBB30_45:                              //   in Loop: Header=BB30_20 Depth=2
	$move , r1, 2048
	$move , r14, 0
	$move , r4, 22
	$move , r0, r18
	$move , r2, r20
	$move , r3, r14
	$call , r23, syscall
	$lw , r0, r22,  - 40
	$sub , r15, r0, r21
	$jlts , r15, 1, .LBB30_49
// %bb.46:                              //   in Loop: Header=BB30_20 Depth=2
	$lw , r0, r22,  - 68
	$lw , r1, r22,  - 80
	$lsl_add , r17, r0, r1, 2
	$lw , r19, r17, 0
.LBB30_47:                              //   Parent Loop BB30_18 Depth=1
                                        //     Parent Loop BB30_20 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	$move , r20, r14
	$lsl_add , r0, r16, r20, 2
	$lw , r1, r0, 0
	$lsl_add , r0, r18, r20, 2
	$lw , r0, r0, 0
	$call , r23, __mulsi3
	$add , r19, r19, r0
	$add , r14, r20, 1
	$sw , r17, 0, r19
	$jges , r14, r15, .LBB30_49
// %bb.48:                              //   in Loop: Header=BB30_47 Depth=3
	$jltu , r20, 511, .LBB30_47
	$jump , .LBB30_49
.LBB30_22:
	$move , r1, 1
	$lw , r15, r22,  - 16
	$move , r0, r15
	$call , r23, print_debug
	$move , r14, b
	$move , r1, 0
	$move , r4, 15
	$move , r0, r14
	$move , r2, r1
	$move , r3, r1
	$call , r23, syscall
	$lw , r0, r14, 4
	$add , r0, r0, 1
	$sw , r14, 4, r0
	$lw , r1, r14, 8
	$jneq , r0, r1, .LBB30_24
// %bb.23:
	$move , r1, 0
	$move , r4, 18
	$move , r0, r14
	$move , r2, r1
	$move , r3, r1
	$call , r23, syscall
	$sw , r14, 4, 0
	$jump , .LBB30_25
.LBB30_24:
	$move , r0, b
	$move , r2, 0
	$move , r4, 17
	$move , r1, r0
	$move , r3, r2
	$call , r23, syscall
.LBB30_25:
	$move , r14, b
	$move , r1, 0
	$move , r4, 16
	$move , r0, r14
	$move , r2, r1
	$move , r3, r1
	$call , r23, syscall
	$move , r1, 2
	$move , r0, r15
	$call , r23, print_debug
	$jneq , r15, 0, .LBB30_27
// %bb.26:
	$lw , r0, zero, sd_host
	$add , r15, r22,  - 84
	$move , r16, 1
	$move , r17, 0
	$move , r4, 12
	$move , r1, r15
	$move , r2, r16
	$move , r3, r17
	$call , r23, syscall
	$move , r1, 4
	$move , r0, r17
	$call , r23, print_debug
	$lw , r0, zero, sd_host
	$move , r4, 11
	$move , r1, r15
	$move , r2, r16
	$move , r3, r17
	$call , r23, syscall
.LBB30_27:
	$move , r1, 0
	$move , r4, 15
	$move , r0, r14
	$move , r2, r1
	$move , r3, r1
	$call , r23, syscall
	$lw , r0, r14, 4
	$add , r0, r0, 1
	$sw , r14, 4, r0
	$lw , r1, r14, 8
	$jneq , r0, r1, .LBB30_51
// %bb.28:
	$move , r14, b
	$move , r1, 0
	$move , r4, 18
	$move , r0, r14
	$move , r2, r1
	$move , r3, r1
	$call , r23, syscall
	$sw , r14, 4, 0
	$jump , .LBB30_52
.LBB30_51:
	$move , r0, b
	$move , r2, 0
	$move , r4, 17
	$move , r1, r0
	$move , r3, r2
	$call , r23, syscall
.LBB30_52:
	$move , r0, b
	$move , r1, 0
	$move , r4, 16
	$move , r2, r1
	$move , r3, r1
	$call , r23, syscall
	$ld , d20, r22,  - 120
	$ld , d18, r22,  - 112
	$ld , d16, r22,  - 104
	$ld , d14, r22,  - 96
	$ld , d22, r22,  - 8
	$jump , r23
.LBB30_11:
	$and , r1, r4, 1, nz, .LBB30_12
// %bb.13:
	$move , r1, r17
	$call , r23, __mulsi3
	$add , r20, r0, r15, true, .LBB30_16
.LBB30_12:
	$and , r15, r4, 30
	$move , r1, r17
	$call , r23, __mulsi3
	$add , r0, r15, r0
	$add , r20, r0, 2, true, .LBB30_16
.Lfunc_end30:
	$size,	main1, .Lfunc_end30 - main1
	$section,	%stack_sizes,"o",@progbits,%text, main1
	$long,	.Lfunc_begin30
	$byte,	120
	$section,	%text, main1,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, main,"ax",@progbits
	$globl,	main                            //  -  -  Begin function main
	$type,	main,@function
main:                                   // @main
.Lfunc_begin31:
// %bb.0:
	$sd , r22, 16, d22
	$add , r22, r22, 24
	$sd , r22,  - 16, d14
	$sd , r22,  - 24, d16
	$move , r0, 7
	$move , r14, 0
	$move , r1, r14
	$call , r23, print_debug
	$move , r4, 10
	$move , r0, r14
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$call , r23, syscall
	$sw , zero, sd_host, r0
	$move , r15, b
	$move , r4, 14
	$move , r0, r15
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$call , r23, syscall
	$sw , r15, 4, 0
	$sw , r15, 8, 16
	$sw , r15, 12, 0
	$move , r16, main1
	$move , r15, 20
	$move , r0, r16
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$move , r4, r15
	$call , r23, syscall
	$move , r0, r16
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$move , r4, r15
	$call , r23, syscall
	$move , r0, r16
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$move , r4, r15
	$call , r23, syscall
	$move , r0, r16
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$move , r4, r15
	$call , r23, syscall
	$move , r0, r16
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$move , r4, r15
	$call , r23, syscall
	$move , r0, r16
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$move , r4, r15
	$call , r23, syscall
	$move , r0, r16
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$move , r4, r15
	$call , r23, syscall
	$move , r0, r16
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$move , r4, r15
	$call , r23, syscall
	$move , r0, r16
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$move , r4, r15
	$call , r23, syscall
	$move , r0, r16
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$move , r4, r15
	$call , r23, syscall
	$move , r0, r16
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$move , r4, r15
	$call , r23, syscall
	$move , r0, r16
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$move , r4, r15
	$call , r23, syscall
	$move , r0, r16
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$move , r4, r15
	$call , r23, syscall
	$move , r0, r16
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$move , r4, r15
	$call , r23, syscall
	$move , r0, r16
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$move , r4, r15
	$call , r23, syscall
	$call , r23, main1
	$move , r15, 21
	$move , r0, r14
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$move , r4, r15
	$call , r23, syscall
	$move , r0, r14
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$move , r4, r15
	$call , r23, syscall
	$move , r0, r14
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$move , r4, r15
	$call , r23, syscall
	$move , r0, r14
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$move , r4, r15
	$call , r23, syscall
	$move , r0, r14
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$move , r4, r15
	$call , r23, syscall
	$move , r0, r14
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$move , r4, r15
	$call , r23, syscall
	$move , r0, r14
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$move , r4, r15
	$call , r23, syscall
	$move , r0, r14
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$move , r4, r15
	$call , r23, syscall
	$move , r0, r14
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$move , r4, r15
	$call , r23, syscall
	$move , r0, r14
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$move , r4, r15
	$call , r23, syscall
	$move , r0, r14
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$move , r4, r15
	$call , r23, syscall
	$move , r0, r14
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$move , r4, r15
	$call , r23, syscall
	$move , r0, r14
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$move , r4, r15
	$call , r23, syscall
	$move , r0, r14
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$move , r4, r15
	$call , r23, syscall
	$move , r0, r14
	$move , r1, r14
	$move , r2, r14
	$move , r3, r14
	$move , r4, r15
	$call , r23, syscall
	$move , r0, r14
	$ld , d16, r22,  - 24
	$ld , d14, r22,  - 16
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end31:
	$size,	main, .Lfunc_end31 - main
	$section,	%stack_sizes,"o",@progbits,%text, main
	$long,	.Lfunc_begin31
	$byte,	24
	$section,	%text, main,"ax",@progbits
                                        //  -  -  End function
	$type,	sd_host,@object                 // @sd_host
	$section,	%bss, sd_host,"aw",@nobits
	$globl,	sd_host
	$p2align,	2
sd_host:
	$long,	0                               // 0x0
	$size,	sd_host, 4

	$type,	DPU_INPUT_ARGUMENTS,@object     // @DPU_INPUT_ARGUMENTS
	$section,	%bss, DPU_INPUT_ARGUMENTS,"aw",@nobits
	$globl,	DPU_INPUT_ARGUMENTS
	$p2align,	2
DPU_INPUT_ARGUMENTS:
	$zero,	16
	$size,	DPU_INPUT_ARGUMENTS, 16

	$type,	b,@object                       // @b
	$section,	%bss, b,"aw",@nobits
	$globl,	b
	$p2align,	2
b:
	$zero,	16
	$size,	b, 16

	$type,	dpu_info,@object                // @dpu_info
	$section,	%bss, dpu_info,"aw",@nobits
	$globl,	dpu_info
	$p2align,	2
dpu_info:
	$long,	0
	$size,	dpu_info, 4

	$addrsig,
	$addrsig_sym, main1
	$addrsig_sym, DPU_INPUT_ARGUMENTS
	$addrsig_sym, b
