data segment
        space db 0DH,0AH,"$"
        string db "aaaabbcabcabc"
        substring db "abc$"
        result db 0DH,0AH,"Number fo occurence is :- $"
        count dw 00h
data ends

print macro msg
        mov dx, offset msg
        mov ah, 09h
        int 21h
endm

code segment
        assume ds:data, cs:code, es:data
start:
        cld
        mov ax, data
        mov ds, ax
        mov es, ax
        mov bx, 00h
        lea di, string
        mov ax, di
        mov dx, di
        add dx, 1Fh
        sub dx, 03h
        inc dx
up:
        mov di, ax
        lea si, substring
        mov cx, 03h
        repe cmpsb
        jz next
prev:
        add ax, 01h
        cmp ax, dx
        jnz up
        jmp exit
next:
        inc bx
        mov cx, 03h
        jmp prev
exit:
        print string
        print space
        print substring
        print space
        print result
        mov [count], bx
        mov dl, byte ptr count[0]
        add dl, 30h
        mov ah, 02h
        int 21h

        mov ah,4CH
        int 21h
code ends
end start
