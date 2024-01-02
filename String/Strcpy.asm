section .data
    string db "Hello World",10
    len equ $-string
    msg db 10
	
section .bss
    stri resq len
	
section .text	
    global main
	
main:
    mov edi, string
    mov esi, stri
    mov ecx, len

lp:
    mov al, byte [edi]
    cmp al, 10
    je lp2
    mov [esi], al
    inc esi

lp2:
    inc edi
    dec ecx
    jz end
    jmp lp

end:
    pusha
    mov eax, 4
    mov ebx, 1
    mov ecx, stri
    mov edx, len
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 1
    int 0x80
    popa
    ret
