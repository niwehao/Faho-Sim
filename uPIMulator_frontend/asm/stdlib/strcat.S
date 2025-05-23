	.text
	.file	"strcat.c"
	.section	.text.strcat,"ax",@progbits
	.globl	strcat                          // -- Begin function strcat
	.type	strcat,@function
strcat:                                 // @strcat
.Lfunc_begin0:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sd r22, -16, d14
	move r15, r1
	move r14, r0
	call r23, strlen
	lbu r2, r15, 0
	jeq r2, 0, .LBB0_1
// %bb.2:
	add r1, r14, r0
	move r3, 0
.LBB0_3:                                // =>This Inner Loop Header: Depth=1
	add r4, r1, r3
	sb r4, 0, r2
	add r2, r15, r3
	lbu r2, r2, 1
	add r4, r3, 1
	move r3, r4
	jneq r2, 0, .LBB0_3
	jump .LBB0_4
.LBB0_1:
	move r4, 0
.LBB0_4:
	add r0, r4, r0
	add r0, r14, r0
	sb r0, 0, 0
	move r0, r14
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	strcat, .Lfunc_end0-strcat
	.section	.stack_sizes,"o",@progbits,.text.strcat
	.long	.Lfunc_begin0
	.byte	16
	.section	.text.strcat,"ax",@progbits
                                        // -- End function
	.addrsig
