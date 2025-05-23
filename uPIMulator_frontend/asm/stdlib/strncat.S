	.text
	.file	"strncat.c"
	.section	.text.strncat,"ax",@progbits
	.globl	strncat                         // -- Begin function strncat
	.type	strncat,@function
strncat:                                // @strncat
.Lfunc_begin0:
// %bb.0:
	sd r22, 16, d22
	add r22, r22, 24
	sd r22, -16, d14
	sd r22, -24, d16
	move r15, r2
	move r16, r1
	move r14, r0
	call r23, strlen
	jeq r15, 0, .LBB0_1
// %bb.2:
	add r2, r14, r0
	move r1, 0
.LBB0_3:                                // =>This Inner Loop Header: Depth=1
	add r3, r16, r1
	lbu r3, r3, 0
	jeq r3, 0, .LBB0_6
// %bb.4:                               //   in Loop: Header=BB0_3 Depth=1
	add r4, r2, r1
	add r1, r1, 1
	sb r4, 0, r3
	jneq r15, r1, .LBB0_3
// %bb.5:
	move r1, r15, true, .LBB0_6
.LBB0_1:
	move r1, 0
.LBB0_6:
	add r0, r1, r0
	add r0, r14, r0
	sb r0, 0, 0
	move r0, r14
	ld d16, r22, -24
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	strncat, .Lfunc_end0-strncat
	.section	.stack_sizes,"o",@progbits,.text.strncat
	.long	.Lfunc_begin0
	.byte	24
	.section	.text.strncat,"ax",@progbits
                                        // -- End function
	.addrsig
