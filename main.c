#include <stdio.h>
#include "uart.h"

int main() {
   // printf() displays the string inside quotation
   printf("Hello, World!");
   printf("init called! %d", uart_init());
   return 0;
}
