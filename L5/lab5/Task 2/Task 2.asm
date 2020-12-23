dz segment
heading db 0DH, 0AH, "Verification of Instructions without using them!$"
addition db 0DH, 0AH, "Addition of two number is : $"
subtraction db 0DH, 0AH, "Subtraction of two number is : $"
multiplication db 0DH, 0AH, "Multiplication of two number is : $"
division db 0DH, 0AH, "Division of two number is : $"
daa_result db 0DH, 0AH, "DAA result is : $"
das_result db 0DH, 0AH, "DAS result is : $"
remainder db 0DH, 0AH, "Remainder is : $"
minus db "-$"
space db 0DH, 0AH, "$"
add_ dw 0
sub_ dw 0
mul_ dw 0
div_ dw 0
daa_ dw 0   
das_ dw 0
num1 db 6H
num2 db 8H
hex_ db 10 dup ('$')
dz ends
printString macro string
mov dx, offset string
mov ah, 09H
int 21H
endm
code segment
assume ds:dz, cs:code
start:
mov ax, dz
mov ds, ax
printString heading
; ---------------------------Addition-------------------------------
_add:
mov ah, 0
mov al, num1
add al, num2
mov cl, 04H
cmp al, 10H
jl jump
add al, 06H
jmp sep
jump:
and al, 0FH
cmp al, 09H
jle direct_a
add al, 06H
sep:
mov ah, al
and ah, 0F0H
rol ah, cl
and al, 0FH
direct_a:
mov [add_], ax
printString space
printString addition
mov dl, byte ptr add_[1]
add dl, 30H
mov ah, 02H
int 21H
mov dl, byte ptr add_[0]
add dl, 30H
mov ah, 02H
int 21H
;---------------------------subtraction-------------------------------------
_sub:
mov ah, 0
mov al, num1
sub al, num2
cmp al, 09H
jnc substracting
jl direct_s
substracting:
and al, 0FH
sub al, 06H
mov bl, 09H
sub bl, al
mov al, bl
add al, 01H
mov [sub_], ax
printString space
printString subtraction
printString minus
jmp next
direct_s:
mov ah, 0H
mov [sub_], ax
printString space
printString subtraction
mov dl, byte ptr sub_[1]
add dl, 30H
mov ah, 02H
int 21H
next:
mov dl, byte ptr sub_[0]
add dl, 30H
mov ah, 02H
int 21H
;--------------------------Multiplication----------------------------
_mul:
mov ah, 0
mov al, num1
mov bl, num2
mul bl
lea si, hex_
mov cx, 0
mov bx, 10
loop1:
mov dx, 0
div bx
add dl, 30h
push dx
inc cx
cmp ax, 9
jg loop1
add al, 30h
mov [si], al
loop2:
pop ax
inc si
mov [si], al
loop loop2
printString space
printString multiplication
mov dl, offset hex_
mov ah, 09h
int 21h
;--------------------------------Division------------------------------
_div:
mov ah, 0
mov al, num1
mov bl, num2
mov ah, al
and al, 0FH
mov cl, 04H
shr ah, cl
div bl
mov [div_], ax
printString space
printString division
mov dl, byte ptr div_[0]
add dl, 30H
mov ah, 02H
int 21H
printString remainder
mov dl, byte ptr div_[1]
add dl, 30H
mov ah, 02H
int 21H
;----------------------------------DAA---------------------------------
_daa:
mov ah, 0
mov al, num1
add al, num2
mov cl, 04H
cmp al, 10H
jl jump2
add al, 06H
jmp sep2
jump2:
and al, 0FH
cmp al, 09H
jle direct_d
add al, 06H
sep2:
mov ah, al
and ah, 0F0H
rol ah, cl
and al, 0FH
direct_d:
mov [daa_], ax
printString space
printString daa_result
mov dl, byte ptr daa_[1]
add dl, 30H
mov ah, 02H
int 21H
mov dl, byte ptr daa_[0]
add dl, 30H
mov ah, 02H
int 21H
;--------------------------------------DAS--------------------------------
_das:
mov ah, 0
mov al, num1
sub al, num2
mov bh,09H
pushf
pushf
pushf
pop bx
and bl,10H
cmp bl,00H
jnz r1
mov bl,al
and bl,0FH
cmp bh,bl
jnc t1
r1:
sub al,60H
t1:
popf
jc t2
mov bl,al
and bl,0F0H
mov cl,04H
rol bl,cl
cmp bh,bl
jnc r2
t2:
sub al,06H
r2:
popf
jnc skip3
mov byte ptr offset das_ + 01H, 01H
skip3:
mov byte ptr offset das_, al
printString space
printString das_result
cmp byte ptr das_[0], 02H
jc TT:
mov al, 99H
cmp byte ptr das_[1], 01H
jz nextt
cmp byte ptr das_[0], 09H
jnc t
sub al, byte ptr das_[0]
add al, 01H
mov [das_], ax
jmp TT
t:
sub byte ptr das_[0], al
sub byte ptr das_[0], 01H
TT:
mov dl, byte ptr das_[0]
add dl, 30H
mov ah, 02H
int 21H
jmp Exit
nextt:
printString minus
and ah, 00H
mov al, 99H
sub al, byte ptr das_[0]
add al, 01H
and al, 0FH
mov [das_], ax
mov dl, byte ptr das_[0]
add dl, 30H
mov ah, 02H
int 21H
jmp Exit
;-----------------------------------Exit-----------------------------
Exit:
mov ax, 4c00H
int 21H
code ends
end start