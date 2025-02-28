.INC "M32.DEF"

.ORG 0X00
LOOKUP_TABLE: .DB 0,1,4,9,16

.ORG 14
    LDI r16, 0X00
    LDI R17, 0XFF
    OUT DDRB, r16
    OUT DDRC, R17
    LDI ZH, HIGH(LOOKUP_TABLE<<1)


LOOP:
    LDI ZL LOW(LOOKUP_TABLE)
    IN PINC, R20,
    ANDI R20, OX0F // FOR LAST 4 BITS
    ADD ZL, R20
    LPM R16, Z
    OUT PORTC, R16
    RJMP LOOP

