global _start

section .data
	msg db "42",0x0a
	len equ $ - msg
	msg2 db "69",0x0a
	len2 equ $ - msg2

section .text

_start:
	mov ebx,1
	mov eax,4
	jmp print69

print42:
	mov ecx,msg
	mov edx,len
	int 0x80
	jmp exit

exit:
	mov eax,1
	mov ebx,0
	int 0x80

print69:
	mov ecx,msg2
	mov edx,len2
	int 0x80
	jmp exit
