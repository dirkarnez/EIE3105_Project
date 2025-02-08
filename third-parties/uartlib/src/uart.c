#include <stdio.h>
#include "uart.h"

#if defined(__AVR_ATmega328P__)
    #include "uart_avr.h"
#elif defined(STM32)
    #include "uart_stm32.h"
#endif

void uart_init() {
    #if defined(__AVR_ATmega328P__)
        uart_init_avr();
    #elif defined(STM32)
        uart_init_stm32();
    #endif
}
