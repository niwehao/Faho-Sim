	.text
	.file	"strndup.c"
	.section	.text.strndup,"ax",@progbits
	.globl	strndup                         // -- Begin function strndup
	.type	strndup,@function
strndup:                                // @strndup
.Lfunc_begin0:
// %bb.0:
	sd r22, 16, d22
	add r22, r22, 24
	sd r22, -16, d14
	sd r22, -24, d16
	move r14, r0
	call r23, strnlen
	move r15, r0
	add r0, r15, 1
	call r23, buddy_alloc
	move r16, r0, z, .LBB0_2
// %bb.1:
	move r0, r16
	move r1, r14
	move r2, r15
	call r23, memcpy
	add r0, r16, r15
	sb r0, 1, 0
.LBB0_2:
	move r0, r16
	ld d16, r22, -24
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	strndup, .Lfunc_end0-strndup
	.section	.stack_sizes,"o",@progbits,.text.strndup
	.long	.Lfunc_begin0
	.byte	24
	.section	.text.strndup,"ax",@progbits
                                        // -- End function
	.addrsig
