	.text
	.file	"addvdi3.c"
	.section	.text.__addvdi3,"ax",@progbits
	.globl	__addvdi3                       // -- Begin function __addvdi3
	.type	__addvdi3,@function
__addvdi3:                              // @__addvdi3
.Lfunc_begin0:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	movd d4, d0
	move.s d6, 0
	add r1, r3, r5
	addc r0, r2, r4
	sub zero, r3, r7
	subc zero, r2, r6, lts, .LBB0_3
// %bb.1:
	sub zero, r1, r5
	subc zero, r0, r4, ges, .LBB0_4
// %bb.2:
	move r0, .L.str
	move r2, .L__func__.__addvdi3
	move r1, 27
	call r23, compilerrt_abort_impl
.LBB0_3:
	sub zero, r1, r5
	subc zero, r0, r4, ges, .LBB0_5
.LBB0_4:
	ld d22, r22, -8
	jump r23
.LBB0_5:
	move r0, .L.str
	move r2, .L__func__.__addvdi3
	move r1, 30
	call r23, compilerrt_abort_impl
.Lfunc_end0:
	.size	__addvdi3, .Lfunc_end0-__addvdi3
	.section	.stack_sizes,"o",@progbits,.text.__addvdi3
	.long	.Lfunc_begin0
	.byte	8
	.section	.text.__addvdi3,"ax",@progbits
                                        // -- End function
	.type	.L.str,@object                  // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"addvdi3.c"
	.size	.L.str, 10

	.type	.L__func__.__addvdi3,@object    // @__func__.__addvdi3
.L__func__.__addvdi3:
	.asciz	"__addvdi3"
	.size	.L__func__.__addvdi3, 10

	.addrsig
