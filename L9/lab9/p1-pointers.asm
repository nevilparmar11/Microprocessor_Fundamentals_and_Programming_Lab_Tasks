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
        mov SI,offset num1     ; pass the offset of num1 in SI 
        mov DI,offset num2     ; pass the offset of num2 in DI
        call calculateLCM    ; calling the calculateLCM procedure by passing the parameters as a pointer
        mov ax,4c00h
        int 21h
        
calculateLCM proc near
        mov ax, [si] ; ax points to num1 in the memory
        mov bx, [di] ; bx points to num2 in the memory
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
        mov ax,[si]
        mov bx,[di]
        mul bx
        div cx
        mov lcm, ax
        RET
calculateLCM endp
code ends
end start