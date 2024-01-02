section .data
	student db "ramesh m kalem,Msc,M,2022",10
		db "mukesh m kalem,MCA,M,2018",10
		db "rakesh h alim,Msc,M,2019",10
		db "bavri d dhavri,Msc,F,2030",10,0

	len equ $-student
	pgm db "Msc",0
	
section .bss
	fname resd 1
	programme resd 1
	pgmlen resd 1
	fnamelen resd 1

section .text
	global main

main:
	mov edi, student
	mov ecx, len
lp2:cmp byte[edi],0
	jnz lp
	mov al," "
	mov dword[fname], edi
	rep scasb
	mov esi, edi
	mov edx, dword[fname]
	sub esi, edx 		; length of firstname
	mov dword[fnamelen], esi
	mov al,','
	rep scasb
	mov dword[programme], edi
	rep scasb
	mov esi, edi
	mov edx, programme
	sub esi,edx		;length of programme
	mov dword[pgmlen], esi
	cmp byte[edi], 'F'
	jnz lp
	pusha
	mov ecx, dword[pgmlen]
	mov esi,programme
lp1:

	mov al, byte[esi]
	mov al, byte[pgm]
	jnz lp
	inc esi
	inc dword[pgm]
	loop lp1


	mov eax, 4
	mov ebx, 1
	mov ecx, fname
	mov edx, dword[fnamelen]
	int 0x80
	popa


lp:
	mov al, 10
	rep scasb
	jmp lp2

endp:	rep
