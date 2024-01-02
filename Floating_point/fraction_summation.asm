section .data
	inp db "%d",0
	out1 db "1/1+1/2+....+1/n : %f",10,0
	msg db "Enter value of N : ",0
	
section .bss
	num resd 1
	
section .text
	global main
	extern printf,scanf

main:
	push msg
	call printf
	add esp,4
	push num
	push inp
	call scanf
	add esp,8
	
	fldz
	cmp dword[num],0	
	jng end

loop:	fld1			
	fild dword[num]	
	fdivp st1,st0		 
	faddp st1,st0	 
	
	mov eax,dword[num]
	dec eax
	mov dword[num],eax
	
	cmp dword[num],0	
	jg loop
	
	sub esp,8		
	fstp qword[esp]
	push out1	
	call printf
	add esp,12
	
end:
	ret
	
	
