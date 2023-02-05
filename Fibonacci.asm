ASSUME CS: CODE, DS: DATA

DATA SEGMENT
    RES DB ?
    CNT DB 0AH
DATA ENDS

CODE SEGMENT
START:  MOV AX, DATA
        MOV DS, AX
        LEA SI, RES
        SUB CNT, 2
        MOV CL, CNT;
        MOV AX, 00H
        MOV BX, 01H
        MOV [SI], AX
        MOV [SI+1], BX
        ADD SI, 2
L1:     ADD AX, BX
        DAA
        MOV [SI], AX
        MOV AX, BX
        MOV BX, [SI]
        INC SI
        LOOP L1
INT 0003H
CODE ENDS
END START