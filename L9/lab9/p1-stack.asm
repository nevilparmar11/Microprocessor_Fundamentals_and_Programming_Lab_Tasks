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

        ; push the necessary params to the stack to acces them inside the procedure instr
        push num1   ; offset SP + 10
        push num2   ; offset SP + 8
        push offset gcd    ; offset SP + 6
        push offset lcm    ; offset SP + 4

        call calculateLCM    ; calling the calculateLCM procedure by passing the parameters as a pointer
        mov ax,4c00h
        int 21h
        
calculateLCM proc near
        push bp
        mov bp, sp
        mov ax, [bp + 10]
        mov bx, [bp + 8] 
find:
        mov dx,0
        mov cx,bx
        div bx
        mov bx,dx
        mov ax,cx
        cmp bx,0
        jne find
        
        mov gcd, ax ; store the gcd
        mov cx,ax
        mov ax, [bp + 10]
        mov bx, [bp + 8]
        mul bx
        div cx
        mov lcm, ax ; store the lcm
        pop bp ; restore the address of BP from the top of the stack
        RET
calculateLCM endp
code ends
end start