#include <avr/io.h>

extern "C" {
int main(void) {
    DDRC = 0xFF;    // Make C port as output
    DDRB &= ~(1<<PB0);    // Make PB0 as input, using proper bit manipulation
    
    TCCR0B = 0x06;  // Timer0 with external clock on falling edge
    
    while(1) {
        do {
            PORTC = TCNT0;
        } while((TIFR0 & (1<<TOV0)) == 0);

        // Reset the timer overflow flag
        TIFR0 = (1<<TOV0);
    }
    return 0;
}
}

void setup() {}
void loop() {}