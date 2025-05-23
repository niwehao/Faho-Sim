	.text
	.file	"bswapdi2.c"
	.section	.text.__bswapdi2,"ax",@progbits
	.globl	__bswapdi2                      // -- Begin function __bswapdi2
	.type	__bswapdi2,@function
__bswapdi2:                             // @__bswapdi2
.Lfunc_begin0:
// %bb.0:
	sd r22, 0, d0                           // 8-byte Folded Spill
	ld !big, d0, r22, 0
	jump r23
.Lfunc_end0:
	.size	__bswapdi2, .Lfunc_end0-__bswapdi2
	.section	.stack_sizes,"o",@progbits,.text.__bswapdi2
	.long	.Lfunc_begin0
	.byte	8
	.section	.text.__bswapdi2,"ax",@progbits
                                        // -- End function
	.addrsig
