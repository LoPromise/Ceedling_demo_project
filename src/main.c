#include "sys_common.h"
#include "led.h"

void main(void)
{
 while(1)
 {
  led_turn_on();
  //delay();
  led_turn_off();
  //delay();
 }
}

