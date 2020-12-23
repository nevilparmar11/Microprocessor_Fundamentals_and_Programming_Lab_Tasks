data segment
    num db "371" 
    str1 db "Number is not armstrong$"
    str2 db "Number is armstrong$"
data ends
code segment
    assume cs:code,ds:data

start: 
        mov ax,data
        mov ds,ax
        mov si,offset num
        mov ax,0000h
        mov cx,0003h
next:
        mov ax,0000h
        mov bl,[si]
        and bl,0fh
        mov al,bl
        mul bl
        mul bl
        add dx,ax
        inc si
        Loop next  
        cmp dx,371d 
        jnz notarm 
        mov dx,offset str2  
        jmp ex
notarm:
        mov dx,offset str1
        jmp ex
ex:   
        mov ah,9h
        int 21h
        mov ax,4c00h
        int 21h
code ends
end start