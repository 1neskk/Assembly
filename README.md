# Assembly

This is a collection of assembly programs I've written to learn assembly language. The programs are written in x64 assembly and use the NASM assembler.

## Table of Contents

- [Hello World](#hello-world)
- [Division](#division)

## Programs

### Hello World

This program prints "Hello, World!" to the console.

### Division

This program divides one number (500) by half through bitwise operations. Also, it converts the result to a string and prints it to the console.

## How to run

```bash
nasm -f elf64 src/hello_world.asm -o hello_world.o
ld hello_world.o -o hello_world
./hello_world
```
