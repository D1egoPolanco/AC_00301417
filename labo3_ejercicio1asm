org 100h

section .text

        XOR BX, BX
        XOR DI, DI 
        XOR AX, AX
        MOV word CX, 8d
        JMP iterar


iterar:
        MOV byte BL, [carnet+DI]
        ADD AL, BL
        INC DI
        LOOP iterar
total:
        
        MOV BX, 8d
        DIV BX
        
        MOV byte [20Ah], AL         
exit:
        int 20h

section .data

carnet DB 0,0,3,0,1,4,1,7
