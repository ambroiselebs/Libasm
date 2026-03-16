extern  ft_strlen
extern  malloc
extern  ft_strcpy

section .text
    global ft_strdup

ft_strdup:
    mov rax, 0
    cmp rdi, 0
    je .return

.strlen:
    call ft_strlen
    inc rax
    push rdi
    mov rdi, rax

.malloc:
    call malloc wrt ..plt
    cmp rax, 0
    je .err

.strcpy:
    pop rdi
    mov rsi, rdi
    mov rdi, rax
    call ft_strcpy
    ret

.return:
    ret

.err:
    mov rax, 0
    pop rdi
    ret