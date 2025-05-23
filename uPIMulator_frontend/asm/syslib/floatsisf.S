	.text
	.file	"floatsisf.c"
	.section	.text.__floatsisf,"ax",@progbits
	.globl	__floatsisf                     // -- Begin function __floatsisf
	.type	__floatsisf,@function
__floatsisf:                            // @__floatsisf
.Lfunc_begin0:
// %bb.0:
	jeq r0, 0, .LBB0_1
// %bb.2:
	and r1, r0, -2147483648
	asr r2, r0, 31
	add r0, r0, r2
	xor r2, r0, r2
	clz r0, r2
	xor r3, r0, 31
	jgtu r3, 23, .LBB0_4
// %bb.3:
	sub r3, 23, r3
	lsl r2, r2, r3
	xor r2, r2, 8388608
	lsl_sub r0, r2, r0, 23
	add r0, r0, 1325400064
	or r0, r0, r1
	jump r23
.LBB0_1:
	move r0, 0
	jump r23
.LBB0_4:
	sub r3, 8, r0
	lsr r3, r2, r3
	xor r3, r3, 8388608
	add r4, r0, 24
	lsl r4, r2, r4
	move r5, -2147483648
	sub r2, r4, r5, gtu
	add r2, r3, r2
	and r3, r2, 1
	jeq r4, r5, .LBB0_6
// %bb.5:
	move r3, 0
.LBB0_6:
	add r2, r3, r2
	lsl_sub r0, r2, r0, 23
	add r0, r0, 1325400064
	or r0, r0, r1
	jump r23
.Lfunc_end0:
	.size	__floatsisf, .Lfunc_end0-__floatsisf
	.section	.stack_sizes,"o",@progbits,.text.__floatsisf
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__floatsisf,"ax",@progbits
                                        // -- End function
	.addrsig
