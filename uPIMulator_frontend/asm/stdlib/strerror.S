	.text
	.file	"strerror.c"
	.section	.text.strerror,"ax",@progbits
	.globl	strerror                        // -- Begin function strerror
	.type	strerror,@function
strerror:                               // @strerror
.Lfunc_begin0:
// %bb.0:
	jltu r0, 82, .LBB0_2
// %bb.1:
	move r0, 28
	sw id4, __errno, r0
	move r0, .L.str.82
	jump r23
.LBB0_2:
	lsl r0, r0, 2
	lw r0, r0, strerror_errors_complete
	jump r23
.Lfunc_end0:
	.size	strerror, .Lfunc_end0-strerror
	.section	.stack_sizes,"o",@progbits,.text.strerror
	.long	.Lfunc_begin0
	.byte	0
	.section	.text.strerror,"ax",@progbits
                                        // -- End function
	.type	strerror_errors_complete,@object // @strerror_errors_complete
	.section	.rodata.strerror_errors_complete,"a",@progbits
	.p2align	2
strerror_errors_complete:
	.long	.L.str
	.long	.L.str.1
	.long	.L.str.2
	.long	.L.str.3
	.long	.L.str.4
	.long	.L.str.5
	.long	.L.str.6
	.long	.L.str.7
	.long	.L.str.8
	.long	.L.str.9
	.long	.L.str.10
	.long	.L.str.11
	.long	.L.str.12
	.long	.L.str.13
	.long	.L.str.14
	.long	.L.str.15
	.long	.L.str.16
	.long	.L.str.17
	.long	.L.str.18
	.long	.L.str.19
	.long	.L.str.20
	.long	.L.str.21
	.long	.L.str.22
	.long	.L.str.23
	.long	.L.str.24
	.long	.L.str.25
	.long	.L.str.26
	.long	.L.str.27
	.long	.L.str.28
	.long	.L.str.29
	.long	.L.str.30
	.long	.L.str.31
	.long	.L.str.32
	.long	.L.str.33
	.long	.L.str.34
	.long	.L.str.35
	.long	.L.str.36
	.long	.L.str.37
	.long	.L.str.38
	.long	.L.str.39
	.long	.L.str.40
	.long	.L.str.41
	.long	.L.str.42
	.long	.L.str.43
	.long	.L.str.44
	.long	.L.str.45
	.long	.L.str.46
	.long	.L.str.47
	.long	.L.str.48
	.long	.L.str.49
	.long	.L.str.50
	.long	.L.str.51
	.long	.L.str.52
	.long	.L.str.53
	.long	.L.str.54
	.long	.L.str.55
	.long	.L.str.56
	.long	.L.str.57
	.long	.L.str.58
	.long	.L.str.59
	.long	.L.str.60
	.long	.L.str.61
	.long	.L.str.62
	.long	.L.str.63
	.long	.L.str.64
	.long	.L.str.65
	.long	.L.str.66
	.long	.L.str.67
	.long	.L.str.68
	.long	.L.str.69
	.long	.L.str.70
	.long	.L.str.71
	.long	.L.str.72
	.long	.L.str.73
	.long	.L.str.74
	.long	.L.str.75
	.long	.L.str.76
	.long	.L.str.77
	.long	.L.str.78
	.long	.L.str.79
	.long	.L.str.80
	.long	.L.str.81
	.long	.L.str.82
	.size	strerror_errors_complete, 332

	.type	.L.str,@object                  // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Success"
	.size	.L.str, 8

	.type	.L.str.1,@object                // @.str.1
.L.str.1:
	.asciz	"Argument list too long"
	.size	.L.str.1, 23

	.type	.L.str.2,@object                // @.str.2
.L.str.2:
	.asciz	"Permission denied"
	.size	.L.str.2, 18

	.type	.L.str.3,@object                // @.str.3
.L.str.3:
	.asciz	"Address in use"
	.size	.L.str.3, 15

	.type	.L.str.4,@object                // @.str.4
.L.str.4:
	.asciz	"Address not available"
	.size	.L.str.4, 22

	.type	.L.str.5,@object                // @.str.5
.L.str.5:
	.asciz	"Address family not supported"
	.size	.L.str.5, 29

	.type	.L.str.6,@object                // @.str.6
.L.str.6:
	.asciz	"Resource unavailable, try again"
	.size	.L.str.6, 32

	.type	.L.str.7,@object                // @.str.7
.L.str.7:
	.asciz	"Connection already in progress"
	.size	.L.str.7, 31

	.type	.L.str.8,@object                // @.str.8
.L.str.8:
	.asciz	"Bad file descriptor"
	.size	.L.str.8, 20

	.type	.L.str.9,@object                // @.str.9
.L.str.9:
	.asciz	"Bad message"
	.size	.L.str.9, 12

	.type	.L.str.10,@object               // @.str.10
.L.str.10:
	.asciz	"Device or resource busy"
	.size	.L.str.10, 24

	.type	.L.str.11,@object               // @.str.11
.L.str.11:
	.asciz	"Operation canceled"
	.size	.L.str.11, 19

	.type	.L.str.12,@object               // @.str.12
.L.str.12:
	.asciz	"No child processes"
	.size	.L.str.12, 19

	.type	.L.str.13,@object               // @.str.13
.L.str.13:
	.asciz	"Connection aborted"
	.size	.L.str.13, 19

	.type	.L.str.14,@object               // @.str.14
.L.str.14:
	.asciz	"Connection refused"
	.size	.L.str.14, 19

	.type	.L.str.15,@object               // @.str.15
.L.str.15:
	.asciz	"Connection reset"
	.size	.L.str.15, 17

	.type	.L.str.16,@object               // @.str.16
.L.str.16:
	.asciz	"Resource deadlock would occur"
	.size	.L.str.16, 30

	.type	.L.str.17,@object               // @.str.17
.L.str.17:
	.asciz	"Destination address required"
	.size	.L.str.17, 29

	.type	.L.str.18,@object               // @.str.18
.L.str.18:
	.asciz	"Mathematics argument out of domain of function"
	.size	.L.str.18, 47

	.type	.L.str.19,@object               // @.str.19
.L.str.19:
	.asciz	"Disk quota exceeded"
	.size	.L.str.19, 20

	.type	.L.str.20,@object               // @.str.20
.L.str.20:
	.asciz	"File exists"
	.size	.L.str.20, 12

	.type	.L.str.21,@object               // @.str.21
.L.str.21:
	.asciz	"Bad address"
	.size	.L.str.21, 12

	.type	.L.str.22,@object               // @.str.22
.L.str.22:
	.asciz	"File too big"
	.size	.L.str.22, 13

	.type	.L.str.23,@object               // @.str.23
.L.str.23:
	.asciz	"Host unreachable"
	.size	.L.str.23, 17

	.type	.L.str.24,@object               // @.str.24
.L.str.24:
	.asciz	"Identifier removed"
	.size	.L.str.24, 19

	.type	.L.str.25,@object               // @.str.25
.L.str.25:
	.asciz	"Illegal byte sequence"
	.size	.L.str.25, 22

	.type	.L.str.26,@object               // @.str.26
.L.str.26:
	.asciz	"Operation in progress"
	.size	.L.str.26, 22

	.type	.L.str.27,@object               // @.str.27
.L.str.27:
	.asciz	"Interrupted function"
	.size	.L.str.27, 21

	.type	.L.str.28,@object               // @.str.28
.L.str.28:
	.asciz	"Invalid argument"
	.size	.L.str.28, 17

	.type	.L.str.29,@object               // @.str.29
.L.str.29:
	.asciz	"I/O error"
	.size	.L.str.29, 10

	.type	.L.str.30,@object               // @.str.30
.L.str.30:
	.asciz	"Socket is connected"
	.size	.L.str.30, 20

	.type	.L.str.31,@object               // @.str.31
.L.str.31:
	.asciz	"File is a directory"
	.size	.L.str.31, 20

	.type	.L.str.32,@object               // @.str.32
.L.str.32:
	.asciz	"Too many levels of symbolic links"
	.size	.L.str.32, 34

	.type	.L.str.33,@object               // @.str.33
.L.str.33:
	.asciz	"File descriptor value too large"
	.size	.L.str.33, 32

	.type	.L.str.34,@object               // @.str.34
.L.str.34:
	.asciz	"Too many links"
	.size	.L.str.34, 15

	.type	.L.str.35,@object               // @.str.35
.L.str.35:
	.asciz	"Message too large"
	.size	.L.str.35, 18

	.type	.L.str.36,@object               // @.str.36
.L.str.36:
	.asciz	"EMULTIHOP"
	.size	.L.str.36, 10

	.type	.L.str.37,@object               // @.str.37
.L.str.37:
	.asciz	"Filename too long"
	.size	.L.str.37, 18

	.type	.L.str.38,@object               // @.str.38
.L.str.38:
	.asciz	"Network is down"
	.size	.L.str.38, 16

	.type	.L.str.39,@object               // @.str.39
.L.str.39:
	.asciz	"Connection aborted by network"
	.size	.L.str.39, 30

	.type	.L.str.40,@object               // @.str.40
.L.str.40:
	.asciz	"Network unreachable"
	.size	.L.str.40, 20

	.type	.L.str.41,@object               // @.str.41
.L.str.41:
	.asciz	"Too many files open in system"
	.size	.L.str.41, 30

	.type	.L.str.42,@object               // @.str.42
.L.str.42:
	.asciz	"No buffer space available"
	.size	.L.str.42, 26

	.type	.L.str.43,@object               // @.str.43
.L.str.43:
	.asciz	"No message is available on the STREAM head read queue"
	.size	.L.str.43, 54

	.type	.L.str.44,@object               // @.str.44
.L.str.44:
	.asciz	"No such device"
	.size	.L.str.44, 15

	.type	.L.str.45,@object               // @.str.45
.L.str.45:
	.asciz	"No such file or directory"
	.size	.L.str.45, 26

	.type	.L.str.46,@object               // @.str.46
.L.str.46:
	.asciz	"Executable file format error"
	.size	.L.str.46, 29

	.type	.L.str.47,@object               // @.str.47
.L.str.47:
	.asciz	"No locks available"
	.size	.L.str.47, 19

	.type	.L.str.48,@object               // @.str.48
.L.str.48:
	.asciz	"ENOLINK"
	.size	.L.str.48, 8

	.type	.L.str.49,@object               // @.str.49
.L.str.49:
	.asciz	"Not enough space"
	.size	.L.str.49, 17

	.type	.L.str.50,@object               // @.str.50
.L.str.50:
	.asciz	"No message of the desired type"
	.size	.L.str.50, 31

	.type	.L.str.51,@object               // @.str.51
.L.str.51:
	.asciz	"Protocol unavailable"
	.size	.L.str.51, 21

	.type	.L.str.52,@object               // @.str.52
.L.str.52:
	.asciz	"No space left on device"
	.size	.L.str.52, 24

	.type	.L.str.53,@object               // @.str.53
.L.str.53:
	.asciz	"No STREAM resources"
	.size	.L.str.53, 20

	.type	.L.str.54,@object               // @.str.54
.L.str.54:
	.asciz	"Not a STREAM"
	.size	.L.str.54, 13

	.type	.L.str.55,@object               // @.str.55
.L.str.55:
	.asciz	"Function not supported"
	.size	.L.str.55, 23

	.type	.L.str.56,@object               // @.str.56
.L.str.56:
	.asciz	"The socket is not connected"
	.size	.L.str.56, 28

	.type	.L.str.57,@object               // @.str.57
.L.str.57:
	.asciz	"Not a directory or a symbolic link to a directory"
	.size	.L.str.57, 50

	.type	.L.str.58,@object               // @.str.58
.L.str.58:
	.asciz	"Directory not empty"
	.size	.L.str.58, 20

	.type	.L.str.59,@object               // @.str.59
.L.str.59:
	.asciz	"State not recoverable"
	.size	.L.str.59, 22

	.type	.L.str.60,@object               // @.str.60
.L.str.60:
	.asciz	"Not a socket"
	.size	.L.str.60, 13

	.type	.L.str.61,@object               // @.str.61
.L.str.61:
	.asciz	"Not supported"
	.size	.L.str.61, 14

	.type	.L.str.62,@object               // @.str.62
.L.str.62:
	.asciz	"Inappropriate I/O control operation"
	.size	.L.str.62, 36

	.type	.L.str.63,@object               // @.str.63
.L.str.63:
	.asciz	"No such device or address"
	.size	.L.str.63, 26

	.type	.L.str.64,@object               // @.str.64
.L.str.64:
	.asciz	"Operation not supported on socket"
	.size	.L.str.64, 34

	.type	.L.str.65,@object               // @.str.65
.L.str.65:
	.asciz	"Value too large to be stored in data type"
	.size	.L.str.65, 42

	.type	.L.str.66,@object               // @.str.66
.L.str.66:
	.asciz	"Previous owner died"
	.size	.L.str.66, 20

	.type	.L.str.67,@object               // @.str.67
.L.str.67:
	.asciz	"Operation not permitted"
	.size	.L.str.67, 24

	.type	.L.str.68,@object               // @.str.68
.L.str.68:
	.asciz	"Broken pipe"
	.size	.L.str.68, 12

	.type	.L.str.69,@object               // @.str.69
.L.str.69:
	.asciz	"Protocol error"
	.size	.L.str.69, 15

	.type	.L.str.70,@object               // @.str.70
.L.str.70:
	.asciz	"Protocol not supported"
	.size	.L.str.70, 23

	.type	.L.str.71,@object               // @.str.71
.L.str.71:
	.asciz	"Protocol wrong type for socket"
	.size	.L.str.71, 31

	.type	.L.str.72,@object               // @.str.72
.L.str.72:
	.asciz	"Result too large"
	.size	.L.str.72, 17

	.type	.L.str.73,@object               // @.str.73
.L.str.73:
	.asciz	"Read-only file system"
	.size	.L.str.73, 22

	.type	.L.str.74,@object               // @.str.74
.L.str.74:
	.asciz	"Invalid seek"
	.size	.L.str.74, 13

	.type	.L.str.75,@object               // @.str.75
.L.str.75:
	.asciz	"No such process"
	.size	.L.str.75, 16

	.type	.L.str.76,@object               // @.str.76
.L.str.76:
	.asciz	"ESTALE"
	.size	.L.str.76, 7

	.type	.L.str.77,@object               // @.str.77
.L.str.77:
	.asciz	"Stream ioctl() timeout"
	.size	.L.str.77, 23

	.type	.L.str.78,@object               // @.str.78
.L.str.78:
	.asciz	"Connection timed out"
	.size	.L.str.78, 21

	.type	.L.str.79,@object               // @.str.79
.L.str.79:
	.asciz	"Text file busy"
	.size	.L.str.79, 15

	.type	.L.str.80,@object               // @.str.80
.L.str.80:
	.asciz	"Operation would block"
	.size	.L.str.80, 22

	.type	.L.str.81,@object               // @.str.81
.L.str.81:
	.asciz	"Cross-device link"
	.size	.L.str.81, 18

	.type	.L.str.82,@object               // @.str.82
.L.str.82:
	.asciz	"Unknown error"
	.size	.L.str.82, 14

	.addrsig
