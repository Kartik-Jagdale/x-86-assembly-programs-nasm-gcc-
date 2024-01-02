section .data
	inputFormat db "%d",0 	;;format of input
	outputFormat db "%d ",0	;;format to print array
	msg db "Enter size of array",10,0 	;;msg for getting array size
	msg1 db "Please Enter %d numbers",10,0	

section .bss
	n resd 1	;;number of int to take from user
	arr resd 50	;;declaring array of size max capacity of gtting input
section .text
	global main
	extern printf,scanf
main:	
	push msg	;;printing msg
	call printf	;;calling printf
	add esp,4	;;poping msg from stack

	push n		;;pushing n as address to store number
	push inputFormat	;;pushing input format spacifier
	call scanf	;;calling scanf
	add esp,8
	
	push dword[n]	;;getting 4byte from location n
	push msg1	;;pushing string to print
	call printf	;;calling printf
	add esp,8
	
	mov eax,arr	;;initialization of register to address of arr
	mov edx,0	;;initiallizing counter to 0
for:	cmp edx,dword[n]	;;compare n and counter for loop exit condition
	jz print	;;if count reach to n go to print array	
	pusha		;;storing all regster before function call
	push eax	;;push address of a[counter]
	push inputFormat;;push format speacifier
	call scanf	
	add esp,8	
	popa		;;re  initializing all registers
	add eax,4	;;incrementing pointer of arr
	inc edx		;;incrementing count
	jmp for		;;go to scan new element
	
print:	mov eax,arr	;;initialization of array pointer
	mov edx,0	;;initiaiization of counter to zero
for1:	cmp dword[n],edx;;compare n and count for loop exit condtion
	jz end		;;if count reach to n go to end
 	pusha		
	push dword[eax]	
	push outputFormat
	call printf
	add esp,8
	popa
	add eax,4	
	inc edx	
	jmp for1	;;go to print next element
	  
end:
	ret



	;;eax,ecx,edx register values aleays get change after any function call
	;;hence we have to use pusha before funcion call and popa after function call
	;;it stores all register value in stack
	
