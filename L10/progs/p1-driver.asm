extrn convertToGray:far
data segment
    n db 0cdh
    answer dw ?
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
    call convertToGray 
    mov answer,ax 
    int 03h 
code ends 
end