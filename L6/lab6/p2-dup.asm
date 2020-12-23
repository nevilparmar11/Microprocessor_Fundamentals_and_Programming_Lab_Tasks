data segment
        msg1 db 10,13,'Printing Original String: $'
        msg2 db 10,13,'Printing Modified String: $'
        original db 20,"Good Morning$"
        find db 0D,20,"Morning$"
        subst db 0D,40,"Evening$"
        result db 100 dup(0)
        i dw ?
        j dw ?
        new db 10,13,'$'
data ends

print_string macro msg
            mov dx, offset msg
            mov ah, 09H
            int 21H
endm

code segment
        assume cs:code,ds:data

        mov  ax, data
        mov  ds, ax

        print_string msg1
        print_string original

exit:     
        mov  ax, 4c00h
        int  21h
code ends
end