;write a program that returns occuranec of an user input character in array
section .data
	ipFormat db "%d",0
	opMsg db "The Number %d occure %d time",10,0
	ipMsg db "Enter Array Size : ",0
	ipMsgFind db "Enter number to find occurance : ",0

section .bss
	num resd 1
	arr resd 100	;set max input size
	srch resd 1	;number to search	
section .text
	global main
	extern printf,scanf
main:
	enter 0,0
	pusha
	push ipMsg
	call printf
	add esp,4
	popa

	;getting value of num
	pusha
	push num
	push ipFormat
	call scanf
	add esp,8
	popa

	mov ecx,0
	mov esi,arr

lp:	cmp ecx,dword[num]
	jge searchOccu
	
	pusha
	push esi
	push ipFormat	
	call scanf
	add esp,8
	popa

	add esi,4
	inc ecx
	jmp lp

searchOccu:
	pusha
	push ipMsgFind
	call printf
	add esp,4
	popa

	pusha
	push srch
	push ipFormat
	call scanf
	add esp,8
	popa
	
	mov esi,arr
	mov eax,dword[srch]
	mov ecx,0
	mov ebx,0
loop:	cmp ecx,dword[num]
	jge printAns
	
	cmp eax,dword[esi]
	jne skip
	inc ebx
skip:	add esi,4
	inc ecx
	jmp loop
printAns:
	pusha
	push ebx
	push eax
	push opMsg
	call printf
	add esp,12
	popa
	leave	
	ret

