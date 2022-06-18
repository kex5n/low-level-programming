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
    xor rax, rax
.loop:
    cmp byte [rdi+rax], 0
    je .end 
    inc rax
    jmp .loop 
.end:
    ret

; args:
;     - rdi: target text
; return:
;     - none
print_string:
    push rdx
    push rax
    call string_length
    mov rdx, rax
    mov rax, 1
    mov rsi, rdi
    push rdi
    mov rdi, 1
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
    mov rax, rdi
    mov rdi, rsp
    push 0
    sub rsp, 16
    
    dec rdi
    mov r8, 10

.loop:
    xor rdx, rdx
    div r8
    or  dl, 0x30
    dec rdi 
    mov [rdi], dl
    test rax, rax
    jnz .loop 
   
    call print_string
    
    add rsp, 24
    ret

; args:
;     - 8 byte unsign int 
; return:
;     - none
print_int:
    mov rax, rdi
    sar rax, 63
    test rax, rax
    jz print_uint
    push rdi
    mov rdi, 0x2D
    call print_char
    pop rdi
    neg rdi
    jmp print_uint
    ret
_start:
    mov rdi, 0x0000000000000020
    call print_int
    call exit