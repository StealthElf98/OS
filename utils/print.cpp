//
// Created by os on 7/1/24.
//

#include "print.hpp"
#include "../lib/console.h"

void printString(char const *string)
{
    while (*string != '\0')
    {
        __putc(*string);
        string++;
    }
}

int stringToInt(const char* s) {
    int n;

    n = 0;
    while ('0' <= *s && *s <= '9')
        n = n * 10 + *s++ - '0';
    return n;
}

void printInteger(uint64 integer)
{
    static char digits[] = "0123456789ABCDEF";
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(integer < 0){
        neg = 1;
        x = -integer;
    } else {
        x = integer;
    }

    i = 0;
    do {
        buf[i++] = digits[x % 10];
    } while((x /= 10) != 0);

    if(neg)
        buf[i++] = '-';

    while(--i >= 0)
        __putc(buf[i]);
}
