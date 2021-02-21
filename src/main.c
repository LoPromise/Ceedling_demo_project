#include "led.h"
#include <FreeRTOS.h>

void delay(void);

int main(void){
 while(1)
 {
  led_turn_on();
  delay();
  led_turn_off();
  delay();
 }
}

void delay(void)
{
    volatile int count;

    for(count = 0; count < 400000; count++)
    {
    }
}
