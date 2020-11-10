global _start:

_start:
	mov eax,25
	mov ebx,5
	div ebx
	mov ebx,eax
	mov eax,1
	int 0x80

