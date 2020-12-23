;Author : Nevil Parmar
;Roll NO: CE092
data segment
 n1 db '8'
 n2 db '5'
 product dw ?
data ends
code segment
        assume cs:code, ds:data
		mov ax, data
        mov ds, ax
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
        int 03                
code ends
	end