.MODEL SMALL
.STACK 100h

.DATA
    VAL DB 12,10,15,8,15,9
    COUNT DW 6


.CODE 

    START:
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV CX,COUNT       
    DEC CX
       
    NEXTSCAN:
    MOV BX,CX
    MOV SI,0
    NEXTCOMP:
    MOV AL,VAL[SI]    ; Compare i, i+1
    MOV DL,VAL[SI+1]
    CMP AL,DL
    JC NOSWAP
    MOV VAL[SI],DL      ; Compare smaller value first
    MOV VAL[SI+1],AL
    NOSWAP:
    INC SI
    DEC BX
    JNZ NEXTCOMP
    LOOP NEXTSCAN

    ;Print From Here
    MOV CX,COUNT
    MOV SI,OFFSET VAL
    PRINT:
    MOV AL,[SI]
    MOV AH,0; 
    MOV BL,0Ah
    DIV BL
    
    MOV BX,AX
    
    ;Print MSB
    MOV DL,BL
    ADD DL,48
    MOV AH,02
    INT 21H
    
    ;Print LSB
    MOV DL,BH
    ADD DL,48
    MOV AH,02
    INT 21H

    ;Print ","
    MOV DL,44
    MOV AH,02
    INT 21H
    
    
    INC SI   
    CMP CX, SI
    JNE PRINT
    ;Print End
    
    MOV AH,4CH
    INT 21H
    END START 
    CODE ENDS