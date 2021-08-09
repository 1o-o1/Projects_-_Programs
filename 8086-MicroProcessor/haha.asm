
.stack 100h
;------------------------------------------
.data
str db 6 dup('$') ;STRING TO STORE NUMBER. 
;------------------------------------------
.code          
;INITIALIZE DATA SEGMENT.
  mov  ax, @data
  mov  ds, ax

;CONVERT NUMBER TO STRING. 
  mov  bx, 5           ; here should be the register
  mov  ax, bx      ;ANY NUMBER.
  call number2string  ;CONVERT AX. RESULT IN "STR".

;DISPLAY STRING.
  mov  ah, 9
  mov  dx, offset str  ;NUMBER CONVERTED.
  int  21h

;WAIT FOR USER TO PRESS ANY KEY.
  mov  ah,7
  int  21h

;FINISH PROGRAM.
  mov  ax, 4c00h
  int  21h           

;------------------------------------------

;NUMBER TO CONVERT MUST ENTER IN AX.
;ALGORITHM : EXTRACT DIGITS ONE BY ONE, STORE
;THEM IN STACK, THEN EXTRACT THEM IN REVERSE
;ORDER TO CONSTRUCT STRING.

proc number2string
  mov  bx, 10 ;DIGITS ARE EXTRACTED DIVIDING BY 10.
  mov  cx, 0 ;COUNTER FOR EXTRACTED DIGITS.
cycle1:       
  mov  dx, 0 ;NECESSARY TO DIVIDE BY BX.
  div  bx ;DX:AX / 10 = AX:QUOTIENT DX:REMAINDER.
  push dx ;PRESERVE DIGIT EXTRACTED FOR LATER.
  inc  cx ;INCREASE COUNTER FOR EVERY DIGIT EXTRACTED.
  cmp  ax, 0  ;IF NUMBER IS
  jne  cycle1 ;NOT ZERO, LOOP. 
;NOW RETRIEVE PUSHED DIGITS.
  mov  si, offset str
cycle2:  
  pop  dx        
  add  dl, 48 ;CONVERT DIGIT TO CHARACTER.
  mov  [ si ], dl
  inc  si
  loop cycle2  

  ret
endp 