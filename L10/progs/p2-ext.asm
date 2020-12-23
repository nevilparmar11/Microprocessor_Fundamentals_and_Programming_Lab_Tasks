public cel 

code_ext segment 
assume cs:code_ext 
    proc cel far 
    sub ax,32 
    mov bx,0005h 
    mul bl 
    mov bx,0009h 
    div bx 
    ret 
    endp cel 
code_ext ends 
end