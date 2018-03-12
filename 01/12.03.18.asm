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
    ; BCF = bit clear | BSF = bit up 1 | TRISD 0 = output
    
    MOVLW 0xf0
    MOVWF TRISD
Loop:    
    MOVLW 0x00
    MOVWF PORTD
    MOVLW 0x05
    MOVWF PORTD
    BCF PORTD, 2
    MOVLW 0x0a
    MOVWF PORTD
    BSF PORTD, 2
    MOVLW 0x01
    MOVWF PORTD    
    BSF PORTD, 1
    MOVLW 0x0d
    MOVWF PORTD
    BCF PORTD, 3
    MOVLW 0x06
    MOVWF PORTD
    BCF PORTD, 2
    MOVLW 0x08
    MOVWF PORTD
    MOVLW 0x07
    MOVWF PORTD
    MOVLW 0x0b
    MOVWF PORTD
    MOVLW 0x0d
    MOVWF PORTD
    MOVLW 0x00
    MOVWF PORTD
    
   GOTO Loop
	
	end