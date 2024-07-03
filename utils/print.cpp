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

void printInteger(uint64 integer)
{

}