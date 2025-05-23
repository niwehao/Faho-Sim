	.text
	.file	"strtok_r.c"
	.section	.text.strtok_r,"ax",@progbits
	.globl	strtok_r                        // -- Begin function strtok_r
	.type	strtok_r,@function
strtok_r:                               // @strtok_r
.Lfunc_begin0:
// %bb.0:
	sd r22, 24, d22
	add r22, r22, 32
	sd r22, -16, d14
	sd r22, -24, d16
	sd r22, -32, d18
	move r14, r2
	move r17, r1
	move r15, r0, z, .LBB0_5
// %bb.1:
	lbu r0, r15, 0
	move r18, 0
	jneq r0, 0, .LBB0_2
	jump .LBB0_8
.LBB0_5:
	lw r15, r14, 0
	lbu r0, r15, 0
	move r18, 0
	jeq r0, 0, .LBB0_8
.LBB0_2:
	move r0, r15
	move r1, r17
	call r23, strspn
	add r16, r15, r0
	lbu r0, r16, 0
	jeq r0, 0, .LBB0_7
// %bb.3:
	move r0, r16
	move r1, r17
	call r23, strcspn
	add r15, r16, r0
	lbu r0, r15, 0
	jeq r0, 0, .LBB0_9
// %bb.4:
	sb r15, 0, 0
	add r15, r15, 1, true, .LBB0_9
.LBB0_7:
	move r15, r16
.LBB0_8:
	move r16, r18
.LBB0_9:
	sw r14, 0, r15
	move r0, r16
	ld d18, r22, -32
	ld d16, r22, -24
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	strtok_r, .Lfunc_end0-strtok_r
	.section	.stack_sizes,"o",@progbits,.text.strtok_r
	.long	.Lfunc_begin0
	.byte	32
	.section	.text.strtok_r,"ax",@progbits
                                        // -- End function
	.addrsig
