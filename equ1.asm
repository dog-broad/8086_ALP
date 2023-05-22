
assume cs:code, ds:data

data segment
    b db 02
    c db 04
    d db 01
    e db 03
    a db 01 dup()
data ends

code segment
start:  mov ax,data
        mov ds,ax

; b = 2
        mov al,b
; c = 4
        mov bl,c
; a = b + c = 6
        add al,bl
; d = 1
        mov cl,d
; a = a - d = 5
        sub al,cl
; e = 3
        mov dl,e
; a = a * e = 15
        mul dl
; a = 15
        mov a,al
        int 03
code ends
end start
                            
                            
 ; -d DS
 ; 02 04 01 03 0F
