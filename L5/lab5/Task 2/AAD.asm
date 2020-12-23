data segment
            division db 0DH, 0AH, "Division of two number is : $"
            remainder db 0DH, 0AH, "Remainder is : $"
            space db 0DH, 0AH, "$"
            divResult dw 0
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
    divL:
            mov ah, 0
            mov al, num1
            mov bl, num2
            mov ah, al
            and al, 0FH
            mov cl, 04H
            shr ah, cl
            div bl
            mov [divResult], ax
            printString space
            printString division
            mov dl, byte ptr divResult[0]
            add dl, 30H
            mov ah, 02H
            int 21H
            printString remainder
            mov dl, byte ptr divResult[1]
            add dl, 30H
            mov ah, 02H
            int 21H
    
            mov ah, 4CH
            int 21H
code ends
end start