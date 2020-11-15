global _start

section .data
	text db "function called"
	len equ $ - text


section .text

_start:
	call print
	
	mov eax,1
	mov ebx,0
	int 0x80


print:
	mov eax,4
	mov ebx,1
	mov ecx,text
	mov edx,len
	int 0x80
