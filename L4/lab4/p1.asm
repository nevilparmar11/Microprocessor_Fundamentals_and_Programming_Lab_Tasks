;Author : Nevil Parmar
;Roll NO: CE092
data segment
    prime_numbers db 20 dup (0)
data ends

code segment
    assume cs:code, ds:data
		mov ax, data
		mov ds, ax
		mov bl, 01h
		mov cx, 10h
		mov si, offset prime_numbers
    up:
		mov dl, 02h
		add bl, 01h
		cmp bl, 02h
		je loop2
		cmp bl, 03h
		je loop2
		cmp bl, 04h
		jge Loop1
    loop1:
        mov ah, 00
        mov al, bl
        div dl
        cmp ah, 00h
        je up
        add dl, 01h
        cmp dl, al  
        jle loop1
        jmp loop2
    loop2:
        mov [si], bl
        inc si
        loop up
        int 21h
code ends
	end