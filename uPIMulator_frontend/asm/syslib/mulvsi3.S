	.text
	.file	"mulvsi3.c"
	.section	.text.__mulvsi3,"ax",@progbits
	.globl	__mulvsi3                       // -- Begin function __mulvsi3
	.type	__mulvsi3,@function
__mulvsi3:                              // @__mulvsi3
.Lfunc_begin0:
// %bb.0:
	sd r22, 16, d22
	add r22, r22, 24
	sd r22, -16, d14
	sd r22, -24, d16
	move r2, -2147483648
	move r15, r1
	move r14, r0
	jneq r14, r2, .LBB0_4
// %bb.1:
	jgtu r15, 1, .LBB0_3
// %bb.2:
	lsl r0, r15, 31
	ld d16, r22, -24
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.LBB0_4:
	jneq r15, r2, .LBB0_8
// %bb.5:
	jgtu r14, 1, .LBB0_7
// %bb.6:
	lsl r0, r14, 31
	ld d16, r22, -24
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.LBB0_8:
	asr r0, r14, 31
	xor r1, r0, r14
	sub r16, r1, r0
	jlts r16, 2, .LBB0_14
// %bb.9:
	asr r2, r15, 31
	xor r1, r2, r15
	sub r1, r1, r2
	jlts r1, 2, .LBB0_14
// %bb.10:
	jneq r0, r2, .LBB0_13
// %bb.11:
	move r0, 2147483647
	call r23, __udiv32
	jles r16, r0, .LBB0_14
// %bb.12:
	move r0, .L.str
	move r2, .L__func__.__mulvsi3
	move r1, 45
	call r23, compilerrt_abort_impl
.LBB0_13:
	neg r1, r1
	move r0, -2147483648
	call r23, __div32
	jgts r16, r0, .LBB0_16
.LBB0_14:
	move r0, r15
	move r1, r14
	call r23, __mulsi3
	ld d16, r22, -24
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.LBB0_3:
	move r0, .L.str
	move r2, .L__func__.__mulvsi3
	move r1, 30
	call r23, compilerrt_abort_impl
.LBB0_7:
	move r0, .L.str
	move r2, .L__func__.__mulvsi3
	move r1, 35
	call r23, compilerrt_abort_impl
.LBB0_16:
	move r0, .L.str
	move r2, .L__func__.__mulvsi3
	move r1, 48
	call r23, compilerrt_abort_impl
.Lfunc_end0:
	.size	__mulvsi3, .Lfunc_end0-__mulvsi3
	.section	.stack_sizes,"o",@progbits,.text.__mulvsi3
	.long	.Lfunc_begin0
	.byte	24
	.section	.text.__mulvsi3,"ax",@progbits
                                        // -- End function
	.type	.L.str,@object                  // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"mulvsi3.c"
	.size	.L.str, 10

	.type	.L__func__.__mulvsi3,@object    // @__func__.__mulvsi3
.L__func__.__mulvsi3:
	.asciz	"__mulvsi3"
	.size	.L__func__.__mulvsi3, 10

	.addrsig
