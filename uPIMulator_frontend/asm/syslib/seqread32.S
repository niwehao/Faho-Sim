	.text
	.file	"seqread32.c"
	.section	.text.seqread32_alloc,"ax",@progbits
	.globl	seqread32_alloc                 // -- Begin function seqread32_alloc
	.type	seqread32_alloc,@function
seqread32_alloc:                        // @seqread32_alloc
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
	add r1, r0, 31
	and r14, r1, -32
	sub r0, r14, r0
	add r0, r0, 64
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
	.size	seqread32_alloc, .Lfunc_end0-seqread32_alloc
	.section	.stack_sizes,"o",@progbits,.text.seqread32_alloc
	.long	.Lfunc_begin0
	.byte	16
	.section	.text.seqread32_alloc,"ax",@progbits
                                        // -- End function
	.section	.text.seqread32_init,"ax",@progbits
	.globl	seqread32_init                  // -- Begin function seqread32_init
	.type	seqread32_init,@function
seqread32_init:                         // @seqread32_init
.Lfunc_begin1:
// %bb.0:
	sw r2, 0, r0
	move r3, 67108864
	sw r2, 4, r3
	add r3, r1, -67108864
	jltu r3, 32, .LBB1_2
// %bb.1:
	and r4, r1, -32
	ldma r0, r4, 7
	and r3, r1, 31
	sw r2, 4, r4
.LBB1_2:
	add r0, r3, r0
	jump r23
.Lfunc_end1:
	.size	seqread32_init, .Lfunc_end1-seqread32_init
	.section	.stack_sizes,"o",@progbits,.text.seqread32_init
	.long	.Lfunc_begin1
	.byte	0
	.section	.text.seqread32_init,"ax",@progbits
                                        // -- End function
	.section	.text.seqread32_seek,"ax",@progbits
	.globl	seqread32_seek                  // -- Begin function seqread32_seek
	.type	seqread32_seek,@function
seqread32_seek:                         // @seqread32_seek
.Lfunc_begin2:
// %bb.0:
	lw r3, r1, 4
	lw r2, r1, 0
	sub r3, r0, r3
	jltu r3, 32, .LBB2_2
// %bb.1:
	and r4, r0, -32
	ldma r2, r4, 7
	and r3, r0, 31
	sw r1, 4, r4
.LBB2_2:
	add r0, r3, r2
	jump r23
.Lfunc_end2:
	.size	seqread32_seek, .Lfunc_end2-seqread32_seek
	.section	.stack_sizes,"o",@progbits,.text.seqread32_seek
	.long	.Lfunc_begin2
	.byte	0
	.section	.text.seqread32_seek,"ax",@progbits
                                        // -- End function
	.section	.text.seqread32_get,"ax",@progbits
	.globl	seqread32_get                   // -- Begin function seqread32_get
	.type	seqread32_get,@function
seqread32_get:                          // @seqread32_get
.Lfunc_begin3:
// %bb.0:
	add r0, r0, r1, nc5, .LBB3_2
// %bb.1:
	lw r1, r2, 4
	add r1, r1, 32
	sw r2, 4, r1
	lw r2, r2, 0
	ldma r2, r1, 7
	add r0, r0, 4294967264
.LBB3_2:
	jump r23
.Lfunc_end3:
	.size	seqread32_get, .Lfunc_end3-seqread32_get
	.section	.stack_sizes,"o",@progbits,.text.seqread32_get
	.long	.Lfunc_begin3
	.byte	0
	.section	.text.seqread32_get,"ax",@progbits
                                        // -- End function
	.section	.text.seqread32_tell,"ax",@progbits
	.globl	seqread32_tell                  // -- Begin function seqread32_tell
	.type	seqread32_tell,@function
seqread32_tell:                         // @seqread32_tell
.Lfunc_begin4:
// %bb.0:
	lw r1, r1, 4
	and r0, r0, 31
	add r0, r1, r0
	jump r23
.Lfunc_end4:
	.size	seqread32_tell, .Lfunc_end4-seqread32_tell
	.section	.stack_sizes,"o",@progbits,.text.seqread32_tell
	.long	.Lfunc_begin4
	.byte	0
	.section	.text.seqread32_tell,"ax",@progbits
                                        // -- End function
	.addrsig
	.addrsig_sym __atomic_bit___heap_pointer
	.addrsig_sym __sys_heap_pointer
