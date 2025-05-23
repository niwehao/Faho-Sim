	.text
	.file	"truncdfsf2.c"
	.section	.text.__truncdfsf2,"ax",@progbits
	.globl	__truncdfsf2                    // -- Begin function __truncdfsf2
	.type	__truncdfsf2,@function
__truncdfsf2:                           // @__truncdfsf2
.Lfunc_begin0:
// %bb.0:
	and r5, r1, 4294967295
	and r4, r0, 2147483647
	add r3, r5, 0
	addc r2, r4, 3354394624
	add r7, r5, 0
	addc r6, r4, 3088056320
	sub zero, r3, r7
	subc zero, r2, r6, geu, .LBB0_5
// %bb.1:
	lsrx r2, r0, 29
	lsr_add r5, r2, r1, 29
	and r7, r1, 536870911
	and r6, r0, 0
	move.s d2, 268435457
	lsr r4, r0, 29
	sub zero, r7, r3
	subc zero, r6, r2, ltu, .LBB0_3
// %bb.2:
	add r3, r5, 1073741825
.LBB0_19:
	and r0, r0, -2147483648
	or r0, r3, r0
	jump r23
.LBB0_5:
	move r3, 1
	move r2, 2146435072
	sub zero, r5, r3
	subc zero, r4, r2, ltu, .LBB0_7
// %bb.6:
	lsrx r2, r0, 29
	lsr_add r3, r2, r1, 29
	lsr r2, r0, 29
	and r2, r3, 4194303
	or r3, r2, 2143289344
	and r0, r0, -2147483648
	or r0, r3, r0
	jump r23
.LBB0_3:
	move.s d8, 268435456
	add r3, r5, 1073741824
	jneq r7, r9, .LBB0_19
// %bb.20:
	jneq r6, r8, .LBB0_19
// %bb.21:
// %bb.4:
	and r4, r5, 1
	add r3, r3, r4
	and r0, r0, -2147483648
	or r0, r3, r0
	jump r23
.LBB0_7:
	move r7, 4294967295
	move r6, 1206910975
	move r3, 2139095040
	sub zero, r5, r7
	subc zero, r4, r6, xgtu, .LBB0_19
// %bb.8:
	lsr.u d4, r4, 20
	move r3, 0
	jltu r5, 845, .LBB0_19
// %bb.9:
	and r3, r1, 4294967295
	and r2, r0, 1048575
	or r3, r3, 0
	or r2, r2, 1048576
	add r8, r5, -833
	sub r4, 897, r5
	lslx r5, r3, r8, sh32, .LBB0_11
// %bb.10:
	lsl r6, r2, r8
	or r6, r6, r5
	lsl r7, r3, r8
	move.s d8, 0
	sub zero, r7, r9
	subc r5, r6, r8, xnz
	lsrx r6, r2, r4, sh32, .LBB0_14
	jump .LBB0_13
.LBB0_14:
	lsr.u d6, r2, r4
	jump .LBB0_15
.LBB0_11:
	lsl r6, r3, r8
	move r7, 0
	move.s d8, 0
	sub zero, r7, r9
	subc r5, r6, r8, xnz
	lsrx r6, r2, r4, sh32, .LBB0_14
.LBB0_13:
	lsr r7, r3, r4
	or r7, r6, r7
	lsr r6, r2, r4
.LBB0_15:
	move.u d4, r5
	lsrx r2, r6, 29
	lsr_add r3, r2, r7, 29
	and r9, r7, 536870911
	and r8, r6, 0
	or r5, r9, r5
	or r4, r8, r4
	move.s d8, 268435457
	lsr r2, r6, 29
	sub zero, r5, r9
	subc zero, r4, r8, ltu, .LBB0_17
// %bb.16:
	add r3, r3, 1
	and r0, r0, -2147483648
	or r0, r3, r0
	jump r23
.LBB0_17:
	move.s d6, 268435456
	jneq r5, r7, .LBB0_19
// %bb.22:
	jneq r4, r6, .LBB0_19
// %bb.23:
// %bb.18:
	and r4, r3, 1
	add r3, r4, r3
	and r0, r0, -2147483648
	or r0, r3, r0
	jump r23
.Lfunc_end0:
	.size	__truncdfsf2, .Lfunc_end0-__truncdfsf2
	.section	.stack_sizes,"o",@progbits,.text.__truncdfsf2
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__truncdfsf2,"ax",@progbits
                                        // -- End function
	.addrsig
