data segment 
    string db "Overflow",13,10,"$" 
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
    mov word ptr es:0010h,offset overflow 
    mov word ptr es:0012h,seg overflow 
    mov al,100 
    add al,100 
    INTO 
    int 03h 
    
overflow proc near 
    lea dx,string 
    mov ah,09 
    int 21h 
    iret
overflow endp 

code ends 
end