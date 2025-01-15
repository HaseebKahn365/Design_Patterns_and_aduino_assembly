
.inc "m32.def"

.org 0x500
MYDATA:    .db "WORLD PEACE"

.org 0x0000
    ldi r16, 11; //11 for 12 characters
    ldi r20, oxFF
    OUT DDRB r20
    LDI ZH, HIGH(MYDATA<<1)
    LDI ZL, LOW(MYDATA<<1)

L1: 
    LPM R20,Z
    OUT PORTB, R20
    INC ZL //POINT TO THE NEXT BYTE
    DEC r16
    BRNE L1

HERE: 
    RJMP HERE


//OTHER METHOD:
LPM R20,Z+
OUT PORTB, R20
CPI R20, 0
BRNE LOOP;

HERE:
    RJMP HERE

