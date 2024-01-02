section .data
	string db "source string line1",10
	db "source string line2",10
	db "source string line3",10,-1

	len equ $-string

section .bss
	destination resd len
	
section .text
	global main
	extern puts

main:
	mov edi,string
	mov ecx,len	
	mov al, 32
lp1:	cmp ecx,0
	jz lp
	repne scasb
	repne scasb		
	pusha
	push edi
	call puts
	add esp,4
	popa
	jmp lp1
	
lp:
	xor eax, eax
	ret
