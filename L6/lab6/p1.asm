data segment
        str1 db 20 dup(0)
        str2 db 20 dup(0)
        str3 db 40 dup(0)
        msg1 db 10,13,'enter the first string: $'
        msg2 db 10,13,'enter the second string: $'
        msg3 db 10,13,'concatenated string is: $'
        new db 10,13,'$'
data ends

code segment
        assume cs:code,ds:data
start:
        mov ax,data
        mov ds,ax

        lea dx,msg1
        mov ah,09h
        int 21h
        mov bx,000
       
up1:
        mov ah,01h
        int 21h
        cmp al,0dh
        je down1
        mov [str1+bx],al
        inc bx
        jmp up1

down1:
        lea dx,new
        mov ah,09h
        int 21h
        lea dx,msg2
        mov ah,09h
        int 21h
        mov cx,bx
        mov bx,00
        
up2:
        mov ah,01h
        int 21h
        cmp al,0dh
        je down2
        mov [str2+bx],al
        inc bx
        jmp up2
        
down2:
        push bx
        mov di,0
        mov si,0
        
up3:
        mov al,[str1+di]
        mov [str3+si],al
        inc si
        inc di
        loop up3
        pop cx
        mov di,0
        
up4:
        mov al,[str2+di]
        mov [str3+si],al
        inc si
        inc di
        loop up4
        lea dx,new
        mov ah,09h
        int 21h
        lea dx,msg3
        mov ah,09h
        int 21h
        mov [str3+si],'$'

        lea dx,str3
        mov ah,09h
        int 21h
        
        mov ah,4ch
        int 21h
code ends
end start
end