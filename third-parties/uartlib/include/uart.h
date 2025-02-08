#ifndef UART_H
#define UART_H

#define MY_INLINE inline __attribute__((always_inline))

#if defined(__AVR_ATmega328P__)
    #include "uart_avr.h"
#elif defined(STM32)
    #include "uart_stm32.h"
#endif

#endif /* UART_H */