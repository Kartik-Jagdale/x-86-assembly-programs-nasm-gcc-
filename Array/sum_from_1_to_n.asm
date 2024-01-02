section .data
	msg db "%d",0
	msg1 db"sum from 1 to %d is %d",10,0

section .bss
	n resd 1
	sum resd 1

section .text
	global main
	extern printf,scanf

main:
	push n
	push msg
	call scanf
	add esp,8

	mov ecx,dword[n]
	mov dword[sum],0

lp:
	cmp ecx,0
	jz end

	add dword[sum],ecx
	dec ecx
	jmp lp

end:
	push dword[sum]
	push dword[n]
	push msg1
	call printf
	add esp,12
	ret
