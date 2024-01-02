section .data
	inp db "%d",0
	msg db "final ans : %f",10,0
	msg1 db "Enter value of N : ",0
	
section .bss
	num resd 1
	fact resd 1
	
section .text
	global main
	extern printf,scanf
main:
	push msg1
	call printf
	add esp,4
	push num
	push inp
	call scanf
	add esp,8
	
	fldz
	cmp dword[num],0	
	jng end

loop:	fild dword[num]			
	
	mov eax,1
	mov ecx,dword[num]	
facto:	mul ecx			
	dec ecx
	cmp ecx,1
	jg facto
	
	mov dword[fact],eax

	fild dword[fact]	
	fdivp st1,st0		 
	faddp st1,st0		 
	
	mov eax,dword[num]	
	dec eax
	mov dword[num],eax
	
	cmp dword[num],0	
	jg loop
	
	sub esp,8		
	fstp qword[esp]
	push msg	
	call printf
	add esp,12
	
end:
	ret
	
	
