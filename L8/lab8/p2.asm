data segment
        ascii db '1'
        lookup db 3fh,06h,5bh,4fh,66h,6dh,7dh,07h,7fh,6fh
        result db ?
data ends

code segment
    assume cs:code,ds:data
        mov ax,data
        mov ds,ax
        mov bx, offset lookup
        mov al,ascii
        and al,0fh
        xlat
        mov result,al
        mov ax,4c00h
        int 21h
code ends
end