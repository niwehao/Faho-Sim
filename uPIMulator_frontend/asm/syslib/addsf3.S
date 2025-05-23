	.text
	.file	"addsf3.c"
	.section	.text.__addsf3,"ax",@progbits
	.globl	__addsf3                        // -- Begin function __addsf3
	.type	__addsf3,@function
__addsf3:                               // @__addsf3
.Lfunc_begin0:
// %bb.0:
	and r3, r0, 2147483647
	add r2, r3, -1
	move r5, 2139095038
	and r4, r1, 2147483647
	jgtu r2, r5, .LBB0_2
// %bb.1:
	add r2, r4, -1
	move r5, 2139095039
	jgeu r2, r5, .LBB0_2
.LBB0_15:
	jleu r4, r3, .LBB0_17
// %bb.16:
	move r2, r0
	move r0, r1, true, .LBB0_18
.LBB0_2:
	move r2, 2139095041
	jltu r3, r2, .LBB0_4
// %bb.3:
	or r2, r0, 4194304
	move r0, r2
	jump r23
.LBB0_17:
	move r2, r1
.LBB0_18:
	lsr r1, r0, 23
	lsr r3, r2, 23
	and r4, r0, 8388607
	clz r7, r4
	and r1, r1, 255
	jeq r1, 0, .LBB0_19
// %bb.20:
	move r5, 0
	and r3, r3, 255
	and r6, r2, 8388607
	jeq r1, 0, .LBB0_22
.LBB0_23:
	clz r7, r6
	jeq r3, 0, .LBB0_24
.LBB0_25:
	move r8, 0
	lsl r4, r4, r5
	lsl r5, r6, r8
	jneq r3, 0, .LBB0_28
.LBB0_27:
	sub r3, 9, r7
.LBB0_28:
	xor r2, r0, r2
	lsl r4, r4, 3
	lsl r5, r5, 3
	or r5, r5, 67108864
	sub r6, r1, r3, z, .LBB0_29
// %bb.30:
	move r3, 1
	jgtu r6, 31, .LBB0_32
// %bb.31:
	sub r3, 32, r6
	lsl r3, r5, r3
	move r7, 0
	sub r3, r3, r7, neq
	lsr r5, r5, r6
	or r3, r5, r3
.LBB0_32:
	or r4, r4, 67108864
	jles r2, -1, .LBB0_33
.LBB0_37:
	add r2, r3, r4
	and r3, r2, 134217728
	jeq r3, 0, .LBB0_39
// %bb.38:
	and r3, r2, 1
	lsr r2, r2, 1
	or r2, r2, r3
	add r1, r1, 1, true, .LBB0_39
.LBB0_4:
	jltu r4, r2, .LBB0_6
// %bb.5:
	or r2, r1, 4194304
	move r0, r2
	jump r23
.LBB0_19:
	add r5, r7, -8
	and r3, r3, 255
	and r6, r2, 8388607
	jneq r1, 0, .LBB0_23
.LBB0_22:
	sub r1, 9, r7
	clz r7, r6
	jneq r3, 0, .LBB0_25
.LBB0_24:
	add r8, r7, -8
	lsl r4, r4, r5
	lsl r5, r6, r8
	jneq r3, 0, .LBB0_28
	jump .LBB0_27
.LBB0_29:
	move r3, r5
	or r4, r4, 67108864
	jgts r2, -1, .LBB0_37
.LBB0_33:
	sub r2, r4, r3, z, .LBB0_34
// %bb.35:
	lsr r3, r2, 26, nz, .LBB0_39
// %bb.36:
	clz r3, r2
	add r3, r3, -5
	lsl r2, r2, r3
	sub r1, r1, r3
.LBB0_39:
	and r0, r0, -2147483648
	jlts r1, 255, .LBB0_41
// %bb.40:
	or r2, r0, 2139095040
	move r0, r2
	jump r23
.LBB0_41:
	jgts r1, 0, .LBB0_43
// %bb.42:
	sub r3, 1, r1
	add r1, r1, 31
	lsl r4, r2, r1
	move r1, 0
	sub r4, r4, r1, neq
	lsr r2, r2, r3
	or r2, r2, r4
.LBB0_43:
	lsr r3, r2, 3
	and r3, r3, 8388607
	lsl r1, r1, 23
	or r0, r1, r0
	or r0, r0, r3
	move r1, 4
	and r2, r2, 7
	sub r1, r2, r1, gtu
	add r0, r0, r1
	and r1, r0, 1
	jeq r2, 4, .LBB0_45
// %bb.44:
	move r1, 0
.LBB0_45:
	add r2, r1, r0
.LBB0_46:
	move r0, r2
	jump r23
.LBB0_6:
	move r2, 2139095040
	jneq r3, r2, .LBB0_9
// %bb.7:
	xor r1, r1, r0
	move r3, -2147483648
	move r2, 2143289344
	jeq r1, r3, .LBB0_46
// %bb.8:
	jump r23
.LBB0_34:
	move r2, 0
	move r0, r2
	jump r23
.LBB0_9:
	jneq r4, r2, .LBB0_11
// %bb.10:
	move r2, r1
	move r0, r2
	jump r23
.LBB0_11:
	jeq r3, 0, .LBB0_12
// %bb.14:
	move r2, r0
	jneq r4, 0, .LBB0_15
	jump .LBB0_46
.LBB0_12:
	move r2, r1
	jneq r4, 0, .LBB0_46
// %bb.13:
	and r2, r1, r0
	move r0, r2
	jump r23
.Lfunc_end0:
	.size	__addsf3, .Lfunc_end0-__addsf3
	.section	.stack_sizes,"o",@progbits,.text.__addsf3
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__addsf3,"ax",@progbits
                                        // -- End function
	.addrsig
