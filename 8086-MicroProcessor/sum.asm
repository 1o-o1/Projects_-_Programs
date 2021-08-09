.Model small
.stack 200h
.data
.code

MAIN PROC

mov ax, 1234h
mov bx,1234h

add bx,ax

mov ah,02
mov dx,bx
int 21h

main endp
end main