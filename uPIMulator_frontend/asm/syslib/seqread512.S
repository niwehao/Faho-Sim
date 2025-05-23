	.text
	.file	"seqread512.c"
	.section	.text.seqread512_alloc,"ax",@progbits
	.globl	seqread512_alloc                // -- Begin function seqread512_alloc
	.type	seqread512_alloc,@function
seqread512_alloc:                       // @seqread512_alloc
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
	add r1, r0, 511
	and r14, r1, -512
	sub r0, r14, r0
	add r0, r0, 1024
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
	.size	seqread512_alloc, .Lfunc_end0-seqread512_alloc
	.section	.stack_sizes,"o",@progbits,.text.seqread512_alloc
	.long	.Lfunc_begin0
	.byte	16
	.section	.text.seqread512_alloc,"ax",@progbits
                                        // -- End function
	.section	.text.seqread512_init,"ax",@progbits
	.globl	seqread512_init                 // -- Begin function seqread512_init
	.type	seqread512_init,@function
seqread512_init:                        // @seqread512_init
.Lfunc_begin1:
// %bb.0:
	sw r2, 0, r0
	move r3, 67108864
	sw r2, 4, r3
	add r3, r1, -67108864
	jltu r3, 512, .LBB1_2
// %bb.1:
	and r4, r1, -512
	ldma r0, r4, 127
	and r3, r1, 511
	sw r2, 4, r4
.LBB1_2:
	add r0, r3, r0
	jump r23
.Lfunc_end1:
	.size	seqread512_init, .Lfunc_end1-seqread512_init
	.section	.stack_sizes,"o",@progbits,.text.seqread512_init
	.long	.Lfunc_begin1
	.byte	0
	.section	.text.seqread512_init,"ax",@progbits
                                        // -- End function
	.section	.text.seqread512_seek,"ax",@progbits
	.globl	seqread512_seek                 // -- Begin function seqread512_seek
	.type	seqread512_seek,@function
seqread512_seek:                        // @seqread512_seek
.Lfunc_begin2:
// %bb.0:
	lw r3, r1, 4
	lw r2, r1, 0
	sub r3, r0, r3
	jltu r3, 512, .LBB2_2
// %bb.1:
	and r4, r0, -512
	ldma r2, r4, 127
	and r3, r0, 511
	sw r1, 4, r4
.LBB2_2:
	add r0, r3, r2
	jump r23
.Lfunc_end2:
	.size	seqread512_seek, .Lfunc_end2-seqread512_seek
	.section	.stack_sizes,"o",@progbits,.text.seqread512_seek
	.long	.Lfunc_begin2
	.byte	0
	.section	.text.seqread512_seek,"ax",@progbits
                                        // -- End function
	.section	.text.seqread512_get,"ax",@progbits
	.globl	seqread512_get                  // -- Begin function seqread512_get
	.type	seqread512_get,@function
seqread512_get:                         // @seqread512_get
.Lfunc_begin3:
// %bb.0:
	add r0, r0, r1, nc9, .LBB3_2
// %bb.1:
	lw r1, r2, 4
	add r1, r1, 512
	sw r2, 4, r1
	lw r2, r2, 0
	ldma r2, r1, 127
	add r0, r0, 4294966784
.LBB3_2:
	jump r23
.Lfunc_end3:
	.size	seqread512_get, .Lfunc_end3-seqread512_get
	.section	.stack_sizes,"o",@progbits,.text.seqread512_get
	.long	.Lfunc_begin3
	.byte	0
	.section	.text.seqread512_get,"ax",@progbits
                                        // -- End function
	.section	.text.seqread512_tell,"ax",@progbits
	.globl	seqread512_tell                 // -- Begin function seqread512_tell
	.type	seqread512_tell,@function
seqread512_tell:                        // @seqread512_tell
.Lfunc_begin4:
// %bb.0:
	lw r1, r1, 4
	and r0, r0, 511
	add r0, r1, r0
	jump r23
.Lfunc_end4:
	.size	seqread512_tell, .Lfunc_end4-seqread512_tell
	.section	.stack_sizes,"o",@progbits,.text.seqread512_tell
	.long	.Lfunc_begin4
	.byte	0
	.section	.text.seqread512_tell,"ax",@progbits
                                        // -- End function
	.addrsig
	.addrsig_sym __atomic_bit___heap_pointer
	.addrsig_sym __sys_heap_pointer
