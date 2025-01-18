.include "m328pdef.inc"

.org 0x0000
    rjmp START

START:
    ; Initialize Stack Pointer
    ldi r16, HIGH(RAMEND)
    out SPH, r16
    ldi r16, LOW(RAMEND)
    out SPL, r16

    ; Configure PORTA (0-3 output, 4-7 input)
    ldi r16, 0x0F
    out DDRA, r16

    rcall LCD_INIT    ; Initialize LCD (assumed to be defined elsewhere)

MAIN_LOOP:
    ; Make columns high
    ldi r16, 0xF0
    out PORTA, r16
    
    ; Check if any key pressed
    in r16, PINA
    cpi r16, 0xF0
    breq MAIN_LOOP    ; If no key pressed, continue scanning

    rcall SCAN_KEYPAD
    rcall LCD_DATA    ; Display character on LCD
    rjmp MAIN_LOOP

SCAN_KEYPAD:
    ; Scan Row 1
    ldi r16, 0xFE    ; ~(1<<0)
    out PORTA, r16
    rcall DELAY
    
    in r16, PINA
    andi r16, 0xF0
    cpi r16, 0xF0
    brne ROW1_PRESSED
    
    ; Scan Row 2
    ldi r16, 0xFD    ; ~(1<<1)
    out PORTA, r16
    rcall DELAY
    
    in r16, PINA
    andi r16, 0xF0
    cpi r16, 0xF0
    brne ROW2_PRESSED
    
    ; Similar patterns for Row 3 and 4
    ; ...

ROW1_PRESSED:
    sbrc r16, 4
    ldi r17, '7'
    sbrc r16, 5
    ldi r17, '8'
    sbrc r16, 6
    ldi r17, '9'
    sbrc r16, 7
    ldi r17, '/'
    ret

ROW2_PRESSED:
    sbrc r16, 4
    ldi r17, '4'
    sbrc r16, 5
    ldi r17, '5'
    sbrc r16, 6
    ldi r17, '6'
    sbrc r16, 7
    ldi r17, '*'
    ret

DELAY:
    ldi r20, 100
DELAY_LOOP:
    dec r20
    brne DELAY_LOOP
    ret

; LCD subroutines should be defined here
; LCD_INIT:
; LCD_DATA: