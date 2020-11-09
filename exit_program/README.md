# Notes

## Begining of the program

```
global _start:
````

global directive is nasm specific. It is used for exporting symbols in your code, to where it points in the object code generated.
global basically mark the _start symbol global so its name is added in the object code so the linker knows where the flow of the program starts. If you want you specify a different name, use the flag -e in ld command to tell linker.

```

global _start22:

_start22:
	mov eax, 1
	mov ebx, 42
	int 0x80

```

Then use these commands

```
nasm -f elf32 ex1.asm -o ex1.o
ld -e _start22 -m elf_i386 ex1.o -o ex1
```
and the program will run just fine.

## label _start

Assembly function uses labels, these are very similar to function but they just label part of code.

The firt line moves int value 1 to general purpose register eax (accumaltor) and then we mov int value 69 to ebx. The line int 0x80 calls a interrupt and the interrupt we are calling depends on the eax value, which 1 thus exit is called. On exit ebx is returned by the cpu. Thus what really happening is exit(69);.

```
_start:
	mov eax, 1
	mov ebx, 69
	int 0x80
```
