section .data
	ms db "Enter a number",10,0
	msg db"%d",0
	msg1 db "%d x %d = %d",10,0

section .bss
	n resd 1
	sum resd 1

section .text
	global main
	extern printf,scanf

main:
	push ms
	call printf
	add esp,4

	push n
	push msg
	call scanf
	add esp,8

	xor ecx,ecx
	mov eax,dword[sum]
	xor eax, eax
	

lp:
	cmp ecx,10
	jz end
	
	add eax, dword[n]
	inc ecx
	pusha
	push eax
	push ecx
	push dword[n]
	push msg1
	call printf
	add esp,16
	popa
	jmp lp

end:
	ret
	
	
