data segment
        new_greet db "Evening$"
        greeting db "Good Morning$"
data ends

print macro msg
        mov dx,offset msg
        mov ah,09h
        int 21h
endm

code segment
        assume ds:data,cs:code
start:
        cld
        mov ax, data
        mov ds, ax
        mov es, ax
        lea si, new_greet
        lea di, greeting
        mov al, 'M'
        mov cx, 0ch
        repne scasb
        dec di
        rep movsb
        print greeting
        
        mov ah,4CH
        int 21h
code ends
end start
