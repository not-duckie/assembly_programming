# looping around

With introduction to cmp and jmp, it easy to figure out loops work out in assembly language. Thus this program does the same.

It prints "hello" 10 times. The code is simple to understand, the only things this does differently are as follows.

## Playing with the stack

The assembly language has only 4 general purpose register.

+ eax
+ ebx
+ ecx
+ edx

This is where the role of stack comes into play. You can push values to the stack with `push` and then retrieve them into a general purpose register later with `pop`. This is what is happening here. We push value of ecx onto the stack and then use ecx to print the hello and then later use it to dec the value. Awesome !

Also another important thing, the value of eax is changed after calling a sys\_call thus eax is again given the value 4.

```
section .text

_start:
	mov eax,4
	mov ebx,1
	mov ecx,10
	push ecx
	jmp loop

loop:

	mov eax,4
	mov ecx, msg
	mov edx, len 
	int 0x80

	pop ecx
	dec ecx
	push ecx
	cmp ecx,0
	jne loop

	jmp exit

```
