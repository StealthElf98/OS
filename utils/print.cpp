//
// Created by os on 7/1/24.
//

#include "print.hpp"

void printString(char const *string)
{
    while (*string != '\0')
    {
        __putc(*string);
        string++;
    }
}

void printInteger(uint64 integer)
{
    statuc char buf[16] = "0123456789ABCDEF";
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
    do{
        buf[i++] = digits[x % base];
    }while((x /= 10) != 0);
    if(neg)
        buf[i++] = '-';

    while(--i >= 0)
        __putc(buf[i]);
}