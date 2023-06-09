global _start

section .data
	msg db "Hello, World", 0x0a ; 0x0a = \n
	len equ $ - msg ; calculate string length

section .text

_start:
	; Write "msg" to stdout upto "len" bytes
	mov eax, 4   ; sys_write
	mov ebx, 1   ; file handler/descriptor for stdout
	mov ecx, msg ; pointer to the string
	mov edx, len ; number of bytes to write
	int 0x80     ; interrupt and call the sys_write (4) call

	; Exit status
	mov eax, 1   ; sys_exit
	mov ebx, 0   ; exit status code
	int 0x80     ; interrupt to call the sys_exit (1) call
