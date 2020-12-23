data segment
    arr db 1,2,3,4
    oddarr db 10 dup(?) 
    evenarr db 10 dup(?)
data ends
code segment assume cs:code,ds:data
    mov ax,data
    mov ds,ax
    lea si,oddarr
    lea di,evenarr
    lea bx,arr
    mov cl,4
    mov dh,2
find:
    mov ah,0000h
    mov al,[bx]
    mov dl,al
    div dh
    cmp ah,00
    je even
    mov [si],dl
    inc si
    inc bx
    dec cl
    cmp cl,00
    jnz find
even:
    mov [di],dl
    inc di
    dec cl
    cmp cl,00
    jnz find
    int 03
code ends
end