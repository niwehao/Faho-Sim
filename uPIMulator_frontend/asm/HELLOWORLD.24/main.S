	.text
	.file	"helloworld.c"
	.section	.text.syscall,"ax",@progbits
	.globl	syscall                         // -- Begin function syscall
	.type	syscall,@function
syscall:                                // @syscall
.Lfunc_begin0:
// %bb.0:
	move r0, 0
	// inline asm
	jump 0x0
	// inline asm
	jump r23
.Lfunc_end0:
	.size	syscall, .Lfunc_end0-syscall
	.section	.stack_sizes,"o",@progbits,.text.syscall
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.syscall,"ax",@progbits
                                        // -- End function
	.section	.text.socket_read,"ax",@progbits
	.globl	socket_read                     // -- Begin function socket_read
	.type	socket_read,@function
socket_read:                            // @socket_read
.Lfunc_begin1:
// %bb.0:
	move r0, 0
	// inline asm
	jump 0x0
	// inline asm
	jump r23
.Lfunc_end1:
	.size	socket_read, .Lfunc_end1-socket_read
	.section	.stack_sizes,"o",@progbits,.text.socket_read
	.long	.Lfunc_begin1
	.byte	0
	.section	.text.socket_read,"ax",@progbits
                                        // -- End function
	.section	.text.socket_write,"ax",@progbits
	.globl	socket_write                    // -- Begin function socket_write
	.type	socket_write,@function
socket_write:                           // @socket_write
.Lfunc_begin2:
// %bb.0:
	move r0, 0
	// inline asm
	jump 0x0
	// inline asm
	jump r23
.Lfunc_end2:
	.size	socket_write, .Lfunc_end2-socket_write
	.section	.stack_sizes,"o",@progbits,.text.socket_write
	.long	.Lfunc_begin2
	.byte	0
	.section	.text.socket_write,"ax",@progbits
                                        // -- End function
	.section	.text.socket_open,"ax",@progbits
	.globl	socket_open                     // -- Begin function socket_open
	.type	socket_open,@function
socket_open:                            // @socket_open
.Lfunc_begin3:
// %bb.0:
	move r0, 0
	// inline asm
	jump 0x0
	// inline asm
	jump r23
.Lfunc_end3:
	.size	socket_open, .Lfunc_end3-socket_open
	.section	.stack_sizes,"o",@progbits,.text.socket_open
	.long	.Lfunc_begin3
	.byte	0
	.section	.text.socket_open,"ax",@progbits
                                        // -- End function
	.section	.text.socket_close,"ax",@progbits
	.globl	socket_close                    // -- Begin function socket_close
	.type	socket_close,@function
socket_close:                           // @socket_close
.Lfunc_begin4:
// %bb.0:
	move r0, 0
	// inline asm
	jump 0x0
	// inline asm
	jump r23
.Lfunc_end4:
	.size	socket_close, .Lfunc_end4-socket_close
	.section	.stack_sizes,"o",@progbits,.text.socket_close
	.long	.Lfunc_begin4
	.byte	0
	.section	.text.socket_close,"ax",@progbits
                                        // -- End function
	.section	.text.get_jid,"ax",@progbits
	.globl	get_jid                         // -- Begin function get_jid
	.type	get_jid,@function
get_jid:                                // @get_jid
.Lfunc_begin5:
// %bb.0:
	move r0, 0
	// inline asm
	jump 0x0
	// inline asm
	jump r23
.Lfunc_end5:
	.size	get_jid, .Lfunc_end5-get_jid
	.section	.stack_sizes,"o",@progbits,.text.get_jid
	.long	.Lfunc_begin5
	.byte	0
	.section	.text.get_jid,"ax",@progbits
                                        // -- End function
	.section	.text.exit_proc,"ax",@progbits
	.globl	exit_proc                       // -- Begin function exit_proc
	.type	exit_proc,@function
exit_proc:                              // @exit_proc
.Lfunc_begin6:
// %bb.0:
	move r0, 0
	// inline asm
	jump 0x0
	// inline asm
	jump r23
.Lfunc_end6:
	.size	exit_proc, .Lfunc_end6-exit_proc
	.section	.stack_sizes,"o",@progbits,.text.exit_proc
	.long	.Lfunc_begin6
	.byte	0
	.section	.text.exit_proc,"ax",@progbits
                                        // -- End function
	.section	.text.debug,"ax",@progbits
	.globl	debug                           // -- Begin function debug
	.type	debug,@function
debug:                                  // @debug
.Lfunc_begin7:
// %bb.0:
	move r0, 0
	// inline asm
	jump 0x0
	// inline asm
	jump r23
.Lfunc_end7:
	.size	debug, .Lfunc_end7-debug
	.section	.stack_sizes,"o",@progbits,.text.debug
	.long	.Lfunc_begin7
	.byte	0
	.section	.text.debug,"ax",@progbits
                                        // -- End function
	.section	.text.debug_int,"ax",@progbits
	.globl	debug_int                       // -- Begin function debug_int
	.type	debug_int,@function
debug_int:                              // @debug_int
.Lfunc_begin8:
// %bb.0:
	move r0, 0
	// inline asm
	jump 0x0
	// inline asm
	jump r23
.Lfunc_end8:
	.size	debug_int, .Lfunc_end8-debug_int
	.section	.stack_sizes,"o",@progbits,.text.debug_int
	.long	.Lfunc_begin8
	.byte	0
	.section	.text.debug_int,"ax",@progbits
                                        // -- End function
	.section	.text.init_lock,"ax",@progbits
	.globl	init_lock                       // -- Begin function init_lock
	.type	init_lock,@function
init_lock:                              // @init_lock
.Lfunc_begin9:
// %bb.0:
	move r0, 0
	// inline asm
	jump 0x0
	// inline asm
	jump r23
.Lfunc_end9:
	.size	init_lock, .Lfunc_end9-init_lock
	.section	.stack_sizes,"o",@progbits,.text.init_lock
	.long	.Lfunc_begin9
	.byte	0
	.section	.text.init_lock,"ax",@progbits
                                        // -- End function
	.section	.text.lock,"ax",@progbits
	.globl	lock                            // -- Begin function lock
	.type	lock,@function
lock:                                   // @lock
.Lfunc_begin10:
// %bb.0:
	move r0, 0
	// inline asm
	jump 0x0
	// inline asm
	jump r23
.Lfunc_end10:
	.size	lock, .Lfunc_end10-lock
	.section	.stack_sizes,"o",@progbits,.text.lock
	.long	.Lfunc_begin10
	.byte	0
	.section	.text.lock,"ax",@progbits
                                        // -- End function
	.section	.text.try_lock,"ax",@progbits
	.globl	try_lock                        // -- Begin function try_lock
	.type	try_lock,@function
try_lock:                               // @try_lock
.Lfunc_begin11:
// %bb.0:
	move r0, 0
	// inline asm
	jump 0x0
	// inline asm
	jump r23
.Lfunc_end11:
	.size	try_lock, .Lfunc_end11-try_lock
	.section	.stack_sizes,"o",@progbits,.text.try_lock
	.long	.Lfunc_begin11
	.byte	0
	.section	.text.try_lock,"ax",@progbits
                                        // -- End function
	.section	.text.unlock,"ax",@progbits
	.globl	unlock                          // -- Begin function unlock
	.type	unlock,@function
unlock:                                 // @unlock
.Lfunc_begin12:
// %bb.0:
	move r0, 0
	// inline asm
	jump 0x0
	// inline asm
	jump r23
.Lfunc_end12:
	.size	unlock, .Lfunc_end12-unlock
	.section	.stack_sizes,"o",@progbits,.text.unlock
	.long	.Lfunc_begin12
	.byte	0
	.section	.text.unlock,"ax",@progbits
                                        // -- End function
	.section	.text.sleep,"ax",@progbits
	.globl	sleep                           // -- Begin function sleep
	.type	sleep,@function
sleep:                                  // @sleep
.Lfunc_begin13:
// %bb.0:
	move r0, 0
	// inline asm
	jump 0x0
	// inline asm
	jump r23
.Lfunc_end13:
	.size	sleep, .Lfunc_end13-sleep
	.section	.stack_sizes,"o",@progbits,.text.sleep
	.long	.Lfunc_begin13
	.byte	0
	.section	.text.sleep,"ax",@progbits
                                        // -- End function
	.section	.text.wakeup,"ax",@progbits
	.globl	wakeup                          // -- Begin function wakeup
	.type	wakeup,@function
wakeup:                                 // @wakeup
.Lfunc_begin14:
// %bb.0:
	move r0, 0
	// inline asm
	jump 0x0
	// inline asm
	jump r23
.Lfunc_end14:
	.size	wakeup, .Lfunc_end14-wakeup
	.section	.stack_sizes,"o",@progbits,.text.wakeup
	.long	.Lfunc_begin14
	.byte	0
	.section	.text.wakeup,"ax",@progbits
                                        // -- End function
	.section	.text.create_job,"ax",@progbits
	.globl	create_job                      // -- Begin function create_job
	.type	create_job,@function
create_job:                             // @create_job
.Lfunc_begin15:
// %bb.0:
	move r0, 0
	// inline asm
	jump 0x0
	// inline asm
	jump r23
.Lfunc_end15:
	.size	create_job, .Lfunc_end15-create_job
	.section	.stack_sizes,"o",@progbits,.text.create_job
	.long	.Lfunc_begin15
	.byte	0
	.section	.text.create_job,"ax",@progbits
                                        // -- End function
	.section	.text.join_job,"ax",@progbits
	.globl	join_job                        // -- Begin function join_job
	.type	join_job,@function
join_job:                               // @join_job
.Lfunc_begin16:
// %bb.0:
	move r0, 0
	// inline asm
	jump 0x0
	// inline asm
	jump r23
.Lfunc_end16:
	.size	join_job, .Lfunc_end16-join_job
	.section	.stack_sizes,"o",@progbits,.text.join_job
	.long	.Lfunc_begin16
	.byte	0
	.section	.text.join_job,"ax",@progbits
                                        // -- End function
	.section	.text.yield,"ax",@progbits
	.globl	yield                           // -- Begin function yield
	.type	yield,@function
yield:                                  // @yield
.Lfunc_begin17:
// %bb.0:
	move r0, 0
	// inline asm
	jump 0x0
	// inline asm
	jump r23
.Lfunc_end17:
	.size	yield, .Lfunc_end17-yield
	.section	.stack_sizes,"o",@progbits,.text.yield
	.long	.Lfunc_begin17
	.byte	0
	.section	.text.yield,"ax",@progbits
                                        // -- End function
	.section	.text.sbrk,"ax",@progbits
	.globl	sbrk                            // -- Begin function sbrk
	.type	sbrk,@function
sbrk:                                   // @sbrk
.Lfunc_begin18:
// %bb.0:
	move r0, 0
	// inline asm
	jump 0x0
	// inline asm
	jump r23
.Lfunc_end18:
	.size	sbrk, .Lfunc_end18-sbrk
	.section	.stack_sizes,"o",@progbits,.text.sbrk
	.long	.Lfunc_begin18
	.byte	0
	.section	.text.sbrk,"ax",@progbits
                                        // -- End function
	.section	.text.get_pid,"ax",@progbits
	.globl	get_pid                         // -- Begin function get_pid
	.type	get_pid,@function
get_pid:                                // @get_pid
.Lfunc_begin19:
// %bb.0:
	move r0, 0
	// inline asm
	jump 0x0
	// inline asm
	jump r23
.Lfunc_end19:
	.size	get_pid, .Lfunc_end19-get_pid
	.section	.stack_sizes,"o",@progbits,.text.get_pid
	.long	.Lfunc_begin19
	.byte	0
	.section	.text.get_pid,"ax",@progbits
                                        // -- End function
	.section	.text.get_role,"ax",@progbits
	.globl	get_role                        // -- Begin function get_role
	.type	get_role,@function
get_role:                               // @get_role
.Lfunc_begin20:
// %bb.0:
	move r0, 0
	// inline asm
	jump 0x0
	// inline asm
	jump r23
.Lfunc_end20:
	.size	get_role, .Lfunc_end20-get_role
	.section	.stack_sizes,"o",@progbits,.text.get_role
	.long	.Lfunc_begin20
	.byte	0
	.section	.text.get_role,"ax",@progbits
                                        // -- End function
	.section	.text.get_appid,"ax",@progbits
	.globl	get_appid                       // -- Begin function get_appid
	.type	get_appid,@function
get_appid:                              // @get_appid
.Lfunc_begin21:
// %bb.0:
	move r0, 0
	// inline asm
	jump 0x0
	// inline asm
	jump r23
.Lfunc_end21:
	.size	get_appid, .Lfunc_end21-get_appid
	.section	.stack_sizes,"o",@progbits,.text.get_appid
	.long	.Lfunc_begin21
	.byte	0
	.section	.text.get_appid,"ax",@progbits
                                        // -- End function
	.section	.text.umram_read,"ax",@progbits
	.globl	umram_read                      // -- Begin function umram_read
	.type	umram_read,@function
umram_read:                             // @umram_read
.Lfunc_begin22:
// %bb.0:
	move r0, 0
	// inline asm
	jump 0x0
	// inline asm
	jump r23
.Lfunc_end22:
	.size	umram_read, .Lfunc_end22-umram_read
	.section	.stack_sizes,"o",@progbits,.text.umram_read
	.long	.Lfunc_begin22
	.byte	0
	.section	.text.umram_read,"ax",@progbits
                                        // -- End function
	.section	.text.umram_write,"ax",@progbits
	.globl	umram_write                     // -- Begin function umram_write
	.type	umram_write,@function
umram_write:                            // @umram_write
.Lfunc_begin23:
// %bb.0:
	move r0, 0
	// inline asm
	jump 0x0
	// inline asm
	jump r23
.Lfunc_end23:
	.size	umram_write, .Lfunc_end23-umram_write
	.section	.stack_sizes,"o",@progbits,.text.umram_write
	.long	.Lfunc_begin23
	.byte	0
	.section	.text.umram_write,"ax",@progbits
                                        // -- End function
	.section	.text.main,"ax",@progbits
	.globl	main                            // -- Begin function main
	.type	main,@function
main:                                   // @main
.Lfunc_begin24:
// %bb.0:
	// inline asm
	jump 0x0
	// inline asm
	move r0, 0
	// inline asm
	jump 0x0
	// inline asm
	jump r23
.Lfunc_end24:
	.size	main, .Lfunc_end24-main
	.section	.stack_sizes,"o",@progbits,.text.main
	.long	.Lfunc_begin24
	.byte	0
	.section	.text.main,"ax",@progbits
                                        // -- End function
	.addrsig
