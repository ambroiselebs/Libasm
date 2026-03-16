section .text
    global  ft_strcmp

ft_strcmp:
    xor rax, rax ; Mettre res a 0

.n_char:
    mov al, [rdi] ; Charger premier char de str
    cmp al, [rsi] ; Comparer char1 avec char2
    jne .diff ; Si pas egal aller a diff
    test al, al ; verifier si fin (\0)
    je .end ; si \0 str1 = str2
    inc rdi
    inc rsi
    jmp .n_char

.diff:
    movzx rax, al ; Isole le 1er octet de rax
    movzx rbx, byte [rsi] ; Lis 1 octet depuis rsi
    sub rax, rbx ; Renvoie la diff

.end:
    ret