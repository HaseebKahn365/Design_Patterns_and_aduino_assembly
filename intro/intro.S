
#define __SFR_OFFSET 0x00
#include "avr/io.h"

.global start
.global led

start:
    SBI DDRB, 4
    ret

led:
    CPI r24,0x00
    BREQ ledOFF
    SBI PORTB,4
    ret

ledOFF:
    CBI PORTB,4
    ret
