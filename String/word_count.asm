section .data
	msg db"This is is is a a a aaa aaa aaa aa aa aa a a a a string",0
	ms db"%d",0

section .text
	global main
	extern printf

main:
	xor ecx,ecx
	mov esi,msg
	mov al,' '
trial:	
	cmp byte[esi],0
	jz terminate
	cmp al,byte[esi]
	jz incount
	inc esi
	jmp trial

incount:
	inc ecx
	inc esi
	jmp trial

terminate:
	inc ecx
	push ecx
	push ms
	call printf
	add esp,8
	ret
	
