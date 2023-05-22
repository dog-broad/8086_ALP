ASSUME CS: CODE, DS: DATA

DATA SEGMENT
	LIST DB 02H,01H, 04H, 03H
    COUNT EQU 0003H
DATA ENDS

CODE SEGMENT
START:	MOV AX, DATA
		MOV DS, AX
		MOV DX, COUNT
AGAIN:	MOV CX, DX
        MOV SI, OFFSET LIST
BACK:	MOV AL, [SI]          ; move the first number in the list to AL
		CMP AL, [SI+1]        ; compare the first number to the second number
		JG NEXT               ; if the first number is greater than the second number, then go to NEXT
		XCHG AL, [SI+1]       ; if the first number is not greater than the second number, then exchange the first number with the second number
		XCHG AL, [SI]         ; exchange the first number with the second number
NEXT:	INC SI                 ; move to the next number in the list
		LOOP BACK             ; repeat the loop until CX = 0
		DEC DX                ; move to the next number in the list
		JNZ AGAIN             ; repeat the loop until DX = 0
		INT 03                ; end the program
CODE ENDS
END START

