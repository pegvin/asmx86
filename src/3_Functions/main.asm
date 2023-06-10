global _start
extern printf

section .data
	;               Format                \n   NULL
	msg db "esp is pointing to 0x%X...", 0x0a, 0x00

section .text

_start:
	push esp        ; push the 2nd argument to printf (int for %i)
	push msg        ; push the 1st argument to printf (format specifier)
	call printf     ; call printf
	pop esp
	pop esp

	mov  ebx, 0     ; exit status
	mov  eax, 1     ; sys_exit system call
	int  0x80       ; execute system call
