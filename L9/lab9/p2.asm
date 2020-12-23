data segment
    mes dd 6537543ah
    divr dw 3456h
    q1 dw ?
    q2 dw ?
    rem dw ?
data ends

my_stack segment stack
    dw 20 dup(0)
    topst label word
my_stack ends

code segment
    assume cs:code , ds:data, ss:my_stack
    mov ax, data
    mov ds, ax
    mov ax, my_stack
    mov ss, ax
    mov sp, offset topst
    lea si, mes
    push divr
    push ds:[si]
    push ds:[si+2]
    call division
    int 03

division proc near
    mov di, sp
    add sp, 2
    mov dx, 00
    pop ax
    pop cx
    pop bx
    pop bx
    div bx
    mov q1, ax
    mov ax, cx
    div bx
    mov q2, ax
    mov rem, dx
    mov sp, di
    ret
division endp

code ends
end