
#define __SFR_OFFSET 0x00
#include "avr/io.h"

//code for ; filepath: intro.S
#define __SFR_OFFSET 0x00
#include "avr/io.h"

.global main
    
main:
    ; Set PB5 as output (Arduino Uno built-in LED)
    sbi DDRB, 5
    
loop:
    ; Toggle LED
    sbi PORTB, 5      ; Turn LED on
    rcall delay       ; Wait
    cbi PORTB, 5      ; Turn LED off
    rcall delay       ; Wait
    rjmp loop         ; Repeat forever

delay:
//adding another outli
    ldi r20, 255      ; Outer loop counter
outer_loop:
    ldi r21, 255      ; Inner loop counter
inner_loop:
    dec r21           ; Decrement inner counter
    brne inner_loop   ; Continue inner loop if not zero
    dec r20           ; Decrement outer counter
    brne outer_loop   ; Continue outer loop if not zero
    ret               ; Return from delay subroutine