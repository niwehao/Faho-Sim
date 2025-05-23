	.text
	.file	"mulvdi3.c"
	.section	.text.__mulvdi3,"ax",@progbits
	.globl	__mulvdi3                       // -- Begin function __mulvdi3
	.type	__mulvdi3,@function
__mulvdi3:                              // @__mulvdi3
.Lfunc_begin0:
// %bb.0:
	sd r22, 24, d22
	add r22, r22, 32
	sd r22, -16, d14
	sd r22, -24, d16
	sd r22, -32, d18
	move r5, 0
	move r4, 2147483648
	movd d16, d2
	movd d14, d0
	jneq r15, r5, .LBB0_4
// %bb.17:
	jneq r14, r4, .LBB0_4
// %bb.18:
// %bb.1:
	move.s d0, 1
	sub zero, r17, r1
	subc zero, r16, r0, xgtu, .LBB0_3
// %bb.2:
	move r1, 0
	lsl r0, r17, 31, true, .LBB0_15
.LBB0_4:
	jneq r17, r5, .LBB0_8
// %bb.19:
	jneq r16, r4, .LBB0_8
// %bb.20:
// %bb.5:
	move.s d0, 1
	sub zero, r15, r1
	subc zero, r14, r0, xgtu, .LBB0_7
// %bb.6:
	move r1, 0
	lsl r0, r15, 31, true, .LBB0_15
.LBB0_8:
	asr.s d0, r14, 31
	xor r3, r1, r15
	xor r2, r0, r14
	sub r19, r3, r1
	subc r18, r2, r0
	move.s d6, 2
	asr.s d4, r16, 31
	sub zero, r19, r7
	subc zero, r18, r6, lts, .LBB0_14
// %bb.9:
	xor r3, r5, r17
	xor r2, r4, r16
	sub r3, r3, r5
	subc r2, r2, r4
	sub zero, r3, r7
	subc zero, r2, r6, lts, .LBB0_14
// %bb.10:
	jneq r1, r5, .LBB0_13
// %bb.21:
	jneq r0, r4, .LBB0_13
// %bb.22:
// %bb.11:
	move r1, 4294967295
	move r0, 2147483647
	call r23, __udivdi3
	sub zero, r19, r1
	subc zero, r18, r0, xles, .LBB0_14
// %bb.12:
	move r0, .L.str
	move r2, .L__func__.__mulvdi3
	move r1, 45
	call r23, compilerrt_abort_impl
.LBB0_13:
	move.s d0, 0
	sub r3, r1, r3
	subc r2, r0, r2
	move r1, 0
	move r0, 2147483648
	call r23, __divdi3
	sub zero, r19, r1
	subc zero, r18, r0, xgts, .LBB0_16
.LBB0_14:
	movd d0, d16
	movd d2, d14
	call r23, __muldi3
.LBB0_15:
	ld d18, r22, -32
	ld d16, r22, -24
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.LBB0_3:
	move r0, .L.str
	move r2, .L__func__.__mulvdi3
	move r1, 30
	call r23, compilerrt_abort_impl
.LBB0_7:
	move r0, .L.str
	move r2, .L__func__.__mulvdi3
	move r1, 35
	call r23, compilerrt_abort_impl
.LBB0_16:
	move r0, .L.str
	move r2, .L__func__.__mulvdi3
	move r1, 48
	call r23, compilerrt_abort_impl
.Lfunc_end0:
	.size	__mulvdi3, .Lfunc_end0-__mulvdi3
	.section	.stack_sizes,"o",@progbits,.text.__mulvdi3
	.long	.Lfunc_begin0
	.byte	32
	.section	.text.__mulvdi3,"ax",@progbits
                                        // -- End function
	.type	.L.str,@object                  // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"mulvdi3.c"
	.size	.L.str, 10

	.type	.L__func__.__mulvdi3,@object    // @__func__.__mulvdi3
.L__func__.__mulvdi3:
	.asciz	"__mulvdi3"
	.size	.L__func__.__mulvdi3, 10

	.addrsig
