
#include <avr/io.h>


void send(unsigned char data);
int main(){

    //init the ucsrb for recieve and send
    UCSRB = (1<<RXEN) | (1<<TXEN);  

    //init the UCSRC 8 bit config z:011 and URSEL = 1
    UCSRC = (1<<URSEL) | (1<<UCSZ1) | (1<<UCSZ0);

    //9600 baudrate
    UBRRL = 0X33

    unsigned  char ch;

    while(1){
        while(!(UCSRA & (1<<RXC))); //wait till rxc of ucsra is 1
        ch = UDR; //recieve data
        if(ch >= 'a' && ch <= 'z'){
            ch = ch - 32; //for capitalization
            //A= 65, a = 97, A-a = 32
            send(ch);

        }
      
    }
}


void send(unsigned char data){
    while(!(UCSRA & (1<<UDRE))); //wait till udr is empty
    UDR = data; //send data
    return;
}