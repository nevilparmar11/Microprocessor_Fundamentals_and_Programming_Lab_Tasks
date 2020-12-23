data segment
    num     dd      10000000h
    dvsr    dw      2000h 
    quot    dd      ?
    rmdr    dw      ?
data ends

code segment
    assume cs:code , ds:data
    mov ax, data
    mov ds, ax

    mov si, offset num
    mov ax, [si]
    mov dx, [si + 2]
    mov bx, [si + 4]
    div bx
    mov quot, ax
    mov rmdr, dx
    int 03
code ends
end