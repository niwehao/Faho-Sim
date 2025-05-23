	.text
	.file	"truncdfhf2.c"
	.section	.text.__truncdfhf2,"ax",@progbits
	.globl	__truncdfhf2                    // -- Begin function __truncdfhf2
	.type	__truncdfhf2,@function
__truncdfhf2:                           // @__truncdfhf2
.Lfunc_begin0:
// %bb.0:
	and r5, r1, 4294967295
	and r4, r0, 2147483647
	add r3, r5, 0
	addc r2, r4, 3236954112
	add r7, r5, 0
	addc r6, r4, 3205496832
	sub zero, r3, r7
	subc zero, r2, r6, geu, .LBB0_5
// %bb.1:
	and r7, r1, 4294967295
	and r6, r0, 1023
	move r3, 1
	move r2, 512
	lsr.u d4, r0, 10
	sub zero, r7, r3
	subc zero, r6, r2, ltu, .LBB0_3
// %bb.2:
	add r3, r5, 16385
	jump .LBB0_20
.LBB0_5:
	move r3, 1
	move r2, 2146435072
	sub zero, r5, r3
	subc zero, r4, r2, ltu, .LBB0_7
// %bb.6:
	lsr.u d2, r0, 10
	and r2, r3, 511
	or r3, r2, 32256
	jump .LBB0_20
.LBB0_3:
	move r9, 0
	move r8, 512
	add r3, r5, 16384
	jneq r7, r9, .LBB0_20
// %bb.21:
	jneq r6, r8, .LBB0_20
// %bb.22:
// %bb.4:
	and r4, r5, 1
.LBB0_19:
	add r3, r4, r3, true, .LBB0_20
.LBB0_7:
	move r7, 4294967295
	move r6, 1089470463
	move r3, 31744
	sub zero, r5, r7
	subc zero, r4, r6, xgtu, .LBB0_20
// %bb.8:
	lsr.u d4, r4, 20
	move r3, 0
	jltu r5, 957, .LBB0_20
// %bb.9:
	and r3, r1, 4294967295
	and r2, r0, 1048575
	or r3, r3, 0
	or r2, r2, 1048576
	add r8, r5, -945
	sub r4, 1009, r5
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
	move.u d2, r5
	and r5, r7, 4294967295
	and r4, r6, 1023
	or r5, r5, r3
	or r4, r4, r2
	move r9, 1
	move r8, 512
	lsr.u d2, r6, 10
	sub zero, r5, r9
	subc zero, r4, r8, ltu, .LBB0_17
// %bb.16:
	add r3, r3, 1, true, .LBB0_20
.LBB0_17:
	move r7, 0
	move r6, 512
	jneq r5, r7, .LBB0_20
// %bb.23:
	jneq r4, r6, .LBB0_20
// %bb.24:
// %bb.18:
	and r4, r3, 1, true, .LBB0_19
.LBB0_20:
	lsr.u d0, r0, 16
	and r0, r1, 32768
	or r0, r3, r0
	and r0, r0, 65535
	jump r23
.Lfunc_end0:
	.size	__truncdfhf2, .Lfunc_end0-__truncdfhf2
	.section	.stack_sizes,"o",@progbits,.text.__truncdfhf2
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__truncdfhf2,"ax",@progbits
                                        // -- End function
	.addrsig
