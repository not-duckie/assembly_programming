global _start

section .text
_start:
	call print		


	mov eax,1
	mov ebx,0
	int 0x80

print:
	mov ebp,esp
	sub esp,2
	mov [esp], byte 'H'
	mov [esp+1], byte 'I'
	
	mov eax,4
	mov ebx,1
	mov ecx,esp
	mov edx,2
	int 0x80
	
	mov esp,ebp
	ret
