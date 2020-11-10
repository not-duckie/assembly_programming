global _start

section .data
	msg db "hello", 0x0a
	len equ $ - msg
	

section .text

_start:
	mov eax,4
	mov ebx,1
	mov ecx,10
	push ecx
	jmp loop

loop:
;printing
	mov eax,4
	mov ecx, msg
	mov edx, len 
	int 0x80

;comparing things
	pop ecx
	dec ecx
	push ecx
	cmp ecx,0
	jne loop

;final exit
	jmp exit

exit:
	mov eax,1
	mov ebx,0
	int 0x80
	
