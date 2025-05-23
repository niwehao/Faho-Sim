	.text
	.file	"stdio.c"
	.section	.text.printf,"ax",@progbits
	.globl	printf                          // -- Begin function printf
	.type	printf,@function
printf:                                 // @printf
.Lfunc_begin0:
// %bb.0:
	sd r22, 40, d22
	add r22, r22, 48
	sd r22, -32, d14
	sd r22, -40, d16
	sd r22, -48, d18
	move r14, r0
	call r23, __open_print_sequence
	sub r0, r22, 56, false
	sw r22, -24, r0
	move r0, 1
	move r15, r14, true, .LBB0_1
.LBB0_19:                               //   in Loop: Header=BB0_1 Depth=1
	add r15, r15, 1
	move r0, r16
.LBB0_1:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_9 Depth 2
	lbu r1, r15, 0
	jeq r1, 37, .LBB0_6
// %bb.2:                               //   in Loop: Header=BB0_1 Depth=1
	jneq r1, 0, .LBB0_3
	jump .LBB0_20
.LBB0_6:                                //   in Loop: Header=BB0_1 Depth=1
	lbu r1, r15, 1
	add r15, r15, 1
	jeq r1, 37, .LBB0_3
// %bb.7:                               //   in Loop: Header=BB0_1 Depth=1
	jeq r1, 0, .LBB0_20
// %bb.8:                               //   in Loop: Header=BB0_1 Depth=1
	move r0, 37
	call r23, __write_byte_and_flush_if_needed
	jump .LBB0_9
.LBB0_18:                               //   in Loop: Header=BB0_9 Depth=2
	call r23, __write_byte_and_flush_if_needed
	lbu r0, r15, 0
	and r0, r0, 223
	add r0, r0, -65
	and r0, r0, 255
	jltu r0, 26, .LBB0_19
.LBB0_17:                               //   in Loop: Header=BB0_9 Depth=2
	add r15, r15, 1
.LBB0_9:                                //   Parent Loop BB0_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	lbu r0, r15, 0
	move r16, 1
	jles r0, 107, .LBB0_10
// %bb.14:                              //   in Loop: Header=BB0_9 Depth=2
	jeq r0, 122, .LBB0_17
// %bb.15:                              //   in Loop: Header=BB0_9 Depth=2
	jneq r0, 108, .LBB0_18
// %bb.16:                              //   in Loop: Header=BB0_9 Depth=2
	move r0, 108
	call r23, __write_byte_and_flush_if_needed
	jump .LBB0_17
.LBB0_10:                               //   in Loop: Header=BB0_9 Depth=2
	jeq r0, 76, .LBB0_17
// %bb.11:                              //   in Loop: Header=BB0_9 Depth=2
	jeq r0, 0, .LBB0_19
// %bb.12:                              //   in Loop: Header=BB0_9 Depth=2
	jneq r0, 105, .LBB0_18
// %bb.13:                              //   in Loop: Header=BB0_1 Depth=1
	move r0, 100
	call r23, __write_byte_and_flush_if_needed
	jump .LBB0_19
.LBB0_3:                                //   in Loop: Header=BB0_1 Depth=1
	move r16, 0
	and r0, r0, 1, z, .LBB0_19
// %bb.4:                               //   in Loop: Header=BB0_1 Depth=1
	move r0, 37
	call r23, __write_byte_and_flush_if_needed
	move r0, 115
	call r23, __write_byte_and_flush_if_needed
	jump .LBB0_19
.LBB0_20:
	move r15, 0
	move r0, r15
	call r23, __write_byte_and_flush_if_needed
	add r0, r22, -16
	or r16, r0, 1, true, .LBB0_21
.LBB0_22:                               //   in Loop: Header=BB0_21 Depth=1
	jeq r0, 0, .LBB0_52
.LBB0_23:                               //   in Loop: Header=BB0_21 Depth=1
	call r23, __write_byte_and_flush_if_needed
	move r15, 1
	add r14, r14, 1
.LBB0_21:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_30 Depth 2
                                        //     Child Loop BB0_41 Depth 2
                                        //     Child Loop BB0_50 Depth 2
	lbu r0, r14, 0
	jneq r0, 37, .LBB0_22
// %bb.24:                              //   in Loop: Header=BB0_21 Depth=1
	lbu r1, r14, 1
	add r14, r14, 1
	jeq r1, 37, .LBB0_23
// %bb.25:                              //   in Loop: Header=BB0_21 Depth=1
	jeq r1, 0, .LBB0_52
// %bb.26:                              //   in Loop: Header=BB0_21 Depth=1
	and r0, r15, 1, z, .LBB0_28
// %bb.27:                              //   in Loop: Header=BB0_21 Depth=1
	move r0, 0
	call r23, __write_byte_and_flush_if_needed
.LBB0_28:                               //   in Loop: Header=BB0_21 Depth=1
	move r0, 0
	lbu r1, r14, 0
	jgts r1, 121, .LBB0_35
	jump .LBB0_30
.LBB0_36:                               //   in Loop: Header=BB0_21 Depth=1
	and r2, r1, 223
	add r2, r2, -65
	and r2, r2, 255
	jleu r2, 25, .LBB0_37
.LBB0_34:                               //   in Loop: Header=BB0_21 Depth=1
	add r14, r14, 1
	lbu r1, r14, 0
	jles r1, 121, .LBB0_30
.LBB0_35:                               //   in Loop: Header=BB0_21 Depth=1
	jeq r1, 122, .LBB0_34
	jump .LBB0_36
.LBB0_30:                               //   Parent Loop BB0_21 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	jeq r1, 0, .LBB0_46
// %bb.31:                              //   in Loop: Header=BB0_30 Depth=2
	jeq r1, 76, .LBB0_33
// %bb.32:                              //   in Loop: Header=BB0_30 Depth=2
	jneq r1, 108, .LBB0_36
.LBB0_33:                               //   in Loop: Header=BB0_30 Depth=2
	add r14, r14, 1
	move r0, 1
	lbu r1, r14, 0
	jgts r1, 121, .LBB0_35
	jump .LBB0_30
.LBB0_37:                               //   in Loop: Header=BB0_21 Depth=1
	add r1, r1, -69
	jgtu r1, 46, .LBB0_46
// %bb.38:                              //   in Loop: Header=BB0_21 Depth=1
	lsl r1, r1, 2
	lw r1, r1, .LJTI0_0
	jump r1
.LBB0_45:                               //   in Loop: Header=BB0_21 Depth=1
	// inline asm
	nop
	// inline asm
	lw r0, r22, -24
	add r0, r0, -8
	and r0, r0, -8
	sw r22, -24, r0
	ld d18, r0, 0
	and r0, r19, 255
	call r23, __write_byte_and_flush_if_needed
	lsr r0, r19, 8
	and r0, r0, 255
	call r23, __write_byte_and_flush_if_needed
	lsr r0, r19, 16
	and r0, r0, 255
	call r23, __write_byte_and_flush_if_needed
	lsr r0, r19, 24
	call r23, __write_byte_and_flush_if_needed
	and r0, r18, 255
	call r23, __write_byte_and_flush_if_needed
	lsr.u d0, r18, 8
	and r0, r1, 255
	call r23, __write_byte_and_flush_if_needed
	lsr.u d0, r18, 16
	and r0, r1, 255
	call r23, __write_byte_and_flush_if_needed
	lsr.u d0, r18, 24
	move r0, r1
	call r23, __write_byte_and_flush_if_needed
	jump .LBB0_51
.LBB0_46:                               //   in Loop: Header=BB0_21 Depth=1
	and r0, r0, 1, z, .LBB0_48
// %bb.47:                              //   in Loop: Header=BB0_21 Depth=1
	lw r0, r22, -24
	add r0, r0, -8
	and r0, r0, -8
	sw r22, -24, r0
	ld d0, r0, 0
	move r15, 8, true, .LBB0_49
.LBB0_48:                               //   in Loop: Header=BB0_21 Depth=1
	lw r0, r22, -24
	add r1, r0, -4
	sw r22, -24, r1
	lw.s d0, r0, -4
	move r15, 4
.LBB0_49:                               //   in Loop: Header=BB0_21 Depth=1
	sd r22, -16, d0
	and r0, r1, 255
	call r23, __write_byte_and_flush_if_needed
	add r15, r15, -1
	move r17, r16
.LBB0_50:                               //   Parent Loop BB0_21 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	lbu r0, r17, 0
	call r23, __write_byte_and_flush_if_needed
	add r17, r17, 1
	add r15, r15, -1, nz, .LBB0_50
.LBB0_51:                               //   in Loop: Header=BB0_21 Depth=1
	move r15, 0
	add r14, r14, 1, true, .LBB0_21
.LBB0_43:                               //   in Loop: Header=BB0_21 Depth=1
	lw r0, r22, -24
	add r1, r0, -4
	sw r22, -24, r1
	lbu r0, r0, -4
	call r23, __write_byte_and_flush_if_needed
	jump .LBB0_51
.LBB0_39:                               //   in Loop: Header=BB0_21 Depth=1
	lw r0, r22, -24
	add r1, r0, -4
	sw r22, -24, r1
	lw r1, r0, -4
	lbu r0, r1, 0
	jeq r0, 0, .LBB0_42
// %bb.40:                              //   in Loop: Header=BB0_21 Depth=1
	add r15, r1, 1
.LBB0_41:                               //   Parent Loop BB0_21 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	and r0, r0, 255
	call r23, __write_byte_and_flush_if_needed
	lbu r0, r15, 0
	add r15, r15, 1
	jneq r0, 0, .LBB0_41
.LBB0_42:                               //   in Loop: Header=BB0_21 Depth=1
	move r15, 0
	move r0, r15
	call r23, __write_byte_and_flush_if_needed
	add r14, r14, 1, true, .LBB0_21
.LBB0_52:
	and r0, r15, 1, z, .LBB0_54
// %bb.53:
	move r0, 0
	call r23, __write_byte_and_flush_if_needed
.LBB0_54:
	call r23, __finalized_print_sequence
	call r23, __close_print_sequence
	ld d18, r22, -48
	ld d16, r22, -40
	ld d14, r22, -32
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	printf, .Lfunc_end0-printf
	.section	.rodata.printf,"a",@progbits
	.p2align	2
.LJTI0_0:
	.long	.LBB0_45
	.long	.LBB0_46
	.long	.LBB0_45
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_43
	.long	.LBB0_46
	.long	.LBB0_45
	.long	.LBB0_45
	.long	.LBB0_45
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_46
	.long	.LBB0_39
	.section	.stack_sizes,"o",@progbits,.rodata.printf
	.long	.Lfunc_begin0
	.byte	48
	.section	.rodata.printf,"a",@progbits
                                        // -- End function
	.section	.text.__write_byte_and_flush_if_needed,"ax",@progbits
	.type	__write_byte_and_flush_if_needed,@function // -- Begin function __write_byte_and_flush_if_needed
__write_byte_and_flush_if_needed:       // @__write_byte_and_flush_if_needed
.Lfunc_begin1:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	lw r1, zero, __stdout_cache_write_index
	sb r1, __stdout_cache_buffer, r0
	add r0, r1, 1
	sw zero, __stdout_cache_write_index, r0
	jneq r0, 8, .LBB1_2
// %bb.1:
	call r23, __transfer_cache_to_mram
	move r0, __stdout_cache_write_index
	sw r0, 0, 0
.LBB1_2:
	ld d22, r22, -8
	jump r23
.Lfunc_end1:
	.size	__write_byte_and_flush_if_needed, .Lfunc_end1-__write_byte_and_flush_if_needed
	.section	.stack_sizes,"o",@progbits,.text.__write_byte_and_flush_if_needed
	.long	.Lfunc_begin1
	.byte	8
	.section	.text.__write_byte_and_flush_if_needed,"ax",@progbits
                                        // -- End function
	.section	.text.puts,"ax",@progbits
	.globl	puts                            // -- Begin function puts
	.type	puts,@function
puts:                                   // @puts
.Lfunc_begin2:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sd r22, -16, d14
	move r14, r0
	call r23, __open_print_sequence
	move r0, 37
	call r23, __write_byte_and_flush_if_needed
	move r0, 115
	call r23, __write_byte_and_flush_if_needed
	move r0, 0
	call r23, __write_byte_and_flush_if_needed
	lbu r0, r14, 0
	jeq r0, 0, .LBB2_3
// %bb.1:
	add r14, r14, 1
.LBB2_2:                                // =>This Inner Loop Header: Depth=1
	and r0, r0, 255
	call r23, __write_byte_and_flush_if_needed
	lbu r0, r14, 0
	add r14, r14, 1
	jneq r0, 0, .LBB2_2
.LBB2_3:
	move r0, 10
	call r23, __write_byte_and_flush_if_needed
	move r0, 0
	call r23, __write_byte_and_flush_if_needed
	call r23, __finalized_print_sequence
	call r23, __close_print_sequence
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end2:
	.size	puts, .Lfunc_end2-puts
	.section	.stack_sizes,"o",@progbits,.text.puts
	.long	.Lfunc_begin2
	.byte	16
	.section	.text.puts,"ax",@progbits
                                        // -- End function
	.section	.text.putchar,"ax",@progbits
	.globl	putchar                         // -- Begin function putchar
	.type	putchar,@function
putchar:                                // @putchar
.Lfunc_begin3:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sd r22, -16, d14
	move r14, r0
	call r23, __open_print_sequence
	move r0, 37
	call r23, __write_byte_and_flush_if_needed
	move r0, 99
	call r23, __write_byte_and_flush_if_needed
	move r0, 0
	call r23, __write_byte_and_flush_if_needed
	and r0, r14, 255
	call r23, __write_byte_and_flush_if_needed
	call r23, __finalized_print_sequence
	call r23, __close_print_sequence
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end3:
	.size	putchar, .Lfunc_end3-putchar
	.section	.stack_sizes,"o",@progbits,.text.putchar
	.long	.Lfunc_begin3
	.byte	16
	.section	.text.putchar,"ax",@progbits
                                        // -- End function
	.section	.text.__open_print_sequence,"ax",@progbits
	.type	__open_print_sequence,@function // -- Begin function __open_print_sequence
__open_print_sequence:                  // @__open_print_sequence
.Lfunc_begin4:
// %bb.0:
	// inline asm
.Ltmp0:
	acquire zero, __atomic_bit___stdout_buffer_lock, nz, .Ltmp0
	// inline asm
	move r0, __stdout_cache_write_index
	lw r1, zero, __stdout_buffer_state
	sw r0, 0, 0
	move r0, __stdout_nr_of_wrapping
	sw r0, 0, 0
	sw zero, __stdout_buffer_write_pointer_initial, r1
	jump r23
.Lfunc_end4:
	.size	__open_print_sequence, .Lfunc_end4-__open_print_sequence
	.section	.stack_sizes,"o",@progbits,.text.__open_print_sequence
	.long	.Lfunc_begin4
	.byte	0
	.section	.text.__open_print_sequence,"ax",@progbits
                                        // -- End function
	.section	.text.__transfer_cache_to_mram,"ax",@progbits
	.type	__transfer_cache_to_mram,@function // -- Begin function __transfer_cache_to_mram
__transfer_cache_to_mram:               // @__transfer_cache_to_mram
.Lfunc_begin5:
// %bb.0:
	lw r0, zero, __stdout_buffer_state
	lw r1, zero, __stdout_buffer_size
	add r2, r0, 8
	sw zero, __stdout_buffer_state, r2
	jltu r2, r1, .LBB5_2
// %bb.1:
	lw r1, zero, __stdout_nr_of_wrapping
	move r3, 0
	move r2, 1
	sd zero, __stdout_buffer_state, d2
	add r1, r1, 1
	sw zero, __stdout_nr_of_wrapping, r1
.LBB5_2:
	move r1, __stdout_buffer
	add r0, r0, r1
	move r1, __stdout_cache_buffer
	sdma r1, r0, 0
	jump r23
.Lfunc_end5:
	.size	__transfer_cache_to_mram, .Lfunc_end5-__transfer_cache_to_mram
	.section	.stack_sizes,"o",@progbits,.text.__transfer_cache_to_mram
	.long	.Lfunc_begin5
	.byte	0
	.section	.text.__transfer_cache_to_mram,"ax",@progbits
                                        // -- End function
	.section	.text.__finalized_print_sequence,"ax",@progbits
	.type	__finalized_print_sequence,@function // -- Begin function __finalized_print_sequence
__finalized_print_sequence:             // @__finalized_print_sequence
.Lfunc_begin6:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	lw r1, zero, __stdout_cache_write_index
	move r0, __stdout_cache_buffer
	add r0, r0, r1
	sub r2, 8, r1
	move r1, 0
	call r23, memset
	call r23, __transfer_cache_to_mram
	lw r0, zero, __stdout_nr_of_wrapping
	jgtu r0, 1, .LBB6_3
// %bb.1:
	jneq r0, 1, .LBB6_4
// %bb.2:
	lw r0, zero, __stdout_buffer_state
	lw r1, zero, __stdout_buffer_write_pointer_initial
	jleu r0, r1, .LBB6_4
.LBB6_3:
	// inline asm
	fault 5
	// inline asm
.LBB6_4:
	ld d22, r22, -8
	jump r23
.Lfunc_end6:
	.size	__finalized_print_sequence, .Lfunc_end6-__finalized_print_sequence
	.section	.stack_sizes,"o",@progbits,.text.__finalized_print_sequence
	.long	.Lfunc_begin6
	.byte	8
	.section	.text.__finalized_print_sequence,"ax",@progbits
                                        // -- End function
	.section	.text.__close_print_sequence,"ax",@progbits
	.type	__close_print_sequence,@function // -- Begin function __close_print_sequence
__close_print_sequence:                 // @__close_print_sequence
.Lfunc_begin7:
// %bb.0:
	// inline asm
.Ltmp1:
	release zero, __atomic_bit___stdout_buffer_lock, nz, .Ltmp1+1
	// inline asm
	jump r23
.Lfunc_end7:
	.size	__close_print_sequence, .Lfunc_end7-__close_print_sequence
	.section	.stack_sizes,"o",@progbits,.text.__close_print_sequence
	.long	.Lfunc_begin7
	.byte	0
	.section	.text.__close_print_sequence,"ax",@progbits
                                        // -- End function
	.type	__stdout_buffer_size,@object    // @__stdout_buffer_size
	.section	.data.__stdout_buffer_size,"aw",@progbits
	.weak	__stdout_buffer_size
	.p2align	2
__stdout_buffer_size:
	.long	1048576                         // 0x100000
	.size	__stdout_buffer_size, 4

	.type	__stdout_buffer,@object         // @__stdout_buffer
	.section	.mram.noinit,"aw",@progbits
	.weak	__stdout_buffer
	.p2align	3
__stdout_buffer:
	.zero	1048576
	.size	__stdout_buffer, 1048576

	.type	__stdout_buffer_state,@object   // @__stdout_buffer_state
	.section	.data.immediate_memory.__stdout_buffer_state,"aw",@progbits
	.globl	__stdout_buffer_state
	.p2align	3
__stdout_buffer_state:
	.zero	8
	.size	__stdout_buffer_state, 8

	.type	__atomic_bit___stdout_buffer_lock,@object // @__atomic_bit___stdout_buffer_lock
	.section	.atomic,"aw",@progbits
	.globl	__atomic_bit___stdout_buffer_lock
__atomic_bit___stdout_buffer_lock:
	.byte	0                               // 0x0
	.size	__atomic_bit___stdout_buffer_lock, 1

	.type	__stdout_cache_write_index,@object // @__stdout_cache_write_index
	.section	.bss.__stdout_cache_write_index,"aw",@nobits
	.p2align	2
__stdout_cache_write_index:
	.long	0                               // 0x0
	.size	__stdout_cache_write_index, 4

	.type	__stdout_nr_of_wrapping,@object // @__stdout_nr_of_wrapping
	.section	.bss.__stdout_nr_of_wrapping,"aw",@nobits
	.p2align	2
__stdout_nr_of_wrapping:
	.long	0                               // 0x0
	.size	__stdout_nr_of_wrapping, 4

	.type	__stdout_buffer_write_pointer_initial,@object // @__stdout_buffer_write_pointer_initial
	.section	.bss.__stdout_buffer_write_pointer_initial,"aw",@nobits
	.p2align	2
__stdout_buffer_write_pointer_initial:
	.long	0                               // 0x0
	.size	__stdout_buffer_write_pointer_initial, 4

	.type	__stdout_cache_buffer,@object   // @__stdout_cache_buffer
	.section	.bss.__stdout_cache_buffer,"aw",@nobits
	.p2align	3
__stdout_cache_buffer:
	.zero	8
	.size	__stdout_cache_buffer, 8

	.addrsig
	.addrsig_sym __stdout_buffer
	.addrsig_sym __stdout_buffer_state
	.addrsig_sym __atomic_bit___stdout_buffer_lock
	.addrsig_sym __stdout_cache_buffer
