;;; 2 pi R2 = ?
section .data
	a dq 2
	msg1 db"%d",0
	msg db"two pi r square = %f",10,0

section .bss
	h resq 1

section .text
	global main
	extern scanf,printf

main:
	push h
	push msg1
	call scanf
	add esp,8

	fild qword[a]
	fldpi
	fmul st1
	fild qword[h]
	fmul st0
	fmul st1
	
	pusha
	sub esp,8
	fstp qword[esp]
	push msg
	call printf
	add esp,12
	popa
	ret
