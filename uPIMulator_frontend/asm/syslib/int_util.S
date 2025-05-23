	.text
	.file	"int_util.c"
	.section	.text.compilerrt_abort_impl,"ax",@progbits
	.globl	compilerrt_abort_impl           // -- Begin function compilerrt_abort_impl
	.type	compilerrt_abort_impl,@function
compilerrt_abort_impl:                  // @compilerrt_abort_impl
.Lfunc_begin0:
// %bb.0:
	sd r22, 0, d22
	add r22, r22, 8
	call r23, abort
.Lfunc_end0:
	.size	compilerrt_abort_impl, .Lfunc_end0-compilerrt_abort_impl
	.section	.stack_sizes,"o",@progbits,.text.compilerrt_abort_impl
	.long	.Lfunc_begin0
	.byte	8
	.section	.text.compilerrt_abort_impl,"ax",@progbits
                                        // -- End function
	.addrsig
