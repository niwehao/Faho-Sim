	.text
	.file	"soft_cache.c"
	.type	__sw_cache_buffer,@object       // @__sw_cache_buffer
	.section	.bss.__sw_cache_buffer,"aw",@nobits
	.globl	__sw_cache_buffer
	.p2align	3
__sw_cache_buffer:
	.zero	192
	.size	__sw_cache_buffer, 192

	.addrsig
	.addrsig_sym __sw_cache_buffer
