section .data
	array dd 10,20,40,50, 60,-1
	
	msg db "%d",10,0
section .text
	global main
	extern printf
main:
	mov esi, array
	mov edi, array
lp1:	cmp dword[esi],-1
	jz lp2
	add esi,4
	jmp lp1
lp2:   	cmp esi, edi
	jz lp3
	sub esi,4
	push dword[esi]
	push msg
	call printf
	add esp,8
	jmp lp2
lp3:	

	ret
