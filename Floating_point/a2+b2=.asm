section .data
	a dq 12
	b dq 12
	d dq 2
	c db "a2+b2 :  %f",10,0
section .bss
	f resq 1
section .text
	global main
	extern printf

main:
	fild qword[a]
	fmul st0
	fild qword[a]
	fild qword[b]
	fmul st1
	fild qword[d]
	fmul st1
	fild qword[b]
	fmul st0
	fadd st1
	fadd st4
	

	sub esp,8
	fst qword[esp]
	push c
	call printf
	add esp,12
	ret
