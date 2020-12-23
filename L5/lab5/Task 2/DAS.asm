code segment
            assume cs:code
            mov al, 23h
            sub al, 31h
            mov bl,al
            mov bh,al
            mov cl,al
            and bl,0f0h
            cmp bl,90h
            jz abc
            jc abc
            sub bl,60h
    abc:
            mov al,bl
            cmp cl,6fh
            jc pqr
            jz pqr
    pqr:
            and cl,0fh
            cmp cl,9
            jz xyz
            jc xyz
            sub cl,6
    xyz:
            add al,cl
    end_:
            int 03
code ends
end