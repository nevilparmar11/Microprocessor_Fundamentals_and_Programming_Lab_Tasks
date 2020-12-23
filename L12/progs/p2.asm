data segment 
    radius dd 3.0 
    area dd 0 
data ends 

code segment 
    assume cs:code, ds:data 
    
    mov ax,data 
    mov ds,ax 
    finit 
    fldpi 
    fld radius 
    FMUL ST,ST(0) 
    FMUL ST,ST(1) 
    FST area 
    int 03h 
    
code ends 
end