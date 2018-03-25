; This program uses lookup table to multiply 25 by 6.
; The multiplicand is stored in ecx.
; Result is stored in edx.
; Compiled with x86 NASM 2.12.01

section .data
    STDIN equ 0
    STDOUT equ 1
    STDERR equ 2
    SYS_EXIT equ 1
    SYS_READ equ 3
    SYS_WRITE equ 4
    EOL equ 0Ah
    EOF equ 00h
    SYS_CALL equ 80h

    table: dd 0, 25, 50, 75, 100, 125, 150, 175, 200, 225, 250, 275, 300


section .bss

section .text

global _start

_start:
    mov ecx, 6 ; position of the result
    mov edx, [table+ecx*4] ; double word aka 32-bit values

    nop ; use debugger to read the result

Exit:
    mov eax, SYS_EXIT
    xor ebx, ebx
    int SYS_CALL
