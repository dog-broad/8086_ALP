ASSUME CS: CODE, DS: DATA

DATA SEGMENT
    RES DB ?       ; Define a byte to store the result
    CNT DB 0AH     ; Define a byte to store the counter
DATA ENDS

CODE SEGMENT
START:  MOV AX, DATA
        MOV DS, AX
        LEA SI, RES
        SUB CNT, 2   ; Subtract 2 from the counter
        MOV CL, CNT  ; Move the counter into CL
        MOV AX, 00H  ; Move 0 into AX
        MOV BX, 01H  ; Move 1 into BX
        MOV [SI], AX ; Store AX in RES
        MOV [SI+1], BX ; Store BX in RES + 1
        ADD SI, 2    ; Increment SI by 2
L1:     ADD AX, BX   ; Add AX and BX
        DAA          ; Decimal adjust AX
        MOV [SI], AX ; Store AX in RES
        MOV AX, BX   ; Move BX into AX
        MOV BX, [SI] ; Move the value at RES into BX
        INC SI       ; Increment SI
        LOOP L1      ; Loop L1
INT 0003H            ; Interrupt 0003H
CODE ENDS
END START