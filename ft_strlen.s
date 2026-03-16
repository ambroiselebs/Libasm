global	ft_strlen

ft_strlen:
	mov		rax, 0
	jmp		counter

counter:
	cmp		BYTE [rdi + rax], 0
	je		exit
	inc		rax
	jmp		counter

exit:
	ret
