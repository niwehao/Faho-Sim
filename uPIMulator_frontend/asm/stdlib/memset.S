	.text
	.file	"memset.c"
	.section	.text.__memset_wram_4align,"ax",@progbits
	.globl	__memset_wram_4align            // -- Begin function __memset_wram_4align
	.type	__memset_wram_4align,@function
__memset_wram_4align:                   // @__memset_wram_4align
.Lfunc_begin0:
// %bb.0:
	lsr r2, r2, 2, z, .LBB0_3
// %bb.1:
	and r3, r1, 255
	lsl_add r1, r3, r1, 24
	lsl_add r1, r1, r3, 8
	lsl_add r1, r1, r3, 16
	move r3, r0
.LBB0_2:                                // =>This Inner Loop Header: Depth=1
	sw r3, 0, r1
	add r3, r3, 4
	add r2, r2, -1, nz, .LBB0_2
.LBB0_3:
	jump r23
.Lfunc_end0:
	.size	__memset_wram_4align, .Lfunc_end0-__memset_wram_4align
	.section	.stack_sizes,"o",@progbits,.text.__memset_wram_4align
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__memset_wram_4align,"ax",@progbits
                                        // -- End function
	.section	.text.memset,"ax",@progbits
	.globl	memset                          // -- Begin function memset
	.type	memset,@function
memset:                                 // @memset
.Lfunc_begin1:
// %bb.0:
	and r3, r0, 3, z, .LBB1_1
// %bb.2:
	sub r4, 4, r3
	move r3, r2
	jgtu r4, r2, .LBB1_4
// %bb.3:
	move r3, r4
.LBB1_4:
	jeq r3, 0, .LBB1_7
// %bb.5:
	move r4, r0
	move r5, r3
.LBB1_6:                                // =>This Inner Loop Header: Depth=1
	sb r4, 0, r1
	add r4, r4, 1
	add r5, r5, -1, nz, .LBB1_6
.LBB1_7:
	sub r2, r2, r3
	add r3, r0, r3
	jgeu r2, 4, .LBB1_9
.LBB1_12:
	jeq r2, 0, .LBB1_14
.LBB1_13:                               // =>This Inner Loop Header: Depth=1
	sb r3, 0, r1
	add r3, r3, 1
	add r2, r2, -1, nz, .LBB1_13
.LBB1_14:
	jump r23
.LBB1_1:
	move r3, r0
	jltu r2, 4, .LBB1_12
.LBB1_9:
	and r4, r2, -4
	and r5, r1, 255
	lsl_add r6, r5, r1, 24
	lsl_add r6, r6, r5, 8
	lsl_add r5, r6, r5, 16
	lsr r6, r2, 2
	move r7, r3
.LBB1_10:                               // =>This Inner Loop Header: Depth=1
	sw r7, 0, r5
	add r7, r7, 4
	add r6, r6, -1, nz, .LBB1_10
// %bb.11:
	and r2, r2, 3
	add r3, r3, r4
	jneq r2, 0, .LBB1_13
	jump .LBB1_14
.Lfunc_end1:
	.size	memset, .Lfunc_end1-memset
	.section	.stack_sizes,"o",@progbits,.text.memset
	.long	.Lfunc_begin1
	.byte	0
	.section	.text.memset,"ax",@progbits
                                        // -- End function
	.section	.text.__memset_mram_8align,"ax",@progbits
	.globl	__memset_mram_8align            // -- Begin function __memset_mram_8align
	.type	__memset_mram_8align,@function
__memset_mram_8align:                   // @__memset_mram_8align
.Lfunc_begin2:
// %bb.0:
	and r3, r1, 255
	lsl_add r1, r3, r1, 24
	lsl_add r1, r1, r3, 8
	lsl_add r1, r1, r3, 16
	sw r22, 0, r1
	sw r22, 4, r1
	jeq r2, 0, .LBB2_3
// %bb.1:
	move r1, 0
.LBB2_2:                                // =>This Inner Loop Header: Depth=1
	add r3, r0, r1
	add r4, r22, 0
	add r1, r1, 8
	sdma r4, r3, 0
	jltu r1, r2, .LBB2_2
.LBB2_3:
	jump r23
.Lfunc_end2:
	.size	__memset_mram_8align, .Lfunc_end2-__memset_mram_8align
	.section	.stack_sizes,"o",@progbits,.text.__memset_mram_8align
	.long	.Lfunc_begin2
	.byte	8
	.section	.text.__memset_mram_8align,"ax",@progbits
                                        // -- End function
	.section	.text.__memset_mram,"ax",@progbits
	.globl	__memset_mram                   // -- Begin function __memset_mram
	.type	__memset_mram,@function
__memset_mram:                          // @__memset_mram
.Lfunc_begin3:
// %bb.0:
	and r3, r0, -8
	and r6, r0, 7, z, .LBB3_7
// %bb.1:
	sub r5, 8, r6
	move r4, r2
	jgtu r5, r2, .LBB3_3
// %bb.2:
	move r4, r5
.LBB3_3:
	add r5, r22, 8
	ldma r5, r3, 0
	jeq r4, 0, .LBB3_6
// %bb.4:
	or r6, r5, r6
	move r7, r4
.LBB3_5:                                // =>This Inner Loop Header: Depth=1
	sb r6, 0, r1
	add r6, r6, 1
	add r7, r7, -1, nz, .LBB3_5
.LBB3_6:
	sdma r5, r3, 0
	sub r2, r2, r4
	add r3, r3, 8
.LBB3_7:
	jltu r2, 8, .LBB3_12
// %bb.8:
	and r4, r1, 255
	lsl_add r5, r4, r1, 24
	lsl_add r5, r5, r4, 8
	lsl_add r4, r5, r4, 16
	sw r22, 0, r4
	sw r22, 4, r4
	and r4, r2, -8, z, .LBB3_11
// %bb.9:
	move r5, 0
.LBB3_10:                               // =>This Inner Loop Header: Depth=1
	add r6, r3, r5
	add r7, r22, 0
	add r5, r5, 8
	sdma r7, r6, 0
	jltu r5, r4, .LBB3_10
.LBB3_11:
	and r2, r2, 7
	add r3, r3, r4
.LBB3_12:
	jeq r2, 0, .LBB3_16
// %bb.13:
	add r4, r22, 8
	ldma r4, r3, 0
.LBB3_14:                               // =>This Inner Loop Header: Depth=1
	sb r4, 0, r1
	add r4, r4, 1
	add r2, r2, -1, nz, .LBB3_14
// %bb.15:
	add r1, r22, 8
	sdma r1, r3, 0
.LBB3_16:
	jump r23
.Lfunc_end3:
	.size	__memset_mram, .Lfunc_end3-__memset_mram
	.section	.stack_sizes,"o",@progbits,.text.__memset_mram
	.long	.Lfunc_begin3
	.byte	16
	.section	.text.__memset_mram,"ax",@progbits
                                        // -- End function
	.addrsig
	.addrsig_sym __memset_wram_4align
	.addrsig_sym __memset_mram_8align
	.addrsig_sym __memset_mram
