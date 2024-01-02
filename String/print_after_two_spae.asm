section .data
	string db "source string line1",10
	db "source string line2",10
	db "source string line3",10,-1

	len equ $-string

section .bss
	destination resd len
	
section .text
	global main

main:
	mov edi,string
	mov ecx,len	
lp:	mov al, 32
	cmp ecx,0
	jz lp1
	repne scasb
	repne scasb
	mov esi,edi
	mov al,10
	repne scasb	
	pusha
	mov eax,4
	mov ebx,1
	mov ecx,esi
	sub edx,edi
	mov edx,esi
	int 0X80
	popa
	jmp lp
lp1:	ret
