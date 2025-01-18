
//configs for  UCSRB and UCSRC needed to configure USART for asyn-
chronous operating mode, 8 data bits (character size), no parity, and 1 stop bit?
Enable both receive and transmit.


//Upm1 = 0, UPM0 = 0 IN UCSRC FOR NO PARITY
//UMSEL = 0 IN UCSRC FOR ASYNCHRONOUS MODE
//USBS = 0 FOR 1 STOP BIT IN UCSRC
//UCSZ1 = 1, UCSZ0 = 1 FOR 8 BIT DATA
;HENCE
LDI R20, (1<<RXEN) | (1<<TXEN)
OUT UCSRB, R20

LDI R20, (1<<URSEL) | (1<<UCSZ1) | (1<<UCSZ0)
OUT UCSRC, R20



#include <avr/io.h>
#include <avr/interrupt.h>

volatile uint16_t count = 0;

ISR(TIMER1_OVF_vect) {
    count++;          // Increment counter on overflow
    PORTB ^= (1<<5); // Toggle LED on PB5
}

int main(void) {
    // Set PB5 as output for LED
    DDRB |= (1<<DDB5);
    
    // Timer1 Configuration
    TCCR1A = 0x00;        // Normal mode
    TCCR1B |= (1<<CS12);  // External clock source on T1 pin, falling edge
    
    // Enable Timer1 overflow interrupt
    TIMSK1 |= (1<<TOIE1);
    
    // Enable global interrupts
    sei();
    
    while(1) {
        // Main program loop
    }
    
    return 0;
}