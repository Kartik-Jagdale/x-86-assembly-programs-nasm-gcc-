
section .data
	inputMsg db "Enter Number Of Elements : ",0
	inputFormat db "%d",0
	outputFormat db 10,"Max Number Is %d",10,0

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
	add esp,8
	;;[SCANF] scan n number from user
	xor ecx,ecx	;;works as count in our loop
	mov eax,inp
	xor ebx,ebx	;;works as max number 
getElement:
	cmp ecx,dword[n]	;;loop exit condition check
	jz printMax		;;print when reach to end
	pusha
	push inp
	push inputFormat
	call scanf
	add esp,8
	popa
	;;	mov eax,dword[inp]
	;;compare input number and current max
	;;[SWAP] if max is less than input number
	cmp ebx,dword[inp]
	jg noswap 	;;skip
	mov ebx,dword[inp]
noswap:	inc ecx
	jmp getElement
printMax:
	push ebx
	push outputFormat
	call printf
	add esp,8
	ret
