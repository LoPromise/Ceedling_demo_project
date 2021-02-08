#include "unity.h"
#include "led.h"

//#include "mock_gpio.h"  // This will mock the functions in driverlib/gpio.h.
//#include "inc/hw_memmap.h"

void test_when_the_led_is_turned_on_then_port_f_pin_2_is_set(void)
{
    // Expect PORTF pin 2 to be set.
    //GPIOPinWrite_Expect(GPIO_PORTF_BASE, GPIO_PIN_2, GPIO_PIN_2);

    // Call the function under test.
    led_turn_on();
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
