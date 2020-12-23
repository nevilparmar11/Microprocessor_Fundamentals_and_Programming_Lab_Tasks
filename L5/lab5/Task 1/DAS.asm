;Author : Nevil Parmar
;Roll NO: CE092
data segment
 n1 db '8'
 n2 db '5'
 d_dif dw ?
data ends
code segment
        assume cs:code, ds:data
		mov ax, data
        mov ds, ax
        ;das
        mov al,2h
        sub al,18h
        das
        mov [d_dif],al
        int 03                
code ends
	end