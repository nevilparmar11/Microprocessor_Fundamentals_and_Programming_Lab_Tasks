data segment
    n1 dd 12345678h
    n2 dd 12342345h
    result dd ?
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
    mov ax,[si+2]
    add ax,[di+2]
    mov [bx+2],ax
    int 03
code ends
end
