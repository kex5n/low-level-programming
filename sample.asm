global _start

section .data
test_string: db "abcdef", 0

section .text

_start:
    mov [r8 + r7 + 10], 6

    xor rdi, rdi
    mov rax, 60
    syscall