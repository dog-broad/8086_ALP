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
        mov al,b
        mov bl,c
        add al,bl
        mov cl,d
        sub al,cl
        mov dl,e
        mul dl
        mov a,al
        int 03
code ends
end start
                            
                            
 ; -d DS
 ; 02 04 01 03 0F
