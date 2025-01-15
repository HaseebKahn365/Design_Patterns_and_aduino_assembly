
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

