	.text
	.file	"seqread256.c"
	.section	.text.seqread256_alloc,"ax",@progbits
	.globl	seqread256_alloc                // -- Begin function seqread256_alloc
	.type	seqread256_alloc,@function
seqread256_alloc:                       // @seqread256_alloc
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
	add r1, r0, 255
	and r14, r1, -256
	sub r0, r14, r0
	add r0, r0, 512
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
	.size	seqread256_alloc, .Lfunc_end0-seqread256_alloc
	.section	.stack_sizes,"o",@progbits,.text.seqread256_alloc
	.long	.Lfunc_begin0
	.byte	16
	.section	.text.seqread256_alloc,"ax",@progbits
                                        // -- End function
	.section	.text.seqread256_init,"ax",@progbits
	.globl	seqread256_init                 // -- Begin function seqread256_init
	.type	seqread256_init,@function
seqread256_init:                        // @seqread256_init
.Lfunc_begin1:
// %bb.0:
	sw r2, 0, r0
	move r3, 67108864
	sw r2, 4, r3
	add r3, r1, -67108864
	jltu r3, 256, .LBB1_2
// %bb.1:
	and r4, r1, -256
	ldma r0, r4, 63
	and r3, r1, 255
	sw r2, 4, r4
.LBB1_2:
	add r0, r3, r0
	jump r23
.Lfunc_end1:
	.size	seqread256_init, .Lfunc_end1-seqread256_init
	.section	.stack_sizes,"o",@progbits,.text.seqread256_init
	.long	.Lfunc_begin1
	.byte	0
	.section	.text.seqread256_init,"ax",@progbits
                                        // -- End function
	.section	.text.seqread256_seek,"ax",@progbits
	.globl	seqread256_seek                 // -- Begin function seqread256_seek
	.type	seqread256_seek,@function
seqread256_seek:                        // @seqread256_seek
.Lfunc_begin2:
// %bb.0:
	lw r3, r1, 4
	lw r2, r1, 0
	sub r3, r0, r3
	jltu r3, 256, .LBB2_2
// %bb.1:
	and r4, r0, -256
	ldma r2, r4, 63
	and r3, r0, 255
	sw r1, 4, r4
.LBB2_2:
	add r0, r3, r2
	jump r23
.Lfunc_end2:
	.size	seqread256_seek, .Lfunc_end2-seqread256_seek
	.section	.stack_sizes,"o",@progbits,.text.seqread256_seek
	.long	.Lfunc_begin2
	.byte	0
	.section	.text.seqread256_seek,"ax",@progbits
                                        // -- End function
	.section	.text.seqread256_get,"ax",@progbits
	.globl	seqread256_get                  // -- Begin function seqread256_get
	.type	seqread256_get,@function
seqread256_get:                         // @seqread256_get
.Lfunc_begin3:
// %bb.0:
	add r0, r0, r1, nc8, .LBB3_2
// %bb.1:
	lw r1, r2, 4
	add r1, r1, 256
	sw r2, 4, r1
	lw r2, r2, 0
	ldma r2, r1, 63
	add r0, r0, 4294967040
.LBB3_2:
	jump r23
.Lfunc_end3:
	.size	seqread256_get, .Lfunc_end3-seqread256_get
	.section	.stack_sizes,"o",@progbits,.text.seqread256_get
	.long	.Lfunc_begin3
	.byte	0
	.section	.text.seqread256_get,"ax",@progbits
                                        // -- End function
	.section	.text.seqread256_tell,"ax",@progbits
	.globl	seqread256_tell                 // -- Begin function seqread256_tell
	.type	seqread256_tell,@function
seqread256_tell:                        // @seqread256_tell
.Lfunc_begin4:
// %bb.0:
	lw r1, r1, 4
	and r0, r0, 255
	add r0, r1, r0
	jump r23
.Lfunc_end4:
	.size	seqread256_tell, .Lfunc_end4-seqread256_tell
	.section	.stack_sizes,"o",@progbits,.text.seqread256_tell
	.long	.Lfunc_begin4
	.byte	0
	.section	.text.seqread256_tell,"ax",@progbits
                                        // -- End function
	.addrsig
	.addrsig_sym __atomic_bit___heap_pointer
	.addrsig_sym __sys_heap_pointer
