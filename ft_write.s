extern  __errno_location

section .text
    global  ft_write

ft_write:
    mov rax, 1 ; assigner 1 a rax
    syscall ; Declancher syscall 1 (write)
    cmp rax, 0 ; si < 0 = echec
    jl .err ; Fonction d'erreur
    jmp .end ; Retourner valeur

.err:
    neg rax ; Valeur absolue de rax
    mov r9, rax ; Mettre valeur rax dans une variable temporaire
    call __errno_location wrt ..plt ; Appeler errno
    mov QWORD [rax], r9 ; Assigne errno dans le pointeur
    mov rax, -1

.end:
    ret