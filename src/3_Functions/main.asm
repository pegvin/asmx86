global _start

_start:
	call myFunc1   ; Pushes Location Of Next Instruction Onto The Stack
	call myFunc2   ; Does Same As Above

	mov eax, 1     ; sys_exit system call
	int 0x80       ; execute system call

myFunc1:
	mov ebx, 42
	pop eax        ; Pops The Location On The Stack And Stores it in eax
	jmp eax        ; Jumps To The Location Stored In eax

myFunc2:
	mov ebx, 43
	ret            ; Instead of popping the value of the stack and jumping to
	               ; the address the pop instruction returns, we call "ret"
	               ; this will do all that for us without needing to modify
	               ; the registers
