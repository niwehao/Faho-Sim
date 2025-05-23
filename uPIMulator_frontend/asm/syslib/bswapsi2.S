	.text
	.file	"bswapsi2.c"
	.section	.text.__bswapsi2,"ax",@progbits
	.globl	__bswapsi2                      // -- Begin function __bswapsi2
	.type	__bswapsi2,@function
__bswapsi2:                             // @__bswapsi2
.Lfunc_begin0:
// %bb.0:
	sw r22, 0, r0                           // 4-byte Folded Spill
	lw !big, r0, r22, 0
	jump r23
.Lfunc_end0:
	.size	__bswapsi2, .Lfunc_end0-__bswapsi2
	.section	.stack_sizes,"o",@progbits,.text.__bswapsi2
	.long	.Lfunc_begin0
	.byte	8
	.section	.text.__bswapsi2,"ax",@progbits
                                        // -- End function
	.addrsig
