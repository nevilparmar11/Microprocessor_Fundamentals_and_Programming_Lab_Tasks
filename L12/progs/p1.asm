data segment 
    n1 dd 3.14
    n2 dd 1.11 
    result dd 4 dup(-1) 
    status dw 0 
data ends 

code segment 
    assume cs:code, ds:data 
    mov ax,data 
    mov ds,ax 
    finit 
    fld n1 
    fadd n2 
    fst result[0] 
    fld n1 
    fsub n2 
    fst result[4] 
    fld n1 
    fmul n2 
    fst result[8] 
    fld n1 
    fdiv n2 
    fstsw status 
    test status,4 
    jnz divide_error ; division might cause an divide error 
    fst result[12] 
    int 03h 
    
divide_error: 
    int 0 
    int 03h 

code ends 
end