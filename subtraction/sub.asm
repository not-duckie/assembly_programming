global _start:

_start:
	mov eax,1
	mov ebx,25
	mov ecx,10
	sub ebx,ecx
	int 0x80
