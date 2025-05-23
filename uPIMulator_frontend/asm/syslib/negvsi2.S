	.text
	.file	"negvsi2.c"
	.section	.text.__negvsi2,"ax",@progbits
	.globl	__negvsi2                       // -- Begin function __negvsi2
	.type	__negvsi2,@function
__negvsi2:                              // @__negvsi2
.Lfunc_begin0:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r1, -2147483648
	jeq r0, r1, .LBB0_2
// %bb.1:
	neg r0, r0
	ld d22, r22, -8
	jump r23
.LBB0_2:
	move r0, .L.str
	move r2, .L__func__.__negvsi2
	move r1, 26
	call r23, compilerrt_abort_impl
.Lfunc_end0:
	.size	__negvsi2, .Lfunc_end0-__negvsi2
	.section	.stack_sizes,"o",@progbits,.text.__negvsi2
	.long	.Lfunc_begin0
	.byte	8
	.section	.text.__negvsi2,"ax",@progbits
                                        // -- End function
	.type	.L.str,@object                  // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"negvsi2.c"
	.size	.L.str, 10

	.type	.L__func__.__negvsi2,@object    // @__func__.__negvsi2
.L__func__.__negvsi2:
	.asciz	"__negvsi2"
	.size	.L__func__.__negvsi2, 10

	.addrsig
