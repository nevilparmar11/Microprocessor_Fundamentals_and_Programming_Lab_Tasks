data segment
        multiplication db 0DH, 0AH, "Multiplication of two number is : $"
        space db 0DH, 0AH, "$"
        num1 db 6H
        num2 db 8H
        hex db 10 dup ('$')
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
    mulL:
            mov ah, 0
            mov al, num1
            mov bl, num2
            mul bl
            lea si, hex
            mov cx, 0
            mov bx, 10
    loop1:
            mov dx, 0
            div bx
            add dl, 30h
            push dx
            inc cx
            cmp ax, 9
            jg loop1
            add al, 30h
            mov [si], al
    loop2:
            pop ax
            inc si
            mov [si], al
            loop loop2
            printString space
            printString multiplication
            mov dl, offset hex
            mov ah, 09h
            int 21h
    
            mov ah, 4CH
            int 21H
code ends
end start