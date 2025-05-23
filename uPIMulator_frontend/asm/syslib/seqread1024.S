	.text
	.file	"seqread1024.c"
	.section	.text.seqread1024_alloc,"ax",@progbits
	.globl	seqread1024_alloc               // -- Begin function seqread1024_alloc
	.type	seqread1024_alloc,@function
seqread1024_alloc:                      // @seqread1024_alloc
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
	add r1, r0, 1023
	and r14, r1, -1024
	sub r0, r14, r0
	add r0, r0, 2048
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
	.size	seqread1024_alloc, .Lfunc_end0-seqread1024_alloc
	.section	.stack_sizes,"o",@progbits,.text.seqread1024_alloc
	.long	.Lfunc_begin0
	.byte	16
	.section	.text.seqread1024_alloc,"ax",@progbits
                                        // -- End function
	.section	.text.seqread1024_init,"ax",@progbits
	.globl	seqread1024_init                // -- Begin function seqread1024_init
	.type	seqread1024_init,@function
seqread1024_init:                       // @seqread1024_init
.Lfunc_begin1:
// %bb.0:
	sw r2, 0, r0
	move r3, 67108864
	sw r2, 4, r3
	add r3, r1, -67108864
	lsr r4, r3, 10, z, .LBB1_2
// %bb.1:
	and r4, r1, -1024
	ldma r0, r4, 255
	and r3, r1, 1023
	sw r2, 4, r4
.LBB1_2:
	add r0, r3, r0
	jump r23
.Lfunc_end1:
	.size	seqread1024_init, .Lfunc_end1-seqread1024_init
	.section	.stack_sizes,"o",@progbits,.text.seqread1024_init
	.long	.Lfunc_begin1
	.byte	0
	.section	.text.seqread1024_init,"ax",@progbits
                                        // -- End function
	.section	.text.seqread1024_seek,"ax",@progbits
	.globl	seqread1024_seek                // -- Begin function seqread1024_seek
	.type	seqread1024_seek,@function
seqread1024_seek:                       // @seqread1024_seek
.Lfunc_begin2:
// %bb.0:
	lw r3, r1, 4
	lw r2, r1, 0
	sub r3, r0, r3
	lsr r4, r3, 10, z, .LBB2_2
// %bb.1:
	and r4, r0, -1024
	ldma r2, r4, 255
	and r3, r0, 1023
	sw r1, 4, r4
.LBB2_2:
	add r0, r3, r2
	jump r23
.Lfunc_end2:
	.size	seqread1024_seek, .Lfunc_end2-seqread1024_seek
	.section	.stack_sizes,"o",@progbits,.text.seqread1024_seek
	.long	.Lfunc_begin2
	.byte	0
	.section	.text.seqread1024_seek,"ax",@progbits
                                        // -- End function
	.section	.text.seqread1024_get,"ax",@progbits
	.globl	seqread1024_get                 // -- Begin function seqread1024_get
	.type	seqread1024_get,@function
seqread1024_get:                        // @seqread1024_get
.Lfunc_begin3:
// %bb.0:
	add r0, r0, r1, nc10, .LBB3_2
// %bb.1:
	lw r1, r2, 4
	add r1, r1, 1024
	sw r2, 4, r1
	lw r2, r2, 0
	ldma r2, r1, 255
	add r0, r0, 4294966272
.LBB3_2:
	jump r23
.Lfunc_end3:
	.size	seqread1024_get, .Lfunc_end3-seqread1024_get
	.section	.stack_sizes,"o",@progbits,.text.seqread1024_get
	.long	.Lfunc_begin3
	.byte	0
	.section	.text.seqread1024_get,"ax",@progbits
                                        // -- End function
	.section	.text.seqread1024_tell,"ax",@progbits
	.globl	seqread1024_tell                // -- Begin function seqread1024_tell
	.type	seqread1024_tell,@function
seqread1024_tell:                       // @seqread1024_tell
.Lfunc_begin4:
// %bb.0:
	lw r1, r1, 4
	and r0, r0, 1023
	add r0, r1, r0
	jump r23
.Lfunc_end4:
	.size	seqread1024_tell, .Lfunc_end4-seqread1024_tell
	.section	.stack_sizes,"o",@progbits,.text.seqread1024_tell
	.long	.Lfunc_begin4
	.byte	0
	.section	.text.seqread1024_tell,"ax",@progbits
                                        // -- End function
	.addrsig
	.addrsig_sym __atomic_bit___heap_pointer
	.addrsig_sym __sys_heap_pointer
