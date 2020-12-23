;Author : Nevil Parmar
;Roll NO: CE092
; It reads character from the console, and prints "Hello world" only if the entered character is 'Y'
;otherwise the loop continues and keep on asking for input character

data segment
    SAYHI DB 'Hello World !','$'
data ends

code segment
Assume cs:code, ds:data
Begin:   
    mov ax,data
    mov ds,ax

READ: 
    ;read a character
    mov ah,1
    int 21h 
    ;save input character to bl register and go to new line
    mov bl,al
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h

    ; check if the entered character is 'Y' by subtracting its ascii value
CHECK:
    mov al,59h
    sub al,bl
    jz EXIT
    jmp READ

    ; terminate
EXIT:
    ; print hello world and exit
    lea dx,SAYHI
    mov ah,09h
    int 21h

    ; return back to console
    mov ah,4ch
    int 21h    
Code Ends
End Begin