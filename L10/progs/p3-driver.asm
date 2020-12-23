extrn compliment:far 

data segment public 
    n dw 0abch 
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
    mov ax,n 
    call compliment 
    mov answer,ax 
    int 03h 
code ends 
end