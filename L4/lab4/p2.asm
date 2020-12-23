;Author : Nevil Parmar
;Roll NO: CE092
data segment
    LSTR DB 30,?,30 DUP('')
data ends

code segment
Assume cs:code, ds:data
Begin:   
    mov ax, data
    mov ds, ax
    
    mov dx,offset LSTR
    mov ah,0ah
    int 21h

    ; printing new line
    mov ah,2
    mov dl,0Dh
    int 21h
    mov dl,0Ah
    int 21h

    mov bl,LSTR[1]

CONVERT:
    cmp bx,00
    je EXIT
    mov al,LSTR[bx+1]
    sub al,20h
    mov LSTR[bx+1],al
    dec bx
    jmp CONVERT

EXIT:
    xor bx,bx
    mov bl,LSTR[1]
    mov LSTR[bx+2],'$'
    mov dx,offset LSTR+2
    mov ah,09h
    int 21h
    
    mov ah, 4Ch
    int 21h
Code Ends
End Begin