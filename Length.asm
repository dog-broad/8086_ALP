ASSUME CS: CODE, DS: DATA

DATA SEGMENT
    STRING DB "ARMSTRONG$"
    REFNO EQU "$"
    COUNT EQU 0000
DATA ENDS

CODE SEGMENT
START:  MOV AX, DATA    ; Load the address of the data segment into the AX register
        MOV DS, AX      ; Move the value in AX into the DS register
        MOV CX, COUNT   ; Move the value stored in COUNT into the CX register
        MOV SI, OFFSET STRING ; Move the offset of STRING into the SI register
        MOV AL, REFNO   ; Move the value stored in REFNO into the AL register
BACK:   CMP AL, [SI]    ; Compare the value in AL with the value in the memory location pointed to by SI
        JE STOP         ; If they are equal, jump to the STOP label
        INC SI          ; Increment the value in SI by 1
        INC CX          ; Increment the value in CX by 1
        JNZ BACK        ; If the value in CX is not zero, jump to the BACK label
STOP:   MOV AX, CX      ; Move the value in CX into the AX register
        INT 03          ; Terminate the program
CODE ENDS
END START