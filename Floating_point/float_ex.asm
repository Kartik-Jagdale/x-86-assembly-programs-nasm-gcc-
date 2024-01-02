section .data
	a dq 1.23
	b dq 2.0
	c dq 1.4
	msg db "Value is %f",10,0

section .bss
	d resq 1
	e resq 1
	f resq 1

section .text
	global main
	extern printf

main:	
	fld qword[a]
	fld qword[b]
	fmul st1
	fsubr st1,st0
	fchs
	fldz
	fld1
	fldpi
	
	
	fst qword[e]
	fild qword[e]
	fst qword[f]
	fst qword[d]
	
	sub esp,8
	fstp qword[esp]
	push msg
	call printf
	add esp,12
	
	
	ret
