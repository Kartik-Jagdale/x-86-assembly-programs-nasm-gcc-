section .data
	array dd 10,20,30,40,50
	msg db "Sum is %d ",10,0
section .bss
	sum resd 1
	section .text
	global main
	extern printf
main:
	xor ebx,ebx
	mov ecx,0
pqr:	mov eax,4
	cmp ecx,5
	jge end1
	mul ecx
	mov esi,array
	add esi,eax
	add ebx,dword[esi]
	inc ecx
	jmp pqr
end1:
	mov dword[sum],ebx
	push dword[sum]
	push msg
	call printf
	add esp,8
	ret



	
