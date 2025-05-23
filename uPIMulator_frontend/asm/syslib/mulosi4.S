	.text
	.file	"mulosi4.c"
	.section	.text.__mulosi4,"ax",@progbits
	.globl	__mulosi4                       // -- Begin function __mulosi4
	.type	__mulosi4,@function
__mulosi4:                              // @__mulosi4
.Lfunc_begin0:
// %bb.0:
	sd r22, 16, d22
	add r22, r22, 24
	sd r22, -16, d14
	sd r22, -24, d16
	move r16, r2
	move r15, r1
	move r14, r0
	move r0, -2147483648
	sw r16, 0, 0
	jneq r14, r0, .LBB0_2
// %bb.1:
	jgeu r15, 2, .LBB0_9
	jump .LBB0_10
.LBB0_2:
	jneq r15, r0, .LBB0_4
// %bb.3:
	jgeu r14, 2, .LBB0_9
	jump .LBB0_10
.LBB0_4:
	asr r0, r14, 31
	xor r1, r0, r14
	sub r17, r1, r0
	jlts r17, 2, .LBB0_10
// %bb.5:
	asr r2, r15, 31
	xor r1, r2, r15
	sub r1, r1, r2
	jlts r1, 2, .LBB0_10
// %bb.6:
	jneq r0, r2, .LBB0_8
// %bb.7:
	move r0, 2147483647
	call r23, __udiv32
	jgts r17, r0, .LBB0_9
	jump .LBB0_10
.LBB0_8:
	neg r1, r1
	move r0, -2147483648
	call r23, __div32
	jles r17, r0, .LBB0_10
.LBB0_9:
	sw r16, 0, 1
.LBB0_10:
	move r0, r15
	move r1, r14
	call r23, __mulsi3
	ld d16, r22, -24
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	__mulosi4, .Lfunc_end0-__mulosi4
	.section	.stack_sizes,"o",@progbits,.text.__mulosi4
	.long	.Lfunc_begin0
	.byte	24
	.section	.text.__mulosi4,"ax",@progbits
                                        // -- End function
	.addrsig
