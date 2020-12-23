data segment
            n1 db '8'
            n2 db '5'
            sum dw ?
            dif dw ?
            product dw ?
            remainder db ?
            quotient db ?
            d_sum db ?
            d_dif db ?
data ends

code segment
            assume cs:code,ds:data
            mov ax,data
            mov ds,ax

            ;aaa
            sub ah,ah
            mov al,[n1]
            add al,[n2]
            aaa
            or ax,3030h
            mov [sum],ax

            ;aas
            sub ah,ah
            mov al,[n1]
            sub al,[n2]
            aas
            or ax,3030h
            mov [dif],ax

            ;aam
            sub ah,ah
            mov al,[n1]
            mov bl, [n2]
            and al,0fh
            and bl,0fh
            mul bl
            aam
            or ax,3030h
            mov [product],ax

            ;aad
            mov ax,129
            aad
            mov bl,2
            div bl
            mov [remainder],ah
            mov [quotient],al

            ;daa
            mov al,17h
            add al,42h
            daa
            mov [d_sum],al
            
            ;das
            mov al,2h
            sub al,18h
            das
            mov [d_dif],al

            int 03
code ends
end