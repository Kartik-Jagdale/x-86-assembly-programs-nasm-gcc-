section .data
	msg db"10",0
	msg1 db"20",0

section .bss
	sum resd 1

section .text
	global main
	extern printf

main:
	mov eax, msg
	add eax, msg1
	mov [sum], eax

	mov eax, 1         ; syscall number for exit
    xor ebx, ebx       ; exit code 0
    int 0x80  
