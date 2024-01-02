section .data
	msg db"%d",0
	string db "My name is ",10
	string1 db "tatyawinchu",10
	len equ $-string
	len1 equ $-string1


section .bss
	n resd 1
	str2 resb len + len1

section .text
	global main

main:
	mov edi, string
	mov esi, str2

copy_str:
	mov al, byte[edi]
	cmp al, 10
	jz jump
	mov byte[esi], al
	inc esi
	inc edi
	jmp copy_str

jump:	
	mov edi, string1
copy_string:
	mov al, byte[edi]
	cmp al, 10
	jz conc
	mov byte[esi], al
	inc esi
	inc edi
	jmp copy_string

conc:
	pusha
	mov eax, 4
	mov ebx, 1
	mov ecx, str2
	mov edx, len + len1
	int 0x80
	popa

	ret

	

	
