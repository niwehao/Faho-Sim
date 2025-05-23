	.text
	.file	"buddy_alloc.c"
	.section	.text.safe_buddy_alloc,"ax",@progbits
	.globl	safe_buddy_alloc                // -- Begin function safe_buddy_alloc
	.type	safe_buddy_alloc,@function
safe_buddy_alloc:                       // @safe_buddy_alloc
.Lfunc_begin0:
// %bb.0:
	sd r22, 0, d14
	lw r1, zero, __BUDDY_SIZE_OF_HEAP__
	add r2, r0, -1
	jgeu r2, r1, .LBB0_4
// %bb.1:
	clz r2, r0
	add r1, r2, -31
	cao r0, r0
	jneq r0, 1, .LBB0_5
// %bb.2:
	lbu r3, zero, __BUDDY_MAX_POWER__
	lbu r2, zero, __BUDDY_NUMBER_OF_LEVELS__
	add r0, r1, r3
	jges r0, r2, .LBB0_6
.LBB0_3:
	jges r0, 0, .LBB0_7
	jump .LBB0_33
.LBB0_4:
	move r0, 28
	sw id4, __errno, r0
	move r0, 0
	ld d14, r22, 0
	jump r23
.LBB0_5:
	or r1, r2, -32
	lbu r3, zero, __BUDDY_MAX_POWER__
	lbu r2, zero, __BUDDY_NUMBER_OF_LEVELS__
	add r0, r1, r3
	jlts r0, r2, .LBB0_3
.LBB0_6:
	add r0, r2, -1, mi, .LBB0_33
.LBB0_7:
	lw r2, zero, __buddy_blocks
	lw r1, zero, __buddy_heap_start
	sub r3, r3, r0
	add r4, r0, 1
	move r5, r0, true, .LBB0_12
.LBB0_8:                                //   in Loop: Header=BB0_12 Depth=1
	move r9, r0
.LBB0_9:                                //   in Loop: Header=BB0_12 Depth=1
	move r8, r7
	move r5, r9
	jgts r6, -1, .LBB0_34
.LBB0_11:                               //   in Loop: Header=BB0_12 Depth=1
	move r6, r5
	add r5, r6, -1
	jles r6, 0, .LBB0_33
.LBB0_12:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_17 Depth 2
                                        //     Child Loop BB0_28 Depth 2
	lsl r7, one, r5
	jgeu r5, 5, .LBB0_14
// %bb.13:                              //   in Loop: Header=BB0_12 Depth=1
	lsl r6, r5, 2
	lw r12, r6, .Lswitch.table.safe_buddy_alloc
	move r10, 0, true, .LBB0_16
.LBB0_14:                               //   in Loop: Header=BB0_12 Depth=1
	jles r7, 31, .LBB0_11
// %bb.15:                              //   in Loop: Header=BB0_12 Depth=1
	asr r6, r7, 5
	add r10, r6, -1
	move r12, -1
.LBB0_16:                               //   in Loop: Header=BB0_12 Depth=1
	asr r9, r7, 5
	lsl_add r13, r2, r9, 2
	add r8, r7, -1
.LBB0_17:                               //   Parent Loop BB0_12 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	move r6, r10
	lsl_add r10, r13, r6, 2
	lw r10, r10, 0
	and r11, r10, r12
	lsl r14, r11, 1
	xor r14, r14, r11
	and r14, r14, -1431655766
	jneq r14, 0, .LBB0_19
// %bb.18:                              //   in Loop: Header=BB0_17 Depth=2
	add r10, r6, -1
	add r8, r8, -32
	jgts r6, 0, .LBB0_17
	jump .LBB0_11
.LBB0_19:                               //   in Loop: Header=BB0_12 Depth=1
	jlts r5, 5, .LBB0_21
// %bb.20:                              //   in Loop: Header=BB0_12 Depth=1
	move r7, 0
.LBB0_21:                               //   in Loop: Header=BB0_12 Depth=1
	clz r12, r14
	sub r13, r7, r12
	add r13, r13, r8
	lsl r13, one, r13
	jges r5, 4, .LBB0_23
// %bb.22:                              //   in Loop: Header=BB0_12 Depth=1
	move r14, -2
	lsl r14, r14, r5
	add r14, r14, 32, true, .LBB0_24
.LBB0_23:                               //   in Loop: Header=BB0_12 Depth=1
	move r14, 0
.LBB0_24:                               //   in Loop: Header=BB0_12 Depth=1
	lsl_add r9, r2, r9, 2
	lsl r13, r13, r14
	and r11, r13, r11
	move r14, 0
	sub r11, r11, r14, eq
	sub r7, r7, r11
	sub r7, r7, r12
	add r7, r7, r8
	lsr r8, r13, r11
	sub r8, r10, r8
	lsl_add r9, r9, r6, 2
	sw r9, 0, r8
	jeq r0, r5, .LBB0_8
// %bb.25:                              //   in Loop: Header=BB0_12 Depth=1
	add r9, r5, 1
	jlts r5, r0, .LBB0_28
	jump .LBB0_9
.LBB0_31:                               //   in Loop: Header=BB0_28 Depth=2
	add r11, r5, -4
	lsl r11, one, r11
	lsr r7, r7, 4
	and r7, r7, 134217727
	add r11, r11, r7
.LBB0_27:                               //   in Loop: Header=BB0_28 Depth=2
	lsl_add r7, r2, r11, 2
	lw r11, r7, 0
	lsl r9, r10, r9
	add r9, r11, r9
	add r5, r5, 1
	sw r7, 0, r9
	move r7, r8
	jeq r0, r5, .LBB0_32
.LBB0_28:                               //   Parent Loop BB0_12 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	jges r5, 3, .LBB0_30
// %bb.29:                              //   in Loop: Header=BB0_28 Depth=2
	add r8, r5, 1
	move r9, -2
	lsl r8, r9, r8
	add r9, r8, 32
	lsl r8, r7, 1
	lsl r10, lneg, r8
	move r11, 0
	jlts r5, 4, .LBB0_27
	jump .LBB0_31
.LBB0_30:                               //   in Loop: Header=BB0_28 Depth=2
	move r9, 0
	lsl r8, r7, 1
	lsl r10, lneg, r8
	move r11, 0
	jlts r5, 4, .LBB0_27
	jump .LBB0_31
.LBB0_32:                               //   in Loop: Header=BB0_12 Depth=1
	move r9, r4
	move r5, r9
	jles r6, -1, .LBB0_11
.LBB0_34:
	lsl r0, r8, r3
	add r0, r1, r0
	ld d14, r22, 0
	jump r23
.LBB0_33:
	move r0, 49
	sw id4, __errno, r0
	move r0, 0
	ld d14, r22, 0
	jump r23
.Lfunc_end0:
	.size	safe_buddy_alloc, .Lfunc_end0-safe_buddy_alloc
	.section	.stack_sizes,"o",@progbits,.text.safe_buddy_alloc
	.long	.Lfunc_begin0
	.byte	8
	.section	.text.safe_buddy_alloc,"ax",@progbits
                                        // -- End function
	.section	.text.buddy_search_for_pointer,"ax",@progbits
	.globl	buddy_search_for_pointer        // -- Begin function buddy_search_for_pointer
	.type	buddy_search_for_pointer,@function
buddy_search_for_pointer:               // @buddy_search_for_pointer
.Lfunc_begin1:
// %bb.0:
	and r2, r0, 7, nz, .LBB1_3
// %bb.1:
	lw r2, zero, __buddy_heap_start
	jgtu r2, r0, .LBB1_3
// %bb.2:
	lw r3, zero, __BUDDY_SIZE_OF_HEAP__
	add r3, r2, r3
	add r3, r3, -1
	jgeu r3, r0, .LBB1_4
.LBB1_3:
	move r0, 28
	sw id4, __errno, r0
	move r0, -1
	jump r23
.LBB1_4:
	lbu r4, zero, __BUDDY_NUMBER_OF_LEVELS__
	lw r3, zero, __buddy_blocks
	sub r0, r0, r2
	asr r0, r0, 4
	add r2, r4, -1
	lsl r4, one, r0
	clz r5, r4
	and r5, r5, 1, z, .LBB1_6
.LBB1_7:
	lsl r5, r4, 1
	add r6, r2, -4, mi, .LBB1_9
.LBB1_10:
	move r6, 0
	add r7, r2, -5, mi, .LBB1_12
.LBB1_13:
	lsl r7, one, r7
	lsr_add r7, r7, r0, 5
	lsl r8, r4, r6
	lsl r4, r5, r6
	jneq r2, 0, .LBB1_15
	jump .LBB1_16
.LBB1_6:
	lsr r5, r4, 1
	add r6, r2, -4, pl, .LBB1_10
.LBB1_9:
	move r6, -2
	lsl r6, r6, r2
	add r6, r6, 32
	add r7, r2, -5, pl, .LBB1_13
.LBB1_12:
	move r7, 0
	lsl r8, r4, r6
	lsl r4, r5, r6
	jeq r2, 0, .LBB1_16
.LBB1_15:
	lsl_add r5, r3, r7, 2
	lw r5, r5, 0
	and r6, r8, r5, z, .LBB1_16
// %bb.18:
	and r4, r4, r5, z, .LBB1_3
// %bb.19:
	lsr r0, r0, 1
	add r2, r2, -1
	lsl r4, one, r0
	clz r5, r4
	and r5, r5, 1
	jneq r5, 0, .LBB1_7
	jump .LBB1_6
.LBB1_16:
	sw r1, 0, r2
	sw r1, 4, r7
	sw r1, 8, r8
	sw r1, 12, r4
	jump r23
.Lfunc_end1:
	.size	buddy_search_for_pointer, .Lfunc_end1-buddy_search_for_pointer
	.section	.stack_sizes,"o",@progbits,.text.buddy_search_for_pointer
	.long	.Lfunc_begin1
	.byte	0
	.section	.text.buddy_search_for_pointer,"ax",@progbits
                                        // -- End function
	.section	.text.safe_buddy_free,"ax",@progbits
	.globl	safe_buddy_free                 // -- Begin function safe_buddy_free
	.type	safe_buddy_free,@function
safe_buddy_free:                        // @safe_buddy_free
.Lfunc_begin2:
// %bb.0:
	and r1, r0, 7, nz, .LBB2_3
// %bb.1:
	lw r2, zero, __buddy_heap_start
	jgtu r2, r0, .LBB2_3
// %bb.2:
	lw r1, zero, __BUDDY_SIZE_OF_HEAP__
	add r1, r2, r1
	add r1, r1, -1
	jgeu r1, r0, .LBB2_4
.LBB2_3:
	move r0, 28
	sw id4, __errno, r0
	jump r23
.LBB2_4:
	lbu r3, zero, __BUDDY_NUMBER_OF_LEVELS__
	lw r1, zero, __buddy_blocks
	sub r0, r0, r2
	asr r2, r0, 4
	add r0, r3, -2
	lsl r3, one, r2
	clz r4, r3
	and r4, r4, 1, z, .LBB2_6
.LBB2_7:
	lsl r5, r3, 1
	add r4, r0, -3, mi, .LBB2_9
.LBB2_10:
	move r6, 0
	add r4, r0, -4, mi, .LBB2_12
.LBB2_13:
	lsl r4, one, r4
	lsr_add r7, r4, r2, 5, true, .LBB2_14
.LBB2_6:
	lsr r5, r3, 1
	add r4, r0, -3, pl, .LBB2_10
.LBB2_9:
	add r4, r0, 1
	move r6, -2
	lsl r4, r6, r4
	add r6, r4, 32
	add r4, r0, -4, pl, .LBB2_13
.LBB2_12:
	move r7, 0
.LBB2_14:
	lsl_add r4, r1, r7, 2
	lw r8, r4, 0
	lsl r4, r3, r6
	lsl r5, r5, r6
	jeq r0, -1, .LBB2_18
// %bb.15:
	and r3, r4, r8, z, .LBB2_18
// %bb.16:
	and r3, r5, r8, z, .LBB2_3
// %bb.17:
	lsr r2, r2, 1
	add r0, r0, -1
	lsl r3, one, r2
	clz r4, r3
	and r4, r4, 1
	jneq r4, 0, .LBB2_7
	jump .LBB2_6
.LBB2_18:
	jeq r2, -1, .LBB2_32
// %bb.19:
	lsl_add r3, r1, r7, 2
	or r6, r8, r4
	sw r3, 0, r6
	jneq r0, -1, .LBB2_20
.LBB2_32:
	jump r23
.LBB2_30:                               //   in Loop: Header=BB2_20 Depth=1
	lsl r7, one, r7
	lsr_add r2, r7, r2, 6
.LBB2_31:                               //   in Loop: Header=BB2_20 Depth=1
	lsl_add r2, r1, r2, 2
	lw r7, r2, 0
	lsl r4, r4, r6
	lsl r5, r5, r6
	or r6, r7, r4
	sw r2, 0, r6
	move r2, r3
	add r0, r0, -1
	jeq r0, -1, .LBB2_32
.LBB2_20:                               // =>This Inner Loop Header: Depth=1
	and r3, r5, r6, z, .LBB2_32
// %bb.21:                              //   in Loop: Header=BB2_20 Depth=1
	and r3, r4, r6, z, .LBB2_32
// %bb.22:                              //   in Loop: Header=BB2_20 Depth=1
	lsr r3, r2, 1
	lsl r4, one, r3
	clz r5, r4
	and r5, r5, 1, z, .LBB2_23
// %bb.24:                              //   in Loop: Header=BB2_20 Depth=1
	lsl r5, r4, 1
	add r6, r0, -4, mi, .LBB2_26
.LBB2_27:                               //   in Loop: Header=BB2_20 Depth=1
	move r6, 0
	add r7, r0, -5
	jges r7, 0, .LBB2_30
	jump .LBB2_29
.LBB2_23:                               //   in Loop: Header=BB2_20 Depth=1
	lsr r5, r4, 1
	add r6, r0, -4, pl, .LBB2_27
.LBB2_26:                               //   in Loop: Header=BB2_20 Depth=1
	move r6, -2
	lsl r6, r6, r0
	add r6, r6, 32
	add r7, r0, -5, pl, .LBB2_30
.LBB2_29:                               //   in Loop: Header=BB2_20 Depth=1
	move r2, 0, true, .LBB2_31
.Lfunc_end2:
	.size	safe_buddy_free, .Lfunc_end2-safe_buddy_free
	.section	.stack_sizes,"o",@progbits,.text.safe_buddy_free
	.long	.Lfunc_begin2
	.byte	0
	.section	.text.safe_buddy_free,"ax",@progbits
                                        // -- End function
	.section	.text.buddy_alloc,"ax",@progbits
	.globl	buddy_alloc                     // -- Begin function buddy_alloc
	.type	buddy_alloc,@function
buddy_alloc:                            // @buddy_alloc
.Lfunc_begin3:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	// inline asm
.Ltmp0:
	acquire zero, __atomic_bit___buddy_lock, nz, .Ltmp0
	// inline asm
	call r23, safe_buddy_alloc
	// inline asm
.Ltmp1:
	release zero, __atomic_bit___buddy_lock, nz, .Ltmp1+1
	// inline asm
	ld d22, r22, -8
	jump r23
.Lfunc_end3:
	.size	buddy_alloc, .Lfunc_end3-buddy_alloc
	.section	.stack_sizes,"o",@progbits,.text.buddy_alloc
	.long	.Lfunc_begin3
	.byte	8
	.section	.text.buddy_alloc,"ax",@progbits
                                        // -- End function
	.section	.text.buddy_free,"ax",@progbits
	.globl	buddy_free                      // -- Begin function buddy_free
	.type	buddy_free,@function
buddy_free:                             // @buddy_free
.Lfunc_begin4:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	// inline asm
.Ltmp2:
	acquire zero, __atomic_bit___buddy_lock, nz, .Ltmp2
	// inline asm
	call r23, safe_buddy_free
	// inline asm
.Ltmp3:
	release zero, __atomic_bit___buddy_lock, nz, .Ltmp3+1
	// inline asm
	ld d22, r22, -8
	jump r23
.Lfunc_end4:
	.size	buddy_free, .Lfunc_end4-buddy_free
	.section	.stack_sizes,"o",@progbits,.text.buddy_free
	.long	.Lfunc_begin4
	.byte	8
	.section	.text.buddy_free,"ax",@progbits
                                        // -- End function
	.section	.text.buddy_init,"ax",@progbits
	.globl	buddy_init                      // -- Begin function buddy_init
	.type	buddy_init,@function
buddy_init:                             // @buddy_init
.Lfunc_begin5:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sd r22, -16, d14
	lbu r1, zero, __buddy_init_done
	jnz r1, .LBB5_2
// %bb.1:
	// inline asm
.Ltmp4:
	release zero, __atomic_bit___buddy_lock, nz, .Ltmp4+1
	// inline asm
	sw zero, __BUDDY_SIZE_OF_HEAP__, r0
	clz r1, r0
	xor r2, r1, 31
	sb zero, __BUDDY_MAX_POWER__, r2
	sub r1, 28, r1
	sb zero, __BUDDY_NUMBER_OF_LEVELS__, r1
	and r1, r1, 255
	add r1, r1, -5
	move r2, 4
	lsl r14, r2, r1
	add r0, r14, r0
	call r23, mem_alloc
	sw zero, __buddy_blocks, r0
	add r1, r0, r14
	sw zero, __buddy_heap_start, r1
	move r1, 2147483647
	sw r0, 0, r1
	add r0, r0, 4
	add r2, r14, -4
	move r1, 255
	call r23, memset
	move r0, __buddy_init_done
	sb r0, 0, 1
.LBB5_2:
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end5:
	.size	buddy_init, .Lfunc_end5-buddy_init
	.section	.stack_sizes,"o",@progbits,.text.buddy_init
	.long	.Lfunc_begin5
	.byte	16
	.section	.text.buddy_init,"ax",@progbits
                                        // -- End function
	.section	.text.buddy_reset,"ax",@progbits
	.globl	buddy_reset                     // -- Begin function buddy_reset
	.type	buddy_reset,@function
buddy_reset:                            // @buddy_reset
.Lfunc_begin6:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	// inline asm
.Ltmp5:
	acquire zero, __atomic_bit___buddy_lock, nz, .Ltmp5
	// inline asm
	lw r0, zero, __buddy_blocks
	move r1, 2147483647
	sw r0, 0, r1
	lbu r1, zero, __BUDDY_NUMBER_OF_LEVELS__
	add r0, r0, 4
	add r1, r1, -5
	move r2, 4
	lsl r1, r2, r1
	add r2, r1, -4
	move r1, 255
	call r23, memset
	// inline asm
.Ltmp6:
	release zero, __atomic_bit___buddy_lock, nz, .Ltmp6+1
	// inline asm
	ld d22, r22, -8
	jump r23
.Lfunc_end6:
	.size	buddy_reset, .Lfunc_end6-buddy_reset
	.section	.stack_sizes,"o",@progbits,.text.buddy_reset
	.long	.Lfunc_begin6
	.byte	8
	.section	.text.buddy_reset,"ax",@progbits
                                        // -- End function
	.type	__BUDDY_SIZE_OF_HEAP__,@object  // @__BUDDY_SIZE_OF_HEAP__
	.section	.bss.__BUDDY_SIZE_OF_HEAP__,"aw",@nobits
	.p2align	2
__BUDDY_SIZE_OF_HEAP__:
	.long	0                               // 0x0
	.size	__BUDDY_SIZE_OF_HEAP__, 4

	.type	__BUDDY_MAX_POWER__,@object     // @__BUDDY_MAX_POWER__
	.section	.bss.__BUDDY_MAX_POWER__,"aw",@nobits
	.p2align	2
__BUDDY_MAX_POWER__:
	.byte	0                               // 0x0
	.size	__BUDDY_MAX_POWER__, 1

	.type	__BUDDY_NUMBER_OF_LEVELS__,@object // @__BUDDY_NUMBER_OF_LEVELS__
	.section	.bss.__BUDDY_NUMBER_OF_LEVELS__,"aw",@nobits
	.p2align	2
__BUDDY_NUMBER_OF_LEVELS__:
	.byte	0                               // 0x0
	.size	__BUDDY_NUMBER_OF_LEVELS__, 1

	.type	__buddy_blocks,@object          // @__buddy_blocks
	.section	.bss.__buddy_blocks,"aw",@nobits
	.p2align	2
__buddy_blocks:
	.long	0
	.size	__buddy_blocks, 4

	.type	__buddy_heap_start,@object      // @__buddy_heap_start
	.section	.bss.__buddy_heap_start,"aw",@nobits
	.p2align	2
__buddy_heap_start:
	.long	0
	.size	__buddy_heap_start, 4

	.type	__atomic_bit___buddy_lock,@object // @__atomic_bit___buddy_lock
	.section	.atomic,"aw",@progbits
	.globl	__atomic_bit___buddy_lock
__atomic_bit___buddy_lock:
	.byte	0                               // 0x0
	.size	__atomic_bit___buddy_lock, 1

	.type	__buddy_init_done,@object       // @__buddy_init_done
	.section	.bss.__buddy_init_done,"aw",@nobits
	.p2align	2
__buddy_init_done:
	.byte	0                               // 0x0
	.size	__buddy_init_done, 1

	.type	.Lswitch.table.safe_buddy_alloc,@object // @switch.table.safe_buddy_alloc
	.section	.rodata..Lswitch.table.safe_buddy_alloc,"a",@progbits
	.p2align	2
.Lswitch.table.safe_buddy_alloc:
	.long	1073741824                      // 0x40000000
	.long	805306368                       // 0x30000000
	.long	251658240                       // 0xf000000
	.long	16711680                        // 0xff0000
	.long	65535                           // 0xffff
	.size	.Lswitch.table.safe_buddy_alloc, 20

	.addrsig
	.addrsig_sym __atomic_bit___buddy_lock
