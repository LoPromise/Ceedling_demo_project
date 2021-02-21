#include "led.h"

#include <stdint.h>
#include <stdbool.h>

#define TEST
#include <gpio.h>
#include <inc/msp432e411y.h>



void led_turn_on(void)
{
  GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_2, 1);
}

void led_turn_off(void)
{
  GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_2, 0);
}

