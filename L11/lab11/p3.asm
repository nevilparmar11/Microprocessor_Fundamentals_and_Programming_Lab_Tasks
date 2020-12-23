data segment 
    n db 4 
    r db 2 
    answer db ? 
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
    mov si,offset n 
    mov di,offset r

    call ncr 
    mov answer,al 
    int 03h 

ncr proc near 
    XOR ax,ax 
    mov al,BYTE PTR [di] 
    mov bl,01 
    call fact 
    mov cx,ax 
    XOR ax,ax 
    mov al,BYTE PTR [si] 
    mov bl,al 
    sub bl,BYTE PTR [di] 
    call fact 
    div cl 
    ret 
ncr endp 

fact proc near 
    cmp al,bl 
    jle stop 
    push ax 
    dec ax 
    call fact 
    pop dx 
    mul dx 
    ret 
stop: 
    mov ax,0001 
    ret 
fact endp 

code ends 
end