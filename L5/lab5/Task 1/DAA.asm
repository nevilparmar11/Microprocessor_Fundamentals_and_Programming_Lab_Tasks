;Author : Nevil Parmar
;Roll NO: CE092
data segment
 n1 db '8'
 n2 db '5'
 d_sum dw ?
data ends
code segment
        assume cs:code, ds:data
		mov ax, data
        mov ds, ax
        ;daa
        mov al,17h
        add al,42h
        daa
        mov [d_sum],al
        int 03                
code ends
	end