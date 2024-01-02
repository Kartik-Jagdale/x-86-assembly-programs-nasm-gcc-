section .data
	first db"first",0
	second db"first",0
	same db"string are same",10,0
	notsame db"not same",10,0

section .text
	global main
	extern printf

main:
	mov esi, first
	mov edi, second

lp:
	xor eax, eax
	mov al,byte[esi]
	cmp al,byte[edi]
	jnz ntsame

	inc esi
	inc edi
	cmp byte[esi],0
	jnz lp

	push same
	call printf
	add esp,4
	jmp end

ntsame:
	push notsame
	call printf
	add esp,4
	jmp end

end:
	ret
