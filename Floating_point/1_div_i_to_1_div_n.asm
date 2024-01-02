section .data
	ms db"Enter a number = ",0
	num dq"%d",0
	msg db "Addition of 1/1 to 1/n is %f",10,0
	
section .bss
	n resq 1
   	sum resq 1
	i resb 1

section .text
	global main
	extern printf,scanf

main:
	push ms
	call printf
	add esp,4
	
	push n
	push num
	call scanf
	add esp,8
	
	fldz
	fstp qword[sum];make it sum =0
	mov eax,dword[n]

lp:
	mov dword[i],eax
	fild dword[i]
	fld1
	fdivrp st1
	fadd qword[sum]
	fstp qword[sum]
	dec eax
	cmp eax,0
	jnz lp
	fld qword[sum]
	
	sub esp,8
	fstp qword[esp]
	push msg
	call printf
	add esp,12
	ret
