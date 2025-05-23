	.text
	.file	"negvdi2.c"
	.section	.text.__negvdi2,"ax",@progbits
	.globl	__negvdi2                       // -- Begin function __negvdi2
	.type	__negvdi2,@function
__negvdi2:                              // @__negvdi2
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
	move.s d2, 0
	sub r1, r3, r1
	subc r0, r2, r0
	ld d22, r22, -8
	jump r23
.LBB0_2:
	move r0, .L.str
	move r2, .L__func__.__negvdi2
	move r1, 26
	call r23, compilerrt_abort_impl
.Lfunc_end0:
	.size	__negvdi2, .Lfunc_end0-__negvdi2
	.section	.stack_sizes,"o",@progbits,.text.__negvdi2
	.long	.Lfunc_begin0
	.byte	8
	.section	.text.__negvdi2,"ax",@progbits
                                        // -- End function
	.type	.L.str,@object                  // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"negvdi2.c"
	.size	.L.str, 10

	.type	.L__func__.__negvdi2,@object    // @__func__.__negvdi2
.L__func__.__negvdi2:
	.asciz	"__negvdi2"
	.size	.L__func__.__negvdi2, 10

	.addrsig
