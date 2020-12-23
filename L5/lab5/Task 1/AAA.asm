data segment
        addition db 0DH, 0AH, "Addition of two number is : $"
        space db 0DH, 0AH, "$"
        add dw 0
        num1 db 6H
        num2 db 8H
data ends

printString macro string
        mov dx, offset string
        mov ah, 09H
        int 21H
endm

code segment
            assume ds:data, cs:code
    start:
            mov ax, data
            mov ds, ax
    
        add:
            mov ah, 0
            mov al, num1
            add al, num2
            AAA
            mov [add], ax
            printString space
            printString addition
            mov dl, byte ptr add[1]
            add dl, 30H
            mov ah, 02H
            int 21H
            mov dl, byte ptr add[0]
            add dl, 30H
            mov ah, 02H
            int 21H
            mov ax, 4CH
            int 21H
code ends
end start