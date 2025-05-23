	.text
	.file	"memmove.c"
	.section	.text.memmove,"ax",@progbits
	.globl	memmove                         // -- Begin function memmove
	.type	memmove,@function
memmove:                                // @memmove
.Lfunc_begin0:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sd r22, -16, d14
	move r14, r0
	jleu r14, r1, .LBB0_2
// %bb.1:
	add r0, r1, r2
	jleu r0, r14, .LBB0_2
// %bb.3:
	add r3, r14, r2
	xor r0, r1, r14
	and r5, r3, -4
	and r4, r0, 3
	move r0, r14
	jltu r5, r14, .LBB0_5
// %bb.4:
	move r0, r5
.LBB0_5:
	add r5, r14, 3
	jeq r4, 0, .LBB0_7
// %bb.6:
	move r0, r14
.LBB0_7:
	and r4, r5, -4
	sub r5, r3, r0
	add r6, r5, -1, mi, .LBB0_10
// %bb.8:
	add r6, r2, -1
	add r2, r14, r6
	add r6, r1, r6
	move r7, r5
.LBB0_9:                                // =>This Inner Loop Header: Depth=1
	lbs r8, r6, 0
	sb r2, 0, r8
	add r2, r2, -1
	add r6, r6, -1
	add r7, r7, -1
	jgts r7, 0, .LBB0_9
.LBB0_10:
	sub r2, r3, r5
	move r3, 0
	jltu r2, r4, .LBB0_12
// %bb.11:
	sub r3, r2, r4
	asr r3, r3, 2
.LBB0_12:
	jlts r3, 1, .LBB0_15
// %bb.13:
	add r4, r3, 1
	add r0, r0, -4
	sub r5, r0, r14
	add r5, r1, r5
.LBB0_14:                               // =>This Inner Loop Header: Depth=1
	lw r6, r5, 0
	sw r0, 0, r6
	add r0, r0, -4
	add r5, r5, -4
	add r4, r4, -1
	jgts r4, 1, .LBB0_14
.LBB0_15:
	lsl_sub r0, r2, r3, 2
	sub r0, r0, r14
	add r2, r0, -1, mi, .LBB0_17
.LBB0_16:                               // =>This Inner Loop Header: Depth=1
	add r2, r1, r0
	lbs r2, r2, -1
	add r3, r14, r0
	sb r3, -1, r2
	add r0, r0, -1
	jgts r0, 0, .LBB0_16
.LBB0_17:
	move r0, r14
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.LBB0_2:
	move r0, r14
	call r23, memcpy
	move r0, r14
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	memmove, .Lfunc_end0-memmove
	.section	.stack_sizes,"o",@progbits,.text.memmove
	.long	.Lfunc_begin0
	.byte	16
	.section	.text.memmove,"ax",@progbits
                                        // -- End function
	.section	.text.__memmove_mm,"ax",@progbits
	.globl	__memmove_mm                    // -- Begin function __memmove_mm
	.type	__memmove_mm,@function
__memmove_mm:                           // @__memmove_mm
.Lfunc_begin1:
// %bb.0:
	sd r22, 56, d22
	add r22, r22, 64
	sd r22, -40, d14
	sd r22, -48, d16
	sd r22, -56, d18
	sd r22, -64, d20
	move r15, r2
	move r21, r0
	jleu r21, r1, .LBB1_2
// %bb.1:
	add r14, r1, r15
	jleu r14, r21, .LBB1_2
// %bb.3:
	add r16, r21, r15
	and r20, r14, 7
	and r17, r16, 7
	jneq r20, r17, .LBB1_12
// %bb.4:
	move r17, r15
	jgtu r20, r15, .LBB1_6
// %bb.5:
	move r17, r20
.LBB1_6:
	jeq r20, 0, .LBB1_8
// %bb.7:
	sub r1, r20, r17
	sub r14, r14, r20
	sub r16, r16, r20
	add r18, r22, -24
	ldma r18, r16, 0
	add r2, r22, -32
	ldma r2, r14, 0
	add r0, r18, r1
	add r1, r2, r1
	move r2, r17
	call r23, memcpy
	sdma r18, r16, 0
	sub r15, r15, r17
.LBB1_8:
	add r0, r14, -8
	add r14, r16, -8
	jltu r15, 8, .LBB1_10
.LBB1_9:                                // =>This Inner Loop Header: Depth=1
	add r1, r22, -32
	ldma r1, r0, 0
	sdma r1, r14, 0
	add r0, r0, -8
	add r14, r14, -8
	add r15, r15, -8
	jgtu r15, 7, .LBB1_9
.LBB1_10:
	jeq r15, 0, .LBB1_29
// %bb.11:
	sub r1, 8, r15
	add r16, r22, -24
	ldma r16, r14, 0
	add r2, r22, -32
	ldma r2, r0, 0
	add r0, r16, r1
	add r1, r2, r1
	move r2, r15
	call r23, memcpy
	sdma r16, r14, 0
	jump .LBB1_29
.LBB1_2:
	move r0, r21
	move r2, r15
	call r23, __memcpy_mm
.LBB1_29:
	move r0, r21
	ld d20, r22, -64
	ld d18, r22, -56
	ld d16, r22, -48
	ld d14, r22, -40
	ld d22, r22, -8
	jump r23
.LBB1_12:
	move r0, r17
	jltu r17, r20, .LBB1_14
// %bb.13:
	move r0, r20
.LBB1_14:
	jgeu r0, r15, .LBB1_15
// %bb.16:
	add r0, r22, -32
	ldma r0, r14, 0
	add r14, r14, -8
	jeq r17, 0, .LBB1_21
// %bb.17:
	add r0, r17, 7
	and r0, r0, 8
	add r18, r22, -24
	sub r1, r18, r0
	add r1, r1, 8
	move r2, -1
	lsr_add r0, r2, r0, 3
	lsl_add r0, r1, r0, 24
	ldma r0, r16, 0
	jgeu r17, r20, .LBB1_19
// %bb.18:
	add r0, r22, -32
	or r0, r0, r20
	sub r1, r0, r17
	add r0, r22, -24
	move r2, r17
	call r23, memcpy
	sub r20, r20, r17, true, .LBB1_20
.LBB1_15:
	add r14, r22, -24
	ldma r14, r21, 0
	add r2, r22, -32
	ldma r2, r1, 0
	or r0, r14, r17
	sub r0, r0, r15
	or r1, r2, r20
	sub r1, r1, r15
	move r2, r15
	call r23, memcpy
	sdma r14, r21, 0
	jump .LBB1_29
.LBB1_19:
	or r0, r18, r17
	sub r0, r0, r20
	add r19, r22, -32
	move r1, r19
	move r2, r20
	call r23, memcpy
	ldma r19, r14, 0
	add r14, r14, -8
	sub r20, r17, r20
	sub r0, r19, r20
	add r1, r0, 8
	move r0, r18
	move r2, r20
	call r23, memcpy
	sub r20, 8, r20
.LBB1_20:
	add r0, r22, -24
	sdma r0, r16, 0
	add r16, r16, -8
	sub r15, r15, r17
.LBB1_21:
	sw r22, -12, r21
	jltu r15, 8, .LBB1_22
// %bb.23:
	add r17, r22, -32
	add r0, r20, r17
	sw r22, -16, r0
	sub r19, 8, r20
	move r18, r20
	add r20, r22, -24
	sub r0, r20, r18
	add r21, r0, 8
.LBB1_24:                               // =>This Inner Loop Header: Depth=1
	move r0, r21
	move r1, r17
	move r2, r18
	call r23, memcpy
	ldma r17, r14, 0
	add r14, r14, -8
	move r0, r20
	lw r1, r22, -16
	move r2, r19
	call r23, memcpy
	sdma r20, r16, 0
	add r16, r16, -8
	add r15, r15, -8
	jgtu r15, 7, .LBB1_24
	jump .LBB1_25
.LBB1_22:
	move r18, r20
.LBB1_25:
	move r20, r18
	lw r21, r22, -12
	jeq r15, 0, .LBB1_29
// %bb.26:
	add r18, r22, -24
	ldma r18, r16, 0
	add r19, r18, 8
	sub r0, r19, r20
	add r17, r22, -32
	move r1, r17
	move r2, r20
	call r23, memcpy
	jleu r15, r20, .LBB1_28
// %bb.27:
	sub r2, r15, r20
	ldma r17, r14, 0
	sub r0, r19, r15
	sub r1, r17, r2
	add r1, r1, 8
	call r23, memcpy
.LBB1_28:
	sdma r18, r16, 0
	jump .LBB1_29
.Lfunc_end1:
	.size	__memmove_mm, .Lfunc_end1-__memmove_mm
	.section	.stack_sizes,"o",@progbits,.text.__memmove_mm
	.long	.Lfunc_begin1
	.byte	64
	.section	.text.__memmove_mm,"ax",@progbits
                                        // -- End function
	.addrsig
