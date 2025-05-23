	.text
	.file	"internalStateReset.c"
	.section	.text.__bootstrap,"ax",@progbits
	.globl	__bootstrap                     // -- Begin function __bootstrap
	.type	__bootstrap,@function
__bootstrap:                            // @__bootstrap
.Lfunc_begin0:
// %bb.0:
	// inline asm
	sub r0, 255, id
before_release:
	release r0, 0, nz, after_release
after_release:
	sub r0, r0, 24, pl, before_release
	add r0, zero, 7
	time_cfg zero, r0
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
