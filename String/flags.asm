section .data
	source db "source string",0
	space db " "
	len equ $-source

section .bss
	destination resd len
	
section .text
	global main
	extern puts

main:
	mov ecx,len
	mov esi,source
	mov al, 32		;" "
loop:	cmp byte[esi],al
	dec ecx
	inc esi
	jnz loop
	mov edi,destination
	

lp:
	xor eax, eax
	;; mov al,byte[esi]  mov byte[edi], al	inc esi  inc edi
	rep movsb
	;; loop lp
	push destination
	call puts
	add esp, 4

	ret
