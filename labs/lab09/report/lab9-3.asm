%include 'in_out.asm'

SECTION .text
GLOBAL _start

_start:
pop ecx
pop edx
sub ecx, 1

next:
cmp ecx, 0
jz _end
pop eax
call sprintLF
loop next

_end:
call quit