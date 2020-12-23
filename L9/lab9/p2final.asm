data segment
        num1 dd 45124579H
        num2 dw 0002h
        quotient dd ?
        remainder dw ?
data ends

code segment
    assume cs:code,ds:data
        mov ax,data
        mov ds,ax
        call division
        int 03

division proc near
        lea si,num1
        lea di,quotient
        mov ax,[si+2]
        mov bx,num2
        mov dx,0h
        div bx
        mov [di+2],ax
        mov ax,[si]
        div bx
        mov remainder,dx
        mov [di],ax
        ret
division endp
code ends
end