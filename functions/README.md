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

## ebp usage

Many new hacker during binary exploitation are confused between usage of esp and ebp. The ebp is used to contain the value of esp during function calls so the return address is not lost. So you can do is, `mov` the value of esp to ebp and then manipulate the stack in whatevery fashion you want and when you are done you can `mov` ebp to esp and then ret. ebp is life saver here.

example code:

```
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
```
