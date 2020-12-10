#!/bin/bash

nasm -f elf32 pass.asm -o pass.o
gcc -m32 pass.o -o pass
./pass
