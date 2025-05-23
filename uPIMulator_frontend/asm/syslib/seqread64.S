	.text
	.file	"seqread64.c"
	.section	.text.seqread64_alloc,"ax",@progbits
	.globl	seqread64_alloc                 // -- Begin function seqread64_alloc
	.type	seqread64_alloc,@function
seqread64_alloc:                        // @seqread64_alloc
.Lfunc_begin0:
// %bb.0:
	sd r22, 8, d22
	add r22, r22, 16
	sd r22, -16, d14
	// inline asm
.Ltmp0:
	acquire zero, __atomic_bit___heap_pointer, nz, .Ltmp0
	// inline asm
	lw r0, zero, __sys_heap_pointer
	add r1, r0, 63
	and r14, r1, -64
	sub r0, r14, r0
	add r0, r0, 128
	call r23, mem_alloc_nolock
	// inline asm
.Ltmp1:
	release zero, __atomic_bit___heap_pointer, nz, .Ltmp1+1
	// inline asm
	move r0, r14
	ld d14, r22, -16
	ld d22, r22, -8
	jump r23
.Lfunc_end0:
	.size	seqread64_alloc, .Lfunc_end0-seqread64_alloc
	.section	.stack_sizes,"o",@progbits,.text.seqread64_alloc
	.long	.Lfunc_begin0
	.byte	16
	.section	.text.seqread64_alloc,"ax",@progbits
                                        // -- End function
	.section	.text.seqread64_init,"ax",@progbits
	.globl	seqread64_init                  // -- Begin function seqread64_init
	.type	seqread64_init,@function
seqread64_init:                         // @seqread64_init
.Lfunc_begin1:
// %bb.0:
	sw r2, 0, r0
	move r3, 67108864
	sw r2, 4, r3
	add r3, r1, -67108864
	jltu r3, 64, .LBB1_2
// %bb.1:
	and r4, r1, -64
	ldma r0, r4, 15
	and r3, r1, 63
	sw r2, 4, r4
.LBB1_2:
	add r0, r3, r0
	jump r23
.Lfunc_end1:
	.size	seqread64_init, .Lfunc_end1-seqread64_init
	.section	.stack_sizes,"o",@progbits,.text.seqread64_init
	.long	.Lfunc_begin1
	.byte	0
	.section	.text.seqread64_init,"ax",@progbits
                                        // -- End function
	.section	.text.seqread64_seek,"ax",@progbits
	.globl	seqread64_seek                  // -- Begin function seqread64_seek
	.type	seqread64_seek,@function
seqread64_seek:                         // @seqread64_seek
.Lfunc_begin2:
// %bb.0:
	lw r3, r1, 4
	lw r2, r1, 0
	sub r3, r0, r3
	jltu r3, 64, .LBB2_2
// %bb.1:
	and r4, r0, -64
	ldma r2, r4, 15
	and r3, r0, 63
	sw r1, 4, r4
.LBB2_2:
	add r0, r3, r2
	jump r23
.Lfunc_end2:
	.size	seqread64_seek, .Lfunc_end2-seqread64_seek
	.section	.stack_sizes,"o",@progbits,.text.seqread64_seek
	.long	.Lfunc_begin2
	.byte	0
	.section	.text.seqread64_seek,"ax",@progbits
                                        // -- End function
	.section	.text.seqread64_get,"ax",@progbits
	.globl	seqread64_get                   // -- Begin function seqread64_get
	.type	seqread64_get,@function
seqread64_get:                          // @seqread64_get
.Lfunc_begin3:
// %bb.0:
	add r0, r0, r1, nc6, .LBB3_2
// %bb.1:
	lw r1, r2, 4
	add r1, r1, 64
	sw r2, 4, r1
	lw r2, r2, 0
	ldma r2, r1, 15
	add r0, r0, 4294967232
.LBB3_2:
	jump r23
.Lfunc_end3:
	.size	seqread64_get, .Lfunc_end3-seqread64_get
	.section	.stack_sizes,"o",@progbits,.text.seqread64_get
	.long	.Lfunc_begin3
	.byte	0
	.section	.text.seqread64_get,"ax",@progbits
                                        // -- End function
	.section	.text.seqread64_tell,"ax",@progbits
	.globl	seqread64_tell                  // -- Begin function seqread64_tell
	.type	seqread64_tell,@function
seqread64_tell:                         // @seqread64_tell
.Lfunc_begin4:
// %bb.0:
	lw r1, r1, 4
	and r0, r0, 63
	add r0, r1, r0
	jump r23
.Lfunc_end4:
	.size	seqread64_tell, .Lfunc_end4-seqread64_tell
	.section	.stack_sizes,"o",@progbits,.text.seqread64_tell
	.long	.Lfunc_begin4
	.byte	0
	.section	.text.seqread64_tell,"ax",@progbits
                                        // -- End function
	.addrsig
	.addrsig_sym __atomic_bit___heap_pointer
	.addrsig_sym __sys_heap_pointer
