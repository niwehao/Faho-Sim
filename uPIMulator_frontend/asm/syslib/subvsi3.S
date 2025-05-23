	.text
	.file	"subvsi3.c"
	.section	.text.__subvsi3,"ax",@progbits
	.globl	__subvsi3                       // -- Begin function __subvsi3
	.type	__subvsi3,@function
__subvsi3:                              // @__subvsi3
.Lfunc_begin0:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r2, r0
	sub r0, r2, r1
	jlts r1, 0, .LBB0_3
// %bb.1:
	jles r0, r2, .LBB0_4
// %bb.2:
	move r0, .L.str
	move r2, .L__func__.__subvsi3
	move r1, 27
	call r23, compilerrt_abort_impl
.LBB0_3:
	jles r0, r2, .LBB0_5
.LBB0_4:
	ld d22, r22, -8
	jump r23
.LBB0_5:
	move r0, .L.str
	move r2, .L__func__.__subvsi3
	move r1, 30
	call r23, compilerrt_abort_impl
.Lfunc_end0:
	.size	__subvsi3, .Lfunc_end0-__subvsi3
	.section	.stack_sizes,"o",@progbits,.text.__subvsi3
	.long	.Lfunc_begin0
	.byte	8
	.section	.text.__subvsi3,"ax",@progbits
                                        // -- End function
	.type	.L.str,@object                  // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"subvsi3.c"
	.size	.L.str, 10

	.type	.L__func__.__subvsi3,@object    // @__func__.__subvsi3
.L__func__.__subvsi3:
	.asciz	"__subvsi3"
	.size	.L__func__.__subvsi3, 10

	.addrsig
