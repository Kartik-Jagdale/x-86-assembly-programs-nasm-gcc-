section .data
	inputMsg db "Enter Number Of Elements : ",0
	inputFormat db "%d",0
	outputFormat db 10,"Min Number Is %d",10,0

section .bss
	n resd 1	;;reserving 4byte for number of elements
	inp resd 1	;;reserve 4 byte for user input number

section .text
	global main
	extern scanf,printf
main:
	;;[PRINT] Enter Number Of Elements
	push inputMsg
	call printf
	add esp,4

	;;[SCANF] getting input to variable n
	push n
	push inputFormat
	call scanf

	;;[SCANF] scan n number from user
	xor ecx,ecx	;;works as count in our loop
	mov eax,inp
	mov ebx,0xffff	;;works as min number 
getElement:
	cmp ecx,dword[n]	;;loop exit condition check
	jz printMin		;;print when reach to end
	pusha
	push eax
	push inputFormat
	call scanf
	add esp,8
	popa
	
	;;compare input number and current max
	;;[SWAP] if max is less than input number
	cmp ebx,dword[eax]
	jng noswap 	;;skip
	mov ebx,dword[eax]
noswap:	inc ecx
	jmp getElement
	
printMin:
	push ebx
	push outputFormat
	call printf
	add esp,8
	ret
