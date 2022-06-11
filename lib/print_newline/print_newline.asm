global _start
section .data
newline: db 10

section .text
_start:
    mov rax, 1
    xor rdi, rdi
    mov rsi, newline
    mov rdx, 1
    syscall

    mov rax, 60
    syscall
