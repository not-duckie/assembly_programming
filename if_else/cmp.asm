global _start

section .data
	msg1 db "The number is less than",0x0a
	len1 equ $ - msg1
	msg2 db "The number is greater",0x0a
	len2 equ $ - msg2
	msg3 db "The number is equal to",0x0a
	len3 equ $ - msg3

section .text
_start:
	mov eax,4
	mov ebx,1
	mov ecx,100
	cmp ecx,10
	jl printless
	je printequ
	jg printg

printg:
	mov ecx,msg2
	mov edx,len2
	int 0x80
	jmp exit

printequ:
	mov ecx,msg3
	mov edx,len3
	int 0x80
	jmp exit

printless:
	mov ecx,msg1
	mov edx,len1
	int 0x80
	jmp exit

exit:
	mov eax,1
	mov ebx,0
	int 0x80
