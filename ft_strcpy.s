section .text
    global  ft_strcpy

ft_strcpy:
    mov rax, rdi ; Sauvegarde de dest dans rax pour le retour

; [rsi] = *src
; [rdi] = dest

.loop:
    mov dl, [rsi] ; lit *src
    mov [rdi], dl ; écrit dans dest
    cmp dl, 0 ; vérifie si c'est le caractère nul
    je .end ; si oui, fin de la copie
    inc rdi ; dest++
    inc rsi ; src++
    jmp .loop

.end:
    ret