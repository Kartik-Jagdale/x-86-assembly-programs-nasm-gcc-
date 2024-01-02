section .data
	inputFormat db "%d",0
	outputFormat db "1/1!+1/2!+....+1/n! : %f",10,0
	msgN db "Enter value of N : ",0
section .bss
	num resd 1
	fact resd 1
section .text
	global main
	extern printf,scanf
main:
	;;geting input fom user
	push msgN
	call printf
	add esp,4
	push num
	push inputFormat
	call scanf
	add esp,8
	
	fldz	;;initilise sum as 0

	cmp dword[num],0	;;check for devide by zero error
	jng End

loop:	fld1			;;load 1 constant for devide
	
	mov eax,1
	mov ecx,dword[num]	
fct:	mul ecx			;;get factor of that number
	dec ecx
	cmp ecx,1
	jg fct
	
	mov dword[fact],eax

	fild dword[fact]		;;load factor for divide
	fdivp st1,st0		;;divide and pop 
	faddp st1,st0		;;add and pop 
	
	mov eax,dword[num]	;;decrementing number
	dec eax
	mov dword[num],eax
	
	cmp dword[num],0	;;check loop condition
	jg loop
	
	sub esp,8		;;mov to esp and pop the top
	fstp qword[esp]
	push outputFormat	;;print the number
	call printf
	add esp,12
	
End:
	ret
	
	
