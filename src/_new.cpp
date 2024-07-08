//
// Created by os on 7/8/24.
//

//#include "../lib/mem.h"
#include "../h/MemoryAllocator.hpp"

void *operator new(size_t n)
{
    return MemoryAllocator::getInstance().mem_alloc(n);
}

void *operator new[](size_t n)
{
    return MemoryAllocator::getInstance().mem_alloc(n);
}

void operator delete(void *p) noexcept
{
    MemoryAllocator::getInstance().mem_free(p);
}

void operator delete[](void *p) noexcept
{
    MemoryAllocator::getInstance().mem_free(p);
}