#include <stdio.h>
#include "uart.h"

int main() {
   // printf() displays the string inside quotation
   printf("Hello, World!");
   uart_init();
   printf("init called!");
   return 0;
}
