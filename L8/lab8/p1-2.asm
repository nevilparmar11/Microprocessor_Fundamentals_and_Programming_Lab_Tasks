; HEX to BCD
data segment
        hex db 0afh
        bcd dw 0
        cnt db 0
data ends

code segment
    assume cs:code,ds:data
start:  
        mov ax,data
        mov ds,ax

        mov al,hex
        cmp al,00
        jz exit

loop1:
        mov ah,00
        mov bl,0ah
        div bl
        mov dh,00
        mov dl,ah
        mov bl,al
        mov al,04
        mul cnt
        mov cl,al
        rol dx,cl
        or bcd,dx
        mov al,bl
        inc cnt
        cmp al,0
        jnz loop1
exit:
        mov bx,bcd
        mov ax,4c00h
        int 21h
       
code ends
end start