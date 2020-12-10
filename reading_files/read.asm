global _start

section .bss
	fd resb 1
	info resb 50

section .data
	msg db "Tubro Programmer v2.0",0x0a
	len equ $ - msg
	file db "/etc/passwd"
	len2 equ $ - file

section .text

_start:
	mov eax,4
	mov ebx,1
	mov ecx,msg
	mov edx,len
	int 0x80

;opening file
	mov eax,5
	mov ebx,file
	mov ecx,0
	mov edx,777o
	int 0x80

;reading file
	mov ebx,eax
	mov eax,3
	mov ecx,info
	mov edx,50
	int 0x80

;printing file
	mov eax,4
	mov ebx,1
	mov ecx,info
	mov edx,50
	int 0x80

	;exit
	mov eax,1
	mov ebx,0
	int 0x80
