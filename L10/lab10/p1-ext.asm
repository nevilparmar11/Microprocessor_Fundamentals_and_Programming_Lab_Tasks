public convertToGray 

code_ext segment 
assume cs:code_ext 
proc convertToGray far 
    mov bl,al 
    clc 
    rcr al,1 
    xor al,bl 
    ret 
endp convertToGray 
code_ext ends 
end