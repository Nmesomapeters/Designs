section .data
    name db 'Zara Ali', 0      ; Null-terminated string to store the name

section .text
global _start

_start:
    ; Print the original name 'Zara Ali'
    mov edx, 9                ; Length of the original name (including null terminator)
    mov ecx, name             ; Load the address of the original name into ecx
    mov ebx, 1                ; File descriptor 1 (stdout)
    mov eax, 4                ; Syscall number for sys_write
    int 0x80                 ; Invoke the syscall

    ; Change the name to 'Nuha Ali'
    mov dword [name], 'Nuha'  ; Store the new name 'Nuha' in the memory
    mov edx, 8                ; Length of the new name (including null terminator)
    mov ecx, name             ; Load the address of the updated name into ecx
    mov eax, 4                ; Syscall number for sys_write
    int 0x80                 ; Invoke the syscall

    ; Exit the program
    mov eax, 1                ; Syscall number for sys_exit
    xor ebx, ebx              ; Exit code 0
    int 0x80                 ; Invoke the syscall
