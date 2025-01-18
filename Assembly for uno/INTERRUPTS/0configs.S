//timer0 overflow enable, and timer2 ocie2 enable

LDI r20, (1<<tov0) | (1<<ocie2)
out timsk r20

SEI //to enable global interrupt
CLI //to disable global interrupt


//following are configs for falling edge triggering in MCUCR FOR INT1
LDI R20, (1<<IS11)
OUT MCUCR, R20


//SAME CAN BE DONE FOR INT0
LDI R20, (1<<IS01)
OUT MCUCR, R20

//FOR INT2 WE HAVE TO USE MCUCSR
LDI R20, (1<<ISC2)
OUT MCUCSR, R20