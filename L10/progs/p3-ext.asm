public compliment 

code_ext segment 
assume cs:code_ext 
proc compliment far 
    cmp ax,0000h 
    jz stop 
    not ax 
    add ax,0001h 
stop: 
    ret 
endp compliment 
code_ext ends 
end