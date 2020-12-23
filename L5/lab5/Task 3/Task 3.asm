data segment
            space db 0DH, 0AH, "$"
            Heading db 0DH, 0AH, "Basic Calc For 1 Digit Number!$"
            string1 db 0DH, 0AH, "Enter 1st number : $"
            string2 db 0DH, 0AH, "Enter 2nd number : $"
            operator db 0DH, 0AH, "Enter the operation : $"
            addition db 0DH, 0AH, "Addition of two number is : $"
            subtraction db 0DH, 0AH, "subtraction of two number is : $"
            multiplication db 0DH, 0AH, "Multiplication of two number is : $"
            division db 0DH, 0AH, "Division of two number is : $"
            remainder db 0DH, 0AH, "Remainder is : $"
            continue db 0DH, 0AH, "Do you want to continue : type 'Y' otherwise 'press any key' : $"
            minus db "-$"
            add_ dw 0
            sub_ dw 0
            mul_ dw 0
            div_ dw 0
            ope_ db 1 dup(?)
            res_ db 1 dup(?)
data ends

print_string macro msg
            mov dx, offset msg
            mov ah, 09H
            int 21H
endm

scan_value macro
            mov ah, 01H
            int 21H
            mov res_, al
endm

user_input macro
            print_string space
            print_string space
            print_string string1
            mov ah, 01H
            int 21H
            mov bl, al
            sub bl, 30H
            print_string operator
            mov ah, 01H
            int 21H
            mov [ope_], al
            print_string string2
            mov ah, 01H
            int 21H
            sub al, 30H
endm

code segment
            assume ds:data, cs:code
    start:
            mov ax, data
            mov ds, ax
            print_string Heading
            print_string space
    up:
            user_input
            cmp [ope_], '+'
            jz additionL
            cmp [ope_], '-'
            jz subtractionL
            cmp [ope_], '*'
            jz mulLabel
            cmp [ope_], '/'
            jz divL

            ;Addition
    additionL:
            mov ah, 0
            add al, bl
            AAA
            mov [add_], ax
            print_string addition
            mov dl, byte ptr add_[1]
            add dl, 30H
            mov ah, 02H
            int 21H
            mov dl, byte ptr add_[0]
            add dl, 30H
            mov ah, 02H
            int 21H
            print_string space
            print_string continue
            scan_value
            cmp res_, 'Y'
            jz up
            jmp _Exit
            
            ;subtraction
    subtractionL:
            mov bh, 0
            sub bl, al
            AAS
            jnc skip
            neg bx
            print_string subtraction
            mov [sub_], bx
            mov dx, offset minus
            mov ah, 09H
            int 21H
            jmp next
    skip:
            print_string subtraction
            mov [sub_], bx
            mov dl, byte ptr sub_[1]
            add dl, 30H
            mov ah, 02H
            int 21H
    next:
            mov dl, byte ptr sub_[0]
            add dl, 30H
            mov ah, 02H
            int 21H
            print_string space
            print_string continue
            scan_value
            cmp res_, 'Y'
            jz up
            jmp _Exit
            
            ;Multiplication
    mulLabel:
            mov ah, 0
            mul bl
            AAM
            mov [mul_], ax
            print_string multiplication
            mov dl, byte ptr mul_[1]
            add dl, 30H
            mov ah, 02H
            int 21H
            mov dl, byte ptr mul_[0]
            add dl, 30H
            mov ah, 02H
            int 21H
            print_string space
            print_string continue
            scan_value
            cmp res_, 'Y'
            jz up
            jmp _Exit
           
            ;Division
    divL:
            xchg al, bl
            mov ah, 0
            AAD
            div bl
            mov [div_], ax
            print_string division
            mov dl, byte ptr div_[0]
            add dl, 30H
            mov ah, 02H
            int 21H
            print_string remainder
            mov dl, byte ptr div_[1]
            add dl, 30H
            mov ah, 02H
            int 21H
            print_string space
            print_string continue
            scan_value
            cmp res_, 'Y'
            jz up
            jmp _Exit
            
            ;Exit
    _Exit:
            mov ax, 4c00h
            int 21H
code ends
end start