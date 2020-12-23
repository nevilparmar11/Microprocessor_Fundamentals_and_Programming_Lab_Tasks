data segment 
    string db "Can't Divide By Zero",13,10,"$" 
data ends 

stacks segment 
    stack dw 20 dup(0) 
    top label word 
stacks ends 

code segment 
    assume cs:code,ds:data,ss:stacks 
    mov ax,data 
    mov ds,ax 
    mov ax,stacks 
    mov ss,ax 
    mov sp,top 
    mov ax,0000 
    mov es,ax 
    mov word ptr es:0000,offset division 
    mov word ptr es:0002,seg division 
    mov ax,0005 
    mov bl,00 
    div bl 
    int 03h 
    
division proc near 
    lea dx,string 
    mov ah,09 
    int 21h 
    pop bx 
    add bx,2 
    push bx 
    iret 
division endp 

code ends 
end