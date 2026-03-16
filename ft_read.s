extern __errno_location

section .text
    global  ft_read

ft_read:
    mov rax, 0 ; mettre rax a 0
    syscall ; Declancher syscall 0 (read)
    cmp rax, 0 ; Si rax < 0 = erreur
    jl .err ; Fonction d'erreur
    jmp .end

.err:
    neg rax
    mov r9, rax ; Assigne rax dans une variable temp
    call __errno_location wrt ..plt ; Appeler errno
    mov [rax], r9 ; Mettre r9 dans le pointeur de retour
    mov rax, -1

.end:
    ret