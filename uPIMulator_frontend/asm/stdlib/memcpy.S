	.text
	.file	"memcpy.c"
	.section	.text.__memcpy_wram_4align,"ax",@progbits
	.globl	__memcpy_wram_4align            // -- Begin function __memcpy_wram_4align
	.type	__memcpy_wram_4align,@function
__memcpy_wram_4align:                   // @__memcpy_wram_4align
.Lfunc_begin0:
// %bb.0:
	lsr r2, r2, 2, z, .LBB0_3
// %bb.1:
	move r3, r0
.LBB0_2:                                // =>This Inner Loop Header: Depth=1
	lw r4, r1, 0
	sw r3, 0, r4
	add r3, r3, 4
	add r1, r1, 4
	add r2, r2, -1, nz, .LBB0_2
.LBB0_3:
	jump r23
.Lfunc_end0:
	.size	__memcpy_wram_4align, .Lfunc_end0-__memcpy_wram_4align
	.section	.stack_sizes,"o",@progbits,.text.__memcpy_wram_4align
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__memcpy_wram_4align,"ax",@progbits
                                        // -- End function
	.section	.text.memcpy,"ax",@progbits
	.globl	memcpy                          // -- Begin function memcpy
	.type	memcpy,@function
memcpy:                                 // @memcpy
.Lfunc_begin1:
// %bb.0:
	add r2, r0, r2
	xor r3, r1, r0
	add r4, r0, 3
	and r5, r4, -4
	and r4, r3, 3
	move r3, r2
	jgtu r5, r2, .LBB1_2
// %bb.1:
	move r3, r5
.LBB1_2:
	jeq r4, 0, .LBB1_4
// %bb.3:
	move r3, r2
.LBB1_4:
	and r6, r2, -4
	sub r5, r3, r0, z, .LBB1_7
// %bb.5:
	move r4, r1
	move r7, r0
	move r8, r5
.LBB1_6:                                // =>This Inner Loop Header: Depth=1
	lbs r9, r4, 0
	sb r7, 0, r9
	add r7, r7, 1
	add r4, r4, 1
	add r8, r8, -1, nz, .LBB1_6
.LBB1_7:
	move r4, 0
	jltu r6, r3, .LBB1_9
// %bb.8:
	sub r4, r6, r3
	asr r4, r4, 2
.LBB1_9:
	add r1, r1, r5
	and r5, r4, 1073741823
	jeq r5, 0, .LBB1_12
// %bb.10:
	move r6, r1
	move r7, r3
.LBB1_11:                               // =>This Inner Loop Header: Depth=1
	lw r8, r6, 0
	sw r7, 0, r8
	add r7, r7, 4
	add r6, r6, 4
	add r5, r5, -1, nz, .LBB1_11
.LBB1_12:
	lsl_add r3, r3, r4, 2
	sub r2, r2, r3, z, .LBB1_15
// %bb.13:
	lsl_add r1, r1, r4, 2
	move r4, 0
.LBB1_14:                               // =>This Inner Loop Header: Depth=1
	add r5, r1, r4
	lbs r5, r5, 0
	add r6, r3, r4
	add r4, r4, 1
	sb r6, 0, r5
	jltu r4, r2, .LBB1_14
.LBB1_15:
	jump r23
.Lfunc_end1:
	.size	memcpy, .Lfunc_end1-memcpy
	.section	.stack_sizes,"o",@progbits,.text.memcpy
	.long	.Lfunc_begin1
	.byte	0
	.section	.text.memcpy,"ax",@progbits
                                        // -- End function
	.section	.text.__memcpy_mw,"ax",@progbits
	.globl	__memcpy_mw                     // -- Begin function __memcpy_mw
	.type	__memcpy_mw,@function
__memcpy_mw:                            // @__memcpy_mw
.Lfunc_begin2:
// %bb.0:
	sd r22, 40, d22
	add r22, r22, 48
	sd r22, -24, d14
	sd r22, -32, d16
	sd r22, -40, d18
	sd r22, -48, d20
	move r15, r2
	move r16, r1
	move r14, r0
	and r18, r16, 7
	and r19, r14, 7, z, .LBB2_1
// %bb.2:
	sub r0, 8, r19
	move r17, r15
	jgtu r0, r15, .LBB2_4
// %bb.3:
	move r17, r0
.LBB2_4:
	add r20, r22, -16
	ldma r20, r14, 0
	or r0, r20, r19
	move r1, r16
	move r2, r17
	call r23, memcpy
	sdma r20, r14, 0
	sub r15, r15, r17
	jneq r18, r19, .LBB2_6
.LBB2_8:
	jltu r15, 8, .LBB2_10
.LBB2_9:                                // =>This Inner Loop Header: Depth=1
	add r0, r16, r17
	add r1, r14, r17
	sdma r0, r1, 0
	add r17, r17, 8
	add r15, r15, -8
	jgtu r15, 7, .LBB2_9
	jump .LBB2_10
.LBB2_1:
	move r17, 0
	jeq r18, r19, .LBB2_8
.LBB2_6:
	jltu r15, 8, .LBB2_10
.LBB2_7:                                // =>This Inner Loop Header: Depth=1
	add r2, r16, r17
	lbu.u d0, r2, 1
	lbu.u d4, r2, 0
	lslx r3, r1, 8
	lsl_add r6, r3, r0, 8
	lbu.u d8, r2, 3
	lsl r7, r1, 8
	or r1, r7, r5
	or r0, r6, r4
	lbu.u d4, r2, 2
	lslx r3, r9, 8
	lsl_add r6, r3, r8, 8
	lsl r7, r9, 8
	or r5, r7, r5
	or r4, r6, r4
	lslx r3, r5, 16
	lbu.u d6, r2, 5
	lsl_add r8, r3, r4, 16
	lsl r9, r5, 16
	lbu.u d4, r2, 4
	lslx r3, r7, 8
	lsl_add r10, r3, r6, 8
	lbu.u d12, r2, 7
	lsl r11, r7, 8
	or r5, r11, r5
	or r4, r10, r4
	lbu.u d2, r2, 6
	lslx r6, r13, 8
	lsl_add r6, r6, r12, 8
	lsl r7, r13, 8
	or r3, r7, r3
	or r2, r6, r2
	lslx r6, r3, 16
	lsl_add r6, r6, r2, 16
	lsl r7, r3, 16
	or r3, r7, r5
	or r2, r6, r4
	move r5, 0
	or r1, r9, r1
	or r0, r8, r0
	move r4, r3
	or r1, r5, r1
	or r0, r4, r0
	sd r22, -16, d0
	add r0, r14, r17
	add r1, r22, -16
	sdma r1, r0, 0
	add r17, r17, 8
	add r15, r15, -8
	jgtu r15, 7, .LBB2_7
.LBB2_10:
	jeq r15, 0, .LBB2_12
// %bb.11:
	add r19, r14, r17
	add r18, r22, -16
	ldma r18, r19, 0
	add r1, r16, r17
	move r0, r18
	move r2, r15
	call r23, memcpy
	sdma r18, r19, 0
.LBB2_12:
	move r0, r14
	ld d20, r22, -48
	ld d18, r22, -40
	ld d16, r22, -32
	ld d14, r22, -24
	ld d22, r22, -8
	jump r23
.Lfunc_end2:
	.size	__memcpy_mw, .Lfunc_end2-__memcpy_mw
	.section	.stack_sizes,"o",@progbits,.text.__memcpy_mw
	.long	.Lfunc_begin2
	.byte	48
	.section	.text.__memcpy_mw,"ax",@progbits
                                        // -- End function
	.section	.text.__memcpy_wm,"ax",@progbits
	.globl	__memcpy_wm                     // -- Begin function __memcpy_wm
	.type	__memcpy_wm,@function
__memcpy_wm:                            // @__memcpy_wm
.Lfunc_begin3:
// %bb.0:
	sd r22, 32, d22
	add r22, r22, 40
	sd r22, -24, d14
	sd r22, -32, d16
	sd r22, -40, d18
	move r17, r2
	move r15, r1
	move r14, r0
	and r18, r15, 7
	sub r0, 8, r18
	and r19, r14, 7
	move r16, r17
	jgtu r0, r17, .LBB3_2
// %bb.1:
	move r16, r0
.LBB3_2:
	add r0, r22, -16
	ldma r0, r15, 0
	or r1, r0, r18
	move r0, r14
	move r2, r16
	call r23, memcpy
	sub r2, r17, r16
	jneq r18, r19, .LBB3_3
// %bb.5:
	jltu r2, 8, .LBB3_7
.LBB3_6:                                // =>This Inner Loop Header: Depth=1
	add r0, r15, r16
	add r1, r14, r16
	ldma r1, r0, 0
	add r16, r16, 8
	add r2, r2, -8
	jgtu r2, 7, .LBB3_6
	jump .LBB3_7
.LBB3_3:
	jltu r2, 8, .LBB3_7
.LBB3_4:                                // =>This Inner Loop Header: Depth=1
	add r0, r15, r16
	add r1, r22, -16
	ldma r1, r0, 0
	ld d0, r22, -16
	add r3, r14, r16
	sb r3, 4, r0
	sb r3, 0, r1
	lsr.u d4, r0, 24
	sb r3, 7, r5
	lsr.u d4, r0, 16
	sb r3, 6, r5
	lsr.u d4, r0, 8
	sb r3, 5, r5
	lsr r4, r1, 24
	sb r3, 3, r4
	lsr r4, r1, 16
	sb r3, 2, r4
	lsr r0, r1, 8
	sb r3, 1, r0
	add r16, r16, 8
	add r2, r2, -8
	jgtu r2, 7, .LBB3_4
.LBB3_7:
	jeq r2, 0, .LBB3_9
// %bb.8:
	add r0, r15, r16
	add r1, r22, -16
	ldma r1, r0, 0
	add r0, r14, r16
	call r23, memcpy
.LBB3_9:
	move r0, r14
	ld d18, r22, -40
	ld d16, r22, -32
	ld d14, r22, -24
	ld d22, r22, -8
	jump r23
.Lfunc_end3:
	.size	__memcpy_wm, .Lfunc_end3-__memcpy_wm
	.section	.stack_sizes,"o",@progbits,.text.__memcpy_wm
	.long	.Lfunc_begin3
	.byte	40
	.section	.text.__memcpy_wm,"ax",@progbits
                                        // -- End function
	.section	.text.__memcpy_mm,"ax",@progbits
	.globl	__memcpy_mm                     // -- Begin function __memcpy_mm
	.type	__memcpy_mm,@function
__memcpy_mm:                            // @__memcpy_mm
.Lfunc_begin4:
// %bb.0:
	sd r22, 64, d22
	add r22, r22, 72
	sd r22, -48, d14
	sd r22, -56, d16
	sd r22, -64, d18
	sd r22, -72, d20
	move r21, r1
	move r20, r0
	and r3, r21, 7
	and r14, r20, 7
	move r15, r2
	jneq r3, r14, .LBB4_10
// %bb.1:
	jeq r3, 0, .LBB4_2
// %bb.3:
	sub r0, 8, r3
	move r18, r15
	jgtu r0, r15, .LBB4_5
// %bb.4:
	move r18, r0
.LBB4_5:
	add r14, r22, -32
	ldma r14, r20, 0
	add r1, r22, -40
	ldma r1, r21, 0
	or r0, r14, r3
	or r1, r1, r3
	move r2, r18
	call r23, memcpy
	sdma r14, r20, 0
	sub r15, r15, r18
	jltu r15, 8, .LBB4_8
.LBB4_7:                                // =>This Inner Loop Header: Depth=1
	add r0, r21, r18
	add r1, r22, -40
	ldma r1, r0, 0
	add r0, r20, r18
	sdma r1, r0, 0
	add r18, r18, 8
	add r15, r15, -8
	jgtu r15, 7, .LBB4_7
.LBB4_8:
	jeq r15, 0, .LBB4_28
// %bb.9:
	add r14, r20, r18
	add r17, r22, -32
	ldma r17, r14, 0
	add r0, r21, r18
	add r1, r22, -40
	ldma r1, r0, 0
	move r0, r17
	move r2, r15
	call r23, memcpy
	sdma r17, r14, 0
	jump .LBB4_28
.LBB4_10:
	move r0, r14
	jgtu r3, r14, .LBB4_12
// %bb.11:
	move r0, r3
.LBB4_12:
	sub r0, 8, r0
	jgeu r0, r15, .LBB4_13
// %bb.14:
	add r0, r22, -40
	ldma r0, r21, 0
	jeq r14, 0, .LBB4_15
// %bb.16:
	add r0, r14, 7
	move r1, -1
	lsr_add r1, r1, r0, 3
	add r0, r22, -32
	lsl_add r1, r0, r1, 24
	ldma r1, r20, 0
	jgeu r3, r14, .LBB4_18
// %bb.17:
	sub r17, 8, r14
	or r0, r0, r14
	add r1, r22, -40
	or r1, r1, r3
	move r2, r17
	move r14, r3
	call r23, memcpy
	move r3, r14
	add r3, r3, r17
	move r14, 8, true, .LBB4_19
.LBB4_13:
	add r16, r22, -32
	ldma r16, r20, 0
	add r1, r22, -40
	ldma r1, r21, 0
	or r0, r16, r14
	or r1, r1, r3
	move r2, r15
	call r23, memcpy
	sdma r16, r20, 0
	jump .LBB4_28
.LBB4_2:
	move r18, 0
	jgeu r15, 8, .LBB4_7
	jump .LBB4_8
.LBB4_15:
	move r14, 8
	move r16, 0
	sw r22, -24, r20
	sw r22, -20, r21
	jgeu r15, 8, .LBB4_22
.LBB4_21:
	move r20, r3, true, .LBB4_24
.LBB4_18:
	sub r17, 8, r3
	or r18, r0, r14
	add r19, r22, -40
	or r1, r19, r3
	move r0, r18
	move r2, r17
	move r16, r3
	call r23, memcpy
	add r0, r21, 8
	ldma r19, r0, 0
	sub r16, r16, r14
	add r0, r18, r17
	move r1, r19
	move r2, r16
	call r23, memcpy
	move r3, r16
	move r14, 16
.LBB4_19:
	add r0, r22, -32
	sdma r0, r20, 0
	or r0, r20, -8
	add r15, r0, r15
	move r16, 8
	sw r22, -24, r20
	sw r22, -20, r21
	jltu r15, 8, .LBB4_21
.LBB4_22:
	sub r0, 8, r3
	add r19, r22, -40
	add r1, r19, r3
	sw r22, -16, r1
	add r21, r22, -32
	move r18, r0
	add r17, r21, r0
	move r20, r3
.LBB4_23:                               // =>This Inner Loop Header: Depth=1
	move r0, r21
	lw r1, r22, -16
	move r2, r18
	call r23, memcpy
	lw r0, r22, -20
	add r0, r0, r14
	ldma r19, r0, 0
	add r14, r14, 8
	move r0, r17
	move r1, r19
	move r2, r20
	call r23, memcpy
	lw r0, r22, -24
	add r0, r0, r16
	sdma r21, r0, 0
	add r16, r16, 8
	add r15, r15, -8
	jgtu r15, 7, .LBB4_23
.LBB4_24:
	move r0, r20
	lw r20, r22, -24
	lw r21, r22, -20
	jeq r15, 0, .LBB4_28
// %bb.25:
	add r16, r20, r16
	add r17, r22, -32
	ldma r17, r16, 0
	sub r19, 8, r0
	add r18, r22, -40
	add r1, r18, r0
	move r0, r17
	move r2, r19
	call r23, memcpy
	jleu r15, r19, .LBB4_27
// %bb.26:
	sub r2, r15, r19
	add r0, r21, r14
	ldma r18, r0, 0
	add r0, r17, r19
	move r1, r18
	call r23, memcpy
.LBB4_27:
	sdma r17, r16, 0
.LBB4_28:
	move r0, r20
	ld d20, r22, -72
	ld d18, r22, -64
	ld d16, r22, -56
	ld d14, r22, -48
	ld d22, r22, -8
	jump r23
.Lfunc_end4:
	.size	__memcpy_mm, .Lfunc_end4-__memcpy_mm
	.section	.stack_sizes,"o",@progbits,.text.__memcpy_mm
	.long	.Lfunc_begin4
	.byte	72
	.section	.text.__memcpy_mm,"ax",@progbits
                                        // -- End function
	.addrsig
	.addrsig_sym __memcpy_wram_4align
	.addrsig_sym __memcpy_mw
	.addrsig_sym __memcpy_wm
	.addrsig_sym __memcpy_mm
