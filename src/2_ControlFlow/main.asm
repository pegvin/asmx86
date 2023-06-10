global _start

_start:
    mov ebx, 0     ; exit status 0

loop_start:
    inc ebx        ; Increment ebx by 1
    cmp ebx, 100   ; Check if ebx is equal 100
    jne loop_start ; goto "loop_start" if ebx is not equal to 100

skip:
    ; By Now Exit Status Should Be 100
    mov eax, 1     ; sys_exit system call
    int 0x80       ; execute system call

; Conditional Jumps
; je LABEL     ; jump if equal
; jne LABEL    ; jump if NOT equal

; jg LABEL     ; jump if greater
; jge LABEL    ; jump if greater OR equal

; jl LABEL     ; jump if less
; jle LABEL    ; jump if less OR equal

; Unconditional Jump
; jmp LABEL
