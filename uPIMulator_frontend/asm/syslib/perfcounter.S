	.text
	.file	"perfcounter.c"
	.section	.text.perfcounter_get,"ax",@progbits
	.globl	perfcounter_get                 // -- Begin function perfcounter_get
	.type	perfcounter_get,@function
perfcounter_get:                        // @perfcounter_get
.Lfunc_begin0:
// %bb.0:
	// inline asm
	time r0
	// inline asm
	move.u d2, r0
	lslx r0, r3, 4
	lsl_add r0, r0, r2, 4
	lsl r1, r3, 4
	jump r23
.Lfunc_end0:
	.size	perfcounter_get, .Lfunc_end0-perfcounter_get
	.section	.stack_sizes,"o",@progbits,.text.perfcounter_get
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.perfcounter_get,"ax",@progbits
                                        // -- End function
	.section	.text.perfcounter_config,"ax",@progbits
	.globl	perfcounter_config              // -- Begin function perfcounter_config
	.type	perfcounter_config,@function
perfcounter_config:                     // @perfcounter_config
.Lfunc_begin1:
// %bb.0:
	lsl_add r0, r1, r0, 1
	// inline asm
	time_cfg r0, r0
	// inline asm
	move.u d2, r0
	lslx r0, r3, 4
	lsl_add r0, r0, r2, 4
	lsl r1, r3, 4
	jump r23
.Lfunc_end1:
	.size	perfcounter_config, .Lfunc_end1-perfcounter_config
	.section	.stack_sizes,"o",@progbits,.text.perfcounter_config
	.long	.Lfunc_begin1
	.byte	0
	.section	.text.perfcounter_config,"ax",@progbits
                                        // -- End function
	.addrsig
