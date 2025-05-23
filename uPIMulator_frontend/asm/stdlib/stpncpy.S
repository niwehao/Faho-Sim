	.text
	.file	"stpncpy.c"
	.section	.text.stpncpy,"ax",@progbits
	.globl	stpncpy                         // -- Begin function stpncpy
	.type	stpncpy,@function
stpncpy:                                // @stpncpy
.Lfunc_begin0:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sd r22, -16, d14
	move r14, r0
	jeq r2, 0, .LBB0_7
// %bb.1:
	move r0, 0
.LBB0_2:                                // =>This Inner Loop Header: Depth=1
	add r3, r1, r0
	lbu r3, r3, 0
	jeq r3, 0, .LBB0_3
// %bb.5:                               //   in Loop: Header=BB0_2 Depth=1
	add r4, r14, r0
	add r0, r0, 1
	sb r4, 0, r3
	jneq r2, r0, .LBB0_2
// %bb.6:
	add r14, r14, r0
.LBB0_7:
	move r0, r14
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.LBB0_3:
	add r14, r14, r0
	jgeu r0, r2, .LBB0_7
// %bb.4:
	sub r2, r2, r0
	move r1, 0
	move r0, r14
	call r23, memset
	move r0, r14
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	stpncpy, .Lfunc_end0-stpncpy
	.section	.stack_sizes,"o",@progbits,.text.stpncpy
	.long	.Lfunc_begin0
	.byte	16
	.section	.text.stpncpy,"ax",@progbits
                                        // -- End function
	.addrsig
