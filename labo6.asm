org 	100h

section	.text

  MOV 	DX, textoInicial
  call 	leerclave
	call	escribircadena
   int 	20h

    section	.data
    
    textoInicial	DB	"Ingrese la clave de 5 caracteres: ", "$"
    clave	db	"clave", "$"
    menbienvenida	db	"Bienvenido", "$"
    mencorrecto	db	"Incorrecto", "$"

    EsperaTecla:
        mov     AH, 01h
        int     21h
        ret

    leerclave:
        xor     SI, SI
      
      while: 

            call    EsperaTecla
            cmp     AL, 0x0D
            je      exit
            call    comparar
            mov     [300h+SI], AL
            inc     SI
            jmp     while
   
   exit:
        mov byte [300h+SI], "$" ; agregar $ 
        ret

    comparacion:

        cmp [clave + SI], AL
        je sum
        ret
    
    sumatoria:

        inc DI
        ret
    
    escribir:

        cmp DI, SI
        ;Mostrar mensaje correcto
       je index
       jne error
       ret

   index:
mov 	AH, 09h
        mov 	DX,  menbienvenida
        int 	21h
        ret
        
  error:
mov 	AH, 09h
        mov 	DX, mencorrecto
        int 	21h
        ret


  
	
