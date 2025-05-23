	.text
	.file	"powisf2.c"
	.section	.text.__powisf2,"ax",@progbits
	.globl	__powisf2                       // -- Begin function __powisf2
	.type	__powisf2,@function
__powisf2:                              // @__powisf2
.Lfunc_begin0:
// %bb.0:
	sd r22, 24, d22
	add r22, r22, 32
	sd r22, -16, d14
	sd r22, -24, d16
	sd r22, -32, d18
	move r15, r1
	move r16, r0
	and r0, r15, 1, z, .LBB0_1
// %bb.2:
	move r14, r16
	add r0, r15, 1
	jltu r0, 3, .LBB0_8
	jump .LBB0_4
.LBB0_1:
	move r14, 1065353216
	add r0, r15, 1
	jgeu r0, 3, .LBB0_4
.LBB0_8:
	jgts r15, -1, .LBB0_10
// %bb.9:
	move r0, 1065353216
	move r1, r14
	call r23, __divsf3
	move r14, r0
.LBB0_10:
	move r0, r14
	ld d18, r22, -32
	ld d16, r22, -24
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.LBB0_4:
	move r17, r15, true, .LBB0_5
.LBB0_7:                                //   in Loop: Header=BB0_5 Depth=1
	add r0, r17, 1
	jleu r0, 2, .LBB0_8
.LBB0_5:                                // =>This Inner Loop Header: Depth=1
	lsr_add r0, r17, r17, 31
	asr r17, r0, 1
	move r0, r16
	move r1, r16
	call r23, __mulsf3
	move r16, r0
	and r18, r17, 1
	move r1, r14
	call r23, __mulsf3
	jeq r18, 0, .LBB0_7
// %bb.6:                               //   in Loop: Header=BB0_5 Depth=1
	move r14, r0, true, .LBB0_7
.Lfunc_end0:
	.size	__powisf2, .Lfunc_end0-__powisf2
	.section	.stack_sizes,"o",@progbits,.text.__powisf2
	.long	.Lfunc_begin0
	.byte	32
	.section	.text.__powisf2,"ax",@progbits
                                        // -- End function
	.addrsig
