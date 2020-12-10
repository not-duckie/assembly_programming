global main
extern printf

section .data
	msg db "Test %i......", 0x0a, 0x00


main:
	push ebp
	mov ebp, esp
	
	push 123
	push msg
	call printf

	mov eax,0
	mov esp,ebp
	pop ebp
	ret
	
