# Subtraction Program

This is again a simple code, the new operand it introduces is `sub` operator. The sub operand will 2 operand update the value in the first register.

## Explanation of code

eax=1
ebx=25
ecx=10
then ebx = ebx-ecx
exit(ebx)

```
global _start:

_start:
	mov eax,1
	mov ebx,25
	mov ecx,10
	sub ebx,ecx
	int 0x80

```
