	.text
	.file	"errno.c"
	.type	__errno,@object                 // @__errno
	.section	.bss.__errno,"aw",@nobits
	.globl	__errno
	.p2align	2
__errno:
	.zero	96
	.size	__errno, 96

	.addrsig
