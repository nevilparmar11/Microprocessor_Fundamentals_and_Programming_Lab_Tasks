;Author : Nevil Parmar
;Roll NO: CE092
data segment
  
data ends

code segment
    assume cs:code, ds:data
		mov ax, data
        mov ds, ax
        
        ; Scan numebr 1
        mov ah,01h
        int 21h
        sub al,30h
        mov bl,al
        
        ; Scan number 2
        mov ah,01
        int 21h
        sub al,30h
        add al,bl
        aaa

        mov ah,4ch
        int 21h
code ends
	end