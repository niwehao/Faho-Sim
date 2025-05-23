	.text
	.file	"accessMramFromDpu.c"
	.section	.text.__bootstrap,"ax",@progbits
	.globl	__bootstrap                     // -- Begin function __bootstrap
	.type	__bootstrap,@function
__bootstrap:                            // @__bootstrap
.Lfunc_begin0:
// %bb.0:
	// inline asm
	sd zero, 0, d0
	sd zero, 8, d2
.Ltmp0:
	or r0, zero, 0, xnz, .Ltmp0+2
	or r0, r0, 2
	addc r0, r0, 0
	sw zero, 16, r0
	lw r0, zero, 20
resume_start:
	lw r1, zero, 24
	move r2, 32
	move r3, 2048
transfer_loop:
	jltu r1, r3, last_transfer
	ldma r2, r0, 255
	add r0, r0, r3
	add r2, r2, r3
	sub r1, r1, r3, true, transfer_loop
last_transfer:
	jz r1, end
	lsr r3, r1, 3
	add r3, r3, -1
	lsl_add r2, r2, r3, 24
	ldma r2, r0, 0
	add r0, r0, r1
end:
	lw r2, zero, 28
.Ltmp1:
	jnz r2, .Ltmp1+2
	stop true, resume_start
	ld d2, zero, 8
	lw r0, zero, 16
	add r1, r0, r0
	add r0, r0, r1
.Ltmp2:
	call zero, r0, .Ltmp2+1
	add r0, zero, 1
	ld d0, zero, 0
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, zero, 0
	stop true, 0x0
	add r0, zero, 0
	ld d0, zero, 0
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, zero, 0
	stop true, 0x0

	// inline asm
.Lfunc_end0:
	.size	__bootstrap, .Lfunc_end0-__bootstrap
	.section	.stack_sizes,"o",@progbits,.text.__bootstrap
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.__bootstrap,"ax",@progbits
                                        // -- End function
	.addrsig
	.addrsig_sym __bootstrap
