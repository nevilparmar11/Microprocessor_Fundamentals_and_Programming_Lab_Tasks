dosseg
.model small

.data
    greating_msg db "Welcome in 8086-Calculator type simple equations to solve",10,"   Examples : 1+1 or 5*8",10,"$"
    error_msg db 10,"Exit due error$"
    division_reminder_msg db " and remainder=$"
    input db 3 DUP('0')

.code
    ; printing greating_msg
    mov dx,@data ;move offsets to data segment
    mov ds,dx
    
    mov ah,9
    mov dx,offset greating_msg
    int '!'         ; '!' = 21h
    
    mov bx,0
take_input:                        ; loop to take input and print dl for each letter
    mov ah,8        ; to input 1 character
    int '!'
    mov cl,al
    cmp bx,1        ; if it's the second character then it's opreation
    je check_cl_opreation
    call check_cl_number
    cmp al,1
    je assign
    jmp print_error_and_quit
check_cl_opreation:    ; to check if the input operation is a supported one
    cmp cl,'+'
    je assign
    cmp cl,'-'
    je assign
    cmp cl,'*'
    je assign
    cmp cl,'/'
    je assign
    jmp print_error_and_quit

assign:
    call print_cl
    mov input[bx],cl
    inc bx
    cmp bx,3
    jne take_input

calculate_input:
    mov cl,input[0]         ; First number
    mov bl,input[1]         ; the mark between the numbers
    mov ch,input[2]          ; Second number
    cmp bl,'+'
    je adding
    cmp bl,'-'
    je subtracting
    cmp bl,'*'
    je multiplying
    cmp bl,'/'
    je dividing
print_error_and_quit:
    mov ah,9
    mov dx,offset error_msg
    int '!'         ; '!' = 21h
    
quit: ; Quit the program
    mov ah,'L'  ; 'L' = 4Ch
    int '!'
    
adding:
    call print_equal_sign
    sub ch,'0'
    add cl,ch
    mov ch,'0' ; ch will be used as 10's number
    jmp check_and_print_cx
    
subtracting:
    call print_equal_sign
    sub ch,'0'
    sub cl,ch
    call check_cl_number
    cmp al,1
    je print_sub
    mov bh,cl
    mov cl,'-'
    call print_cl
    mov cl,':'     ; ':' = '9'+1
    sub bh,'0'    ; make bh contains exact number
    add bh,10   ; add 10 to get number in positive in next instruction
    sub cl,bh     ; remove bh from cl to get positive number in cl
print_sub:
    call print_cl
    jmp quit

multiplying:
    call print_equal_sign
    sub ch,'0'
    sub cl,'0'
    mov al,ch
    mul cl
    mov cl,al
    mov ch,ah
    add cl,'0'
    add ch,'0'
    call check_and_print_cx
    
check_and_print_cx:
    call check_cl_number
    cmp al,1
    je print_cx
    inc ch
    sub cl,10
    jmp check_and_print_cx
print_cx:
    cmp ch,'0'
    je print_units
    mov bh,cl ; using bh as temp
    mov cl,ch
    call print_cl
    mov cl,bh
print_units:
    call print_cl
    jmp quit

dividing:
    call print_equal_sign
    sub cl,'0'                      ; to use the real value of cl not '0'+value
    sub ch,'0'                     ; to use the real value of ch not '0'+value
    mov ah,0                    ; clear ah to use ax in division
    mov al,cl
    mov bl,ch
    div bl
    mov ch,ah
    mov cl,al
    add cl,'0'
    call print_cl
    mov ah,9
    cmp ch,0
    je quit_division
    mov dx,offset division_reminder_msg
    int '!'         ; '!' = 21h
    mov cl,ch
    add cl,'0'
    call print_cl
quit_division:
    jmp quit

print_equal_sign:
    mov ah,2
    mov dl,'='
    int '!'
    ret
    
print_cl:
    mov ah,2
    mov dl,cl
    int '!'
    ret

check_cl_number: ; check if the CL is a number if so return 1 in AL else return 0 in AL
    cmp cl,'0'
    jb not_number
    cmp cl,'9'
    ja not_number
    mov al,1
    ret
not_number:
    mov al,0
    ret
end