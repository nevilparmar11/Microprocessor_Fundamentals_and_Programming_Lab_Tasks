;Author : Nevil Parmar
;Roll NO: CE092
data segment
    
    ;creating a new file
    fname1 db 'C:\emu8086\MyBuild\file1', 0
    fname2 db 'C:\emu8086\MyBuild\file2', 0
    fp1 dw ?
    fp2 dw ?
    
    string db 'Hey There, Nevil Here !'
    temp db 40 dup(?)
    
data ends

code segment
    
    assume cs:code, ds:data
    start:
        
        mov ax, data
        mov ds, ax
        
        mov ah, 3ch  ; new file1
        mov dx, offset fname1
        mov cl, 1
        int 21h
        mov fp1, ax
        
        mov ah, 3ch  ; new file2
        mov dx, offset fname2
        mov cl, 1
        int 21h
        mov fp2, ax
        
        mov ah, 3eh  ; closing file1
        mov dx, fp1
        int 21h
        
        mov ah, 3eh  ; closing file2
        mov dx, fp2
        int 21h
        
        mov ah, 3dh  ; open existing file1
        mov dx, offset fname1
        mov al, 1    ; writing mode
        int 21h
        mov fp1, ax
        
        mov ah, 40h  ; updation in file1  
        mov bx, fp1
        mov cx, 23h
        mov dx, offset string
        int 21h
        
        mov ah, 3eh  ; closing file1
        mov dx, fp1
        int 21h 
        
        mov ah, 3dh
        mov dx, offset fname1
        mov al, 0    ; reading mode
        int 21h
        mov fp1, ax
        
        mov ah, 3fh  ; reading 23 bytes from file1
        mov bx, fp1
        mov dx, offset temp
        mov cx, 23h
        int 21h
        
        mov ah, 3dh  ; open existing file2
        mov dx, offset fname2
        mov al, 1    ; writing mode
        int 21h
        mov fp2, ax
        
        mov ah, 40h  ; copy from file2 to file2  
        mov bx, fp2
        mov cx, 23h
        mov dx, offset temp
        int 21h
        
        mov ah, 3eh  ; closing file1
        mov dx, fp1
        int 21h
        
        mov ah, 3eh  ; closing file2
        mov dx, fp2
        int 21h
        
        
code ends
    end start