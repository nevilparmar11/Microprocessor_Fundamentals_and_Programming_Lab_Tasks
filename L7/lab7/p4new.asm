data segment
     array dw 0000h,0001h,0002h,0003h,0004h,0005h,0006h,0007h,0008h,0009h
     len dw ($-array)/2
     key equ 0007h
     msg db "key is found at "
     res db "  position",13,10," $"
     notfoundstr db 'not found $'
data ends
 
code segment 
    assume ds:data,cs:code
start:
      mov ax,data
      mov ds,ax
    
      mov bx,00
      mov dx,len
      mov cx,key
binary_search: 
      cmp bx,dx
       ja notfound
       mov ax,dx
       add ax,bx
       shr ax,1
       mov si,ax
       add si,si
       cmp cx,array[si]
       jae big
       dec ax
       mov dx,ax
       jmp binary_search
big:   
      je success
      inc ax
      mov bx,ax
      jmp binary_search
success: 
      add al,01
      add al,'0'
      mov res,al
      lea dx,msg
      jmp result
 
notfound: 
      lea dx,notfoundstr
      
result: 
      mov ah,09h
      int 21h
     
      mov ah,4ch
      int 21h     
code ends
end start
