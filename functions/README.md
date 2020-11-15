# Calling Functions

In assembly you can call labels which has a return address pushed to stack, that you can jmp later if you want to and this is regarded as function calling. A new instruction called `call` is introduced in the code, what is does is it pushes the address of next intruction onto the stack and then jmps to given label.

```
call func
```
Now you have the ability to jmp back the return address and continue the execution of code normally after executing the function. In order to jump back to the return address you have 2 options here.

1. you can either use `ret` instruction to automatically jmp back 
2. you can manually jmp back by popping the return address from stack.

```
	pop eax
	jmp eax
```


example code:

```
print:
	mov eax,4
	mov ebx,1
	mov ecx,text
	mov edx,len
	int 0x80
```

