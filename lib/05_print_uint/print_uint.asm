global _start

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
    push rax
    xor rax, rax
.loop:
    cmp byte[rdi + rax], 0
    jz .end
    inc rax
    jmp .loop
.end:
    pop rax
    ret

; args:
;     - rdi: address of target text
; return:
;     - none
print_string:
    call string_length
    push rdx
    push rax
    mov rdx, rax
    mov rax, 1
    mov rsi, rdi
    push rdi
    xor rdi, rdi
    syscall
    pop rdi
    pop rax
    pop rdx
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

; args:
;     - none
; return:
;     - none
print_newline:
    mov rdi, 0xA
    call print_char
    ret

; args:
;     - 8 byte unsign int 
; return:
;     - none
print_uint:
    xor rax, rax
    xor rdx, rdx
    mov rax, 0x20 ; 32
    mov rcx, 0x0A ; 10

    idiv rcx
    mov rdi, rdx
    add dil, 0x30
    push rax
    call print_char ; 2
    pop rax

    ; mov rdi, rax
    ; add dil, 0x30
    ; call print_char ; 3

    idiv rcx
    mov rdi, rdx
    add dil, 0x30
    call print_char ; 3
    call print_newline
    call exit

_start:
    ; mov rdi, 0x000000000000020
    call print_uint
