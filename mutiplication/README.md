# The Division and Multiplication Instruction

These instruction unlike the previously discussed instructions take only one
operand and by does the operation and save the data in accumulator i.e eax
register. The program is simple again we are doing the following things.

eax=25
ebx=5
eax=eax/ebx
eax=1
exit(ebx)

```
global _start:

_start:
	mov eax,25
	mov ebx,5
	div ebx
	mov ebx,eax
	mov eax,1
	int 0x80

```
