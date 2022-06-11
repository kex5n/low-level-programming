global _start

section .text

exit:
    mov rax, 60
    xor rdi, rdi
    syscall

_start:
    call exit