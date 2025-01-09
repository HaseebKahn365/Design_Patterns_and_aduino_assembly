#include<avr/io.h>

void T0Delay();

int main(){
    DDRB |= 1<<PB3; // Set pb3 as output

    while(1){
        PORTB ^= 1<<PB3; // Toggle pb3 (fixed capitalization)
        T0Delay();
    }
    return 0;
}

void T0Delay(){
    TCNT0 = 0X00;    // Added missing semicolon
    TCCR0B = 0x05;   // Changed TCCR0 to TCCR0B USED TO SELECT THE TIMER CLOCK/1024
    while((TIFR0 & (1<<TOV0)) == 0); // Changed TIFR to TIFR0
    //STOP THE TIMER
    TCCR0B = 0x00;   // Changed TCCR0 to TCCR0B
    TIFR0 = 1<<TOV0; // Changed TIFR to TIFR0
}