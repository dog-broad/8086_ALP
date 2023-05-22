ASSUME CS: CODE, DS: DATA

DATA SEGMENT
    LIST DB 02H, 01H, 04H, 03H  ; Data to be sorted
    COUNT EQU 0003H             ; Number of elements in the list
DATA ENDS

CODE SEGMENT
START:  MOV AX, DATA             ; Initialize DS
        MOV DS, AX
        MOV DX, COUNT            ; Count = number of elements in the list
AGAIN:  MOV CX, DX               ; CX = DX
        MOV SI, OFFSET LIST      ; SI = address of the first element
BACK:   MOV AL, [SI]            ; AL = first element
        CMP AL, [SI+1]          ; Compare with the second element
        JL NEXT                 ; If first element is less than second element, go to NEXT
        XCHG AL, [SI+1]         ; Exchange the first and second elements
        XCHG AL, [SI]
NEXT:   INC SI                  ; Increment SI to point to the next element
        LOOP BACK               ; Repeat the process for the next pair of elements
        DEC DX                  ; Decrement DX to process the next element
        JNZ AGAIN               ; Repeat the process until all elements are processed
        INT 03                  ; Stop execution
CODE ENDS
END START
 