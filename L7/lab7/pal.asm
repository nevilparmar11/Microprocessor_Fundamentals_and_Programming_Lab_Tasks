Data SEGMENT
    Block1 DB ’ABCDEEDCBA’
    Pal DB 00H
Data ENDS

Extra SEGMENT
    Block2 DB 10 Dup(?)
Extra ENDS

PRINT MACRO MSG
    mov dx, offset MSG
    mov ah,09h
    int 21h
ENDM

Code SEGMENT
    ASSUME CS: Code, DS: Data, ES: Extra
    MOV AX, Data
    MOV DS, AX
    MOV AX, Extra
    MOV ES, AX
    LEA SI, Block1
    LEA DI, Block2 + 9
    MOV CX, 000AH
Back: 
    CLD
    LODSB
    STD
    STOSB
    LOOP Back
    LEA SI, Block1
    LEA DI, Block2
    MOV CX, 000AH
    CLD
REPZ CMPSB
    JNZ Skip
    MOV Pal, 01H
Skip:
    INT3
Code ENDS
END