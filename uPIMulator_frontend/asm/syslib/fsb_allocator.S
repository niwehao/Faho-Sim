	.text
	.file	"fsb_allocator.c"
	.section	.text.fsb_alloc,"ax",@progbits
	.globl	fsb_alloc                       // -- Begin function fsb_alloc
	.type	fsb_alloc,@function
fsb_alloc:                              // @fsb_alloc
.Lfunc_begin0:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sd r22, -16, d14
	move r15, r1
	jgeu r0, -7, .LBB0_9
// %bb.1:
	jeq r0, 0, .LBB0_2
// %bb.3:
	add r0, r0, 7
	and r14, r0, -8, true, .LBB0_4
.LBB0_2:
	move r14, 8
.LBB0_4:
	move r0, r14
	move r1, r15
	call r23, __mulsi3
	or r0, r0, 4
	call r23, mem_alloc
	move r2, r0
	add r1, r15, -1, z, .LBB0_8
// %bb.5:
	add r3, r14, r0
	move r2, 0
.LBB0_6:                                // =>This Inner Loop Header: Depth=1
	add r4, r3, r2
	add r5, r0, r2
	sw r5, 0, r4
	add r2, r2, r14
	add r1, r1, -1, nz, .LBB0_6
// %bb.7:
	add r2, r0, r2
.LBB0_8:
	sw r2, 0, 0
	add r1, r2, r14
	sw r1, 0, r0
	move r0, r1
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.LBB0_9:
	// inline asm
	fault 1
	// inline asm
.Lfunc_end0:
	.size	fsb_alloc, .Lfunc_end0-fsb_alloc
	.section	.stack_sizes,"o",@progbits,.text.fsb_alloc
	.long	.Lfunc_begin0
	.byte	16
	.section	.text.fsb_alloc,"ax",@progbits
                                        // -- End function
	.section	.text.fsb_get,"ax",@progbits
	.globl	fsb_get                         // -- Begin function fsb_get
	.type	fsb_get,@function
fsb_get:                                // @fsb_get
.Lfunc_begin1:
// %bb.0:
	// inline asm
.Ltmp0:
	acquire zero, __atomic_bit___fsb_lock, nz, .Ltmp0
	// inline asm
	move r1, r0
	// inline asm
	lw r0, r1, 0
	// inline asm
	jeq r0, 0, .LBB1_1
// %bb.2:
	lw r2, r0, 0
	// inline asm
	sw r1, 0, r2
	// inline asm
	// inline asm
.Ltmp1:
	release zero, __atomic_bit___fsb_lock, nz, .Ltmp1+1
	// inline asm
	jump r23
.LBB1_1:
	// inline asm
.Ltmp2:
	release zero, __atomic_bit___fsb_lock, nz, .Ltmp2+1
	// inline asm
	move r0, 0
	jump r23
.Lfunc_end1:
	.size	fsb_get, .Lfunc_end1-fsb_get
	.section	.stack_sizes,"o",@progbits,.text.fsb_get
	.long	.Lfunc_begin1
	.byte	0
	.section	.text.fsb_get,"ax",@progbits
                                        // -- End function
	.section	.text.fsb_free,"ax",@progbits
	.globl	fsb_free                        // -- Begin function fsb_free
	.type	fsb_free,@function
fsb_free:                               // @fsb_free
.Lfunc_begin2:
// %bb.0:
	// inline asm
.Ltmp3:
	acquire zero, __atomic_bit___fsb_lock, nz, .Ltmp3
	// inline asm
	// inline asm
	lw r2, r0, 0
	// inline asm
	sw r1, 0, r2
	// inline asm
	sw r0, 0, r1
	// inline asm
	// inline asm
.Ltmp4:
	release zero, __atomic_bit___fsb_lock, nz, .Ltmp4+1
	// inline asm
	jump r23
.Lfunc_end2:
	.size	fsb_free, .Lfunc_end2-fsb_free
	.section	.stack_sizes,"o",@progbits,.text.fsb_free
	.long	.Lfunc_begin2
	.byte	0
	.section	.text.fsb_free,"ax",@progbits
                                        // -- End function
	.type	__atomic_bit___fsb_lock,@object // @__atomic_bit___fsb_lock
	.section	.atomic,"aw",@progbits
	.globl	__atomic_bit___fsb_lock
__atomic_bit___fsb_lock:
	.byte	0                               // 0x0
	.size	__atomic_bit___fsb_lock, 1

	.addrsig
	.addrsig_sym __atomic_bit___fsb_lock
