section .text
	global _start

section .data
	msg db "Hello, world", 0x0a
	len equ $ - msg
	msg2 db "fuck the world",0x09
	len2 equ $ - msg2

section .text

_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, len
	int 0x80
	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, len2
	int 0x80
	mov eax,1
	mov ebx,0
	int 0x80
