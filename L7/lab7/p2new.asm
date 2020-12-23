data segment 
    str1 db "abc"
    len1 db $-str1
    str2 db "ABd"
    len2 db $-str2
    msg1 db "Equal",13,10,"$"
    msg2 db "Not Equal" ,13,10,"$"
    lookUp db "abcdefghijklmnopqrstuvwxyz"
data ends

code segment
    assume cs:code,ds:data
    mov ax,data
    mov ds,ax
    mov al,len1
    cmp al,len2
    jnz notequal
    mov bx,offset lookUp
    mov si,offset str1
    mov di,offset str2
    mov cl,len1
start:
    mov al,[si]
    cmp al,'a'
    jl S1
CONTINUE1:
    mov dl,al
    mov al,[di]
    cmp al,'a'
    jl S2
CONTINUE2:
    cmp al,dl
    jnz notequal
    inc si
    inc di
    loop start
    jmp equal
notequal:
    mov dx,offset msg2
    mov ah,09h
    int 21h
    jmp stop
equal:
    mov dx,offset msg1
    mov ah,09h
    int 21h
stop:
    mov ax,4c00h
    int 21h
S1:
    sub al,'A'
    xlat
    jmp CONTINUE1
S2:
    sub al,'A'
    xlat
    jmp CONTINUE2            
code ends
end    