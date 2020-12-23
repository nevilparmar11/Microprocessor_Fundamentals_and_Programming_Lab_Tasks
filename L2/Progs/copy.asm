data segment
    arr1 db 1,2,3,4,5
   	arr2 db 0,0,0,0
data ends
code segment
	assume cs:code,ds:data
	MOV AX,DATA
	MOV DS,AX
	MOV CL,5
	LEA BX,arr1
	LEA SI,arr2
L:	MOV CH,[BX]
	MOV [SI],CH
	INC BX
	INC SI
	DEC CL
	CMP CL,00
	JNZ L 	
    INT 3
code ends
end
