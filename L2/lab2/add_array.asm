data segment
    arr1 dw 0201h,0202h,0203h,0404h,0305h
    result dw ?
data ends
code segment
	assume cs:code,ds:data
	MOV AX,DATA
	MOV DS,AX
	MOV CL,5
	LEA SI,arr1
	LEA BX,result
	MOV AX,0000h
L:	ADD AX,[SI]
	INC SI
	INC SI
	DEC CL
	CMP CL,00
	JNZ L
	MOV [BX],AX	
    INT 3
code ends
end
