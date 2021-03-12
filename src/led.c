#include "led.h"

#include <stdint.h>
#include <stdbool.h>
#include "system.h"
#include "het.h"

void led_turn_on(void)
{
  //GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_2, 1);
  gioSetBit(hetPORT1, 1, 1);
}

void led_turn_off(void)
{
  //GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_2, 0);
  gioSetBit(hetPORT1, 1, 0);
}
