global _start:

_start:
	mov eax,1
	mov ebx,50
	mul ebx
	mov ebx,eax
	mov eax,1
	int 0x80
