# The Jump Instruction

The jmp instruction is used to modify the flow of code in assembly. jmp statment modifies the value of eip and alter the flow of code. The jmp is not be confued with call.

The jmp statment only modifies the eip value and change the flow while the call statment saves the value of eip and jumps back to eip after ret is hit.

In the code we created two labels print42, print69 and exit. We initialize the `sys_write` call in `_start` and then completes it with the value 42 and 69 in labels print42 and print69 respectively. After everything exit is called for gracefull exit of the code.

```
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

```
