; BCD to HEX
data segment
        bcd db '1234'
        hex_num dw 0
        mult_factor dw 1000
        digit_count dw 4
data ends

code segment
    assume cs:code,ds:data
start:  
        mov ax,data
        mov ds,ax
        mov bx , 10    
        mov cx , digit_count 
        lea si , bcd  
    up:
        mov al , [si]   
        and ax , 000fh  
        mul mult_factor  
        add hex_num , ax  
        mov ax , mult_factor   
        mov dx , 00
        div bx
        mov mult_factor , ax
        inc si
        loop up    
        
        mov cx , hex_num
        
        mov ah , 4ch   
        int 21h
code ends
end start