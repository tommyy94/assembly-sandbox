; This program reads string character by character
; and prints it to standard output.
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
    
    BYTES_TO_READ equ 1

    string: db "Useless string", EOL, EOF
    
section .bss

section .text

global _start

_start:
    mov ecx, string ; pointer to string
    mov edx, BYTES_TO_READ
    mov ebx, STDOUT
    
Write:
    mov eax, SYS_WRITE
    int SYS_CALL
    
    inc ecx ; increment pointer
    cmp byte [ecx], EOF
    jne Write ; keep writing until EOF marker
    
Exit:
    mov eax, SYS_EXIT
    xor ebx, ebx
    int SYS_CALL
