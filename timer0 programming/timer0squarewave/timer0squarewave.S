
#define __SFR_OFFSET 0
#include "avr/io.h"
.global main

main:
  
    SBI DDRB, 5

SQRWAVE:
    SBI PORTB, 5    
    RCALL DELAY     
    CBI PORTB, 5    
    RCALL DELAY     
    RJMP SQRWAVE

DELAY:
    LDI R20, 0x00   
    OUT TCNT0, R20
    
    LDI R20, 0x05
    OUT TCCR0B, R20 // Set prescaler to 1024

POLL:
    IN R20, TIFR0   
    SBRS R20, TOV0
    RJMP POLL
    
    LDI R20, 0x00
    OUT TCCR0B, R20 
    
    LDI R20, 0x01
    OUT TIFR0, R20  
    RET
