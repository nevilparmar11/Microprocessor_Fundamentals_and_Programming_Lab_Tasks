data segment
        num1 dw 0016
        num2 dw 0024
        gcd dw ?
        lcm dw ?
data ends

code segment
    assume ds:data,cs:code
start:
        mov ax,data
        mov ds,ax
        mov ax,num1     ;NUM1 is stored in ax
        mov bx,num2     ; NUM2 is stored in bx  
        call calculateLCM    ; calling the calculateLCM procedure by passing the parameters in register
        mov lcm,AX
        mov ax,4c00h
        int 21h
        
calculateLCM proc near
find:
        mov dx,0
        mov cx,bx
        div bx
        mov bx,dx
        mov ax,cx
        cmp bx,0
        jne find
        
        mov gcd,ax
        mov cx,ax
        mov ax,num1
        mov bx,num2
        mul bx
        div cx
        RET
calculateLCM endp
code ends
end start