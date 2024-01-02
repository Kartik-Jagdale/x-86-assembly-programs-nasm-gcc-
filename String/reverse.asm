section .data
	string db"This is a sample",0
	len equ $-string

section .text
	global main

main:
	mov esi,len
	mov ebx,string
	add ebx,len
	xor ecx,ecx

lp:	
	pusha
	mov eax,4
	mov ecx,ebx
	mov ebx,1
	mov edx,1
	int 0x80
	popa
	dec ebx
	dec esi
	
	cmp esi,0
	jge lp

