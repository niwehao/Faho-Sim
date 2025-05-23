	.text
	.file	"strsep.c"
	.section	.text.strsep,"ax",@progbits
	.globl	strsep                          // -- Begin function strsep
	.type	strsep,@function
strsep:                                 // @strsep
.Lfunc_begin0:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sd r22, -16, d14
	move r15, r0
	lw r14, r15, 0
	jeq r14, 0, .LBB0_5
// %bb.1:
	move r0, r14
	call r23, strpbrk
	jeq r0, 0, .LBB0_2
// %bb.3:
	sb r0, 0, 0
	add r0, r0, 1, true, .LBB0_4
.LBB0_2:
	move r0, 0
.LBB0_4:
	sw r15, 0, r0
.LBB0_5:
	move r0, r14
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	strsep, .Lfunc_end0-strsep
	.section	.stack_sizes,"o",@progbits,.text.strsep
	.long	.Lfunc_begin0
	.byte	16
	.section	.text.strsep,"ax",@progbits
                                        // -- End function
	.addrsig
