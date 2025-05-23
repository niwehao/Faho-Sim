	.text
	.file	"waitqueue.c"
	.type	__sys_wq_table,@object          // @__sys_wq_table
	.section	.data.__sys_wq_table,"aw",@progbits
	.globl	__sys_wq_table
__sys_wq_table:
	.zero	24,255
	.size	__sys_wq_table, 24

	.addrsig
	.addrsig_sym __sys_wq_table
