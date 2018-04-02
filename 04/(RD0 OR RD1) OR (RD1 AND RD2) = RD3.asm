#include <p18F4550.inc>
	
	CONFIG WDT=OFF; disable watchdog timer
	CONFIG MCLRE = ON; MCLEAR Pin on
	CONFIG DEBUG = ON; Enable Debug Mode
	CONFIG LVP = OFF; Low-Voltage programming disabled (necessary for debugging)
	CONFIG FOSC = INTOSCIO_EC;Internal oscillator, port function on RA6 
	
	org 0; start code at 0

UDATA
	
Delay1 res 1;reserve 1 byte for the variable Delay1
Delay2 res 1;reserve 1 byte for the variable Delay2

CODE
 
Start:   
    ; MOVLW copia literal para worker, MOVWF copia do worker para file 
    MOVLW 0xf7 ; 1111 0111
    MOVWF TRISD
Giro:    
    ;(RD0 OR RD1) OR (RD1 AND RD2) = RD3
    MOVF PORTD, W ; copia do PORTD para o worker
    MOVWF 0x00 ; copia do worker para o endereço 0x00    
    RLCF WREG ; Rotate Left f through Carry
    IORWF 0x00, W ; porta OU entre endereço 0x00 e worker bit a bit
    MOVWF 0x01    
    MOVF 0x00, W
    RLCF 0x00    
    ANDWF 0x00, W
    RLCF 0x01
    IORWF 0x01, W
    RLCF WREG
    MOVWF PORTD ; copia do worker para PORTD
    
    GOTO Giro
      
	end
	