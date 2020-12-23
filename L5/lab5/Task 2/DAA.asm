data segment
            daaResultString db 0DH, 0AH, "DAA result is : $"
            space db 0DH, 0AH, "$"
            daaResult dw 0   
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
    daaL:
            mov ah, 0
            mov al, num1
            add al, num2
            mov cl, 04H
            cmp al, 10H
            jl jump2
            add al, 06H
            jmp sep2
    jump2:
            and al, 0FH
            cmp al, 09H
            jle directd
            add al, 06H
    sep2:
            mov ah, al
            and ah, 0F0H
            rol ah, cl
            and al, 0FH
    directd:
            mov [daaResult], ax
            printString space
            printString daaResultString
            mov dl, byte ptr daaResult[1]
            add dl, 30H
            mov ah, 02H
            int 21H
            mov dl, byte ptr daaResult[0]
            add dl, 30H
            mov ah, 02H
            int 21H
    
            mov ah, 4CH
            int 21H
code ends
end start