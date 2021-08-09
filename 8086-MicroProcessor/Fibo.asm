
.MODEL SMALL
.STACK 200h
.DATA
CNT DB 12
DAT DB ?
       
.CODE
MAIN: 
MOV AX,@DATA
MOV DS,AX
LEA SI,DAT
MOV CL,CNT       ; Load the count value for CL for looping
MOV AX,00H       ; Default No
MOV BX,01H       ; Default No

    ;Fibonacci Part
    FIB:
    ADD AX,BX
    MOV [SI],AX
    MOV AX,BX
    MOV BX,[SI]
    INC SI   
    DEC CL
    CMP CL,0
    JA FIB
    ;Fibonacci End;
    
    
    
    ;Array Print
    MOV CL,CNT
    LEA SI,DAT
    PRINT:
    MOV AL,[SI]     ;Copy one value of array
    MOV AH,0; 
    MOV BL,64h
    DIV BL          ;Find quotient
    MOV BX,AX
    
    ;Print quotient MSB, 3rd Decimal
    MOV DL,BL
    ADD DL,48
    MOV AH,02
    INT 21H
    
    
    MOV AL,BH;      ;Copy Reminder
    MOV AH,0;
    MOV BL,0Ah
    DIV BL          ;Find quotient
    MOV BX,AX
    
    ;Print MSB, 2nd Decimal
    MOV DL,BL
    ADD DL,48
    MOV AH,02
    INT 21H
    
    ;Print LSB , 1st Decimal
    MOV DL,BH
    ADD DL,48
    MOV AH,02
    INT 21H

    ;Print "," to separate
    MOV DL,44
    MOV AH,02
    INT 21H
    
    ;Counting array element
    INC SI
    DEC CL   
    CMP CL,0
    JA PRINT
    ;Print End    
    
MOV AH,4CH        ; Clear
INT 21H           ; Terminate
END MAIN