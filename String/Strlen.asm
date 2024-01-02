section .data
    string db "this is nasm code", 0
    msg db "Length = %d", 10, 0

section .bss

section .text
    global main
    extern printf

main:
    mov edi, string
    xor ecx, ecx

lp:
    mov al, byte [edi]
    cmp al, 0
    jz end

    inc edi
    inc ecx
    jmp lp

end:
    push ecx
    push msg
    call printf
    add esp, 8
    ret


