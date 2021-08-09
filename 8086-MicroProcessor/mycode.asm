DATA SEGMENT
    ;haha db 'hahavodox','$'
CODE SEGMENT
    print    MACRO c  
            push    ax
            mov     al, c
            mov     ah, 0x0E
            int     0x10     
            pop     ax
    ENDM
    ;mov ax,48 
    
mov ax, 6h ; number to divide goes in AX
mov bx, 2h ; dividing-by (operand)
div bl     ; perform division. <- BYTE division
           ; Stores integer result in AL and remainder in DX


;mov al, bl
print al
int 21h