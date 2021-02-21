#include "unity.h"
#include "led.h"

#define TEST
#include "mock_gpio.h"  // This will mock the functions in driverlib/gpio.h.
//#include "inc/hw_memmap.h"
#include <inc/msp432e411y.h>

void test_when_the_led_is_turned_on_then_port_f_pin_2_is_set(void)
{
    // Expect PORTF pin 2 to be set.
    GPIOPinWrite_Expect(GPIO_PORTF_BASE, GPIO_PIN_2, 1);

    // Call the function under test.
    led_turn_on();
}

void test_when_the_led_is_turned_off_then_port_f_pin_2_is_set(void)
{
    // Expect PORTF pin 2 to be set.
    GPIOPinWrite_Expect(GPIO_PORTF_BASE, GPIO_PIN_2, 0);

    // Call the function under test.
    led_turn_off();
}

void setUp(void)
{
}

void tearDown(void)
{
}

void test_module_generator_needs_to_be_implemented(void)
{
    TEST_IGNORE_MESSAGE("Implement me!");
}
