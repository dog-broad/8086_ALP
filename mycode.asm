ASSUME CS:CODE,DS:DATA 

DATA SEGMENT
STRING DB "CMRIT$"
REFNO EQU '$'
COUNT EQU 0000
DATA ENDS

CODE SEGMENT
START:	; Initialize the data segment
		MOV AX,DATA 
		MOV DS,AX
		; Initialize CX with the number of characters in the string
		MOV CX,COUNT 
		; Initialize SI with the offset of the string
		MOV SI,OFFSET STRING 
		; Initialize AL with the reference number to search for
		MOV AL,REFNO 
BACK: 	; Compare AL with the character in the string
		CMP AL,[SI] 
		; Jump to STOP if equal
		JE STOP 
		; Increment SI to point to the next character in the string
		INC SI 
		; Decrement CX to count the next character in the string
		INC CX 
		; Jump to BACK if CX is not zero
		JNZ BACK 
STOP: 	; Move CX to AX
		MOV AX,CX 
		; Stop the program
		INT 03 
CODE ENDS
END START

