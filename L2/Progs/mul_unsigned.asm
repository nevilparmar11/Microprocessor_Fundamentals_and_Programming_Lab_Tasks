data segment
    n1 dw 12h
    n2 dw 56h
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
    mul [di]
    mov [bx],ax
    int 03
code ends
end
