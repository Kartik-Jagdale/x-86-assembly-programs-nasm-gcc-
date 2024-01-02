section .data
	arr dd 10,20,30,40,50,60,-1 ;; taking datatype dd for reserve 4bytes for every number
	msg db "Addition of given number is %d",10,0 ;;statement for printing the output

section .bss
	sum resd 1;;reserve 4 bytes for tsking sum
	;;sum resb 4;;this is alsow valid statement

section .text
	global main
	extern printf
main:
	mov eax,arr 		;;address of first number from array
	xor edx,edx 		;;edx = 0
				;;remove content from edx
for:	
	cmp dword[eax],-1	;;this is our base condition
	jz end			;;jump to end when the content of dword[eax] is -1
	add edx,dword[eax] 	;;edx = edx + eax[0] 
				;;adding array element to edx	
				;;dword[arr] mean getting value from location arr.  just like accessing the value from pointer
	add eax,4		;;incrementing the pointer value
	jmp for
end:	
	push edx		;;pushing sum
	push msg		;;pushing msg
	call printf		;;call printf and print values
	add esp,8		;;because of two push we have to increment stack pointer by 8
	ret
