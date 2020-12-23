data segment
        arr db 2,4,6,8,10
        mid db ?
        num  db 12
        strfound db "Found $"
        strNot db "Not Found $"
data ends

PRINT MACRO MSG
    mov dx, offset MSG
    MOV AX,0900H
    INT 21H

    MOV ax,4C00H
    INT 21H
ENDM

code segment
        assume cs:code,ds:data
start:
        LEA SI,arr
        mov ax,SI
        add ax,4
        mov DI,ax
        mov dl,2

L1:
        mov ax,SI
        add ax,DI
        div dl
        mov BX,00
        mov Bl,al
        mov bh,00
        mov al,BYTE PTR [BX]
        cmp al,num
        PRINT strfound
        jl Less

        sub BX,1
        mov DI,BX
        cmp SI,DI
        jle L1
        PRINT strNot

Less:
        add BX,1
        mov SI,BX
        cmp SI,DI
        jle L1
        PRINT strNot
code ends
end start
end