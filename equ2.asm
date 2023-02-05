assume cs:code,ds:data   

; Z=X*Y+W-V+U/K

data segment
    x db 02   ; x = 2
    y db 04   ; y = 4
    w db 09
    v db 03
    u dw 0006
    k db 03
    z db 01 dup()
data ends  

code segment
start:  mov ax,data
        mov ds,ax
        mov al,x
        mov bl,y
        mul bl
        mov cl,w
        add al,cl
        mov dl,v
        sub al,dl
        mov cl,al
        mov ax,u
        mov bl,k
        div bl
        add cl,al
        mov z,cl
        int 03
code ends
end start
