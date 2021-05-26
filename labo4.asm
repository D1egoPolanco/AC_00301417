section .text

XOR SI, SI                          
XOR DI, DI
XOR BX, BX
XOR CX, CX
XOR DX, DX
XOR AX, AX

MOV     BP, arreglo     
CALL    datos        

int     20h

section .data

arreglo db 11,22,33,44,55,66,77,88,99,98 ;datos arreglo   

largo equ $-array ;tamano
   
dividir equ 02 ;

datos:
    MOV     BL, dividir

for:
    CMP     SI, largo
    JE      end

    MOV     AL, [BP+SI]
    MOV     BH,AL
    DIV     BL
    INC     SI

    CMP     AH, 0
    JE      par
    JNE     impar
        
par:
    MOV     DI, CX
    MOV     [300h+ DI], BH
    INC     DI
    MOV     CX, DI
    jmp     for

impar:
    MOV     DI, DX
    MOV     [320h+DI], BH
    INC     DI
    MOV     DX, DI
    jmp     for

end:
    ret
