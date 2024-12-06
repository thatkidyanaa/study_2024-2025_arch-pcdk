SECTION .data
msg1: db 'Hello, ', 0x0
msg1Len: equ $ -msg1

msg2: db 'World!', 0xa
msg2Len: equ $ -msg2

SECTION .text
global _start
_start:
mov eax, 4
mov ebx, 1
mov ecx, msg1
mov edx, msg1Len
int 0x80

mov eax, 4
mov ebx, 1
mov ecx, msg2
mov edx, msg2Len
int 0x80

mov eax, 1
mov ebx, 0
int 0x80