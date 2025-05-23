	.text
	.file	"addvsi3.c"
	.section	.text.__addvsi3,"ax",@progbits
	.globl	__addvsi3                       // -- Begin function __addvsi3
	.type	__addvsi3,@function
__addvsi3:                              // @__addvsi3
.Lfunc_begin0:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	move r2, r0
	add r0, r1, r2, smi, .LBB0_3
// %bb.1:
	jges r0, r2, .LBB0_4
// %bb.2:
	move r0, .L.str
	move r2, .L__func__.__addvsi3
	move r1, 27
	call r23, compilerrt_abort_impl
.LBB0_3:
	jges r0, r2, .LBB0_5
.LBB0_4:
	ld d22, r22, -8
	jump r23
.LBB0_5:
	move r0, .L.str
	move r2, .L__func__.__addvsi3
	move r1, 30
	call r23, compilerrt_abort_impl
.Lfunc_end0:
	.size	__addvsi3, .Lfunc_end0-__addvsi3
	.section	.stack_sizes,"o",@progbits,.text.__addvsi3
	.long	.Lfunc_begin0
	.byte	8
	.section	.text.__addvsi3,"ax",@progbits
                                        // -- End function
	.type	.L.str,@object                  // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"addvsi3.c"
	.size	.L.str, 10

	.type	.L__func__.__addvsi3,@object    // @__func__.__addvsi3
.L__func__.__addvsi3:
	.asciz	"__addvsi3"
	.size	.L__func__.__addvsi3, 10

	.addrsig
