data segment
        input_msg1 db 0Dh, 0Ah, "Enter first String :- $"
        input_msg2 db 0Dh, 0Ah, "Enter second String :- $"
        output_msg db 0Dh, 0Ah, "Common characters are :-$"
        heading db 0DH, 0AH, "Program to store common characters : $"
        string1 db 100 dup('$')
        string2 db 100 dup('$')
        space db 0DH, 0AH, "$"
data ends

print_msg macro msg
        mov dx, offset msg
        mov ah, 09h
        int 21h
endm

code segment

        assume ds:data, cs:code
start:
        cld
        mov ax, data
        mov ds, ax
        mov es, ax
        print_msg heading
        print_msg input_msg1
        mov dx, offset string1	; Input string1
        mov ah, 0ah	
        int 21h	
        mov cl, string1 + 1	
        mov ch, 00h	
        lea si,string1 + 2	
        print_msg space	
        print_msg input_msg2	
        mov dx,offset string2	; Input string2
        mov ah,0ah	
        int 21h	
        lea di,string2 + 2	
        print_msg space	
        print_msg output_msg	
        mov ax, 0000h	
        mov bx, cx	
again:	
        mov cl, string1 + 1	
        mov ch, 00h	
        lea di, string2 + 2	
        lodsb	
        repne scasb	
        jz char_disp	
up:	
        dec bx	
        cmp bx,0000h	
        jne again	
        jmp Exit	
char_disp:	
        mov dl, al	
        mov ah, 02h
        int 21h
        jmp up
Exit:
        mov ah,4CH
        int 21h
code ends
end start
