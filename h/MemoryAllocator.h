//
// Created by os on 4/3/24.
//

#ifndef PROJEKAT_OS_MEMORYALLOCATOR_H
#define PROJEKAT_OS_MEMORYALLOCATOR_H

#include "../h/MemBlock.h"

class MemoryAllocator {
private:
    MemBlock* usedBlocks;
    MemBlock* freeBlocks;

    MemoryAllocator();

public:
    static MemoryAllocator& getInstance();
    void* mem_alloc(size_t size);
    int mem_free(void* ptr);
};

#endif //PROJEKAT_OS_MEMORYALLOCATOR_H