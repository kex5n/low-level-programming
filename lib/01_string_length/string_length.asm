global _start

section .data
text: db "abcdefg"

section .text
exit:
    mov rax, 60
    xor rdi, rdi
    syscall

; args:
;     - rdi: address of target text.
; return:
;     - rax: length of target text.
string_length:
    xor rax, rax
.loop:
    cmp byte[rdi + rax], 0
    jz .end
    inc rax
    jmp .loop
.end:
    ret

_start:
    mov rdi, text
    call string_length
    mov rdi, rax
    mov rax, 60
    syscall
    call exit
