ASSUME CS: CODE, DS: DATA

DATA SEGMENT
    LIST DB 02H, 01H, 04H, 03H
    COUNT EQU 0003H ; 3 comparisons needed
DATA ENDS

CODE SEGMENT
START:  MOV AX, DATA
        MOV DS, AX
        MOV AX, 0000H           ; AL = 0
        MOV CX, COUNT           ; CX = 3
        MOV SI, OFFSET LIST     ; SI = address of list
        MOV AL, [SI]            ; AL = first element
AGAIN:  CMP AL, [SI+1]          ; compare AL to next element
        JL NEXT                 ; if AL < next element, go to NEXT
        MOV AL, [SI+1]          ; otherwise, AL = next element
NEXT:   INC SI                  ; increment to next element
        DEC CX                  ; decrement count
        JNZ AGAIN               ; if CX = 0, stop. Otherwise, go to AGAIN
        INT 03                  ; exit
CODE ENDS
END START