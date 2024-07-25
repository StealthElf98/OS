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

char digits[] = "0123456789ABCDEF";

void printInteger(int xx, int base, int sgn)
{
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    }

    i = 0;
    do{
        buf[i++] = digits[x % base];
    }while((x /= base) != 0);
    if(neg)
        buf[i++] = '-';

    while(--i >= 0)
        __putc(buf[i]);
}
