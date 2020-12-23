extrn cel:far 
    data segment public 
    n db 0cdh 
    answer db ? 
data ends 

stack_seg segment stack 
    dw 20 dup(0) 
    top label word 
stack_seg ends 

code segment 
assume cs:code, ds:data, ss:stack_seg 
    mov ax,data 
    mov ds,ax 
    mov ax,stack_seg 
    mov ss,ax 
    mov sp,top 
    xor ax,ax 
    mov al,n 
    call cel 
    mov answer,al 
    int 03h 
code ends 
end