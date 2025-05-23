	.text
	.file	"strrev.c"
	.section	.text.strrev,"ax",@progbits
	.globl	strrev                          // -- Begin function strrev
	.type	strrev,@function
strrev:                                 // @strrev
.Lfunc_begin0:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sd r22, -16, d14
	move r14, r0
	call r23, strlen
	lsr r1, r0, 1, z, .LBB0_3
// %bb.1:
	add r0, r0, r14
	add r0, r0, -1
	move r2, r14
.LBB0_2:                                // =>This Inner Loop Header: Depth=1
	lbs r3, r0, 0
	lbs r4, r2, 0
	sb r2, 0, r3
	sb r0, 0, r4
	add r2, r2, 1
	add r0, r0, -1
	add r1, r1, -1, nz, .LBB0_2
.LBB0_3:
	move r0, r14
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	strrev, .Lfunc_end0-strrev
	.section	.stack_sizes,"o",@progbits,.text.strrev
	.long	.Lfunc_begin0
	.byte	16
	.section	.text.strrev,"ax",@progbits
                                        // -- End function
	.addrsig
