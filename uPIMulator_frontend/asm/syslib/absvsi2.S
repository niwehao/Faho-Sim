	.text
	.file	"absvsi2.c"
	.section	.text.__absvsi2,"ax",@progbits
	.globl	__absvsi2                       // -- Begin function __absvsi2
	.type	__absvsi2,@function
__absvsi2:                              // @__absvsi2
.Lfunc_begin0:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r1, -2147483648
	jeq r0, r1, .LBB0_2
// %bb.1:
	asr r1, r0, 31
	add r0, r0, r1
	xor r0, r0, r1
	ld d22, r22, -8
	jump r23
.LBB0_2:
	move r0, .L.str
	move r2, .L__func__.__absvsi2
	move r1, 26
	call r23, compilerrt_abort_impl
.Lfunc_end0:
	.size	__absvsi2, .Lfunc_end0-__absvsi2
	.section	.stack_sizes,"o",@progbits,.text.__absvsi2
	.long	.Lfunc_begin0
	.byte	8
	.section	.text.__absvsi2,"ax",@progbits
                                        // -- End function
	.type	.L.str,@object                  // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"absvsi2.c"
	.size	.L.str, 10

	.type	.L__func__.__absvsi2,@object    // @__func__.__absvsi2
.L__func__.__absvsi2:
	.asciz	"__absvsi2"
	.size	.L__func__.__absvsi2, 10

	.addrsig
