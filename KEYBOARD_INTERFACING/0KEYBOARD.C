
#include<avr/io.h>

int main(){
    unsigned char x;
    //A:0-3 AS OUTPUT, A:4-7 AS INPUT
    DDRA = 0X0F; 
    LCD_init();
    while(1){
        PORTA = 0XF0; //MAKE COLUMS HIGH
        IF(PINA != OXF0){ //short circuit
            x = keypad();
            lcd_data(x);
        }
        
    }
return 0;
}

unsigned char keypad(){
    PORTA =~(1<<0); // set pa0 = 0
    if(PINA & (1<<4) ==0) //IF PA4 =0 FIRST COLUMN IS PRESSED
       {
        delay(100);
         return '7';
       }else if(PINA & (1<<5) ==0) //IF PA5 =0 SECOND COLUMN IS PRESSED
       {
        delay(100);
         return '8';
         }else if(PINA & (1<<6) ==0) //IF PA6 =0 THIRD COLUMN IS PRESSED
         {
        delay(100);
            return '9';
            }else if(PINA & (1<<7) ==0) //IF PA7 =0 FOURTH COLUMN IS PRESSED
            {
        delay(100);
                return '➗';
                }

    PORTA =~(1<<1); //put 1 on second row

    if(PINA & (1<<4) ==0) //IF PA4 =0 FIRST COLUMN IS PRESSED
       {
        delay(100);
         return '4';
       }else if(PINA & (1<<5) ==0) //IF PA5 =0 SECOND COLUMN IS PRESSED
       {
        delay(100);
         return '5';
         }else if(PINA & (1<<6) ==0) //IF PA6 =0 THIRD COLUMN IS PRESSED
         {
        delay(100);
            return '6';
            }else if(PINA & (1<<7) ==0) //IF PA7 =0 FOURTH COLUMN IS PRESSED
            {
        delay(100);
                return '✖️';
                }


    PORTA =~(1<<2); //put 1 on third row

    if(PINA & (1<<4)==0)
         {
          delay(100);
            return '1';
         }else if(PINA & (1<<5)==0)
         {
          delay(100);
            return '2';
            }else if(PINA & (1<<6)==0)
            {
          delay(100);
                return '3';
                }else if(PINA & (1<<7)==0)
                {
          delay(100);
                 return '-';
                 }

    PORTA =~(1<<3); //put 1 on fourth row

    if(PINA & (1<<4)==0)
         {
          delay(100);
            return 'C';
         }else if(PINA & (1<<5)==0)
         {
          delay(100);
            return '0';
            }else if(PINA & (1<<6)==0)
            {
          delay(100);
                return '=';
                }else if(PINA & (1<<7)==0)
                {
          delay(100);
                 return '+';
                 }




}