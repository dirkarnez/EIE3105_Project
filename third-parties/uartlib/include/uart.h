#ifndef UART_H
#define UART_H

#define MY_INLINE inline __attribute__((always_inline))

// static MY_INLINE void uart_init();

// #include "uart.h"

#if defined(__AVR_ATmega328P__)
    #include "uart_avr.h"
#elif defined(STM32)
    #include "uart_stm32.h"
#endif

static MY_INLINE int uart_init() {
    #if defined(__AVR_ATmega328P__)
        return uart_init_avr();
    #elif defined(STM32)
        return uart_init_stm32();
    #endif
}


#endif /* UART_H */
