    .MODEL SMALL
    .STACK 100H
    .DATA
        INP dw 12
        MS1 dw 'D Decimal Value is : 12 ',13,10,'$'
        MS2 dw 'Binary Value is: ','$'
        DAT DB ?
    .CODE
    MAIN PROC
    MOV AX,@DATA  ;Load Data
    MOV DS,AX
  
    LEA DX,MS1
    MOV AH,09      ;Output First Msg
    INT 21H        ;Value is Static
    
    MOV CX,0       ;Count
    LEA SI,DAT     ;Load Variable
    MOV AX,INP     ;Load Input Decimal Number
    MOV BL,02      
    
    ;Convert Function start
    BIN:
    DIV BL         ;Divided by 2
    MOV [SI],AH;   ;Save Reminder
    INC SI         ;Next Address
    MOV AH,0       ;Clear Reminder
    INC CX
    CMP AL,0
    JNE BIN
    ;Convert FunctioneEnd
  
    LEA DX,MS2
    MOV AH,09      ;Print Second Msg
    INT 21H 
    
    LEA SI,DAT
    ADD SI,CX      ;Load Last Address
    SUB SI,1
    
    ;Print Start
    PRINT:
     
    MOV DL,[SI]
    ADD DL,48
    MOV AH,02      ;Printing in Reverse Order
    INT 21H
    
    DEC SI
    DEC CX         ;MSB to LSB
    CMP CX,0       ;Counter check
    JNE PRINT
    ;Print End

    MOV AH,4CH 
    INT 21H
  
    MAIN ENDP
    
    
    END MAIN