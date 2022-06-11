global _start

section .data
codes: db 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

section .text
exit:
    mov rax, 60
    xor rdi, rdi
    syscall

; args:
;    - rdi: address of target text.
; return:
;    - rax: length of target text.
string_length:
    xor rax, rax
.loop:
    cmp byte[rdi + rax], 0
    jz .end
    inc rax
    jmp .loop
.end:
    ret

; args:
;     - rdi: address of target text
; return:
;     - none
print_string:
    call string_length
    mov rdx, rax
    mov rax, 1
    mov rsi, rdi
    push rdi
    xor rdi, rdi
    syscall
    pop rdi
    ret

; args:
;     - rdi: target text
; return:
;     - none
print_char:
    push rdi
    mov rdi, rsp
    call print_string
    pop rdi
    ret

_start:
    mov rdi, 0xA
    call print_char
    call exit
