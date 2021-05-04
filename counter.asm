
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

DATA SEGMENT
    PORTA EQU 00H
    PORTC EQU 00H
    PORT_CON EQU 06H   
    
DATA ENDS


CODE SEGMENT
    MOV AX, DATA
    MOV DS, AX
    
    ORG 0000H
    
START:
    MOV DX, PORT_CON
    MOV AL, 10000000B
    OUT DX, AL
    
    MOV SI, 0
    MOV DI, 0
    
L0: MOV CX, 1FFFH
L1: MOV AL, S1[SI]
    MOV DX, PORTA
    OUT DX, AL
    LOOP L1
    
    INC SI
    CMP SI, 16
    JL L0
    
    MOV DX, PORT_CON
    MOV AL, 10000000B
    OUT DX, AL
    
LL0:MOV CX, 2FFFH
LL1:MOV AL, S2[DI]
    MOV DX, PORTC
    OUT DX, AL
    LOOP LL1
    
    INC DI
    CMP DI, 4
    JL LL0

JMP START
    
ORG 1000H
S1 DB 11000000B
   DB 11111001B
   DB 10100100B
   DB 10110000B
   DB 10011001B
   DB 10010010B
   DB 10000010B
   DB 11011000B
   DB 10000000B
   DB 10010000B
   DB 10001000B
   DB 10000011B
   DB 11000110B
   DB 10100001B
   DB 10000110B
   DB 10001110B
      
S2 DB 1101B
   DB 1011B
   DB 0111B
   DB 1110B

CODE ENDS
END


ret




