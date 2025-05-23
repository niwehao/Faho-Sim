	.text
	.file	"absvdi2.c"
	.section	.text.__absvdi2,"ax",@progbits
	.globl	__absvdi2                       // -- Begin function __absvdi2
	.type	__absvdi2,@function
__absvdi2:                              // @__absvdi2
.Lfunc_begin0:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r3, 0
	move r2, 2147483648
	jneq r1, r3, .LBB0_4
// %bb.3:
	jeq r0, r2, .LBB0_2
.LBB0_4:
// %bb.1:
	asr.s d2, r0, 31
	add r1, r1, r3
	addc r0, r0, r2
	xor r1, r1, r3
	xor r0, r0, r2
	ld d22, r22, -8
	jump r23
.LBB0_2:
	move r0, .L.str
	move r2, .L__func__.__absvdi2
	move r1, 26
	call r23, compilerrt_abort_impl
.Lfunc_end0:
	.size	__absvdi2, .Lfunc_end0-__absvdi2
	.section	.stack_sizes,"o",@progbits,.text.__absvdi2
	.long	.Lfunc_begin0
	.byte	8
	.section	.text.__absvdi2,"ax",@progbits
                                        // -- End function
	.type	.L.str,@object                  // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"absvdi2.c"
	.size	.L.str, 10

	.type	.L__func__.__absvdi2,@object    // @__func__.__absvdi2
.L__func__.__absvdi2:
	.asciz	"__absvdi2"
	.size	.L__func__.__absvdi2, 10

	.addrsig
