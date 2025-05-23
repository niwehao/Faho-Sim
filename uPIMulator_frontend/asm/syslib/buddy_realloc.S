	.text
	.file	"buddy_realloc.c"
	.section	.text.buddy_realloc,"ax",@progbits
	.globl	buddy_realloc                   // -- Begin function buddy_realloc
	.type	buddy_realloc,@function
buddy_realloc:                          // @buddy_realloc
.Lfunc_begin0:
// %bb.0:
	sd r22, 32, d22
	add r22, r22, 40
	sd r22, -32, d14
	sd r22, -40, d16
	// inline asm
.Ltmp0:
	acquire zero, __atomic_bit___buddy_lock, nz, .Ltmp0
	// inline asm
	move r15, r1
	move r14, r0, z, .LBB0_1
// %bb.2:
	jeq r15, 0, .LBB0_3
// %bb.4:
	add r1, r22, -24
	move r0, r14
	call r23, buddy_search_for_pointer
	sub r1, 12, r0
	lsl r1, one, r1
	jeq r0, -1, .LBB0_5
// %bb.6:
	move r2, r1
	jeq r0, -1, .LBB0_8
.LBB0_9:
	lsr r0, r2, 1
	move r16, r15
	jgeu r0, r15, .LBB0_12
// %bb.10:
	move r16, r1
	jgeu r2, r15, .LBB0_11
.LBB0_12:
	move r0, r14
	call r23, safe_buddy_free
	move r0, r15
	call r23, safe_buddy_alloc
	move r15, r0
	move r1, r14
	move r2, r16
	call r23, memcpy
	// inline asm
.Ltmp1:
	release zero, __atomic_bit___buddy_lock, nz, .Ltmp1+1
	// inline asm
	move r14, r15, true, .LBB0_13
.LBB0_1:
	move r0, r15
	call r23, safe_buddy_alloc
	// inline asm
.Ltmp2:
	release zero, __atomic_bit___buddy_lock, nz, .Ltmp2+1
	// inline asm
	move r14, r0, true, .LBB0_13
.LBB0_3:
	move r0, r14
	call r23, safe_buddy_free
	// inline asm
.Ltmp3:
	release zero, __atomic_bit___buddy_lock, nz, .Ltmp3+1
	// inline asm
	jump .LBB0_13
.LBB0_5:
	move r2, -1
	jneq r0, -1, .LBB0_9
.LBB0_8:
	// inline asm
.Ltmp4:
	release zero, __atomic_bit___buddy_lock, nz, .Ltmp4+1
	// inline asm
	move r14, 0, true, .LBB0_13
.LBB0_11:
	// inline asm
.Ltmp5:
	release zero, __atomic_bit___buddy_lock, nz, .Ltmp5+1
	// inline asm
.LBB0_13:
	move r0, r14
	ld d16, r22, -40
	ld d14, r22, -32
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	buddy_realloc, .Lfunc_end0-buddy_realloc
	.section	.stack_sizes,"o",@progbits,.text.buddy_realloc
	.long	.Lfunc_begin0
	.byte	40
	.section	.text.buddy_realloc,"ax",@progbits
                                        // -- End function
	.addrsig
	.addrsig_sym __atomic_bit___buddy_lock
