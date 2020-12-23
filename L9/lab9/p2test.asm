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

    mov     cx,dvsr                ;cx = dvsr
    xor     dx,dx                  ;dx = 0
    mov     ax,word ptr [num+2]    ;ax = high order numerator
    div     cx                     ;dx = rem, ax = high order quotient
    mov     word ptr [quot+2],ax   ;store high order quotient
    mov     ax,word ptr [num]      ;ax = low  order numerator
    div     cx                     ;dx = rem, ax = low  order quotient
    mov     word ptr [quot],ax     ;store low  order quotient
    mov     word ptr [rmdr],dx     ;store remainder

    int 03
code ends
end