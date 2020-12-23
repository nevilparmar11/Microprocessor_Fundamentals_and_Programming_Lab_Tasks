data segment
    n1 dw 1234h
    n2 dw 5678h
    result dw ?
data ends
code segment
assume cs:code,ds:data
    mov ax,data
    mov ds,ax
    lea si,n1
    lea di,n2
    lea bx,result
    mov ax,[si]
    add ax,[di]
    mov [bx],ax
    int 03
code ends
end
