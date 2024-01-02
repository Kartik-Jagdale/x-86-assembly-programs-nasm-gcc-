section .data
	string db "Level",0
	len equ $-string

section .bss
	stringrev resb len

section .text
	global main

main:
	mov edi, stringrev
	mov esi, string
	add esi, len
	dec esi

lp1:

	mov al, byte[esi]
	mov byte[edi], al
	inc edi
	dec esi
	cmp esi, string

	jnz lp1
	ret


	
