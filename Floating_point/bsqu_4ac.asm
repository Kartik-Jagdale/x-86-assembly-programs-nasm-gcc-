section .data
	inp db "%d",0
	msg dq "Enter value of a = ",0
	msg1 dq "Enter value of b = ",0
	msg2 dq "Enter value of c = ",0
	msg3 db "Final Answer of quadratic equation with positive sign = %f",10,0
	msg4 db "Final Answer of quadratic equation with negative sign = %f",10,0
	
	n dq 4
	m dq 2

section .bss
	a resq 1
	b resq 1
	c resq 1
	d resq 1
	
	
section .text
	global main
	extern printf,scanf
	

main:
	push msg
	call printf
	add esp,4

	push a
	push inp
	call scanf
	add esp,8

	push msg1
	call printf
	add esp,4

	push b
	push inp
	call scanf
	add esp,8

	push msg2
	call printf
	add esp,4

	push c
	push inp
	call scanf
	add esp,8
	
begin:	
	fild qword[b]
	fmul st0
	fild qword[n]
	fild qword[a]
	fmul st1
	fild qword[c]
	fmul st1
	fsubr st3
	fsqrt
	fild qword[b]
	fadd st1
	fchs
	fild qword[m]
	fild qword[a]
	fmulp st1
	fdivr st1 

	sub esp,8
	fst qword[esp]
	push msg3
	call printf
	add esp,12
	ret
