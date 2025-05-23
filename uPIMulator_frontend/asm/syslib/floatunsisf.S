	.text
	.file	"floatunsisf.c"
	.section	.text.__floatunsisf,"ax",@progbits
	.globl	__floatunsisf                   // -- Begin function __floatunsisf
	.type	__floatunsisf,@function
__floatunsisf:                          // @__floatunsisf
.Lfunc_begin0:
// %bb.0:
	jeq r0, 0, .LBB0_1
// %bb.2:
	clz r1, r0
	xor r2, r1, 31
	jgtu r2, 23, .LBB0_4
// %bb.3:
	sub r2, 23, r2
	lsl r0, r0, r2
	xor r0, r0, 8388608
	lsl_sub r0, r0, r1, 23
	add r0, r0, 1325400064
	jump r23
.LBB0_1:
	move r0, 0
	jump r23
.LBB0_4:
	sub r2, 8, r1
	lsr r2, r0, r2
	xor r2, r2, 8388608
	add r3, r1, 24
	lsl r3, r0, r3
	move r4, -2147483648
	sub r0, r3, r4, gtu
	add r0, r2, r0
	and r2, r0, 1
	jeq r3, r4, .LBB0_6
// %bb.5:
	move r2, 0
.LBB0_6:
	add r0, r2, r0
	lsl_sub r0, r0, r1, 23
	add r0, r0, 1325400064
	jump r23
.Lfunc_end0:
	.size	__floatunsisf, .Lfunc_end0-__floatunsisf
	.section	.stack_sizes,"o",@progbits,.text.__floatunsisf
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__floatunsisf,"ax",@progbits
                                        // -- End function
	.addrsig
