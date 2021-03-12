#include "unity.h"
#include "led.h"
#include "mock_gio.h"
#include "system.h"
#include "het.h"



void test_when_the_led_is_turned_on_then_port_f_pin_2_is_set(void)
{
    // Expect PORTF pin 2 to be set.
    gioSetBit_Expect(hetPORT1, 1, 1);

    // Call the function under test.
    led_turn_on();
}

void test_when_the_led_is_turned_off_then_port_f_pin_2_is_set(void)
{
    // Expect PORTF pin 2 to be set.
    gioSetBit_Expect(hetPORT1, 1, 0);

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
