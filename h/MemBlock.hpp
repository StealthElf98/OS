//
// Created by os on 5/8/24.
//

#ifndef PROJEKAT_MEMBLOCK_HPP
#define PROJEKAT_MEMBLOCK_HPP

#include "../lib/hw.h"

class MemBlock {
public:
    size_t size;
    MemBlock* next;

    MemBlock(size_t sz);
};

#endif //PROJEKAT_MEMBLOCK_HPP
