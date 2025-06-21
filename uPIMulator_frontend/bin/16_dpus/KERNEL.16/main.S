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
	$sd , r22, 0, d14
	$sd , r22, 8, d16
	$sd , r22, 16, d18
	$sd , r22, 24, d20
	$sd , r22, 32, d22
	$sw , r0, 0, r22  
	$move , r4, 0
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
	$ld , d22, r22, 32
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
	$section,	%text, sp_wait,"ax",@progbits
	$globl,	sp_wait                         //  -  -  Begin function sp_wait
	$type,	sp_wait,@function
sp_wait:                                // @sp_wait
.Lfunc_begin0:
// %bb.0:
	$sd , r22, 16, d22
	$add , r22, r22, 24
	$sw , r22,  - 20, r0
	$lw , r0, r22,  - 20
	$lw , r0, r0, 4
	$call , r23, mutex_lock
	$move , r0, id
	$sb , r22,  - 16, r0
	$lw , r0, r22,  - 20
	$lbs , r1, r0, 1
	$add , r1, r1, 1
	$sb , r0, 1, r1
	$lw , r1, r22,  - 20
	$lbu , r0, r1, 1
	$lbu , r1, r1, 0
	$jneq , r0, r1, .LBB0_8
	$jump , .LBB0_1
.LBB0_1:
	$lw , r0, r22,  - 20
	$sb , r0, 2, 0
	$sw , r22,  - 12, 0
	$jump , .LBB0_2
.LBB0_2:                                // =>This Inner Loop Header: Depth=1
	$lw , r0, r22,  - 12
	$lw , r1, r22,  - 20
	$lbu , r1, r1, 0
	$jges , r0, r1, .LBB0_7
	$jump , .LBB0_3
.LBB0_3:                                //   in Loop: Header=BB0_2 Depth=1
	$lbu , r0, r22,  - 16
	$lw , r1, r22,  - 12
	$jeq , r0, r1, .LBB0_5
	$jump , .LBB0_4
.LBB0_4:                                //   in Loop: Header=BB0_2 Depth=1
	$lw , r0, r22,  - 12
	// inline asm
.Ltmp0:
	$resume , r0, 0, nz, .Ltmp0 + 0
	// inline asm
	$jump , .LBB0_5
.LBB0_5:                                //   in Loop: Header=BB0_2 Depth=1
	$jump , .LBB0_6
.LBB0_6:                                //   in Loop: Header=BB0_2 Depth=1
	$lw , r0, r22,  - 12
	$add , r0, r0, 1
	$sw , r22,  - 12, r0
	$jump , .LBB0_2
.LBB0_7:
	$lw , r0, r22,  - 20
	$sb , r0, 1, 0
	$lw , r0, r22,  - 20
	$lw , r0, r0, 4
	$call , r23, mutex_unlock
	$sw , r22,  - 24, 0
	$jump , .LBB0_10
.LBB0_8:
	$lw , r0, r22,  - 20
	$lw , r0, r0, 4
	$call , r23, mutex_unlock
	// inline asm
	$move , r0, 5
	// inline asm
	// inline asm
	$stop , false, 0x0
	// inline asm
	$jump , .LBB0_9
.LBB0_9:
	$lw , r0, r22,  - 20
	$lbu , r0, r0, 2
	$sw , r22,  - 24, r0
	$jump , .LBB0_10
.LBB0_10:
	$lw , r0, r22,  - 24
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end0:
	$size,	sp_wait, .Lfunc_end0 - sp_wait
	$section,	%stack_sizes,"o",@progbits,%text, sp_wait
	$long,	.Lfunc_begin0
	$byte,	24
	$section,	%text, sp_wait,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, mutex_lock,"ax",@progbits
	$type,	mutex_lock,@function            //  -  -  Begin function mutex_lock
mutex_lock:                             // @mutex_lock
.Lfunc_begin1:
// %bb.0:
	$sw , r22, 0, r0
	$lw , r0, r22, 0
	// inline asm
.Ltmp1:
	$acquire , r0, 0, nz, .Ltmp1
	// inline asm
	$jump , r23
.Lfunc_end1:
	$size,	mutex_lock, .Lfunc_end1 - mutex_lock
	$section,	%stack_sizes,"o",@progbits,%text, mutex_lock
	$long,	.Lfunc_begin1
	$byte,	4
	$section,	%text, mutex_lock,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, mutex_unlock,"ax",@progbits
	$type,	mutex_unlock,@function          //  -  -  Begin function mutex_unlock
mutex_unlock:                           // @mutex_unlock
.Lfunc_begin2:
// %bb.0:
	$sw , r22, 0, r0
	$lw , r0, r22, 0
	// inline asm
.Ltmp2:
	$release , r0, 0, nz, .Ltmp2 + 1
	// inline asm
	$jump , r23
.Lfunc_end2:
	$size,	mutex_unlock, .Lfunc_end2 - mutex_unlock
	$section,	%stack_sizes,"o",@progbits,%text, mutex_unlock
	$long,	.Lfunc_begin2
	$byte,	4
	$section,	%text, mutex_unlock,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, abnormal_wakeup,"ax",@progbits
	$globl,	abnormal_wakeup                 //  -  -  Begin function abnormal_wakeup
	$type,	abnormal_wakeup,@function
abnormal_wakeup:                        // @abnormal_wakeup
.Lfunc_begin3:
// %bb.0:
	$sd , r22, 8, d22
	$add , r22, r22, 16
	$sw , r22,  - 16, r0
	$lw , r0, r22,  - 16
	$lw , r0, r0, 4
	$call , r23, mutex_lock
	$lw , r0, r22,  - 16
	$sb , r0, 2, 1
	$sw , r22,  - 12, 0
	$jump , .LBB3_1
.LBB3_1:                                // =>This Inner Loop Header: Depth=1
	$lw , r0, r22,  - 12
	$lw , r1, r22,  - 16
	$lbu , r1, r1, 0
	$jges , r0, r1, .LBB3_4
	$jump , .LBB3_2
.LBB3_2:                                //   in Loop: Header=BB3_1 Depth=1
	$lw , r0, r22,  - 12
	// inline asm
.Ltmp3:
	$resume , r0, 0, nz, .Ltmp3 + 1
	// inline asm
	$jump , .LBB3_3
.LBB3_3:                                //   in Loop: Header=BB3_1 Depth=1
	$lw , r0, r22,  - 12
	$add , r0, r0, 1
	$sw , r22,  - 12, r0
	$jump , .LBB3_1
.LBB3_4:
	$lw , r0, r22,  - 16
	$sb , r0, 1, 0
	$lw , r0, r22,  - 16
	$lw , r0, r0, 4
	$call , r23, mutex_unlock
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end3:
	$size,	abnormal_wakeup, .Lfunc_end3 - abnormal_wakeup
	$section,	%stack_sizes,"o",@progbits,%text, abnormal_wakeup
	$long,	.Lfunc_begin3
	$byte,	16
	$section,	%text, abnormal_wakeup,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, abnormal_wakeup_one,"ax",@progbits
	$globl,	abnormal_wakeup_one             //  -  -  Begin function abnormal_wakeup_one
	$type,	abnormal_wakeup_one,@function
abnormal_wakeup_one:                    // @abnormal_wakeup_one
.Lfunc_begin4:
// %bb.0:
	$sd , r22, 8, d22
	$add , r22, r22, 16
	$sw , r22,  - 16, r0
	$lw , r0, r22,  - 16
	$lw , r0, r0, 4
	$call , r23, mutex_lock
	$lw , r0, r22,  - 16
	$lbu , r0, r0, 1
	$jneq , r0, 0, .LBB4_2
	$jump , .LBB4_1
.LBB4_1:
	$jump , .LBB4_7
.LBB4_2:
	$lw , r0, r22,  - 16
	$sb , r0, 2, 1
	$lw , r0, r22,  - 16
	$lbs , r1, r0, 1
	$add , r1, r1,  - 1
	$sb , r0, 1, r1
	$sw , r22,  - 12, 0
	$jump , .LBB4_3
.LBB4_3:                                // =>This Inner Loop Header: Depth=1
	$lw , r0, r22,  - 12
	$lw , r1, r22,  - 16
	$lbu , r1, r1, 0
	$jges , r0, r1, .LBB4_6
	$jump , .LBB4_4
.LBB4_4:                                //   in Loop: Header=BB4_3 Depth=1
	$lw , r0, r22,  - 12
	// inline asm
.Ltmp4:
	$resume , r0, 0, nz, .Ltmp4 + 2
	// inline asm
	$sw , r22,  - 12, 16
	$jump , .LBB4_5
.LBB4_5:                                //   in Loop: Header=BB4_3 Depth=1
	$lw , r0, r22,  - 12
	$add , r0, r0, 1
	$sw , r22,  - 12, r0
	$jump , .LBB4_3
.LBB4_6:
	$jump , .LBB4_7
.LBB4_7:
	$lw , r0, r22,  - 16
	$lw , r0, r0, 4
	$call , r23, mutex_unlock
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end4:
	$size,	abnormal_wakeup_one, .Lfunc_end4 - abnormal_wakeup_one
	$section,	%stack_sizes,"o",@progbits,%text, abnormal_wakeup_one
	$long,	.Lfunc_begin4
	$byte,	16
	$section,	%text, abnormal_wakeup_one,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, swap_scheduler,"ax",@progbits
	$globl,	swap_scheduler                  //  -  -  Begin function swap_scheduler
	$type,	swap_scheduler,@function
swap_scheduler:                         // @swap_scheduler
.Lfunc_begin5:
// %bb.0:
	$sd , r22, 8, d22
	$add , r22, r22, 16
	$call , r23, me
	$lbu , r1, r0, cur_jobs
	$lsl , r0, r1, 2
	$lsl_add , r1, r0, r1, 4
	$move , r0, jobs
	$add , r0, r0, r1
	$add , r0, r0, 16
	$sw , r22,  - 16, r0
	$call , r23, me
	$move , r1, r0
	$lw , r0, r22,  - 16
	$lsl , r1, r1, 2
	$lw , r1, r1, fc_scheduler_job
	$call , r23, swap_context
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end5:
	$size,	swap_scheduler, .Lfunc_end5 - swap_scheduler
	$section,	%stack_sizes,"o",@progbits,%text, swap_scheduler
	$long,	.Lfunc_begin5
	$byte,	16
	$section,	%text, swap_scheduler,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, __end_child_jobs,"ax",@progbits
	$globl,	__end_child_jobs                //  -  -  Begin function __end_child_jobs
	$type,	__end_child_jobs,@function
__end_child_jobs:                       // @__end_child_jobs
.Lfunc_begin6:
// %bb.0:
	$sd , r22, 16, d22
	$add , r22, r22, 24
	$lw , r0, zero, mutex_jobs
	$call , r23, mutex_lock
	$call , r23, me
	$lbs , r0, r0, cur_jobs
	$sb , r22,  - 24, r0
	$lbu , r1, r22,  - 24
	$lsl , r0, r1, 2
	$lsl_add , r0, r0, r1, 4
	$move , r1, jobs
	$sw , r22,  - 16, r1
	$move , r1, 4
	$sb , r0, jobs, r1
	$lw , r0, zero, mutex_jobs
	$call , r23, mutex_unlock
	$lw , r0, r22,  - 16
	$move , r2, 1
	$move , r1, r2
	$call , r23, wakeup
	$call , r23, me
	$move , r1, r0
	$lw , r0, r22,  - 16
	$lbu , r2, r1, cur_jobs
	$lsl , r1, r2, 2
	$lsl_add , r1, r1, r2, 4
	$add , r0, r0, r1
	$add , r0, r0, 16
	$sw , r22,  - 20, r0
	$call , r23, me
	$move , r1, r0
	$lw , r0, r22,  - 20
	$lsl , r1, r1, 2
	$lw , r1, r1, fc_scheduler_job
	$call , r23, swap_context
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end6:
	$size,	__end_child_jobs, .Lfunc_end6 - __end_child_jobs
	$section,	%stack_sizes,"o",@progbits,%text, __end_child_jobs
	$long,	.Lfunc_begin6
	$byte,	24
	$section,	%text, __end_child_jobs,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, wakeup,"ax",@progbits
	$globl,	wakeup                          //  -  -  Begin function wakeup
	$type,	wakeup,@function
wakeup:                                 // @wakeup
.Lfunc_begin7:
// %bb.0:
	$sd , r22, 24, d22
	$add , r22, r22, 32
                                        // kill: def $r3 killed $r2
                                        // kill: def $r3 killed $r1
	$sw , r22,  - 32, r0
	$sb , r22,  - 28, r1
	$sb , r22,  - 24, r2
	$sw , r22,  - 20, 0
	$jump , .LBB7_1
.LBB7_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB7_8 Depth 2
	$lw , r0, r22,  - 20
	$jgtu , r0, 9, .LBB7_21
	$jump , .LBB7_2
.LBB7_2:                                //   in Loop: Header=BB7_1 Depth=1
	$lw , r0, zero, mutex_jobs
	$call , r23, mutex_lock
	$lbu , r0, r22,  - 28
	$jneq , r0, 0, .LBB7_4
	$jump , .LBB7_3
.LBB7_3:                                //   in Loop: Header=BB7_1 Depth=1
	$lw , r1, r22,  - 20
	$lsl , r0, r1, 4
	$lsl_add , r0, r0, r1, 11
	$lsl_sub , r0, r0, r1, 6
	$add , r0, r0, 651280
	$move , r1, jobs
	$move , r2, 2000
	$call , r23, _mram_read
	$jump , .LBB7_7
.LBB7_4:                                //   in Loop: Header=BB7_1 Depth=1
	$lw , r0, r22,  - 20
	$lw , r1, zero, cur_process_index
	$jeq , r0, r1, .LBB7_6
	$jump , .LBB7_5
.LBB7_5:                                //   in Loop: Header=BB7_1 Depth=1
	$jump , .LBB7_20
.LBB7_6:                                //   in Loop: Header=BB7_1 Depth=1
	$jump , .LBB7_7
.LBB7_7:                                //   in Loop: Header=BB7_1 Depth=1
	$sw , r22,  - 16, 0
	$jump , .LBB7_8
.LBB7_8:                                //   Parent Loop BB7_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	$lw , r0, r22,  - 16
	$lw , r2, r22,  - 20
	$lsl , r1, r2, 4
	$lsl_add , r2, r1, r2, 6
	$move , r1, processs
	$add , r1, r1, r2
	$lbu , r1, r1, 2
	$jgeu , r0, r1, .LBB7_17
	$jump , .LBB7_9
.LBB7_9:                                //   in Loop: Header=BB7_8 Depth=2
	$lw , r1, r22,  - 16
	$lsl , r0, r1, 2
	$lsl_add , r0, r0, r1, 4
	$lbu , r0, r0, jobs
	$jneq , r0, 6, .LBB7_15
	$jump , .LBB7_10
.LBB7_10:                               //   in Loop: Header=BB7_8 Depth=2
	$lw , r1, r22,  - 16
	$lsl , r0, r1, 2
	$lsl_add , r1, r0, r1, 4
	$move , r0, jobs
	$add , r0, r0, r1
	$lw , r0, r0, 8
	$lw , r1, r22,  - 32
	$jneq , r0, r1, .LBB7_15
	$jump , .LBB7_11
.LBB7_11:                               //   in Loop: Header=BB7_8 Depth=2
	$lw , r1, r22,  - 16
	$lsl , r0, r1, 2
	$lsl_add , r0, r0, r1, 4
	$move , r1, 3
	$sb , r0, jobs, r1
	$lbu , r0, r22,  - 28
	$jneq , r0, 0, .LBB7_14
	$jump , .LBB7_12
.LBB7_12:                               //   in Loop: Header=BB7_8 Depth=2
	$lw , r1, r22,  - 20
	$lsl , r0, r1, 4
	$lsl_add , r1, r0, r1, 6
	$move , r0, processs
	$add , r0, r0, r1
	$lw , r0, r0, 8
	$jneq , r0, 5, .LBB7_14
	$jump , .LBB7_13
.LBB7_13:                               //   in Loop: Header=BB7_8 Depth=2
	$lw , r1, r22,  - 20
	$lsl , r0, r1, 4
	$lsl_add , r1, r0, r1, 6
	$move , r0, processs
	$add , r0, r0, r1
	$sw , r0, 8, 3
	$jump , .LBB7_14
.LBB7_14:                               //   in Loop: Header=BB7_8 Depth=2
	$jump , .LBB7_15
.LBB7_15:                               //   in Loop: Header=BB7_8 Depth=2
	$jump , .LBB7_16
.LBB7_16:                               //   in Loop: Header=BB7_8 Depth=2
	$lw , r0, r22,  - 16
	$add , r0, r0, 1
	$sw , r22,  - 16, r0
	$jump , .LBB7_8
.LBB7_17:                               //   in Loop: Header=BB7_1 Depth=1
	$lw , r0, zero, mutex_jobs
	$call , r23, mutex_unlock
	$lbu , r0, r22,  - 28
	$jeq , r0, 0, .LBB7_19
	$jump , .LBB7_18
.LBB7_18:
	$jump , .LBB7_22
.LBB7_19:                               //   in Loop: Header=BB7_1 Depth=1
	$lw , r1, r22,  - 20
	$lsl , r0, r1, 4
	$lsl_add , r0, r0, r1, 11
	$lsl_sub , r0, r0, r1, 6
	$add , r1, r0, 651280
	$move , r0, jobs
	$move , r2, 2000
	$call , r23, _mram_write
	$jump , .LBB7_20
.LBB7_20:                               //   in Loop: Header=BB7_1 Depth=1
	$lw , r0, r22,  - 20
	$add , r0, r0, 1
	$sw , r22,  - 20, r0
	$jump , .LBB7_1
.LBB7_21:
	$lw , r1, zero, cur_process_index
	$lsl , r0, r1, 4
	$lsl_add , r0, r0, r1, 11
	$lsl_sub , r0, r0, r1, 6
	$add , r0, r0, 651280
	$move , r1, jobs
	$move , r2, 2000
	$call , r23, _mram_read
	$jump , .LBB7_22
.LBB7_22:
	$lbu , r0, r22,  - 24
	$jeq , r0, 0, .LBB7_24
	$jump , .LBB7_23
.LBB7_23:
	$move , r0, cp
	$call , r23, abnormal_wakeup
	$jump , .LBB7_24
.LBB7_24:
	$move , r0, 0
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end7:
	$size,	wakeup, .Lfunc_end7 - wakeup
	$section,	%stack_sizes,"o",@progbits,%text, wakeup
	$long,	.Lfunc_begin7
	$byte,	32
	$section,	%text, wakeup,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, create_job,"ax",@progbits
	$globl,	create_job                      //  -  -  Begin function create_job
	$type,	create_job,@function
create_job:                             // @create_job
.Lfunc_begin8:
// %bb.0:
	$sd , r22, 40, d22
	$add , r22, r22, 48
	$sw , r22,  - 44, r0
	$call , r23, me
	$lbs , r0, r0, cur_jobs
	$sb , r22,  - 40, r0
	$lbu , r1, r22,  - 40
	$lsl , r0, r1, 2
	$lsl_add , r1, r0, r1, 4
	$move , r0, jobs
	$add , r0, r0, r1
	$lbu , r0, r0, 1
	$jeq , r0, 0, .LBB8_2
	$jump , .LBB8_1
.LBB8_1:
	$sw , r22,  - 48,  - 15
	$jump , .LBB8_23
.LBB8_2:
	$lw , r0, zero, mutex_jobs
	$call , r23, mutex_lock
	$sw , r22,  - 36, 0
	$sw , r22,  - 32,  - 1
	$sw , r22,  - 28, 0
	$jump , .LBB8_3
.LBB8_3:                                // =>This Inner Loop Header: Depth=1
	$lw , r0, r22,  - 28
	$jgts , r0, 99, .LBB8_8
	$jump , .LBB8_4
.LBB8_4:                                //   in Loop: Header=BB8_3 Depth=1
	$lw , r1, r22,  - 28
	$lsl , r0, r1, 2
	$lsl_add , r0, r0, r1, 4
	$lbu , r0, r0, jobs
	$jneq , r0, 8, .LBB8_6
	$jump , .LBB8_5
.LBB8_5:
	$lw , r0, r22,  - 28
	$sw , r22,  - 32, r0
	$lw , r1, r22,  - 28
	$lsl , r0, r1, 2
	$lsl_add , r1, r0, r1, 4
	$move , r0, jobs
	$add , r0, r0, r1
	$lw , r0, r0, 4
	$sw , r22,  - 36, r0
	$jump , .LBB8_8
.LBB8_6:                                //   in Loop: Header=BB8_3 Depth=1
	$jump , .LBB8_7
.LBB8_7:                                //   in Loop: Header=BB8_3 Depth=1
	$lw , r0, r22,  - 28
	$add , r0, r0, 1
	$sw , r22,  - 28, r0
	$jump , .LBB8_3
.LBB8_8:
	$lw , r0, r22,  - 36
	$jneq , r0, 0, .LBB8_12
	$jump , .LBB8_9
.LBB8_9:
	$move , r0, 2048
	$call , r23, sbrk
	$sw , r22,  - 36, r0
	$jgeu , r0, 0, .LBB8_11
	$jump , .LBB8_10
.LBB8_10:
	$lw , r0, zero, mutex_jobs
	$call , r23, mutex_unlock
	$lw , r0, r22,  - 36
	$sw , r22,  - 48, r0
	$jump , .LBB8_23
.LBB8_11:
	$lw , r0, r22,  - 36
	$add , r0, r0,  - 2048
	$sw , r22,  - 36, r0
	$jump , .LBB8_12
.LBB8_12:
	$lw , r1, zero, cur_process_index
	$lsl , r0, r1, 4
	$lsl_add , r1, r0, r1, 6
	$move , r0, processs
	$add , r0, r0, r1
	$sw , r22,  - 24, r0
	$lw , r0, r22,  - 24
	$lbs , r0, r0, 2
	$sb , r22,  - 20, r0
	$lw , r0, r22,  - 24
	$lbs , r1, r0, 2
	$add , r1, r1, 1
	$sb , r0, 2, r1
	$sw , r22,  - 16, 0
	$jump , .LBB8_13
.LBB8_13:                               // =>This Inner Loop Header: Depth=1
	$lw , r0, r22,  - 16
	$move , r1, 0
	$sw , r22,  - 12, r1
	$jgts , r0, 99, .LBB8_15
	$jump , .LBB8_14
.LBB8_14:                               //   in Loop: Header=BB8_13 Depth=1
	$lw , r0, r22,  - 32
	$move , r1,  - 1
	$sub , r0, r0, r1, eq
	$sw , r22,  - 12, r0
	$jump , .LBB8_15
.LBB8_15:                               //   in Loop: Header=BB8_13 Depth=1
	$lw , r0, r22,  - 12
	$and , r0, r0, 1
	$jeq , r0, 0, .LBB8_20
	$jump , .LBB8_16
.LBB8_16:                               //   in Loop: Header=BB8_13 Depth=1
	$lw , r1, r22,  - 16
	$lsl , r0, r1, 2
	$lsl_add , r0, r0, r1, 4
	$lbu , r0, r0, jobs
	$jneq , r0, 0, .LBB8_18
	$jump , .LBB8_17
.LBB8_17:                               //   in Loop: Header=BB8_13 Depth=1
	$lw , r0, r22,  - 16
	$sw , r22,  - 32, r0
	$jump , .LBB8_18
.LBB8_18:                               //   in Loop: Header=BB8_13 Depth=1
	$jump , .LBB8_19
.LBB8_19:                               //   in Loop: Header=BB8_13 Depth=1
	$lw , r0, r22,  - 16
	$add , r0, r0, 1
	$sw , r22,  - 16, r0
	$jump , .LBB8_13
.LBB8_20:
	$lw , r0, r22,  - 32
	$jeq , r0,  - 1, .LBB8_22
	$jump , .LBB8_21
.LBB8_21:
	$lw , r1, r22,  - 32
	$lsl , r0, r1, 2
	$lsl_add , r1, r0, r1, 4
	$move , r0, jobs
	$move , r2, 1
	$sb , r1, jobs, r2
	$lbs , r2, r22,  - 20
	$lw , r3, r22,  - 32
	$lsl , r1, r3, 2
	$lsl_add , r1, r1, r3, 4
	$add , r1, r0, r1
	$sb , r1, 1, r2
	$lw , r2, r22,  - 36
	$lw , r3, r22,  - 32
	$lsl , r1, r3, 2
	$lsl_add , r1, r1, r3, 4
	$add , r1, r0, r1
	$sw , r1, 16, r2
	$lw , r2, r22,  - 36
	$lw , r3, r22,  - 32
	$lsl , r1, r3, 2
	$lsl_add , r1, r1, r3, 4
	$add , r1, r0, r1
	$sw , r1, 4, r2
	$lw , r2, r22,  - 32
	$lsl , r1, r2, 2
	$lsl_add , r1, r1, r2, 4
	$add , r1, r0, r1
	$lw , r1, r1, 16
	$sw , r1, 36, r1
	$lw , r2, r22,  - 32
	$lsl , r1, r2, 2
	$lsl_add , r1, r1, r2, 4
	$add , r1, r0, r1
	$lw , r1, r1, 16
	$move , r2, __end_child_jobs
	$sw , r1, 32, r2
	$lw , r1, r22,  - 44
	$lw , r3, r22,  - 32
	$lsl , r2, r3, 2
	$lsl_add , r2, r2, r3, 4
	$add , r0, r0, r2
	$lw , r0, r0, 16
	$sw , r0, 24, r1
	$lw , r0, zero, mutex_jobs
	$call , r23, mutex_unlock
	$move , r0, cp
	$call , r23, abnormal_wakeup_one
	$lbu , r0, r22,  - 20
	$sw , r22,  - 48, r0
	$jump , .LBB8_23
.LBB8_22:
	$lw , r0, zero, mutex_jobs
	$call , r23, mutex_unlock
	$sw , r22,  - 48,  - 16
	$jump , .LBB8_23
.LBB8_23:
	$lw , r0, r22,  - 48
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end8:
	$size,	create_job, .Lfunc_end8 - create_job
	$section,	%stack_sizes,"o",@progbits,%text, create_job
	$long,	.Lfunc_begin8
	$byte,	48
	$section,	%text, create_job,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, sbrk,"ax",@progbits
	$globl,	sbrk                            //  -  -  Begin function sbrk
	$type,	sbrk,@function
sbrk:                                   // @sbrk
.Lfunc_begin9:
// %bb.0:
	$sd , r22, 8, d22
	$add , r22, r22, 16
	$sw , r22,  - 16, r0
	$lw , r0, zero, mutex_sbrk
	$call , r23, mutex_lock
	$lw , r0, r22,  - 16
	$jlts , r0, 1, .LBB9_4
	$jump , .LBB9_1
.LBB9_1:
	$sw , r22,  - 12,  - 2
	$lw , r1, zero, cur_process_index
	$lsl , r0, r1, 4
	$lsl_add , r1, r0, r1, 6
	$move , r0, processs
	$add , r0, r0, r1
	$lw , r0, r0, 32
	$lw , r1, r22,  - 16
	$add , r0, r0, r1
	$lsr , r0, r0, 8
	$jltu , r0, 223, .LBB9_3
	$jump , .LBB9_2
.LBB9_2:
	$jump , .LBB9_10
.LBB9_3:
	$lw , r2, r22,  - 16
	$lw , r1, zero, cur_process_index
	$lsl , r0, r1, 4
	$lsl_add , r1, r0, r1, 6
	$move , r0, processs
	$add , r0, r0, r1
	$lw , r1, r0, 32
	$add , r1, r1, r2
	$sw , r0, 32, r1
	$jump , .LBB9_9
.LBB9_4:
	$lw , r0, r22,  - 16
	$jgts , r0,  - 1, .LBB9_8
	$jump , .LBB9_5
.LBB9_5:
	$sw , r22,  - 12,  - 3
	$lw , r1, zero, cur_process_index
	$lsl , r0, r1, 4
	$lsl_add , r0, r0, r1, 6
	$move , r1, processs
	$add , r0, r1, r0
	$lw , r0, r0, 32
	$lw , r2, r22,  - 16
	$add , r0, r0, r2
	$lw , r3, zero, cur_process_index
	$lsl , r2, r3, 4
	$lsl_add , r2, r2, r3, 6
	$add , r1, r1, r2
	$lw , r1, r1, 44
	$jgeu , r0, r1, .LBB9_7
	$jump , .LBB9_6
.LBB9_6:
	$jump , .LBB9_10
.LBB9_7:
	$lw , r2, r22,  - 16
	$lw , r1, zero, cur_process_index
	$lsl , r0, r1, 4
	$lsl_add , r1, r0, r1, 6
	$move , r0, processs
	$add , r0, r0, r1
	$lw , r1, r0, 32
	$add , r1, r1, r2
	$sw , r0, 32, r1
	$jump , .LBB9_8
.LBB9_8:
	$jump , .LBB9_9
.LBB9_9:
	$lw , r1, zero, cur_process_index
	$lsl , r0, r1, 4
	$lsl_add , r1, r0, r1, 6
	$move , r0, processs
	$add , r0, r0, r1
	$lw , r0, r0, 32
	$sw , r22,  - 12, r0
	$jump , .LBB9_10
.LBB9_10:
	$lw , r0, zero, mutex_sbrk
	$call , r23, mutex_unlock
	$lw , r0, r22,  - 12
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end9:
	$size,	sbrk, .Lfunc_end9 - sbrk
	$section,	%stack_sizes,"o",@progbits,%text, sbrk
	$long,	.Lfunc_begin9
	$byte,	16
	$section,	%text, sbrk,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, join_job,"ax",@progbits
	$globl,	join_job                        //  -  -  Begin function join_job
	$type,	join_job,@function
join_job:                               // @join_job
.Lfunc_begin10:
// %bb.0:
	$sd , r22, 16, d22
	$add , r22, r22, 24
	$sb , r22,  - 20, 0
	$lw , r0, zero, mutex_jobs
	$call , r23, mutex_lock
	$jump , .LBB10_1
.LBB10_1:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB10_3 Depth 2
	$lbu , r0, r22,  - 20
	$jneq , r0, 0, .LBB10_10
	$jump , .LBB10_2
.LBB10_2:                               //   in Loop: Header=BB10_1 Depth=1
	$sb , r22,  - 20, 1
	$sw , r22,  - 16, 0
	$jump , .LBB10_3
.LBB10_3:                               //   Parent Loop BB10_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	$lw , r0, r22,  - 16
	$jgts , r0, 99, .LBB10_9
	$jump , .LBB10_4
.LBB10_4:                               //   in Loop: Header=BB10_3 Depth=2
	$lw , r1, r22,  - 16
	$lsl , r0, r1, 2
	$lsl_add , r0, r0, r1, 4
	$lbu , r0, r0, jobs
	$jneq , r0, 4, .LBB10_6
	$jump , .LBB10_5
.LBB10_5:
	$lw , r1, r22,  - 16
	$lsl , r0, r1, 2
	$lsl_add , r1, r0, r1, 4
	$move , r0, jobs
	$move , r2, 8
	$sb , r1, jobs, r2
	$lw , r2, r22,  - 16
	$lsl , r1, r2, 2
	$lsl_add , r1, r1, r2, 4
	$add , r0, r0, r1
	$lbs , r0, r0, 1
	$sb , r22,  - 12, r0
	$lw , r0, zero, mutex_jobs
	$call , r23, mutex_unlock
	$lbu , r0, r22,  - 12
	$sw , r22,  - 24, r0
	$jump , .LBB10_11
.LBB10_6:                               //   in Loop: Header=BB10_3 Depth=2
	$sb , r22,  - 20, 0
	$jump , .LBB10_7
.LBB10_7:                               //   in Loop: Header=BB10_3 Depth=2
	$jump , .LBB10_8
.LBB10_8:                               //   in Loop: Header=BB10_3 Depth=2
	$lw , r0, r22,  - 16
	$add , r0, r0, 1
	$sw , r22,  - 16, r0
	$jump , .LBB10_3
.LBB10_9:                               //   in Loop: Header=BB10_1 Depth=1
	$lw , r2, zero, mutex_jobs
	$move , r0, jobs
	$move , r1, 0
	$call , r23, sleep
	$jump , .LBB10_1
.LBB10_10:
	$lw , r0, zero, mutex_jobs
	$call , r23, mutex_unlock
	$sw , r22,  - 24, 0
	$jump , .LBB10_11
.LBB10_11:
	$lw , r0, r22,  - 24
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end10:
	$size,	join_job, .Lfunc_end10 - join_job
	$section,	%stack_sizes,"o",@progbits,%text, join_job
	$long,	.Lfunc_begin10
	$byte,	24
	$section,	%text, join_job,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, sleep,"ax",@progbits
	$globl,	sleep                           //  -  -  Begin function sleep
	$type,	sleep,@function
sleep:                                  // @sleep
.Lfunc_begin11:
// %bb.0:
	$sd , r22, 16, d22
	$add , r22, r22, 24
	$sw , r22,  - 24, r0
	$sw , r22,  - 20, r1
	$sw , r22,  - 16, r2
	$call , r23, me
	$lbs , r0, r0, cur_jobs
	$sb , r22,  - 12, r0
	$lbu , r1, r22,  - 12
	$lsl , r0, r1, 2
	$lsl_add , r1, r0, r1, 4
	$move , r0, jobs
	$move , r2, 6
	$sb , r1, jobs, r2
	$lw , r1, r22,  - 24
	$lbu , r3, r22,  - 12
	$lsl , r2, r3, 2
	$lsl_add , r2, r2, r3, 4
	$add , r0, r0, r2
	$sw , r0, 8, r1
	$lw , r0, r22,  - 20
	$jeq , r0, 0, .LBB11_2
	$jump , .LBB11_1
.LBB11_1:
	$lw , r0, r22,  - 20
	$call , r23, unlock
	$jump , .LBB11_2
.LBB11_2:
	$lw , r0, r22,  - 16
	$jeq , r0, 0, .LBB11_4
	$jump , .LBB11_3
.LBB11_3:
	$lw , r0, r22,  - 16
	$call , r23, mutex_unlock
	$jump , .LBB11_4
.LBB11_4:
	$call , r23, swap_scheduler
	$lw , r0, r22,  - 20
	$jeq , r0, 0, .LBB11_6
	$jump , .LBB11_5
.LBB11_5:
	$lw , r0, r22,  - 20
	$call , r23, lock
	$jump , .LBB11_6
.LBB11_6:
	$lw , r0, r22,  - 16
	$jeq , r0, 0, .LBB11_8
	$jump , .LBB11_7
.LBB11_7:
	$lw , r0, r22,  - 16
	$call , r23, mutex_lock
	$jump , .LBB11_8
.LBB11_8:
	$move , r0, 0
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end11:
	$size,	sleep, .Lfunc_end11 - sleep
	$section,	%stack_sizes,"o",@progbits,%text, sleep
	$long,	.Lfunc_begin11
	$byte,	24
	$section,	%text, sleep,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, swap,"ax",@progbits
	$globl,	swap                            //  -  -  Begin function swap
	$type,	swap,@function
swap:                                   // @swap
.Lfunc_begin12:
// %bb.0:
	$sd , r22, 24, d22
	$add , r22, r22, 32
                                        // kill: def $r2 killed $r1
	$sw , r22,  - 32, r0
	$sb , r22,  - 28, r1
	$lw , r1, r22,  - 32
	$lsl , r0, r1, 2
	$lsl_add , r0, r0, r1, 4
	$move , r1, jobs
	$sw , r22,  - 20, r1
	$move , r1, 2
	$sb , r0, jobs, r1
	$lw , r0, zero, mutex_jobs
	$call , r23, mutex_unlock
	$lw , r0, r22,  - 32
	$sw , r22,  - 16, r0
	$call , r23, me
	$lw , r2, r22,  - 16
	$move , r1, r0
	$lw , r0, r22,  - 20
	$sb , r1, cur_jobs, r2
	$sw , r22,  - 24, 0
	// inline asm
	$time , r1
	// inline asm
	$sw , r22,  - 24, r1
	$lw , r1, r22,  - 24
	$lw , r3, r22,  - 32
	$lsl , r2, r3, 2
	$lsl_add , r2, r2, r3, 4
	$add , r0, r0, r2
	$sw , r0, 12, r1
	$lbu , r0, r22,  - 28
	$jeq , r0, 0, .LBB12_2
	$jump , .LBB12_1
.LBB12_1:
	$call , r23, me
	$move , r1, r0
	$move , r0, fc_scheduler_job
	$lsl_add , r0, r0, r1, 2
	$lw , r2, r22,  - 32
	$lsl , r1, r2, 2
	$lsl_add , r2, r1, r2, 4
	$move , r1, jobs
	$add , r1, r1, r2
	$lw , r1, r1, 16
	$lw , r2, r1, 24
	$call , r23, first_swap_context
	$jump , .LBB12_3
.LBB12_2:
	$call , r23, me
	$move , r1, r0
	$move , r0, fc_scheduler_job
	$lsl_add , r0, r0, r1, 2
	$lw , r2, r22,  - 32
	$lsl , r1, r2, 2
	$lsl_add , r2, r1, r2, 4
	$move , r1, jobs
	$add , r1, r1, r2
	$lw , r1, r1, 16
	$call , r23, swap_context
	$jump , .LBB12_3
.LBB12_3:
	$lw , r0, zero, mutex_jobs
	$call , r23, mutex_lock
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end12:
	$size,	swap, .Lfunc_end12 - swap
	$section,	%stack_sizes,"o",@progbits,%text, swap
	$long,	.Lfunc_begin12
	$byte,	32
	$section,	%text, swap,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, check_time_process,"ax",@progbits
	$globl,	check_time_process              //  -  -  Begin function check_time_process
	$type,	check_time_process,@function
check_time_process:                     // @check_time_process
.Lfunc_begin13:
// %bb.0:
	$sw , r22, 4, 0
	// inline asm
	$time , r0
	// inline asm
	$sw , r22, 4, r0
	$lw , r0, r22, 4
	$lw , r2, zero, cur_process_index
	$lsl , r1, r2, 4
	$lsl_add , r2, r1, r2, 6
	$move , r1, processs
	$add , r1, r1, r2
	$lw , r1, r1, 20
	$sub , r0, r0, r1
	$move , r1, 50001
	$jltu , r0, r1, .LBB13_2
	$jump , .LBB13_1
.LBB13_1:
	$sb , r22, 0, 1
	$jump , .LBB13_3
.LBB13_2:
	$sb , r22, 0, 0
	$jump , .LBB13_3
.LBB13_3:
	$lbu , r0, r22, 0
	$jump , r23
.Lfunc_end13:
	$size,	check_time_process, .Lfunc_end13 - check_time_process
	$section,	%stack_sizes,"o",@progbits,%text, check_time_process
	$long,	.Lfunc_begin13
	$byte,	8
	$section,	%text, check_time_process,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, scheduler_jobs,"ax",@progbits
	$globl,	scheduler_jobs                  //  -  -  Begin function scheduler_jobs
	$type,	scheduler_jobs,@function
scheduler_jobs:                         // @scheduler_jobs
.Lfunc_begin14:
// %bb.0:
	$sd , r22, 16, d22
	$add , r22, r22, 24
	$sw , r22,  - 24, 0
	$sb , r22,  - 20, 0
	$move , r0, cp
	$call , r23, sp_wait
	$jump , .LBB14_1
.LBB14_1:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB14_2 Depth 2
	$lw , r0, zero, mutex_jobs
	$call , r23, mutex_lock
	$jump , .LBB14_2
.LBB14_2:                               //   Parent Loop BB14_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	$lw , r0, r22,  - 24
	$lw , r2, zero, cur_process_index
	$lsl , r1, r2, 4
	$lsl_add , r2, r1, r2, 6
	$move , r1, processs
	$add , r1, r1, r2
	$lbu , r1, r1, 2
	$move , r2, 0
	$sw , r22,  - 12, r2
	$jgeu , r0, r1, .LBB14_4
	$jump , .LBB14_3
.LBB14_3:                               //   in Loop: Header=BB14_2 Depth=2
	$lbu , r0, r22,  - 20
	$move , r1, 0
	$sub , r0, r0, r1, eq
	$sw , r22,  - 12, r0
	$jump , .LBB14_4
.LBB14_4:                               //   in Loop: Header=BB14_2 Depth=2
	$lw , r0, r22,  - 12
	$and , r0, r0, 1
	$jeq , r0, 0, .LBB14_13
	$jump , .LBB14_5
.LBB14_5:                               //   in Loop: Header=BB14_2 Depth=2
	$lw , r1, r22,  - 24
	$lsl , r0, r1, 2
	$lsl_add , r0, r0, r1, 4
	$lbu , r0, r0, jobs
	$jneq , r0, 3, .LBB14_7
	$jump , .LBB14_6
.LBB14_6:                               //   in Loop: Header=BB14_2 Depth=2
	$sb , r22,  - 16, 0
	$jump , .LBB14_11
.LBB14_7:                               //   in Loop: Header=BB14_2 Depth=2
	$lw , r1, r22,  - 24
	$lsl , r0, r1, 2
	$lsl_add , r0, r0, r1, 4
	$lbu , r0, r0, jobs
	$jneq , r0, 1, .LBB14_9
	$jump , .LBB14_8
.LBB14_8:                               //   in Loop: Header=BB14_2 Depth=2
	$sb , r22,  - 16, 1
	$jump , .LBB14_10
.LBB14_9:                               //   in Loop: Header=BB14_2 Depth=2
	$jump , .LBB14_12
.LBB14_10:                              //   in Loop: Header=BB14_2 Depth=2
	$jump , .LBB14_11
.LBB14_11:                              //   in Loop: Header=BB14_2 Depth=2
	$lw , r0, r22,  - 24
	$lbu , r1, r22,  - 16
	$call , r23, swap
	$move , r0, all_end_or_waiting
	$sb , r0, 0, 0
	$call , r23, check_time_process
	$sb , r22,  - 20, r0
	$jump , .LBB14_12
.LBB14_12:                              //   in Loop: Header=BB14_2 Depth=2
	$lw , r0, r22,  - 24
	$add , r0, r0, 1
	$sw , r22,  - 24, r0
	$jump , .LBB14_2
.LBB14_13:                              //   in Loop: Header=BB14_1 Depth=1
	$call , r23, check_time_process
	$sb , r22,  - 20, r0
	$sw , r22,  - 24, 0
	$lw , r0, zero, mutex_jobs
	$call , r23, mutex_unlock
	$lbu , r0, zero, all_end_or_waiting
	$jneq , r0, 0, .LBB14_15
	$jump , .LBB14_14
.LBB14_14:                              //   in Loop: Header=BB14_1 Depth=1
	$lbu , r0, r22,  - 20
	$jeq , r0, 0, .LBB14_20
	$jump , .LBB14_15
.LBB14_15:                              //   in Loop: Header=BB14_1 Depth=1
	$move , r0, cp
	$call , r23, sp_wait
	$jeq , r0, 0, .LBB14_17
	$jump , .LBB14_16
.LBB14_16:                              //   in Loop: Header=BB14_1 Depth=1
	$jump , .LBB14_1
.LBB14_17:                              //   in Loop: Header=BB14_1 Depth=1
	$call , r23, me
	$jneq , r0, 0, .LBB14_19
	$jump , .LBB14_18
.LBB14_18:
	$lbu , r0, zero, all_end_or_waiting
	$ld , d22, r22,  - 8
	$jump , r23
.LBB14_19:                              //   in Loop: Header=BB14_1 Depth=1
	$move , r0, cp
	$call , r23, sp_wait
	$sb , r22,  - 20, 0
	$jump , .LBB14_20
.LBB14_20:                              //   in Loop: Header=BB14_1 Depth=1
	$move , r0, all_end_or_waiting
	$sb , r0, 0, 1
	$jump , .LBB14_1
.Lfunc_end14:
	$size,	scheduler_jobs, .Lfunc_end14 - scheduler_jobs
	$section,	%stack_sizes,"o",@progbits,%text, scheduler_jobs
	$long,	.Lfunc_begin14
	$byte,	24
	$section,	%text, scheduler_jobs,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, try_lock,"ax",@progbits
	$globl,	try_lock                        //  -  -  Begin function try_lock
	$type,	try_lock,@function
try_lock:                               // @try_lock
.Lfunc_begin15:
// %bb.0:
	$sd , r22, 16, d22
	$add , r22, r22, 24
	$sw , r22,  - 20, r0
	$call , r23, me
	$lbs , r0, r0, cur_jobs
	$sb , r22,  - 16, r0
	$lw , r0, zero, mutex_l
	$call , r23, mutex_lock
	$lw , r0, zero, mutex_jobs
	$call , r23, mutex_lock
	$lw , r0, r22,  - 20
	$lw , r0, r0, 0
	$jeq , r0,  - 1, .LBB15_2
	$jump , .LBB15_1
.LBB15_1:
	$lw , r0, zero, mutex_jobs
	$call , r23, mutex_unlock
	$lw , r0, zero, mutex_l
	$call , r23, mutex_unlock
	$sw , r22,  - 24, 1
	$jump , .LBB15_3
.LBB15_2:
	$lbu , r1, r22,  - 16
	$lw , r0, r22,  - 20
	$sw , r0, 0, r1
	$lw , r0, zero, mutex_jobs
	$call , r23, mutex_unlock
	$lw , r0, zero, mutex_l
	$call , r23, mutex_unlock
	$sw , r22,  - 24, 0
	$jump , .LBB15_3
.LBB15_3:
	$lw , r0, r22,  - 24
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end15:
	$size,	try_lock, .Lfunc_end15 - try_lock
	$section,	%stack_sizes,"o",@progbits,%text, try_lock
	$long,	.Lfunc_begin15
	$byte,	24
	$section,	%text, try_lock,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, lock,"ax",@progbits
	$globl,	lock                            //  -  -  Begin function lock
	$type,	lock,@function
lock:                                   // @lock
.Lfunc_begin16:
// %bb.0:
	$sd , r22, 16, d22
	$add , r22, r22, 24
	$sw , r22,  - 20, r0
	$call , r23, me
	$lbs , r0, r0, cur_jobs
	$sb , r22,  - 16, r0
	$lw , r0, zero, mutex_l
	$call , r23, mutex_lock
	$lw , r0, zero, mutex_jobs
	$call , r23, mutex_lock
	$lw , r0, r22,  - 20
	$lw , r0, r0, 0
	$jeq , r0,  - 1, .LBB16_2
	$jump , .LBB16_1
.LBB16_1:
	$lbu , r1, r22,  - 16
	$lsl , r0, r1, 2
	$lsl_add , r1, r0, r1, 4
	$move , r0, jobs
	$move , r2, 5
	$sb , r1, jobs, r2
	$lw , r1, r22,  - 20
	$lbu , r3, r22,  - 16
	$lsl , r2, r3, 2
	$lsl_add , r2, r2, r3, 4
	$add , r0, r0, r2
	$sw , r0, 8, r1
	$lw , r0, zero, mutex_jobs
	$call , r23, mutex_unlock
	$lw , r0, zero, mutex_l
	$call , r23, mutex_unlock
	$call , r23, swap_scheduler
	$sw , r22,  - 24, 0
	$jump , .LBB16_3
.LBB16_2:
	$lbu , r1, r22,  - 16
	$lw , r0, r22,  - 20
	$sw , r0, 0, r1
	$lw , r0, zero, mutex_jobs
	$call , r23, mutex_unlock
	$lw , r0, zero, mutex_l
	$call , r23, mutex_unlock
	$sw , r22,  - 24, 0
	$jump , .LBB16_3
.LBB16_3:
	$lw , r0, r22,  - 24
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end16:
	$size,	lock, .Lfunc_end16 - lock
	$section,	%stack_sizes,"o",@progbits,%text, lock
	$long,	.Lfunc_begin16
	$byte,	24
	$section,	%text, lock,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, unlock,"ax",@progbits
	$globl,	unlock                          //  -  -  Begin function unlock
	$type,	unlock,@function
unlock:                                 // @unlock
.Lfunc_begin17:
// %bb.0:
	$sd , r22, 16, d22
	$add , r22, r22, 24
	$sw , r22,  - 20, r0
	$lw , r0, zero, mutex_l
	$call , r23, mutex_lock
	$lw , r0, zero, mutex_jobs
	$call , r23, mutex_lock
	$lw , r0, r22,  - 20
	$sw , r0, 0,  - 1
	$sw , r22,  - 16, 0
	$jump , .LBB17_1
.LBB17_1:                               // =>This Inner Loop Header: Depth=1
	$lw , r0, r22,  - 16
	$lw , r2, zero, cur_process_index
	$lsl , r1, r2, 4
	$lsl_add , r2, r1, r2, 6
	$move , r1, processs
	$add , r1, r1, r2
	$lbu , r1, r1, 2
	$jgeu , r0, r1, .LBB17_7
	$jump , .LBB17_2
.LBB17_2:                               //   in Loop: Header=BB17_1 Depth=1
	$lw , r1, r22,  - 16
	$lsl , r0, r1, 2
	$lsl_add , r0, r0, r1, 4
	$lbu , r0, r0, jobs
	$jneq , r0, 5, .LBB17_5
	$jump , .LBB17_3
.LBB17_3:                               //   in Loop: Header=BB17_1 Depth=1
	$lw , r1, r22,  - 16
	$lsl , r0, r1, 2
	$lsl_add , r1, r0, r1, 4
	$move , r0, jobs
	$add , r0, r0, r1
	$lw , r0, r0, 8
	$lw , r1, r22,  - 20
	$jneq , r0, r1, .LBB17_5
	$jump , .LBB17_4
.LBB17_4:
	$lw , r1, r22,  - 16
	$lw , r0, r22,  - 20
	$sw , r0, 0, r1
	$lw , r1, r22,  - 16
	$lsl , r0, r1, 2
	$lsl_add , r0, r0, r1, 4
	$move , r1, 3
	$sb , r0, jobs, r1
	$lw , r0, zero, mutex_l
	$call , r23, mutex_unlock
	$lw , r0, zero, mutex_jobs
	$call , r23, mutex_unlock
	$move , r0, cp
	$call , r23, abnormal_wakeup_one
	$sw , r22,  - 24, 0
	$jump , .LBB17_8
.LBB17_5:                               //   in Loop: Header=BB17_1 Depth=1
	$jump , .LBB17_6
.LBB17_6:                               //   in Loop: Header=BB17_1 Depth=1
	$lw , r0, r22,  - 16
	$add , r0, r0, 1
	$sw , r22,  - 16, r0
	$jump , .LBB17_1
.LBB17_7:
	$lw , r0, zero, mutex_jobs
	$call , r23, mutex_unlock
	$lw , r0, zero, mutex_l
	$call , r23, mutex_unlock
	$sw , r22,  - 24, 0
	$jump , .LBB17_8
.LBB17_8:
	$lw , r0, r22,  - 24
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end17:
	$size,	unlock, .Lfunc_end17 - unlock
	$section,	%stack_sizes,"o",@progbits,%text, unlock
	$long,	.Lfunc_begin17
	$byte,	24
	$section,	%text, unlock,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, _mram_read,"ax",@progbits
	$type,	_mram_read,@function             //  -  -  Begin function _mram_read
_mram_read:                              // @_mram_read
.Lfunc_begin18:
// %bb.0:
	$sw , r22, 0, r0
	$sw , r22, 4, r1
	$sw , r22, 8, r2
	$lw , r0, r22, 4
	$lw , r1, r22, 0
	$lw , r3, r22, 8
	$move , r2,  - 1
	$lsr_add , r2, r2, r3, 3
	$lsl_add , r0, r0, r2, 24
	$ldma , r0, r1, 0
	$jump , r23
.Lfunc_end18:
	$size,	_mram_read, .Lfunc_end18 - _mram_read
	$section,	%stack_sizes,"o",@progbits,%text, _mram_read
	$long,	.Lfunc_begin18
	$byte,	12
	$section,	%text, _mram_read,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, _mram_write,"ax",@progbits
	$type,	_mram_write,@function            //  -  -  Begin function _mram_write
_mram_write:                             // @_mram_write
.Lfunc_begin19:
// %bb.0:
	$sw , r22, 0, r0
	$sw , r22, 4, r1
	$sw , r22, 8, r2
	$lw , r0, r22, 0
	$lw , r1, r22, 4
	$lw , r3, r22, 8
	$move , r2,  - 1
	$lsr_add , r2, r2, r3, 3
	$lsl_add , r0, r0, r2, 24
	$sdma , r0, r1, 0
	$jump , r23
.Lfunc_end19:
	$size,	_mram_write, .Lfunc_end19 - _mram_write
	$section,	%stack_sizes,"o",@progbits,%text, _mram_write
	$long,	.Lfunc_begin19
	$byte,	12
	$section,	%text, _mram_write,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, inode_operation,"ax",@progbits
	$globl,	inode_operation                 //  -  -  Begin function inode_operation
	$type,	inode_operation,@function
inode_operation:                        // @inode_operation
.Lfunc_begin20:
// %bb.0:
	$sd , r22, 24, d22
	$add , r22, r22, 32
	$sw , r22,  - 32, r0
	$sw , r22,  - 28, r1
	$sw , r22,  - 24, r2
	$sw , r22,  - 20, r3
	$sw , r22,  - 16, r4
	$lw , r1, r22,  - 32
	$lw , r0, r22,  - 20
	$lsl_add , r0, r0, r1, 16
	$add , r0, r0, 651264
	$sw , r22,  - 12, r0
	$lw , r0, r22,  - 16
	$jneq , r0, 0, .LBB20_2
	$jump , .LBB20_1
.LBB20_1:
	$lw , r0, r22,  - 12
	$lw , r1, r22,  - 28
	$lw , r2, r22,  - 24
	$call , r23, load_big_blocks
	$jump , .LBB20_3
.LBB20_2:
	$lw , r0, r22,  - 28
	$lw , r1, r22,  - 12
	$lw , r2, r22,  - 24
	$call , r23, store_big_blocks
	$jump , .LBB20_3
.LBB20_3:
	$move , r0, 0
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end20:
	$size,	inode_operation, .Lfunc_end20 - inode_operation
	$section,	%stack_sizes,"o",@progbits,%text, inode_operation
	$long,	.Lfunc_begin20
	$byte,	32
	$section,	%text, inode_operation,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, load_big_blocks,"ax",@progbits
	$globl,	load_big_blocks                 //  -  -  Begin function load_big_blocks
	$type,	load_big_blocks,@function
load_big_blocks:                        // @load_big_blocks
.Lfunc_begin21:
// %bb.0:
	$sd , r22, 16, d22
	$add , r22, r22, 24
	$sw , r22,  - 24, r0
	$sw , r22,  - 20, r1
	$sw , r22,  - 16, r2
	$sw , r22,  - 12, 0
	$jump , .LBB21_1
.LBB21_1:                               // =>This Inner Loop Header: Depth=1
	$lw , r0, r22,  - 12
	$lw , r1, r22,  - 16
	$lsr , r1, r1, 11
	$jgeu , r0, r1, .LBB21_4
	$jump , .LBB21_2
.LBB21_2:                               //   in Loop: Header=BB21_1 Depth=1
	$lw , r0, r22,  - 24
	$lw , r2, r22,  - 12
	$lsl_add , r0, r0, r2, 11
	$lw , r1, r22,  - 20
	$lsl_add , r1, r1, r2, 11
	$move , r2, 2048
	$call , r23, _mram_read
	$jump , .LBB21_3
.LBB21_3:                               //   in Loop: Header=BB21_1 Depth=1
	$lw , r0, r22,  - 12
	$add , r0, r0, 1
	$sw , r22,  - 12, r0
	$jump , .LBB21_1
.LBB21_4:
	$lhu , r0, r22,  - 16
	$and , r0, r0, 2047
	$jeq , r0, 0, .LBB21_6
	$jump , .LBB21_5
.LBB21_5:
	$lw , r0, r22,  - 24
	$lw , r2, r22,  - 12
	$lsl_add , r0, r0, r2, 11
	$lw , r1, r22,  - 20
	$lsl_add , r1, r1, r2, 11
	$lw , r2, r22,  - 16
	$and , r2, r2, 2047
	$call , r23, _mram_read
	$jump , .LBB21_6
.LBB21_6:
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end21:
	$size,	load_big_blocks, .Lfunc_end21 - load_big_blocks
	$section,	%stack_sizes,"o",@progbits,%text, load_big_blocks
	$long,	.Lfunc_begin21
	$byte,	24
	$section,	%text, load_big_blocks,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, store_big_blocks,"ax",@progbits
	$globl,	store_big_blocks                //  -  -  Begin function store_big_blocks
	$type,	store_big_blocks,@function
store_big_blocks:                       // @store_big_blocks
.Lfunc_begin22:
// %bb.0:
	$sd , r22, 16, d22
	$add , r22, r22, 24
	$sw , r22,  - 24, r0
	$sw , r22,  - 20, r1
	$sw , r22,  - 16, r2
	$sw , r22,  - 12, 0
	$jump , .LBB22_1
.LBB22_1:                               // =>This Inner Loop Header: Depth=1
	$lw , r0, r22,  - 12
	$lw , r1, r22,  - 16
	$lsr , r1, r1, 11
	$jgeu , r0, r1, .LBB22_4
	$jump , .LBB22_2
.LBB22_2:                               //   in Loop: Header=BB22_1 Depth=1
	$lw , r0, r22,  - 24
	$lw , r2, r22,  - 12
	$lsl_add , r0, r0, r2, 11
	$lw , r1, r22,  - 20
	$lsl_add , r1, r1, r2, 11
	$move , r2, 2048
	$call , r23, _mram_write
	$jump , .LBB22_3
.LBB22_3:                               //   in Loop: Header=BB22_1 Depth=1
	$lw , r0, r22,  - 12
	$add , r0, r0, 1
	$sw , r22,  - 12, r0
	$jump , .LBB22_1
.LBB22_4:
	$lhu , r0, r22,  - 16
	$and , r0, r0, 2047
	$jeq , r0, 0, .LBB22_6
	$jump , .LBB22_5
.LBB22_5:
	$lw , r0, r22,  - 24
	$lw , r2, r22,  - 12
	$lsl_add , r0, r0, r2, 11
	$lw , r1, r22,  - 20
	$lsl_add , r1, r1, r2, 11
	$lw , r2, r22,  - 16
	$and , r2, r2, 2047
	$call , r23, _mram_write
	$jump , .LBB22_6
.LBB22_6:
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end22:
	$size,	store_big_blocks, .Lfunc_end22 - store_big_blocks
	$section,	%stack_sizes,"o",@progbits,%text, store_big_blocks
	$long,	.Lfunc_begin22
	$byte,	24
	$section,	%text, store_big_blocks,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, alloc_inode,"ax",@progbits
	$globl,	alloc_inode                     //  -  -  Begin function alloc_inode
	$type,	alloc_inode,@function
alloc_inode:                            // @alloc_inode
.Lfunc_begin23:
// %bb.0:
	$sd , r22, 24, d22
	$add , r22, r22, 32
	$lw , r0, zero, mutex_mram
	$call , r23, mutex_lock
	$sw , r22,  - 28, 0
	$jump , .LBB23_1
.LBB23_1:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB23_3 Depth 2
                                        //       Child Loop BB23_6 Depth 3
	$lw , r0, r22,  - 28
	$jgts , r0, 9, .LBB23_19
	$jump , .LBB23_2
.LBB23_2:                               //   in Loop: Header=BB23_1 Depth=1
	$lw , r1, r22,  - 28
	$lsl , r0, r1, 4
	$lsl_add , r0, r0, r1, 7
	$lsl_add , r0, r0, r1, 8
	$add , r0, r0, 61536
	$sw , r22,  - 24, r0
	$lw , r0, r22,  - 24
	$add , r0, r0, 651264
	$move , r1, alloc_inode.bit_map
	$move , r2, 400
	$call , r23, _mram_read
	$sw , r22,  - 20, 0
	$jump , .LBB23_3
.LBB23_3:                               //   Parent Loop BB23_1 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB23_6 Depth 3
	$lw , r0, r22,  - 20
	$jgts , r0, 399, .LBB23_17
	$jump , .LBB23_4
.LBB23_4:                               //   in Loop: Header=BB23_3 Depth=2
	$lw , r0, r22,  - 20
	$lbu , r0, r0, alloc_inode.bit_map
	$jeq , r0, 255, .LBB23_15
	$jump , .LBB23_5
.LBB23_5:                               //   in Loop: Header=BB23_3 Depth=2
	$sw , r22,  - 16, 0
	$jump , .LBB23_6
.LBB23_6:                               //   Parent Loop BB23_1 Depth=1
                                        //     Parent Loop BB23_3 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	$lw , r0, r22,  - 16
	$jgts , r0, 7, .LBB23_14
	$jump , .LBB23_7
.LBB23_7:                               //   in Loop: Header=BB23_6 Depth=3
	$lw , r0, r22,  - 20
	$lbu , r0, r0, alloc_inode.bit_map
	$lw , r1, r22,  - 16
	$lsr , r0, r0, r1
	$and , r0, r0, 1
	$jneq , r0, 0, .LBB23_12
	$jump , .LBB23_8
.LBB23_8:                               //   in Loop: Header=BB23_6 Depth=3
	$lw , r1, r22,  - 28
	$lsl , r0, r1, 4
	$lsl_add , r0, r0, r1, 7
	$lsl_add , r0, r0, r1, 8
	$lw , r1, r22,  - 20
	$add , r1, r0, r1
	$lw , r0, r22,  - 16
	$lsl_add , r0, r0, r1, 3
	$sw , r22,  - 12, r0
	$lw , r0, r22,  - 12
	$jeq , r0, 0, .LBB23_10
	$jump , .LBB23_9
.LBB23_9:                               //   in Loop: Header=BB23_6 Depth=3
	$lw , r0, r22,  - 12
	$jneq , r0, 1, .LBB23_11
	$jump , .LBB23_10
.LBB23_10:                              //   in Loop: Header=BB23_6 Depth=3
	$jump , .LBB23_13
.LBB23_11:
	$lw , r0, r22,  - 16
	$move , r1, 1
	$lsl , r3, one, r0
	$lw , r1, r22,  - 20
	$move , r0, alloc_inode.bit_map
	$lbs , r2, r1, alloc_inode.bit_map
	$or , r2, r2, r3
	$sb , r1, alloc_inode.bit_map, r2
	$lw , r2, r22,  - 28
	$lsl , r1, r2, 4
	$lsl_add , r1, r1, r2, 7
	$lsl_add , r1, r1, r2, 8
	$add , r1, r1, 712800
	$move , r2, 400
	$call , r23, _mram_write
	$lw , r0, zero, mutex_mram
	$call , r23, mutex_unlock
	$lw , r0, r22,  - 12
	$sw , r22,  - 32, r0
	$jump , .LBB23_20
.LBB23_12:                              //   in Loop: Header=BB23_6 Depth=3
	$jump , .LBB23_13
.LBB23_13:                              //   in Loop: Header=BB23_6 Depth=3
	$lw , r0, r22,  - 16
	$add , r0, r0, 1
	$sw , r22,  - 16, r0
	$jump , .LBB23_6
.LBB23_14:                              //   in Loop: Header=BB23_3 Depth=2
	$jump , .LBB23_15
.LBB23_15:                              //   in Loop: Header=BB23_3 Depth=2
	$jump , .LBB23_16
.LBB23_16:                              //   in Loop: Header=BB23_3 Depth=2
	$lw , r0, r22,  - 20
	$add , r0, r0, 1
	$sw , r22,  - 20, r0
	$jump , .LBB23_3
.LBB23_17:                              //   in Loop: Header=BB23_1 Depth=1
	$jump , .LBB23_18
.LBB23_18:                              //   in Loop: Header=BB23_1 Depth=1
	$lw , r0, r22,  - 28
	$add , r0, r0, 1
	$sw , r22,  - 28, r0
	$jump , .LBB23_1
.LBB23_19:
	$lw , r0, zero, mutex_mram
	$call , r23, mutex_unlock
	$sw , r22,  - 32,  - 11
	$jump , .LBB23_20
.LBB23_20:
	$lw , r0, r22,  - 32
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end23:
	$size,	alloc_inode, .Lfunc_end23 - alloc_inode
	$section,	%stack_sizes,"o",@progbits,%text, alloc_inode
	$long,	.Lfunc_begin23
	$byte,	32
	$section,	%text, alloc_inode,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, find_inode,"ax",@progbits
	$globl,	find_inode                      //  -  -  Begin function find_inode
	$type,	find_inode,@function
find_inode:                             // @find_inode
.Lfunc_begin24:
// %bb.0:
	$sd , r22, 24, d22
	$add , r22, r22, 32
	$sw , r22,  - 28, r0
	$sw , r22,  - 24, r1
	$lhu , r0, r22,  - 22
	$sw , r22,  - 20, r0
	$lw , r0, zero, mutex_inode
	$call , r23, mutex_lock
	$sw , r22,  - 16, 0
	$jump , .LBB24_1
.LBB24_1:                               // =>This Inner Loop Header: Depth=1
	$lw , r0, r22,  - 16
	$jgts , r0, 3, .LBB24_20
	$jump , .LBB24_2
.LBB24_2:                               //   in Loop: Header=BB24_1 Depth=1
	$lw , r1, r22,  - 28
	$move , r0, inode_table
	$lsl_add , r0, r0, r1, 4
	$lw , r1, r22,  - 16
	$lsl_add , r0, r0, r1, 2
	$lhu , r0, r0, 0
	$jeq , r0, 0, .LBB24_7
	$jump , .LBB24_3
.LBB24_3:                               //   in Loop: Header=BB24_1 Depth=1
	$lw , r0, r22,  - 20
	$lw , r2, r22,  - 28
	$move , r1, inode_table
	$lsl_add , r1, r1, r2, 4
	$lw , r2, r22,  - 16
	$lsl_add , r1, r1, r2, 2
	$lhu , r1, r1, 2
	$jges , r0, r1, .LBB24_5
	$jump , .LBB24_4
.LBB24_4:
	$lw , r0, zero, mutex_inode
	$call , r23, mutex_unlock
	$lw , r1, r22,  - 28
	$move , r0, inode_table
	$lsl_add , r0, r0, r1, 4
	$lw , r1, r22,  - 16
	$lsl_add , r0, r0, r1, 2
	$lhu , r0, r0, 0
	$lw , r1, r22,  - 20
	$add , r0, r0, r1
	$sw , r22,  - 32, r0
	$jump , .LBB24_21
.LBB24_5:                               //   in Loop: Header=BB24_1 Depth=1
	$lw , r1, r22,  - 28
	$move , r0, inode_table
	$lsl_add , r0, r0, r1, 4
	$lw , r1, r22,  - 16
	$lsl_add , r0, r0, r1, 2
	$lhu , r1, r0, 2
	$lw , r0, r22,  - 20
	$sub , r0, r0, r1
	$sw , r22,  - 20, r0
	$jump , .LBB24_6
.LBB24_6:                               //   in Loop: Header=BB24_1 Depth=1
	$jump , .LBB24_18
.LBB24_7:
	$lw , r0, r22,  - 16
	$add , r0, r0,  - 1
	$sw , r22,  - 16, r0
	$jump , .LBB24_8
.LBB24_8:                               // =>This Inner Loop Header: Depth=1
	$call , r23, alloc_inode
	$sw , r22,  - 12, r0
	$lw , r0, r22,  - 12
	$jgts , r0,  - 1, .LBB24_10
	$jump , .LBB24_9
.LBB24_9:
	$lw , r0, zero, mutex_inode
	$call , r23, mutex_unlock
	$lw , r0, r22,  - 12
	$sw , r22,  - 32, r0
	$jump , .LBB24_21
.LBB24_10:                              //   in Loop: Header=BB24_8 Depth=1
	$lw , r0, r22,  - 12
	$lw , r2, r22,  - 28
	$move , r1, inode_table
	$lsl_add , r1, r1, r2, 4
	$lw , r2, r22,  - 16
	$lsl_add , r2, r1, r2, 2
	$lhu , r1, r2, 0
	$lhu , r2, r2, 2
	$add , r1, r1, r2
	$jneq , r0, r1, .LBB24_12
	$jump , .LBB24_11
.LBB24_11:                              //   in Loop: Header=BB24_8 Depth=1
	$lw , r1, r22,  - 28
	$move , r0, inode_table
	$lsl_add , r0, r0, r1, 4
	$lw , r1, r22,  - 16
	$lsl_add , r0, r0, r1, 2
	$lhs , r1, r0, 2
	$add , r1, r1, 1
	$sh , r0, 2, r1
	$jump , .LBB24_15
.LBB24_12:                              //   in Loop: Header=BB24_8 Depth=1
	$lw , r0, r22,  - 16
	$add , r0, r0, 1
	$sw , r22,  - 16, r0
	$lw , r0, r22,  - 16
	$jlts , r0, 4, .LBB24_14
	$jump , .LBB24_13
.LBB24_13:
	$move , r0, 4444
	$call , r23, printk_int
	$lw , r0, zero, mutex_inode
	$call , r23, mutex_unlock
	$call , r23, halt
.LBB24_14:                              //   in Loop: Header=BB24_8 Depth=1
	$lw , r2, r22,  - 12
	$lw , r1, r22,  - 28
	$move , r0, inode_table
	$lsl_add , r1, r0, r1, 4
	$lw , r3, r22,  - 16
	$lsl_add , r1, r1, r3, 2
	$sh , r1, 0, r2
	$lw , r1, r22,  - 28
	$lsl_add , r0, r0, r1, 4
	$lw , r1, r22,  - 16
	$lsl_add , r0, r0, r1, 2
	$sh , r0, 2, 1
	$jump , .LBB24_15
.LBB24_15:                              //   in Loop: Header=BB24_8 Depth=1
	$jump , .LBB24_16
.LBB24_16:                              //   in Loop: Header=BB24_8 Depth=1
	$lw , r0, r22,  - 20
	$add , r1, r0,  - 1
	$sw , r22,  - 20, r1
	$jneq , r0, 0, .LBB24_8
	$jump , .LBB24_17
.LBB24_17:
	$lw , r0, zero, mutex_inode
	$call , r23, mutex_unlock
	$lw , r0, r22,  - 12
	$sw , r22,  - 32, r0
	$jump , .LBB24_21
.LBB24_18:                              //   in Loop: Header=BB24_1 Depth=1
	$jump , .LBB24_19
.LBB24_19:                              //   in Loop: Header=BB24_1 Depth=1
	$lw , r0, r22,  - 16
	$add , r0, r0, 1
	$sw , r22,  - 16, r0
	$jump , .LBB24_1
.LBB24_20:
	$lw , r0, zero, mutex_inode
	$call , r23, mutex_unlock
	$sw , r22,  - 32,  - 54
	$jump , .LBB24_21
.LBB24_21:
	$lw , r0, r22,  - 32
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end24:
	$size,	find_inode, .Lfunc_end24 - find_inode
	$section,	%stack_sizes,"o",@progbits,%text, find_inode
	$long,	.Lfunc_begin24
	$byte,	32
	$section,	%text, find_inode,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, printk_int,"ax",@progbits
	$globl,	printk_int                      //  -  -  Begin function printk_int
	$type,	printk_int,@function
printk_int:                             // @printk_int
.Lfunc_begin25:
// %bb.0:
	$sd , r22, 16, d22
	$add , r22, r22, 24
	$sw , r22,  - 24, r0
	$lw , r0, zero, log_w
	$add , r0, r0, 8
	$move , r1, 65537
	$jltu , r0, r1, .LBB25_2
	$jump , .LBB25_1
.LBB25_1:
	$jump , .LBB25_3
.LBB25_2:
	$lw , r0, zero, mutex_printk
	$call , r23, mutex_lock
	$sw , r22,  - 16, 1
	$lw , r0, r22,  - 24
	$sw , r22,  - 12, r0
	$lw , r3, zero, log_w
	$add , r1, r22,  - 16
	$move , r2, 8
	$move , r4, 1
	$move , r0, r4
	$call , r23, inode_operation
	$lw , r0, zero, log_w
	$add , r0, r0, 8
	$sw , zero, log_w, r0
	$move , r0, 64
	$call , r23, set_flag
	$lw , r0, zero, mutex_printk
	$call , r23, mutex_unlock
	$jump , .LBB25_3
.LBB25_3:
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end25:
	$size,	printk_int, .Lfunc_end25 - printk_int
	$section,	%stack_sizes,"o",@progbits,%text, printk_int
	$long,	.Lfunc_begin25
	$byte,	24
	$section,	%text, printk_int,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, chained_inode_operation,"ax",@progbits
	$globl,	chained_inode_operation         //  -  -  Begin function chained_inode_operation
	$type,	chained_inode_operation,@function
chained_inode_operation:                // @chained_inode_operation
.Lfunc_begin26:
// %bb.0:
	$sd , r22, 48, d22
	$add , r22, r22, 56
	$sw , r22,  - 52, r0
	$sw , r22,  - 48, r1
	$sw , r22,  - 44, r2
	$sw , r22,  - 40, r3
	$lw , r0, r22,  - 48
	$move , r1, 65537
	$jltu , r0, r1, .LBB26_2
	$jump , .LBB26_1
.LBB26_1:
	$sw , r22,  - 56,  - 20
	$jump , .LBB26_23
.LBB26_2:
	$lhu , r0, r22,  - 44
	$sw , r22,  - 32, r0
	$lw , r0, r22,  - 32
	$sub , r0, 65536, r0
	$sw , r22,  - 28, r0
	$lw , r0, r22,  - 28
	$lw , r1, r22,  - 48
	$jleu , r0, r1, .LBB26_4
	$jump , .LBB26_3
.LBB26_3:
	$lw , r0, r22,  - 48
	$sw , r22,  - 16, r0
	$jump , .LBB26_5
.LBB26_4:
	$lw , r0, r22,  - 28
	$sw , r22,  - 16, r0
	$jump , .LBB26_5
.LBB26_5:
	$lw , r0, r22,  - 16
	$sw , r22,  - 24, r0
	$lhu , r0, r22,  - 42
	$sw , r22,  - 20, r0
	$lw , r0, r22,  - 20
	$lw , r2, zero, cur_process_index
	$move , r1, inode_table
	$lsl_add , r1, r1, r2, 4
	$lhu , r1, r1, 2
	$jges , r0, r1, .LBB26_7
	$jump , .LBB26_6
.LBB26_6:
	$lw , r0, zero, cur_process_index
	$lsl , r0, r0, 4
	$lhu , r0, r0, inode_table
	$lw , r1, r22,  - 20
	$add , r0, r0, r1
	$sw , r22,  - 36, r0
	$jump , .LBB26_8
.LBB26_7:
	$lw , r0, zero, cur_process_index
	$lw , r1, r22,  - 44
	$call , r23, find_inode
	$sw , r22,  - 36, r0
	$jump , .LBB26_8
.LBB26_8:
	$lw , r0, r22,  - 36
	$jgts , r0, 1023, .LBB26_10
	$jump , .LBB26_9
.LBB26_9:
	$lw , r0, r22,  - 36
	$jgts , r0,  - 1, .LBB26_11
	$jump , .LBB26_10
.LBB26_10:
	$sw , r22,  - 56,  - 11
	$jump , .LBB26_23
.LBB26_11:
	$lw , r0, r22,  - 36
	$lw , r1, r22,  - 52
	$lw , r2, r22,  - 24
	$lw , r3, r22,  - 32
	$lw , r4, r22,  - 40
	$call , r23, inode_operation
	$sw , r22,  - 36, r0
	$jgts , r0,  - 1, .LBB26_13
	$jump , .LBB26_12
.LBB26_12:
	$lw , r0, r22,  - 36
	$sw , r22,  - 56, r0
	$jump , .LBB26_23
.LBB26_13:
	$lw , r1, r22,  - 24
	$lw , r0, r22,  - 48
	$sub , r0, r0, r1
	$sw , r22,  - 48, r0
	$lw , r0, r22,  - 48
	$jneq , r0, 0, .LBB26_15
	$jump , .LBB26_14
.LBB26_14:
	$sw , r22,  - 56, 0
	$jump , .LBB26_23
.LBB26_15:
	$lw , r1, r22,  - 24
	$lw , r0, r22,  - 44
	$add , r0, r0, r1
	$sw , r22,  - 44, r0
	$lw , r1, r22,  - 24
	$lw , r0, r22,  - 52
	$add , r0, r0, r1
	$sw , r22,  - 52, r0
	$lw , r0, zero, cur_process_index
	$lw , r1, r22,  - 44
	$call , r23, find_inode
	$sw , r22,  - 36, r0
	$jgts , r0,  - 1, .LBB26_17
	$jump , .LBB26_16
.LBB26_16:
	$lw , r0, r22,  - 36
	$sw , r22,  - 56, r0
	$jump , .LBB26_23
.LBB26_17:
	$lw , r0, r22,  - 36
	$jgts , r0, 1023, .LBB26_19
	$jump , .LBB26_18
.LBB26_18:
	$lw , r0, r22,  - 36
	$jgts , r0,  - 1, .LBB26_20
	$jump , .LBB26_19
.LBB26_19:
	$sw , r22,  - 56,  - 11
	$jump , .LBB26_23
.LBB26_20:
	$lw , r0, r22,  - 36
	$lw , r1, r22,  - 52
	$lw , r2, r22,  - 48
	$lw , r4, r22,  - 40
	$move , r3, 0
	$call , r23, inode_operation
	$sw , r22,  - 36, r0
	$jgts , r0,  - 1, .LBB26_22
	$jump , .LBB26_21
.LBB26_21:
	$lw , r0, r22,  - 36
	$sw , r22,  - 56, r0
	$jump , .LBB26_23
.LBB26_22:
	$sw , r22,  - 56, 0
	$jump , .LBB26_23
.LBB26_23:
	$lw , r0, r22,  - 56
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end26:
	$size,	chained_inode_operation, .Lfunc_end26 - chained_inode_operation
	$section,	%stack_sizes,"o",@progbits,%text, chained_inode_operation
	$long,	.Lfunc_begin26
	$byte,	56
	$section,	%text, chained_inode_operation,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, free_inode,"ax",@progbits
	$globl,	free_inode                      //  -  -  Begin function free_inode
	$type,	free_inode,@function
free_inode:                             // @free_inode
.Lfunc_begin27:
// %bb.0:
	$sd , r22, 8, d22
	$add , r22, r22, 16
	$sw , r22,  - 16, r0
	$move , r0, 75698
	$call , r23, printk_int
	$call , r23, halt
.Lfunc_end27:
	$size,	free_inode, .Lfunc_end27 - free_inode
	$section,	%stack_sizes,"o",@progbits,%text, free_inode
	$long,	.Lfunc_begin27
	$byte,	16
	$section,	%text, free_inode,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, wakeup_sleepy_socket,"ax",@progbits
	$globl,	wakeup_sleepy_socket            //  -  -  Begin function wakeup_sleepy_socket
	$type,	wakeup_sleepy_socket,@function
wakeup_sleepy_socket:                   // @wakeup_sleepy_socket
.Lfunc_begin28:
// %bb.0:
	$sd , r22, 8, d22
	$add , r22, r22, 16
	$sw , r22,  - 16, 0
	$jump , .LBB28_1
.LBB28_1:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB28_3 Depth 2
	$lw , r0, r22,  - 16
	$jgtu , r0, 9, .LBB28_10
	$jump , .LBB28_2
.LBB28_2:                               //   in Loop: Header=BB28_1 Depth=1
	$sw , r22,  - 12, 0
	$jump , .LBB28_3
.LBB28_3:                               //   Parent Loop BB28_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	$lw , r0, r22,  - 12
	$jgtu , r0, 2, .LBB28_8
	$jump , .LBB28_4
.LBB28_4:                               //   in Loop: Header=BB28_3 Depth=2
	$lw , r1, r22,  - 16
	$lsl , r0, r1, 4
	$lsl_add , r1, r0, r1, 6
	$move , r0, processs
	$add , r0, r0, r1
	$lw , r1, r22,  - 12
	$lsl_add , r0, r0, r1, 3
	$lbu , r0, r0, 60
	$and , r0, r0, 32
	$jeq , r0, 0, .LBB28_6
	$jump , .LBB28_5
.LBB28_5:                               //   in Loop: Header=BB28_3 Depth=2
	$lw , r1, r22,  - 16
	$lsl , r0, r1, 4
	$lsl_add , r1, r0, r1, 6
	$move , r0, processs
	$add , r1, r0, r1
	$lw , r2, r22,  - 12
	$lsl_add , r1, r1, r2, 3
	$lw , r2, r1, 60
	$and , r2, r2,  - 33
	$sw , r1, 60, r2
	$lw , r2, r22,  - 16
	$lsl , r1, r2, 4
	$lsl_add , r1, r1, r2, 6
	$add , r0, r0, r1
	$lw , r1, r22,  - 12
	$lsl_add , r0, r0, r1, 3
	$add , r0, r0, 56
	$move , r2, 0
	$move , r1, r2
	$call , r23, wakeup
	$jump , .LBB28_6
.LBB28_6:                               //   in Loop: Header=BB28_3 Depth=2
	$jump , .LBB28_7
.LBB28_7:                               //   in Loop: Header=BB28_3 Depth=2
	$lw , r0, r22,  - 12
	$add , r0, r0, 1
	$sw , r22,  - 12, r0
	$jump , .LBB28_3
.LBB28_8:                               //   in Loop: Header=BB28_1 Depth=1
	$jump , .LBB28_9
.LBB28_9:                               //   in Loop: Header=BB28_1 Depth=1
	$lw , r0, r22,  - 16
	$add , r0, r0, 1
	$sw , r22,  - 16, r0
	$jump , .LBB28_1
.LBB28_10:
	$move , r0, 0
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end28:
	$size,	wakeup_sleepy_socket, .Lfunc_end28 - wakeup_sleepy_socket
	$section,	%stack_sizes,"o",@progbits,%text, wakeup_sleepy_socket
	$long,	.Lfunc_begin28
	$byte,	16
	$section,	%text, wakeup_sleepy_socket,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, socket_open,"ax",@progbits
	$globl,	socket_open                     //  -  -  Begin function socket_open
	$type,	socket_open,@function
socket_open:                            // @socket_open
.Lfunc_begin29:
// %bb.0:
	$sd , r22, 56, d22
	$add , r22, r22, 64
	$sw , r22,  - 60, r0
	$lw , r0, zero, mutex_sockets
	$call , r23, mutex_lock
	$lw , r1, zero, cur_process_index
	$lsl , r0, r1, 4
	$lsl_add , r1, r0, r1, 6
	$move , r0, processs
	$add , r0, r0, r1
	$sw , r22,  - 56, r0
	$sw , r22,  - 52, 0
	$jump , .LBB29_1
.LBB29_1:                               // =>This Inner Loop Header: Depth=1
	$lw , r0, r22,  - 52
	$jgtu , r0, 2, .LBB29_12
	$jump , .LBB29_2
.LBB29_2:                               //   in Loop: Header=BB29_1 Depth=1
	$lw , r0, r22,  - 56
	$lw , r1, r22,  - 52
	$lsl_add , r0, r0, r1, 3
	$lw , r0, r0, 56
	$jneq , r0, 0, .LBB29_10
	$jump , .LBB29_3
.LBB29_3:
	$call , r23, alloc_inode
	$sw , r22,  - 48, r0
	$lw , r0, r22,  - 48
	$jgtu , r0, 1, .LBB29_5
	$jump , .LBB29_4
.LBB29_4:
	$lw , r0, zero, mutex_sockets
	$call , r23, mutex_unlock
	$sw , r22,  - 64,  - 11
	$jump , .LBB29_13
.LBB29_5:
	$lw , r1, r22,  - 48
	$lw , r0, r22,  - 56
	$lw , r2, r22,  - 52
	$lsl_add , r0, r0, r2, 3
	$sw , r0, 56, r1
	$lw , r0, r22,  - 56
	$lw , r1, r22,  - 52
	$lsl_add , r0, r0, r1, 3
	$sw , r0, 60, 5
	$move , r0, 16
	$sw , r22,  - 16, r0
	$call , r23, set_flag
	$lw , r2, r22,  - 16
	$sd , r22,  - 32, 0
	$sd , r22,  - 40, 0
	$lw , r0, r22,  - 60
	$sw , r22,  - 24, r0
	$sw , r22,  - 20, 0
	$lw , r0, r22,  - 48
	$add , r1, r22,  - 40
	$move , r3, 0
	$move , r4, 1
	$call , r23, inode_operation
	$jeq , r0, 0, .LBB29_7
	$jump , .LBB29_6
.LBB29_6:
	$call , r23, halt
.LBB29_7:
	$lw , r0, r22,  - 48
	$add , r1, r22,  - 24
	$move , r2, 8
	$move , r3, 16
	$move , r4, 1
	$call , r23, inode_operation
	$jeq , r0, 0, .LBB29_9
	$jump , .LBB29_8
.LBB29_8:
	$call , r23, halt
.LBB29_9:
	$lw , r0, zero, mutex_sockets
	$call , r23, mutex_unlock
	$lw , r0, r22,  - 52
	$sw , r22,  - 64, r0
	$jump , .LBB29_13
.LBB29_10:                              //   in Loop: Header=BB29_1 Depth=1
	$jump , .LBB29_11
.LBB29_11:                              //   in Loop: Header=BB29_1 Depth=1
	$lw , r0, r22,  - 52
	$add , r0, r0, 1
	$sw , r22,  - 52, r0
	$jump , .LBB29_1
.LBB29_12:
	$lw , r0, zero, mutex_sockets
	$call , r23, mutex_unlock
	$sw , r22,  - 64,  - 7
	$jump , .LBB29_13
.LBB29_13:
	$lw , r0, r22,  - 64
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end29:
	$size,	socket_open, .Lfunc_end29 - socket_open
	$section,	%stack_sizes,"o",@progbits,%text, socket_open
	$long,	.Lfunc_begin29
	$byte,	64
	$section,	%text, socket_open,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, set_flag,"ax",@progbits
	$globl,	set_flag                        //  -  -  Begin function set_flag
	$type,	set_flag,@function
set_flag:                               // @set_flag
.Lfunc_begin30:
// %bb.0:
	$sd , r22, 40, d22
	$add , r22, r22, 48
	$sw , r22,  - 48, r0
	$lw , r0, zero, mutex_flag
	$call , r23, mutex_lock
	$move , r0, 651264
	$sw , r22,  - 20, r0
	$add , r1, r22,  - 40
	$sw , r22,  - 16, r1
	$move , r2, 16
	$sw , r22,  - 24, r2
	$call , r23, _mram_read
	$lw , r0, r22,  - 16
	$lw , r1, r22,  - 20
	$lw , r2, r22,  - 24
	$lw , r3, r22,  - 32
	$lw , r4, r22,  - 48
	$or , r3, r3, r4
	$sw , r22,  - 32, r3
	$call , r23, _mram_write
	$lw , r0, zero, mutex_flag
	$call , r23, mutex_unlock
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end30:
	$size,	set_flag, .Lfunc_end30 - set_flag
	$section,	%stack_sizes,"o",@progbits,%text, set_flag
	$long,	.Lfunc_begin30
	$byte,	48
	$section,	%text, set_flag,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, check_sd,"ax",@progbits
	$globl,	check_sd                        //  -  -  Begin function check_sd
	$type,	check_sd,@function
check_sd:                               // @check_sd
.Lfunc_begin31:
// %bb.0:
	$sw , r22, 4, r0
	$lw , r0, r22, 4
	$jgtu , r0, 3, .LBB31_2
	$jump , .LBB31_1
.LBB31_1:
	$lw , r1, zero, cur_process_index
	$lsl , r0, r1, 4
	$lsl_add , r1, r0, r1, 6
	$move , r0, processs
	$add , r0, r0, r1
	$lw , r1, r22, 4
	$lsl_add , r0, r0, r1, 3
	$lw , r0, r0, 56
	$jneq , r0, 0, .LBB31_3
	$jump , .LBB31_2
.LBB31_2:
	$sw , r22, 0,  - 8
	$jump , .LBB31_4
.LBB31_3:
	$sw , r22, 0, 0
	$jump , .LBB31_4
.LBB31_4:
	$lw , r0, r22, 0
	$jump , r23
.Lfunc_end31:
	$size,	check_sd, .Lfunc_end31 - check_sd
	$section,	%stack_sizes,"o",@progbits,%text, check_sd
	$long,	.Lfunc_begin31
	$byte,	8
	$section,	%text, check_sd,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, socket_close,"ax",@progbits
	$globl,	socket_close                    //  -  -  Begin function socket_close
	$type,	socket_close,@function
socket_close:                           // @socket_close
.Lfunc_begin32:
// %bb.0:
	$sd , r22, 16, d22
	$add , r22, r22, 24
	$sw , r22,  - 24, r0
	$lw , r0, zero, mutex_sockets
	$call , r23, mutex_lock
	$lw , r0, r22,  - 24
	$call , r23, check_sd
	$sw , r22,  - 20, r0
	$lw , r0, r22,  - 20
	$jeq , r0, 0, .LBB32_2
	$jump , .LBB32_1
.LBB32_1:
	$jump , .LBB32_3
.LBB32_2:
	$lw , r1, zero, cur_process_index
	$lsl , r0, r1, 4
	$lsl_add , r1, r0, r1, 6
	$move , r0, processs
	$sw , r22,  - 16, r0
	$add , r0, r0, r1
	$lw , r1, r22,  - 24
	$lsl_add , r0, r0, r1, 3
	$lw , r0, r0, 56
	$call , r23, free_inode
	$lw , r0, r22,  - 16
	$lw , r2, zero, cur_process_index
	$lsl , r1, r2, 4
	$lsl_add , r1, r1, r2, 6
	$add , r0, r0, r1
	$lw , r1, r22,  - 24
	$lsl_add , r0, r0, r1, 3
	$sw , r0, 56, 0
	$jump , .LBB32_3
.LBB32_3:
	$lw , r0, zero, mutex_sockets
	$call , r23, mutex_unlock
	$lw , r0, r22,  - 20
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end32:
	$size,	socket_close, .Lfunc_end32 - socket_close
	$section,	%stack_sizes,"o",@progbits,%text, socket_close
	$long,	.Lfunc_begin32
	$byte,	24
	$section,	%text, socket_close,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, socket_read,"ax",@progbits
	$globl,	socket_read                     //  -  -  Begin function socket_read
	$type,	socket_read,@function
socket_read:                            // @socket_read
.Lfunc_begin33:
// %bb.0:
	$sd , r22, 88, d22
	$add , r22, r22, 96
	$sw , r22,  - 96, r0
	$sw , r22,  - 92, r1
	$sw , r22,  - 88, r2
	$lw , r0, r22,  - 92
	$sw , r22,  - 84, r0
	$lw , r0, zero, mutex_sockets
	$call , r23, mutex_lock
	$lw , r0, r22,  - 96
	$call , r23, check_sd
	$sw , r22,  - 80, r0
	$lw , r0, r22,  - 80
	$jeq , r0, 0, .LBB33_2
	$jump , .LBB33_1
.LBB33_1:
	$jump , .LBB33_22
.LBB33_2:
	$lw , r1, zero, cur_process_index
	$lsl , r0, r1, 4
	$lsl_add , r1, r0, r1, 6
	$move , r0, processs
	$add , r0, r0, r1
	$lw , r1, r22,  - 96
	$lsl_add , r0, r0, r1, 3
	$lw , r0, r0, 56
	$sw , r22,  - 76, r0
	$lw , r0, r22,  - 76
	$add , r1, r22,  - 72
	$move , r2, 16
	$move , r4, 0
	$move , r3, r4
	$call , r23, inode_operation
	$jeq , r0, 0, .LBB33_4
	$jump , .LBB33_3
.LBB33_3:
	$call , r23, halt
.LBB33_4:
	$jump , .LBB33_5
.LBB33_5:                               // =>This Inner Loop Header: Depth=1
	$lw , r0, r22,  - 64
	$lw , r1, r22,  - 68
	$jltu , r0, r1, .LBB33_7
	$jump , .LBB33_6
.LBB33_6:                               //   in Loop: Header=BB33_5 Depth=1
	$lw , r0, r22,  - 64
	$lw , r1, r22,  - 68
	$sub , r0, r0, r1
	$lw , r1, r22,  - 88
	$move , r2, 1
	$sw , r22,  - 32, r2
	$jltu , r0, r1, .LBB33_10
	$jump , .LBB33_7
.LBB33_7:                               //   in Loop: Header=BB33_5 Depth=1
	$lw , r0, r22,  - 64
	$lw , r1, r22,  - 68
	$move , r2, 0
	$sw , r22,  - 28, r2
	$jgeu , r0, r1, .LBB33_9
	$jump , .LBB33_8
.LBB33_8:                               //   in Loop: Header=BB33_5 Depth=1
	$lw , r1, r22,  - 68
	$lw , r0, r22,  - 64
	$sub , r0, r0, r1
	$add , r0, r0, 16384
	$lw , r1, r22,  - 88
	$sub , r0, r0, r1, ltu
	$sw , r22,  - 28, r0
	$jump , .LBB33_9
.LBB33_9:                               //   in Loop: Header=BB33_5 Depth=1
	$lw , r0, r22,  - 28
	$sw , r22,  - 32, r0
	$jump , .LBB33_10
.LBB33_10:                              //   in Loop: Header=BB33_5 Depth=1
	$lw , r0, r22,  - 32
	$and , r0, r0, 1
	$jeq , r0, 0, .LBB33_14
	$jump , .LBB33_11
.LBB33_11:                              //   in Loop: Header=BB33_5 Depth=1
	$lw , r1, zero, cur_process_index
	$lsl , r0, r1, 4
	$lsl_add , r1, r0, r1, 6
	$move , r0, processs
	$add , r0, r0, r1
	$lw , r1, r22,  - 96
	$lsl_add , r0, r0, r1, 3
	$add , r0, r0, 56
	$lw , r2, zero, mutex_sockets
	$move , r1, 0
	$sw , r22,  - 24, r1
	$call , r23, sleep
	$lw , r4, r22,  - 24
	$lw , r0, r22,  - 76
	$add , r1, r22,  - 72
	$move , r2, 16
	$move , r3, r4
	$call , r23, inode_operation
	$jeq , r0, 0, .LBB33_13
	$jump , .LBB33_12
.LBB33_12:
	$call , r23, halt
.LBB33_13:                              //   in Loop: Header=BB33_5 Depth=1
	$jump , .LBB33_5
.LBB33_14:
	$lw , r0, r22,  - 68
	$lw , r1, r22,  - 88
	$add , r0, r0, r1
	$and , r0, r0,  - 8
	$add , r0, r0, 8
	$sw , r22,  - 56, r0
	$lw , r0, r22,  - 68
	$and , r0, r0,  - 8
	$add , r0, r0, 16
	$sw , r22,  - 52, r0
	$lw , r0, r22,  - 52
	$lw , r1, r22,  - 56
	$add , r0, r0, r1
	$move , r1, 16384
	$jgtu , r0, r1, .LBB33_16
	$jump , .LBB33_15
.LBB33_15:
	$lw , r0, r22,  - 76
	$lw , r2, r22,  - 56
	$lw , r3, r22,  - 52
	$move , r1, buf_socket
	$move , r4, 0
	$call , r23, inode_operation
	$jump , .LBB33_17
.LBB33_16:
	$lw , r0, r22,  - 52
	$sub , r0, 16384, r0
	$sw , r22,  - 48, r0
	$lw , r0, r22,  - 56
	$lw , r1, r22,  - 48
	$sub , r0, r0, r1
	$sw , r22,  - 44, r0
	$lw , r0, r22,  - 76
	$lw , r2, r22,  - 48
	$lw , r3, r22,  - 52
	$move , r1, buf_socket
	$sw , r22,  - 16, r1
	$move , r4, 0
	$sw , r22,  - 20, r4
	$call , r23, inode_operation
	$lw , r1, r22,  - 16
	$lw , r4, r22,  - 20
	$lw , r0, r22,  - 76
	$lw , r2, r22,  - 48
	$add , r1, r1, r2
	$lw , r2, r22,  - 44
	$move , r3, 16
	$call , r23, inode_operation
	$jump , .LBB33_17
.LBB33_17:
	$lw , r0, r22,  - 68
	$and , r0, r0, 7
	$sb , r22,  - 40, r0
	$sw , r22,  - 36, 0
	$jump , .LBB33_18
.LBB33_18:                              // =>This Inner Loop Header: Depth=1
	$lw , r0, r22,  - 36
	$lw , r1, r22,  - 88
	$jgeu , r0, r1, .LBB33_21
	$jump , .LBB33_19
.LBB33_19:                              //   in Loop: Header=BB33_18 Depth=1
	$lw , r2, r22,  - 36
	$lbu , r0, r22,  - 40
	$add , r0, r2, r0
	$lbs , r1, r0, buf_socket
	$lw , r0, r22,  - 84
	$add , r0, r0, r2
	$sb , r0, 0, r1
	$jump , .LBB33_20
.LBB33_20:                              //   in Loop: Header=BB33_18 Depth=1
	$lw , r0, r22,  - 36
	$add , r0, r0, 1
	$sw , r22,  - 36, r0
	$jump , .LBB33_18
.LBB33_21:
	$lw , r0, r22,  - 68
	$lw , r1, r22,  - 88
	$add , r0, r0, r1
	$and , r0, r0, 16383
	$sw , r22,  - 68, r0
	$lw , r0, r22,  - 76
	$add , r1, r22,  - 72
	$move , r2, 16
	$move , r3, 0
	$move , r4, 1
	$call , r23, inode_operation
	$jump , .LBB33_22
.LBB33_22:
	$lw , r0, zero, mutex_sockets
	$call , r23, mutex_unlock
	$lw , r0, r22,  - 80
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end33:
	$size,	socket_read, .Lfunc_end33 - socket_read
	$section,	%stack_sizes,"o",@progbits,%text, socket_read
	$long,	.Lfunc_begin33
	$byte,	96
	$section,	%text, socket_read,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, socket_write,"ax",@progbits
	$globl,	socket_write                    //  -  -  Begin function socket_write
	$type,	socket_write,@function
socket_write:                           // @socket_write
.Lfunc_begin34:
// %bb.0:
	$sd , r22, 72, d22
	$add , r22, r22, 80
	$sw , r22,  - 76, r0
	$sw , r22,  - 72, r1
	$sw , r22,  - 68, r2
	$lw , r0, r22,  - 72
	$sw , r22,  - 64, r0
	$lw , r0, r22,  - 68
	$jltu , r0, 265, .LBB34_2
	$jump , .LBB34_1
.LBB34_1:
	$sw , r22,  - 80,  - 20
	$jump , .LBB34_19
.LBB34_2:
	$lw , r0, zero, mutex_sockets
	$call , r23, mutex_lock
	$lw , r0, r22,  - 76
	$call , r23, check_sd
	$sw , r22,  - 60, r0
	$lw , r0, r22,  - 60
	$jeq , r0, 0, .LBB34_4
	$jump , .LBB34_3
.LBB34_3:
	$jump , .LBB34_18
.LBB34_4:
	$lw , r1, zero, cur_process_index
	$lsl , r0, r1, 4
	$lsl_add , r1, r0, r1, 6
	$move , r0, processs
	$add , r0, r0, r1
	$lw , r1, r22,  - 76
	$lsl_add , r0, r0, r1, 3
	$lw , r0, r0, 56
	$sw , r22,  - 56, r0
	$lw , r0, r22,  - 56
	$add , r1, r22,  - 48
	$move , r2, 16
	$move , r4, 0
	$move , r3, r4
	$call , r23, inode_operation
	$jeq , r0, 0, .LBB34_6
	$jump , .LBB34_5
.LBB34_5:
	$call , r23, halt
.LBB34_6:
	$jump , .LBB34_7
.LBB34_7:                               // =>This Inner Loop Header: Depth=1
	$lw , r0, r22,  - 48
	$lw , r1, r22,  - 68
	$add , r0, r0, r1
	$lsr , r0, r0, 14
	$jeq , r0, 0, .LBB34_11
	$jump , .LBB34_8
.LBB34_8:                               //   in Loop: Header=BB34_7 Depth=1
	$lw , r1, zero, cur_process_index
	$lsl , r0, r1, 4
	$lsl_add , r1, r0, r1, 6
	$move , r0, processs
	$add , r0, r0, r1
	$lw , r1, r22,  - 76
	$lsl_add , r0, r0, r1, 3
	$add , r0, r0, 56
	$lw , r2, zero, mutex_sockets
	$move , r1, 0
	$sw , r22,  - 20, r1
	$call , r23, sleep
	$lw , r4, r22,  - 20
	$lw , r0, r22,  - 56
	$add , r1, r22,  - 48
	$move , r2, 16
	$move , r3, r4
	$call , r23, inode_operation
	$jeq , r0, 0, .LBB34_10
	$jump , .LBB34_9
.LBB34_9:
	$call , r23, halt
.LBB34_10:                              //   in Loop: Header=BB34_7 Depth=1
	$jump , .LBB34_7
.LBB34_11:
	$lbu , r0, r22,  - 48
	$and , r0, r0, 7
	$jeq , r0, 0, .LBB34_13
	$jump , .LBB34_12
.LBB34_12:
	$lw , r0, r22,  - 56
	$lw , r1, r22,  - 48
	$and , r1, r1,  - 8
	$add , r3, r1, 16400
	$move , r1, buf_socket
	$move , r2, 8
	$move , r4, 0
	$call , r23, inode_operation
	$jump , .LBB34_13
.LBB34_13:
	$lw , r0, r22,  - 48
	$and , r0, r0, 7
	$sb , r22,  - 32, r0
	$sw , r22,  - 28, 0
	$jump , .LBB34_14
.LBB34_14:                              // =>This Inner Loop Header: Depth=1
	$lw , r0, r22,  - 28
	$lw , r1, r22,  - 68
	$jgeu , r0, r1, .LBB34_17
	$jump , .LBB34_15
.LBB34_15:                              //   in Loop: Header=BB34_14 Depth=1
	$lw , r1, r22,  - 64
	$lw , r0, r22,  - 28
	$add , r1, r1, r0
	$lbs , r1, r1, 0
	$lbu , r2, r22,  - 32
	$add , r0, r0, r2
	$sb , r0, buf_socket, r1
	$jump , .LBB34_16
.LBB34_16:                              //   in Loop: Header=BB34_14 Depth=1
	$lw , r0, r22,  - 28
	$add , r0, r0, 1
	$sw , r22,  - 28, r0
	$jump , .LBB34_14
.LBB34_17:
	$lw , r0, r22,  - 48
	$lw , r1, r22,  - 68
	$add , r0, r0, r1
	$and , r0, r0,  - 8
	$add , r0, r0, 8
	$sw , r22,  - 24, r0
	$lw , r0, r22,  - 56
	$lw , r2, r22,  - 24
	$lw , r1, r22,  - 48
	$and , r1, r1,  - 8
	$add , r3, r1, 16400
	$move , r1, buf_socket
	$move , r4, 1
	$sw , r22,  - 16, r4
	$call , r23, inode_operation
	$lw , r4, r22,  - 16
	$lw , r1, r22,  - 68
	$lw , r0, r22,  - 48
	$add , r0, r0, r1
	$sw , r22,  - 48, r0
	$lw , r0, r22,  - 56
	$add , r1, r22,  - 48
	$move , r2, 16
	$move , r3, 0
	$call , r23, inode_operation
	$lw , r1, zero, cur_process_index
	$lsl , r0, r1, 4
	$lsl_add , r1, r0, r1, 6
	$move , r0, processs
	$add , r0, r0, r1
	$lw , r1, r22,  - 76
	$lsl_add , r0, r0, r1, 3
	$lw , r1, r0, 60
	$or , r1, r1, 64
	$sw , r0, 60, r1
	$move , r0, 8
	$call , r23, set_flag
	$jump , .LBB34_18
.LBB34_18:
	$lw , r0, zero, mutex_sockets
	$call , r23, mutex_unlock
	$lw , r0, r22,  - 60
	$sw , r22,  - 80, r0
	$jump , .LBB34_19
.LBB34_19:
	$lw , r0, r22,  - 80
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end34:
	$size,	socket_write, .Lfunc_end34 - socket_write
	$section,	%stack_sizes,"o",@progbits,%text, socket_write
	$long,	.Lfunc_begin34
	$byte,	80
	$section,	%text, socket_write,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, syscall,"ax",@progbits
	$globl,	syscall                         //  -  -  Begin function syscall
	$type,	syscall,@function
syscall:                                // @syscall
.Lfunc_begin35:
// %bb.0:
	$sd , r22, 40, d22
	$add , r22, r22, 48
	$sw , r22,  - 44, r0
	$sw , r22,  - 40, r1
	$sw , r22,  - 36, r2
	$sw , r22,  - 32, r3
	$sw , r22,  - 28, r4
	$lw , r0, r22,  - 28
	$jneq , r0, 0, .LBB35_2
	$jump , .LBB35_1
.LBB35_1:
	$sw , r22,  - 48, 0
	$jump , .LBB35_56
.LBB35_2:
	$sw , r22,  - 24, 0
	$call , r23, me
	$lbs , r0, r0, cur_jobs
	$sb , r22,  - 20, r0
	// inline asm
	$time , r0
	// inline asm
	$sw , r22,  - 24, r0
	$lw , r0, r22,  - 24
	$lbu , r2, r22,  - 20
	$lsl , r1, r2, 2
	$lsl_add , r2, r1, r2, 4
	$move , r1, jobs
	$add , r1, r1, r2
	$lw , r1, r1, 12
	$sub , r0, r0, r1
	$move , r1, 2501
	$jltu , r0, r1, .LBB35_4
	$jump , .LBB35_3
.LBB35_3:
	$lbu , r1, r22,  - 20
	$lsl , r0, r1, 2
	$lsl_add , r0, r0, r1, 4
	$move , r1, 3
	$sb , r0, jobs, r1
	$call , r23, swap_scheduler
	$jump , .LBB35_4
.LBB35_4:
	$lw , r0, r22,  - 28
	$jneq , r0, 24, .LBB35_6
	$jump , .LBB35_5
.LBB35_5:
	$lw , r0, r22,  - 44
	$call , r23, try_lock
	$sw , r22,  - 48, r0
	$jump , .LBB35_56
.LBB35_6:
	$lw , r0, r22,  - 28
	$jeq , r0, 22, .LBB35_8
	$jump , .LBB35_7
.LBB35_7:
	$lw , r0, r22,  - 28
	$jneq , r0, 23, .LBB35_15
	$jump , .LBB35_8
.LBB35_8:
	$lw , r0, r22,  - 44
	$jneq , r0, 0, .LBB35_10
	$jump , .LBB35_9
.LBB35_9:
	$sw , r22,  - 48, 0
	$jump , .LBB35_56
.LBB35_10:
	$lbu , r0, r22,  - 40
	$and , r0, r0, 7
	$jeq , r0, 0, .LBB35_12
	$jump , .LBB35_11
.LBB35_11:
	$sw , r22,  - 48,  - 19
	$jump , .LBB35_56
.LBB35_12:
	$lbu , r0, r22,  - 36
	$and , r0, r0, 7
	$jeq , r0, 0, .LBB35_14
	$jump , .LBB35_13
.LBB35_13:
	$sw , r22,  - 48,  - 21
	$jump , .LBB35_56
.LBB35_14:
	$lw , r0, r22,  - 44
	$lw , r1, r22,  - 40
	$lw , r2, r22,  - 36
	$lw , r3, r22,  - 28
	$move , r4, 22
	$sub , r3, r3, r4, neq
	$call , r23, chained_inode_operation
	$sw , r22,  - 48, r0
	$jump , .LBB35_56
.LBB35_15:
	$lw , r0, r22,  - 28
	$jneq , r0, 15, .LBB35_17
	$jump , .LBB35_16
.LBB35_16:
	$lw , r0, r22,  - 44
	$call , r23, lock
	$sw , r22,  - 48, r0
	$jump , .LBB35_56
.LBB35_17:
	$lw , r0, r22,  - 28
	$jneq , r0, 16, .LBB35_19
	$jump , .LBB35_18
.LBB35_18:
	$lw , r0, r22,  - 44
	$call , r23, unlock
	$sw , r22,  - 48, r0
	$jump , .LBB35_56
.LBB35_19:
	$lw , r0, r22,  - 28
	$jneq , r0, 17, .LBB35_21
	$jump , .LBB35_20
.LBB35_20:
	$lw , r0, r22,  - 44
	$lw , r1, r22,  - 40
	$move , r2, 0
	$call , r23, sleep
	$sw , r22,  - 48, r0
	$jump , .LBB35_56
.LBB35_21:
	$lw , r0, r22,  - 28
	$jneq , r0, 18, .LBB35_23
	$jump , .LBB35_22
.LBB35_22:
	$lw , r0, r22,  - 44
	$move , r2, 1
	$move , r1, r2
	$call , r23, wakeup
	$sw , r22,  - 48, r0
	$jump , .LBB35_56
.LBB35_23:
	$lw , r0, r22,  - 28
	$jneq , r0, 14, .LBB35_25
	$jump , .LBB35_24
.LBB35_24:
	$lw , r0, r22,  - 44
	$sw , r22,  - 16, r0
	$lw , r0, r22,  - 16
	$sw , r0, 0,  - 1
	$sw , r22,  - 48, 0
	$jump , .LBB35_56
.LBB35_25:
	$lw , r0, r22,  - 28
	$jneq , r0, 1, .LBB35_27
	$jump , .LBB35_26
.LBB35_26:
	$sw , r22,  - 48, 0
	$jump , .LBB35_56
.LBB35_27:
	$lw , r0, r22,  - 28
	$jneq , r0, 2, .LBB35_29
	$jump , .LBB35_28
.LBB35_28:
	$lw , r0, r22,  - 44
	$call , r23, sbrk
	$sw , r22,  - 48, r0
	$jump , .LBB35_56
.LBB35_29:
	$lw , r0, r22,  - 28
	$jneq , r0, 3, .LBB35_31
	$jump , .LBB35_30
.LBB35_30:
	$lw , r1, zero, cur_process_index
	$lsl , r0, r1, 4
	$lsl_add , r1, r0, r1, 6
	$move , r0, processs
	$add , r0, r0, r1
	$lw , r0, r0, 4
	$sw , r22,  - 48, r0
	$jump , .LBB35_56
.LBB35_31:
	$lw , r0, r22,  - 28
	$jneq , r0, 4, .LBB35_33
	$jump , .LBB35_32
.LBB35_32:
	$lw , r1, zero, cur_process_index
	$lsl , r0, r1, 4
	$lsl_add , r1, r0, r1, 6
	$move , r0, processs
	$add , r0, r0, r1
	$lbu , r0, r0, 1
	$sw , r22,  - 48, r0
	$jump , .LBB35_56
.LBB35_33:
	$lw , r0, r22,  - 28
	$jneq , r0, 5, .LBB35_35
	$jump , .LBB35_34
.LBB35_34:
	$lw , r1, zero, cur_process_index
	$lsl , r0, r1, 4
	$lsl_add , r0, r0, r1, 6
	$lbu , r0, r0, processs
	$sw , r22,  - 48, r0
	$jump , .LBB35_56
.LBB35_35:
	$lw , r0, r22,  - 28
	$jneq , r0, 6, .LBB35_37
	$jump , .LBB35_36
.LBB35_36:
	$lbu , r1, r22,  - 20
	$lsl , r0, r1, 2
	$lsl_add , r1, r0, r1, 4
	$move , r0, jobs
	$add , r0, r0, r1
	$lbu , r0, r0, 1
	$sw , r22,  - 48, r0
	$jump , .LBB35_56
.LBB35_37:
	$lw , r0, r22,  - 28
	$jneq , r0, 7, .LBB35_39
	$jump , .LBB35_38
.LBB35_38:
	$lw , r0, r22,  - 44
	$call , r23, __end_process
	$jump , .LBB35_39
.LBB35_39:
	$lw , r0, r22,  - 28
	$jneq , r0, 8, .LBB35_41
	$jump , .LBB35_40
.LBB35_40:
	$move , r0, beg
	$call , r23, printk
	$lw , r0, r22,  - 44
	$call , r23, printk
	$move , r0, end
	$call , r23, printk
	$sw , r22,  - 48, 0
	$jump , .LBB35_56
.LBB35_41:
	$lw , r0, r22,  - 28
	$jneq , r0, 9, .LBB35_43
	$jump , .LBB35_42
.LBB35_42:
	$move , r0, beg
	$call , r23, printk
	$lw , r0, r22,  - 44
	$call , r23, printk_int
	$move , r0, end
	$call , r23, printk
	$sw , r22,  - 48, 0
	$jump , .LBB35_56
.LBB35_43:
	$lw , r0, r22,  - 28
	$jneq , r0, 10, .LBB35_45
	$jump , .LBB35_44
.LBB35_44:
	$lw , r0, r22,  - 44
	$call , r23, socket_open
	$sw , r22,  - 48, r0
	$jump , .LBB35_56
.LBB35_45:
	$lw , r0, r22,  - 28
	$jneq , r0, 11, .LBB35_47
	$jump , .LBB35_46
.LBB35_46:
	$lw , r0, r22,  - 44
	$lw , r1, r22,  - 40
	$lw , r2, r22,  - 36
	$call , r23, socket_read
	$sw , r22,  - 48, r0
	$jump , .LBB35_56
.LBB35_47:
	$lw , r0, r22,  - 28
	$jneq , r0, 12, .LBB35_49
	$jump , .LBB35_48
.LBB35_48:
	$lw , r0, r22,  - 44
	$lw , r1, r22,  - 40
	$lw , r2, r22,  - 36
	$call , r23, socket_write
	$sw , r22,  - 48, r0
	$jump , .LBB35_56
.LBB35_49:
	$lw , r0, r22,  - 28
	$jneq , r0, 13, .LBB35_51
	$jump , .LBB35_50
.LBB35_50:
	$lw , r0, r22,  - 44
	$call , r23, socket_close
	$sw , r22,  - 48, r0
	$jump , .LBB35_56
.LBB35_51:
	$lw , r0, r22,  - 28
	$jneq , r0, 20, .LBB35_53
	$jump , .LBB35_52
.LBB35_52:
	$lw , r0, r22,  - 44
	$call , r23, create_job
	$sw , r22,  - 48, r0
	$jump , .LBB35_56
.LBB35_53:
	$lw , r0, r22,  - 28
	$jneq , r0, 21, .LBB35_55
	$jump , .LBB35_54
.LBB35_54:
	$call , r23, join_job
	$sw , r22,  - 48, r0
	$jump , .LBB35_56
.LBB35_55:
	$sw , r22,  - 48,  - 1
	$jump , .LBB35_56
.LBB35_56:
	$lw , r0, r22,  - 48
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end35:
	$size,	syscall, .Lfunc_end35 - syscall
	$section,	%stack_sizes,"o",@progbits,%text, syscall
	$long,	.Lfunc_begin35
	$byte,	48
	$section,	%text, syscall,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, __end_process,"ax",@progbits
	$globl,	__end_process                   //  -  -  Begin function __end_process
	$type,	__end_process,@function
__end_process:                          // @__end_process
.Lfunc_begin36:
// %bb.0:
	$sd , r22, 8, d22
	$add , r22, r22, 16
	$sw , r22,  - 16, r0
	$lw , r0, zero, mutex_jobs
	$call , r23, mutex_lock
	$lw , r1, zero, cur_process_index
	$lsl , r0, r1, 4
	$lsl_add , r1, r0, r1, 6
	$move , r0, processs
	$add , r1, r0, r1
	$sw , r1, 8, 4
	$lw , r1, r22,  - 16
	$lw , r3, zero, cur_process_index
	$lsl , r2, r3, 4
	$lsl_add , r2, r2, r3, 6
	$add , r0, r0, r2
	$sw , r0, 12, r1
	$move , r0, 2
	$call , r23, set_flag
	$sw , r22,  - 12, 0
	$jump , .LBB36_1
.LBB36_1:                               // =>This Inner Loop Header: Depth=1
	$lw , r0, r22,  - 12
	$lw , r2, zero, cur_process_index
	$lsl , r1, r2, 4
	$lsl_add , r2, r1, r2, 6
	$move , r1, processs
	$add , r1, r1, r2
	$lbu , r1, r1, 2
	$jges , r0, r1, .LBB36_4
	$jump , .LBB36_2
.LBB36_2:                               //   in Loop: Header=BB36_1 Depth=1
	$lw , r1, r22,  - 12
	$lsl , r0, r1, 2
	$lsl_add , r0, r0, r1, 4
	$move , r1, 4
	$sb , r0, jobs, r1
	$jump , .LBB36_3
.LBB36_3:                               //   in Loop: Header=BB36_1 Depth=1
	$lw , r0, r22,  - 12
	$add , r0, r0, 1
	$sw , r22,  - 12, r0
	$jump , .LBB36_1
.LBB36_4:
	$lw , r0, zero, mutex_jobs
	$call , r23, mutex_unlock
	$call , r23, me
	$lsl , r0, r0, 2
	$lw , r1, r0, fc_scheduler_job
	$move , r0, jobs
	$add , r0, r0, 16
	$call , r23, swap_context
	$call , r23, halt
.Lfunc_end36:
	$size,	__end_process, .Lfunc_end36 - __end_process
	$section,	%stack_sizes,"o",@progbits,%text, __end_process
	$long,	.Lfunc_begin36
	$byte,	16
	$section,	%text, __end_process,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, printk,"ax",@progbits
	$globl,	printk                          //  -  -  Begin function printk
	$type,	printk,@function
printk:                                 // @printk
.Lfunc_begin37:
// %bb.0:
	$sd , r22, 24, d22
	$add , r22, r22, 32
	$sw , r22,  - 32, r0
	$sw , r22,  - 28, 0
	$lw , r0, r22,  - 32
	$sw , r22,  - 24, r0
	$jump , .LBB37_1
.LBB37_1:                               // =>This Inner Loop Header: Depth=1
	$lw , r0, r22,  - 24
	$lbs , r0, r0, 0
	$jeq , r0, 0, .LBB37_3
	$jump , .LBB37_2
.LBB37_2:                               //   in Loop: Header=BB37_1 Depth=1
	$lw , r0, r22,  - 24
	$add , r0, r0, 1
	$sw , r22,  - 24, r0
	$lw , r0, r22,  - 28
	$add , r0, r0, 1
	$sw , r22,  - 28, r0
	$jump , .LBB37_1
.LBB37_3:
	$lw , r0, zero, log_w
	$lw , r1, r22,  - 28
	$add , r0, r0, r1
	$move , r1, 65537
	$jltu , r0, r1, .LBB37_5
	$jump , .LBB37_4
.LBB37_4:
	$jump , .LBB37_15
.LBB37_5:
	$sb , r22,  - 20, 0
	$lw , r0, zero, mutex_printk
	$call , r23, mutex_lock
	$sw , r22,  - 16, 0
	$jump , .LBB37_6
.LBB37_6:                               // =>This Inner Loop Header: Depth=1
	$lw , r0, r22,  - 16
	$lw , r1, r22,  - 28
	$jges , r0, r1, .LBB37_11
	$jump , .LBB37_7
.LBB37_7:                               //   in Loop: Header=BB37_6 Depth=1
	$lw , r0, r22,  - 32
	$lw , r1, r22,  - 16
	$add , r0, r0, r1
	$lbs , r1, r0, 0
	$lbu , r0, r22,  - 20
	$sb , r0, buf_aligned, r1
	$lbs , r0, r22,  - 20
	$add , r0, r0, 1
	$sb , r22,  - 20, r0
	$lbu , r0, r22,  - 20
	$jneq , r0, 128, .LBB37_9
	$jump , .LBB37_8
.LBB37_8:                               //   in Loop: Header=BB37_6 Depth=1
	$lw , r3, zero, log_w
	$move , r1, buf_aligned
	$move , r2, 128
	$move , r4, 1
	$move , r0, r4
	$call , r23, inode_operation
	$lw , r0, zero, log_w
	$add , r0, r0, 128
	$sw , zero, log_w, r0
	$sb , r22,  - 20, 0
	$jump , .LBB37_9
.LBB37_9:                               //   in Loop: Header=BB37_6 Depth=1
	$jump , .LBB37_10
.LBB37_10:                              //   in Loop: Header=BB37_6 Depth=1
	$lw , r0, r22,  - 16
	$add , r0, r0, 1
	$sw , r22,  - 16, r0
	$jump , .LBB37_6
.LBB37_11:
	$jump , .LBB37_12
.LBB37_12:                              // =>This Inner Loop Header: Depth=1
	$lbu , r0, r22,  - 20
	$and , r0, r0, 7
	$jeq , r0, 0, .LBB37_14
	$jump , .LBB37_13
.LBB37_13:                              //   in Loop: Header=BB37_12 Depth=1
	$lbu , r0, r22,  - 20
	$move , r1, 0
	$sb , r0, buf_aligned, r1
	$lbs , r0, r22,  - 20
	$add , r0, r0, 1
	$sb , r22,  - 20, r0
	$jump , .LBB37_12
.LBB37_14:
	$lbu , r2, r22,  - 20
	$lw , r3, zero, log_w
	$move , r1, buf_aligned
	$move , r4, 1
	$move , r0, r4
	$call , r23, inode_operation
	$lbu , r1, r22,  - 20
	$lw , r0, zero, log_w
	$add , r0, r0, r1
	$sw , zero, log_w, r0
	$move , r0, 64
	$call , r23, set_flag
	$lw , r0, zero, mutex_printk
	$call , r23, mutex_unlock
	$jump , .LBB37_15
.LBB37_15:
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end37:
	$size,	printk, .Lfunc_end37 - printk
	$section,	%stack_sizes,"o",@progbits,%text, printk
	$long,	.Lfunc_begin37
	$byte,	32
	$section,	%text, printk,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, read_flags,"ax",@progbits
	$globl,	read_flags                      //  -  -  Begin function read_flags
	$type,	read_flags,@function
read_flags:                             // @read_flags
.Lfunc_begin38:
// %bb.0:
	$sd , r22, 16, d22
	$add , r22, r22, 24
	$lw , r0, zero, mutex_flag
	$call , r23, mutex_lock
	$move , r0, 651264
	$add , r1, r22,  - 24
	$move , r2, 16
	$call , r23, _mram_read
	$lw , r0, zero, mutex_flag
	$call , r23, mutex_unlock
	$lw , r0, r22,  - 16
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end38:
	$size,	read_flags, .Lfunc_end38 - read_flags
	$section,	%stack_sizes,"o",@progbits,%text, read_flags
	$long,	.Lfunc_begin38
	$byte,	24
	$section,	%text, read_flags,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, write_flags,"ax",@progbits
	$globl,	write_flags                     //  -  -  Begin function write_flags
	$type,	write_flags,@function
write_flags:                            // @write_flags
.Lfunc_begin39:
// %bb.0:
	$sd , r22, 24, d22
	$add , r22, r22, 32
	$sw , r22,  - 32, r0
	$lw , r0, zero, mutex_flag
	$call , r23, mutex_lock
	$lw , r0, r22,  - 32
	$sw , r22,  - 16, r0
	$add , r0, r22,  - 24
	$move , r1, 651264
	$move , r2, 16
	$call , r23, _mram_write
	$lw , r0, zero, mutex_flag
	$call , r23, mutex_unlock
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end39:
	$size,	write_flags, .Lfunc_end39 - write_flags
	$section,	%stack_sizes,"o",@progbits,%text, write_flags
	$long,	.Lfunc_begin39
	$byte,	32
	$section,	%text, write_flags,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, load_prg_memory,"ax",@progbits
	$globl,	load_prg_memory                 //  -  -  Begin function load_prg_memory
	$type,	load_prg_memory,@function
load_prg_memory:                        // @load_prg_memory
.Lfunc_begin40:
// %bb.0:
	$sd , r22, 24, d22
	$add , r22, r22, 32
	$sw , r22,  - 32, r0
	$lw , r1, r22,  - 32
	$lsl , r0, r1, 4
	$lsl_add , r1, r0, r1, 6
	$move , r0, processs
	$add , r0, r0, r1
	$add , r0, r0, 28
	$sw , r22,  - 28, r0
	$lw , r1, r22,  - 28
	$lw , r2, r1, 0
	$move , r0, 651264
	$lsl_add , r0, r0, r2, 16
	$lw , r2, r1, 4
	$move , r1, 512
	$call , r23, load_big_blocks
	$lw , r0, r22,  - 28
	$lw , r0, r0, 12
	$sw , r22,  - 24, r0
	$sw , r22,  - 20, 16
	$jump , .LBB40_1
.LBB40_1:                               // =>This Inner Loop Header: Depth=1
	$lw , r0, r22,  - 24
	$lsr , r0, r0, 11
	$jeq , r0, 0, .LBB40_3
	$jump , .LBB40_2
.LBB40_2:                               //   in Loop: Header=BB40_1 Depth=1
	$lw , r0, r22,  - 24
	$add , r0, r0,  - 2048
	$sw , r22,  - 24, r0
	$lw , r0, r22,  - 20
	$or , r0, r0,  - 16777216
	$sw , r22,  - 16, r0
	$lw , r0, r22,  - 16
	$lw , r1, r22,  - 28
	$lw , r2, r1, 8
	$lw , r1, r22,  - 20
	$lsl_add , r1, r1, r2, 16
	// inline asm
	$ldmai , r0, r1, 0

	// inline asm
	$lw , r0, r22,  - 20
	$add , r0, r0, 2048
	$sw , r22,  - 20, r0
	$jump , .LBB40_1
.LBB40_3:
	$lw , r0, r22,  - 20
	$lw , r2, r22,  - 24
	$move , r1,  - 16777216
	$lsl_add , r1, r1, r2, 21
	$and , r1, r1,  - 16777216
	$or , r0, r0, r1
	$sw , r22,  - 12, r0
	$lw , r0, r22,  - 12
	$lw , r1, r22,  - 28
	$lw , r2, r1, 8
	$lw , r1, r22,  - 20
	$lsl_add , r1, r1, r2, 16
	// inline asm
	$ldmai , r0, r1, 0

	// inline asm
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end40:
	$size,	load_prg_memory, .Lfunc_end40 - load_prg_memory
	$section,	%stack_sizes,"o",@progbits,%text, load_prg_memory
	$long,	.Lfunc_begin40
	$byte,	32
	$section,	%text, load_prg_memory,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, save_wram_process,"ax",@progbits
	$globl,	save_wram_process               //  -  -  Begin function save_wram_process
	$type,	save_wram_process,@function
save_wram_process:                      // @save_wram_process
.Lfunc_begin41:
// %bb.0:
	$sd , r22, 8, d22
	$add , r22, r22, 16
	$sw , r22,  - 16, r0
	$lw , r1, r22,  - 16
	$lsl , r0, r1, 4
	$lsl_add , r1, r0, r1, 6
	$move , r0, processs
	$add , r0, r0, r1
	$add , r0, r0, 28
	$sw , r22,  - 12, r0
	$lw , r0, r22,  - 12
	$lw , r2, r0, 0
	$move , r1, 651264
	$lsl_add , r1, r1, r2, 16
	$lw , r2, r0, 4
	$move , r0, 512
	$call , r23, store_big_blocks
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end41:
	$size,	save_wram_process, .Lfunc_end41 - save_wram_process
	$section,	%stack_sizes,"o",@progbits,%text, save_wram_process
	$long,	.Lfunc_begin41
	$byte,	16
	$section,	%text, save_wram_process,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, launch_proc,"ax",@progbits
	$globl,	launch_proc                     //  -  -  Begin function launch_proc
	$type,	launch_proc,@function
launch_proc:                            // @launch_proc
.Lfunc_begin42:
// %bb.0:
	$sd , r22, 24, d22
	$add , r22, r22, 32
                                        // kill: def $r2 killed $r1
	$sw , r22,  - 32, r0
	$sb , r22,  - 28, r1
	$lw , r1, r22,  - 32
	$lsl , r0, r1, 4
	$lsl_add , r1, r0, r1, 6
	$move , r0, processs
	$add , r0, r0, r1
	$sw , r0, 8, 2
	$lw , r0, r22,  - 32
	$sw , zero, cur_process_index, r0
	$lbu , r0, r22,  - 28
	$jeq , r0, 0, .LBB42_6
	$jump , .LBB42_1
.LBB42_1:
	$sw , r22,  - 24, 0
	$jump , .LBB42_2
.LBB42_2:                               // =>This Inner Loop Header: Depth=1
	$lw , r0, r22,  - 24
	$jgts , r0, 99, .LBB42_5
	$jump , .LBB42_3
.LBB42_3:                               //   in Loop: Header=BB42_2 Depth=1
	$lw , r1, r22,  - 24
	$lsl , r0, r1, 2
	$lsl_add , r0, r0, r1, 4
	$move , r1, 0
	$sb , r0, jobs, r1
	$jump , .LBB42_4
.LBB42_4:                               //   in Loop: Header=BB42_2 Depth=1
	$lw , r0, r22,  - 24
	$add , r0, r0, 1
	$sw , r22,  - 24, r0
	$jump , .LBB42_2
.LBB42_5:
	$lw , r1, r22,  - 32
	$lsl , r0, r1, 4
	$lsl_add , r0, r0, r1, 6
	$move , r1, processs
	$add , r0, r1, r0
	$sb , r0, 2, 1
	$lw , r2, r22,  - 32
	$lsl , r0, r2, 4
	$lsl_add , r0, r0, r2, 6
	$add , r0, r1, r0
	$lw , r2, r0, 24
	$move , r0, jobs
	$sw , r0, 16, r2
	$lw , r2, r0, 16
	$sw , r2, 36, r2
	$lw , r2, r0, 16
	$move , r3, __end_process
	$sw , r2, 32, r3
	$lw , r3, r22,  - 32
	$lsl , r2, r3, 4
	$lsl_add , r2, r2, r3, 6
	$add , r1, r1, r2
	$lw , r2, r1, 12
	$lw , r1, r0, 16
	$sw , r1, 24, r2
	$sb , r0, 0, 1
	$sb , r0, 1, 0
	$jump , .LBB42_6
.LBB42_6:
	$sw , r22,  - 20, 0
	// inline asm
	$time , r0
	// inline asm
	$sw , r22,  - 20, r0
	$lw , r1, r22,  - 20
	$lw , r2, r22,  - 32
	$lsl , r0, r2, 4
	$lsl_add , r2, r0, r2, 6
	$move , r0, processs
	$add , r0, r0, r2
	$sw , r0, 20, r1
	$call , r23, scheduler_jobs
	$sw , r22,  - 16, r0
	$lw , r0, r22,  - 16
	$jeq , r0, 0, .LBB42_9//判断 all_end_or_waiting
	$jump , .LBB42_7
.LBB42_7:
	$lw , r1, r22,  - 32
	$lsl , r0, r1, 4
	$lsl_add , r1, r0, r1, 6
	$move , r0, processs
	$add , r0, r0, r1
	$lw , r0, r0, 8
	$jeq , r0, 4, .LBB42_9
	$jump , .LBB42_8
.LBB42_8:
	$lw , r1, r22,  - 32
	$lsl , r0, r1, 4
	$lsl_add , r1, r0, r1, 6
	$move , r0, processs
	$add , r0, r0, r1
	$sw , r0, 8, 5
	$jump , .LBB42_9
.LBB42_9:
	$lw , r1, r22,  - 32
	$lsl , r0, r1, 4
	$lsl_add , r1, r0, r1, 6
	$move , r0, processs
	$add , r0, r0, r1
	$lw , r0, r0, 8
	$jneq , r0, 2, .LBB42_11 //判断状态
	$jump , .LBB42_10
.LBB42_10:
	$lw , r1, r22,  - 32
	$lsl , r0, r1, 4
	$lsl_add , r1, r0, r1, 6
	$move , r0, processs
	$add , r0, r0, r1
	$sw , r0, 8, 3
	$jump , .LBB42_11
.LBB42_11:
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end42:
	$size,	launch_proc, .Lfunc_end42 - launch_proc
	$section,	%stack_sizes,"o",@progbits,%text, launch_proc
	$long,	.Lfunc_begin42
	$byte,	32
	$section,	%text, launch_proc,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, stop_dpu,"ax",@progbits
	$globl,	stop_dpu                        //  -  -  Begin function stop_dpu
	$type,	stop_dpu,@function
stop_dpu:                               // @stop_dpu
.Lfunc_begin43:
// %bb.0:
	$sd , r22, 8, d22
	$add , r22, r22, 16
	$move , r0, saved_fc_stop
	$call , r23, stop_me
	$sw , r22,  - 16, 15
	$move , r0, 3
	// inline asm
	$time_cfg , r0, r0
	// inline asm
	$sw , r22,  - 16, r0
	$call , r23, read_flags
	$sw , r22,  - 12, r0
	$move , r0, 0
	$call , r23, write_flags
	$lbu , r0, r22,  - 12
	$and , r0, r0, 32
	$jeq , r0, 0, .LBB43_2
	$jump , .LBB43_1
.LBB43_1:
	$call , r23, wakeup_sleepy_socket
	$jump , .LBB43_2
.LBB43_2:
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end43:
	$size,	stop_dpu, .Lfunc_end43 - stop_dpu
	$section,	%stack_sizes,"o",@progbits,%text, stop_dpu
	$long,	.Lfunc_begin43
	$byte,	16
	$section,	%text, stop_dpu,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, check_timer_stop,"ax",@progbits
	$globl,	check_timer_stop                //  -  -  Begin function check_timer_stop
	$type,	check_timer_stop,@function
check_timer_stop:                       // @check_timer_stop
.Lfunc_begin44:
// %bb.0:
	$sd , r22, 8, d22
	$add , r22, r22, 16
	$sw , r22,  - 16, 0
	// inline asm
	$time , r0
	// inline asm
	$sw , r22,  - 16, r0
	$lw , r0, r22,  - 16
	$move , r1, 5000001
	$jltu , r0, r1, .LBB44_2
	$jump , .LBB44_1
.LBB44_1:
	$call , r23, stop_dpu
	$jump , .LBB44_2
.LBB44_2:
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end44:
	$size,	check_timer_stop, .Lfunc_end44 - check_timer_stop
	$section,	%stack_sizes,"o",@progbits,%text, check_timer_stop
	$long,	.Lfunc_begin44
	$byte,	16
	$section,	%text, check_timer_stop,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, scheduler,"ax",@progbits
	$globl,	scheduler                       //  -  -  Begin function scheduler
	$type,	scheduler,@function
scheduler:                              // @scheduler
.Lfunc_begin45:
// %bb.0:
	$sd , r22, 32, d22
	$add , r22, r22, 40
	$sb , r22,  - 40, 0
	$sw , r22,  - 36, 0
	$sw , r22,  - 32, 0
	$sw , r22,  - 28, 0
	$jump , .LBB45_1
.LBB45_1:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB45_2 Depth 2
	$jump , .LBB45_2
.LBB45_2:                               //   Parent Loop BB45_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	$lw , r0, r22,  - 36
	$jgtu , r0, 9, .LBB45_17
	$jump , .LBB45_3
.LBB45_3:                               //   in Loop: Header=BB45_2 Depth=2
	$call , r23, check_timer_stop
	$lw , r1, r22,  - 36
	$lsl , r0, r1, 4
	$lsl_add , r1, r0, r1, 6
	$move , r0, processs
	$add , r0, r0, r1
	$lw , r0, r0, 8
	$jneq , r0, 1, .LBB45_5
	$jump , .LBB45_4
.LBB45_4:                               //   in Loop: Header=BB45_2 Depth=2
	$sb , r22,  - 20, 1
	$jump , .LBB45_9
.LBB45_5:                               //   in Loop: Header=BB45_2 Depth=2
	$lw , r1, r22,  - 36
	$lsl , r0, r1, 4
	$lsl_add , r1, r0, r1, 6
	$move , r0, processs
	$add , r0, r0, r1
	$lw , r0, r0, 8
	$jneq , r0, 3, .LBB45_7
	$jump , .LBB45_6
.LBB45_6:                               //   in Loop: Header=BB45_2 Depth=2
	$sb , r22,  - 20, 0
	$jump , .LBB45_8
.LBB45_7:                               //   in Loop: Header=BB45_2 Depth=2
	$jump , .LBB45_16
.LBB45_8:                               //   in Loop: Header=BB45_2 Depth=2
	$jump , .LBB45_9
.LBB45_9:                               //   in Loop: Header=BB45_2 Depth=2
	$sb , r22,  - 40, 0
	$call , r23, me
	$jeq , r0, 0, .LBB45_11
	$jump , .LBB45_10
.LBB45_10:
	$call , r23, halt
.LBB45_11:                              //   in Loop: Header=BB45_2 Depth=2
	$lw , r1, r22,  - 36
	$lsl , r0, r1, 4
	$lsl_add , r1, r0, r1, 6
	$move , r0, processs
	$add , r0, r0, r1
	$lw , r0, r0, 4
	$sw , r22,  - 24, r0
	$lw , r0, r22,  - 28
	$lw , r1, r22,  - 24
	$jeq , r0, r1, .LBB45_15
	$jump , .LBB45_12
.LBB45_12:                              //   in Loop: Header=BB45_2 Depth=2
	$lw , r1, r22,  - 32
	$lsl , r0, r1, 4
	$lsl_add , r1, r0, r1, 6
	$move , r0, processs
	$add , r0, r0, r1
	$lw , r0, r0, 4
	$lw , r1, r22,  - 28
	$jneq , r0, r1, .LBB45_14
	$jump , .LBB45_13
.LBB45_13:                              //   in Loop: Header=BB45_2 Depth=2
	$lw , r0, r22,  - 32
	$call , r23, save_wram_process
	$jump , .LBB45_14
.LBB45_14:                              //   in Loop: Header=BB45_2 Depth=2
	$lw , r0, r22,  - 36
	$call , r23, load_prg_memory
	$lw , r0, r22,  - 36
	$sw , r22,  - 32, r0
	$lw , r0, r22,  - 24
	$sw , r22,  - 28, r0
	$jump , .LBB45_15
.LBB45_15:                              //   in Loop: Header=BB45_2 Depth=2
	$lw , r1, r22,  - 36
	$lsl , r0, r1, 4
	$lsl_add , r0, r0, r1, 11
	$lsl_sub , r0, r0, r1, 6
	$add , r0, r0, 651280
	$move , r1, jobs
	$sw , r22,  - 12, r1
	$move , r2, 2000
	$sw , r22,  - 16, r2
	$call , r23, _mram_read
	$lw , r0, r22,  - 36
	$lbu , r1, r22,  - 20
	$call , r23, launch_proc
	$lw , r0, r22,  - 12
	$lw , r2, r22,  - 16
	$lw , r3, r22,  - 36
	$lsl , r1, r3, 4
	$lsl_add , r1, r1, r3, 11
	$lsl_sub , r1, r1, r3, 6
	$add , r1, r1, 651280
	$call , r23, _mram_write
	$jump , .LBB45_16
.LBB45_16:                              //   in Loop: Header=BB45_2 Depth=2
	$lw , r0, r22,  - 36
	$add , r0, r0, 1
	$sw , r22,  - 36, r0
	$jump , .LBB45_2
.LBB45_17:                              //   in Loop: Header=BB45_1 Depth=1
	$sw , r22,  - 36, 0
	$lbu , r0, r22,  - 40
	$jeq , r0, 0, .LBB45_19
	$jump , .LBB45_18
.LBB45_18:                              //   in Loop: Header=BB45_1 Depth=1
	$call , r23, stop_dpu
	$jump , .LBB45_19
.LBB45_19:                              //   in Loop: Header=BB45_1 Depth=1
	$sb , r22,  - 40, 1
	$jump , .LBB45_1
.Lfunc_end45:
	$size,	scheduler, .Lfunc_end45 - scheduler
	$section,	%stack_sizes,"o",@progbits,%text, scheduler
	$long,	.Lfunc_begin45
	$byte,	40
	$section,	%text, scheduler,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, main,"ax",@progbits
	$globl,	main                            //  -  -  Begin function main
	$type,	main,@function
main:                                   // @main
.Lfunc_begin46:
// %bb.0:
	$sd , r22, 16, d22
	$add , r22, r22, 24
	$sw , r22,  - 24, 0
	$call , r23, me
	$jneq , r0, 0, .LBB46_2
	$jump , .LBB46_1
.LBB46_1:
	$move , r1, __atomic_bit_mutex_sp
	$move , r0, cp
	$sw , r0, 4, r1
	$sb , r0, 0, 16
	$sb , r0, 1, 0
	$sb , r0, 2, 0
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
	$jump , .LBB46_6
.LBB46_2:
	$jump , .LBB46_3
.LBB46_3:                               // =>This Inner Loop Header: Depth=1
	$lbu , r0, zero, cp
	$jneq , r0, 0, .LBB46_5
	$jump , .LBB46_4
.LBB46_4:                               //   in Loop: Header=BB46_3 Depth=1
	$jump , .LBB46_3
.LBB46_5:
	$call , r23, scheduler_jobs
	$jump , .LBB46_6
.LBB46_6:
	$call , r23, boot_me
	$move , r0, __user_space_wram
	$move , r1, 255
	$sb , r0, 57343, r1
	$move , r0, 0
	$sw , r22,  - 16, r0
	$call , r23, write_flags
	$sw , r22,  - 20, 15
	$move , r0, 3
	// inline asm
	$time_cfg , r0, r0
	// inline asm
	$sw , r22,  - 20, r0
	$call , r23, scheduler
                                        // kill: def $r1 killed $r0
	$lw , r0, r22,  - 16
	$ld , d22, r22,  - 8
	$jump , r23
.Lfunc_end46:
	$size,	main, .Lfunc_end46 - main
	$section,	%stack_sizes,"o",@progbits,%text, main
	$long,	.Lfunc_begin46
	$byte,	24
	$section,	%text, main,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, index_from_roleid,"ax",@progbits
	$globl,	index_from_roleid               //  -  -  Begin function index_from_roleid
	$type,	index_from_roleid,@function
index_from_roleid:                      // @index_from_roleid
.Lfunc_begin47:
// %bb.0:
                                        // kill: def $r1 killed $r0
	$sb , r22, 4, r0
	$lw , r1, zero, cur_process_index
	$lsl , r0, r1, 4
	$lsl_add , r0, r0, r1, 6
	$lbs , r0, r0, processs
	$sb , r22, 8, r0
	$sw , r22, 12, 0
	$jump , .LBB47_1
.LBB47_1:                               // =>This Inner Loop Header: Depth=1
	$lw , r0, r22, 12
	$jgtu , r0, 9, .LBB47_8
	$jump , .LBB47_2
.LBB47_2:                               //   in Loop: Header=BB47_1 Depth=1
	$lw , r1, r22, 12
	$lsl , r0, r1, 4
	$lsl_add , r1, r0, r1, 6
	$move , r0, processs
	$add , r0, r0, r1
	$lw , r0, r0, 4
	$jeq , r0, 0, .LBB47_6
	$jump , .LBB47_3
.LBB47_3:                               //   in Loop: Header=BB47_1 Depth=1
	$lw , r1, r22, 12
	$lsl , r0, r1, 4
	$lsl_add , r0, r0, r1, 6
	$lbu , r0, r0, processs
	$lbu , r1, r22, 8
	$jneq , r0, r1, .LBB47_6
	$jump , .LBB47_4
.LBB47_4:                               //   in Loop: Header=BB47_1 Depth=1
	$lw , r1, r22, 12
	$lsl , r0, r1, 4
	$lsl_add , r1, r0, r1, 6
	$move , r0, processs
	$add , r0, r0, r1
	$lbu , r0, r0, 1
	$lbu , r1, r22, 4
	$jneq , r0, r1, .LBB47_6
	$jump , .LBB47_5
.LBB47_5:
	$lw , r0, r22, 12
	$sw , r22, 0, r0
	$jump , .LBB47_9
.LBB47_6:                               //   in Loop: Header=BB47_1 Depth=1
	$jump , .LBB47_7
.LBB47_7:                               //   in Loop: Header=BB47_1 Depth=1
	$lw , r0, r22, 12
	$add , r0, r0, 1
	$sw , r22, 12, r0
	$jump , .LBB47_1
.LBB47_8:
	$sw , r22, 0,  - 1
	$jump , .LBB47_9
.LBB47_9:
	$lw , r0, r22, 0
	$jump , r23
.Lfunc_end47:
	$size,	index_from_roleid, .Lfunc_end47 - index_from_roleid
	$section,	%stack_sizes,"o",@progbits,%text, index_from_roleid
	$long,	.Lfunc_begin47
	$byte,	16
	$section,	%text, index_from_roleid,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, me,"ax",@progbits
	$type,	me,@function                    //  -  -  Begin function me
me:                                     // @me
.Lfunc_begin48:
// %bb.0:
	$move , r0, id
	$jump , r23
.Lfunc_end48:
	$size,	me, .Lfunc_end48 - me
	$section,	%stack_sizes,"o",@progbits,%text, me
	$long,	.Lfunc_begin48
	$byte,	0
	$section,	%text, me,"ax",@progbits
                                        //  -  -  End function
	$section,	%text, halt,"ax",@progbits
	$type,	halt,@function                  //  -  -  Begin function halt
halt:                                   // @halt
.Lfunc_begin49:
// %bb.0:
	$fault , 4
.Lfunc_end49:
	$size,	halt, .Lfunc_end49 - halt
	$section,	%stack_sizes,"o",@progbits,%text, halt
	$long,	.Lfunc_begin49
	$byte,	0
	$section,	%text, halt,"ax",@progbits
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

	$type,	__user_space_wram,@object       // @__user_space_wram
	$globl,	__user_space_wram
__user_space_wram:
	$zero,	57344
	$size,	__user_space_wram, 57344

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
	$addrsig_sym, sp_wait
	$addrsig_sym, mutex_lock
	$addrsig_sym, mutex_unlock
	$addrsig_sym, abnormal_wakeup
	$addrsig_sym, abnormal_wakeup_one
	$addrsig_sym, swap_scheduler
	$addrsig_sym, swap_context
	$addrsig_sym, __end_child_jobs
	$addrsig_sym, wakeup
	$addrsig_sym, create_job
	$addrsig_sym, sbrk
	$addrsig_sym, join_job
	$addrsig_sym, sleep
	$addrsig_sym, swap
	$addrsig_sym, first_swap_context
	$addrsig_sym, check_time_process
	$addrsig_sym, scheduler_jobs
	$addrsig_sym, try_lock
	$addrsig_sym, lock
	$addrsig_sym, unlock
	$addrsig_sym, _mram_read
	$addrsig_sym, _mram_write
	$addrsig_sym, inode_operation
	$addrsig_sym, load_big_blocks
	$addrsig_sym, store_big_blocks
	$addrsig_sym, alloc_inode
	$addrsig_sym, find_inode
	$addrsig_sym, printk_int
	$addrsig_sym, chained_inode_operation
	$addrsig_sym, free_inode
	$addrsig_sym, wakeup_sleepy_socket
	$addrsig_sym, socket_open
	$addrsig_sym, set_flag
	$addrsig_sym, check_sd
	$addrsig_sym, socket_close
	$addrsig_sym, socket_read
	$addrsig_sym, socket_write
	$addrsig_sym, __end_process
	$addrsig_sym, printk
	$addrsig_sym, read_flags
	$addrsig_sym, write_flags
	$addrsig_sym, load_prg_memory
	$addrsig_sym, save_wram_process
	$addrsig_sym, launch_proc
	$addrsig_sym, stop_dpu
	$addrsig_sym, stop_me
	$addrsig_sym, check_timer_stop
	$addrsig_sym, scheduler
	$addrsig_sym, boot_me
	$addrsig_sym, me
	$addrsig_sym, halt
	$addrsig_sym, fc_scheduler_job
	$addrsig_sym, jobs
	$addrsig_sym, cur_jobs
	$addrsig_sym, mutex_jobs
	$addrsig_sym, processs
	$addrsig_sym, cur_process_index
	$addrsig_sym, cp
	$addrsig_sym, all_end_or_waiting
	$addrsig_sym, mutex_l
	$addrsig_sym, inode_table
	$addrsig_sym, mutex_mram
	$addrsig_sym, alloc_inode.bit_map
	$addrsig_sym, mutex_inode
	$addrsig_sym, buf_socket
	$addrsig_sym, mutex_sockets
	$addrsig_sym, beg
	$addrsig_sym, end
	$addrsig_sym, __user_space_wram
	$addrsig_sym, mutex_printk
	$addrsig_sym, mutex_flag
	$addrsig_sym, mutex_sbrk
	$addrsig_sym, saved_fc_stop
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
