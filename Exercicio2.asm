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
	BCF TRISD, 0
	BCF TRISD, 1
	BCF TRISD, 2
	BCF TRISD, 3
	
	BSF PORTD, 3
	BSF PORTD, 2
	BSF PORTD, 0
	BCF PORTD, 3
	BCF PORTD, 0
	BSF PORTD, 1
	BCF PORTD, 2
	BSF PORTD, 0
	BCF PORTD, 0
	BCF PORTD, 1
	BSF PORTD, 3
	BCF PORTD, 3
	BSF PORTD, 1
	BCF PORTD, 1
	
	GOTO Start
	
	end