;Author : Nevil Parmar
;Roll NO: CE092
data segment
 n1 db '8'
 n2 db '5'
 remainder dw ?
 quotient dw ?
data ends
code segment
        assume cs:code, ds:data
		mov ax, data
        mov ds, ax
        ;aad
        mov ax,129
        aad
        mov bl,2
        div bl
        mov [remainder],ah
        mov [quotient],al
        int 03                
code ends
	end