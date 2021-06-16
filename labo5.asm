org 100h

section .text
       
        XOR AX, AX
        XOR SI, SI
        XOR BX, BX
        XOR DX, DX
        XOR CX, CX

    ; Asignando valores iniciales
    MOV SI, 0
    MOV DI, 0d
    MOV DH, 10
    MOV DL, 20
    

    call modotexto
;movimiento principal 
 movimiento:
    call movercursor
    MOV CL, [texto+SI]
        call escribir
        INC SI
        INC DL
        INC DI

        CMP DI, 34d
        MOV BH, 0h
        jb movimiento

        jmp esperartecla
    
 modotexto: 
        MOV AH, 0h ;modo texto
        MOV AL, 03h ;grafico deseado
        INT 10h
        RET
movercursor:
        MOV AH, 02h
        MOV BH, 0h

        ;comparaciones
        CMP DI, 6d
        JE aumentadh
        
        CMP DI, 20d
        JE aumentadh

        CMP DI, 20d
        JE aumentadh

        INT 10h
        RET

   escribir:
        MOV AH, 0Ah
        MOV AL, CL 
        MOV BH, 0h
        MOV CX, 1h
        INT 10h
        RET

;posicionamiento
aumentadh:
        INC DH
        INC DH
        MOV DL, 19
        RET
;detener tecla 
esperartecla:
        MOV AH, 00h ; espera teclado para avanzar en la siguiente instrucción
        INT 16h
    exit:
        int 20h
    
    regresar:
        ret

    section .data

 texto DB 'Diego Ernesto Polanco Ortiz'
 len equ $-texto + 10;
