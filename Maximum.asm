ASSUME CS: CODE, DS: DATA

DATA SEGMENT
    LIST DB 02H, 01H, 04H, 03H
    COUNT EQU 0003H
DATA ENDS

CODE SEGMENT
START:  MOV AX, DATA
        MOV DS, AX
        MOV AX, 0000H
        MOV CX, COUNT           ; CX contains the number of items in the list
        MOV SI, OFFSET LIST     ; SI contains the offset of the first item in the list

AGAIN:  MOV AL, [SI]            ; AL contains the current item
        CMP AL, [SI+1]          ; Compare the current item with the next item
        JG NEXT                 ; If the current item is greater than the next item, jump to NEXT
        MOV AL, [SI]            ; Move the current item into AL
NEXT:   INC SI                  ; Increment the offset to the next item
        DEC CX                  ; Decrement the count of items
        JNZ AGAIN               ; If CX is not zero, jump to AGAIN
        INT 03                  ; End of program
CODE ENDS
END START