	.text
	.file	"restoreRegisters.c"
	.section	.text.__bootstrap,"ax",@progbits
	.globl	__bootstrap                     // -- Begin function __bootstrap
	.type	__bootstrap,@function
__bootstrap:                            // @__bootstrap
.Lfunc_begin0:
// %bb.0:
	// inline asm
.Ltmp0:
	jeq id, 23, .Ltmp0+2
	boot id, 1
	ld d2, id8, 448
	ld d4, id8, 640
	ld d6, id8, 832
	ld d8, id8, 1024
	ld d10, id8, 1216
	ld d12, id8, 1408
	ld d14, id8, 1600
	ld d16, id8, 1792
	ld d18, id8, 1984
	ld d20, id8, 2176
	ld d22, id8, 2368
	jnz id, atomic_done
	move r0, 255
atomic_loop:
	lbu r1, r0, 0
	jz r1, atomic_release
	acquire r0, 0, true, atomic_next
atomic_release:
	release r0, 0, nz, atomic_next
atomic_next:
	add r0, r0, -1, pl, atomic_loop
atomic_done:
	lw r0, id4, 2560
	add r1, r0, r0
	add r0, r0, r1
	or r1, id8, 0
	add r1, id4, r1
	add r0, r0, r1
	call zero, r0, ending_routines
ending_routines:
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 1
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483649
	ld d0, id8, 256
	stop true, 0x0
	add r0, zero, 0
	ld d0, id8, 256
	stop true, 0x0
	add r0, mneg, 2147483648
	ld d0, id8, 256
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
