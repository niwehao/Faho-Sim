	.text
	.file	"strncpy.c"
	.section	.text.strncpy,"ax",@progbits
	.globl	strncpy                         // -- Begin function strncpy
	.type	strncpy,@function
strncpy:                                // @strncpy
.Lfunc_begin0:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sd r22, -16, d14
	move r14, r0
	jeq r2, 0, .LBB0_6
// %bb.1:
	move r3, 0
.LBB0_2:                                // =>This Inner Loop Header: Depth=1
	add r0, r1, r3
	lbu r0, r0, 0
	jeq r0, 0, .LBB0_3
// %bb.5:                               //   in Loop: Header=BB0_2 Depth=1
	add r4, r14, r3
	add r3, r3, 1
	sb r4, 0, r0
	jneq r2, r3, .LBB0_2
.LBB0_6:
	move r0, r14
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.LBB0_3:
	jgeu r3, r2, .LBB0_6
// %bb.4:
	add r0, r14, r3
	sub r2, r2, r3
	move r1, 0
	call r23, memset
	move r0, r14
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	strncpy, .Lfunc_end0-strncpy
	.section	.stack_sizes,"o",@progbits,.text.strncpy
	.long	.Lfunc_begin0
	.byte	16
	.section	.text.strncpy,"ax",@progbits
                                        // -- End function
	.addrsig
