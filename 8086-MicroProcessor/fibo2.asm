
.MODEL SMALL
.STACK 200h
.DATA
CNT DB 25   ;How many Fib Number
NUM0 DW 00h ;Initial Number1
NUM1 DW 01h ;Initial Number2

DV DW 0Ah   ;Used for Find Out Digit

DAT DW ?      
.CODE
MAIN: 
MOV AX,@DATA
MOV DS,AX
MOV CL,CNT       ; Load the count value for CL for looping

    ;Fibonacci Part
    FIB:
    MOV BX,NUM0
    ADD BX,NUM1    ;SUM=BX=Num0+Num1
    MOV AX,NUM1
    MOV NUM1,BX    ;NUM2=SUM (i+2th) Number
    MOV NUM0,AX    ;NUM1= (i+1th)Number
        
        LEA SI,DAT   ;Array For holding Digit
        MOV BX,0 
        
        DIGIT: 
        MOV DX,0    ; Na dile Div/0 Error dey
        DIV DV
        MOV [SI],DX
        INC SI
        INC BX
        CMP AX,0
        JNE DIGIT        
        
            LEA SI,DAT
            ADD SI,BX      ;Load Last Address
            SUB SI,1    
            ;Print Start
            PRINT:
            MOV DX,[SI]
            ADD DX,48
            MOV AH,02      ;Printing in Reverse Order
            INT 21H
            
            DEC SI
            DEC BX         ;MSB to LSB
            CMP BX,0       ;Counter check
            JNE PRINT

          ;Print "," to separate
        MOV DL,44
        MOV AH,02
        INT 21H
      
     DEC CL         ;MSB to LSB
     CMP CL,0       ;Counter check
     JNE FIB
    
       
    
MOV AH,4CH        ; Clear
INT 21H           ; Terminate
END MAIN