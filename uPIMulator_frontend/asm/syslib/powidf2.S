	.text
	.file	"powidf2.c"
	.section	.text.__powidf2,"ax",@progbits
	.globl	__powidf2                       // -- Begin function __powidf2
	.type	__powidf2,@function
__powidf2:                              // @__powidf2
.Lfunc_begin0:
// %bb.0:
	sd r22, 32, d22
	add r22, r22, 40
	sd r22, -16, d14
	sd r22, -24, d16
	sd r22, -32, d18
	sd r22, -40, d20
	move r16, r2
	movd d18, d0
	and r0, r16, 1, z, .LBB0_1
// %bb.2:
	movd d14, d18
	add r0, r16, 1
	jltu r0, 3, .LBB0_8
	jump .LBB0_4
.LBB0_1:
	move r15, 0
	move r14, 1072693248
	add r0, r16, 1
	jgeu r0, 3, .LBB0_4
.LBB0_8:
	jgts r16, -1, .LBB0_10
// %bb.9:
	move r1, 0
	move r0, 1072693248
	movd d2, d14
	call r23, __divdf3
	movd d14, d0
.LBB0_10:
	movd d0, d14
	ld d20, r22, -40
	ld d18, r22, -32
	ld d16, r22, -24
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.LBB0_4:
	move r17, r16, true, .LBB0_5
.LBB0_7:                                //   in Loop: Header=BB0_5 Depth=1
	add r0, r17, 1
	jleu r0, 2, .LBB0_8
.LBB0_5:                                // =>This Inner Loop Header: Depth=1
	lsr_add r0, r17, r17, 31
	asr r17, r0, 1
	movd d0, d18
	movd d2, d18
	call r23, __muldf3
	movd d18, d0
	and r20, r17, 1
	movd d2, d14
	call r23, __muldf3
	jeq r20, 0, .LBB0_7
// %bb.6:                               //   in Loop: Header=BB0_5 Depth=1
	movd d14, d0
	jump .LBB0_7
.Lfunc_end0:
	.size	__powidf2, .Lfunc_end0-__powidf2
	.section	.stack_sizes,"o",@progbits,.text.__powidf2
	.long	.Lfunc_begin0
	.byte	40
	.section	.text.__powidf2,"ax",@progbits
                                        // -- End function
	.addrsig
