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
            mov al, num1
            sub al, num2
            cmp al, 09H
            jnc substracting
            jl direct_s
    substracting:
            and al, 0FH
            sub al, 06H
            mov bl, 09H
            sub bl, al
            mov al, bl
            add al, 01H
            mov [sub_], ax
            printString space
            printString subtraction
            printString minus
            jmp next
    direct_s:
            mov ah, 0H
            mov [sub_], ax
            printString space
            printString subtraction
            mov dl, byte ptr sub_[1]
            add dl, 30H
            mov ah, 02H
            int 21H
    next:
            mov dl, byte ptr sub_[0]
            add dl, 30H
            mov ah, 02H
            int 21H

            mov ah, 4CH
            int 21H
code ends
end start