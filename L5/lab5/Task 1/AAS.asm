data segment
            subtraction db 0DH, 0AH, "Subtraction of two number is : $"
            minus db "-$"
            space db 0DH, 0AH, "$"
            sub_ dw 0
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
    
    _sub:
            mov ah, 0
            mov al, num2
            mov bl, num1
            sub bl, al
            AAS
            jnc skip
            neg bx
            mov [sub_], bx
            common_print space
            common_print substraction
            mov dx, offset minus
            mov ah, 09H
            int 21H
            jmp next
            skip:
            mov [sub_], bx
            common_print space
            common_print substraction
            mov dl, byte ptr sub_[1]
            add dl, 30H
            mov ah, 02H
            int 21H
            next:
            mov dl, byte ptr sub_[0]
            add dl, 30H
            mov ah, 02H
            int 21H
            mov ax, 4CH
            int 21H
code ends
end start