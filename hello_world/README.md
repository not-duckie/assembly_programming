# The Hello World Program

Now we are finally writing to the screen with the help of syscall 4 i.e sys\_write() and file descriptor 1 i.e the stdout. The program also makes use of strings in asm that are declared as follows. Here msg var is assigned the string value "value here" and end line character is the new line character.

```
msg db "value here",0x0a
```

You can also create multiple line strings assigned to one var with the below syntax.

```
msg db "value here",0x0a
db "another here",0x0a
```

Now in order to print the string to the screen we make use of SYS\_write. The syscall function will look something like `syscall(SYS_write, 1, "Hello, World",len)`. Thus the assembly code will be like:

```
mov eax,4 	; calling the sys_write
mov ebx, 1 	; specifying the stdout file descriptor
mov ecx, msg	; value to print
mov edx, len	; len of the message
int 0x80	; interupt for cpu to run the things given
mov eax, 1
mov ebx, 0
int 0x80	; exiting the program and returning zero for sucessful completion
```
