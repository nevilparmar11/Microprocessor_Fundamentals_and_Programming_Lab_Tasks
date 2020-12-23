data segment 
    a dd 3.0 
    b dd 4.0 
    c dd 0.0 
data ends 

code segment 
    assume cs:code, ds:data 
    
    mov ax,data 
    mov ds,ax
    finit 
    FLD A 
    FMUL ST,ST(0) 
    FLD B 
    FMUL ST,ST(0) 
    FADD ST,ST(1) 
    FSQRT 
    FST c 
    int 03h 
    
code ends 
end