data segment
        addition db 0DH, 0AH, "Addition of two number is : $"
        space db 0DH, 0AH, "$"
        addResult dw 0
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
    
    addL:
            mov ah, 0
            mov al, num1
            add al, num2
            mov cl, 04H
            cmp al, 10H
            jl jump
            add al, 06H
            jmp sep
    jump:
            and al, 0FH
            cmp al, 09H
            jle directa
            add al, 06H
    sep:
            mov ah, al
            and ah, 0F0H
            rol ah, cl
            and al, 0FH
    directa:
            mov [addResult], ax
            printString space
            printString addition
            mov dl, byte ptr addResult[1]
            add dl, 30H
            mov ah, 02H
            int 21H
            mov dl, byte ptr addResult[0]
            add dl, 30H
            mov ah, 02H
            int 21H

            mov ah, 4CH
            int 21H
code ends
end start