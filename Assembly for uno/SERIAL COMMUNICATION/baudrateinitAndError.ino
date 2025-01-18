

#include<avr/io.h>
//for 9600 baudrate
void initUBRR(){
    UBRR0H = 0;
    unsigned int ubrr = (8000000/16*9600)-1;
    UBRR0L = ubrr;
    UCSR0B = (1<<TXEN0) | (1<<RXEN0);
    UCSR0C = (1<<UCSZ01) | (1<<UCSZ00); // for 8 bit data

    //total error in baudrate [crystal f = 8MHz]
    float error = ((8*1000000)/(16*(ubrr+1)))-9600;
}

