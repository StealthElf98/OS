//
// Created by os on 4/3/24.
//

#ifndef PROJEKAT_OS_MEMORYALLOCATOR_H
#define PROJEKAT_OS_MEMORYALLOCATOR_H

#include "../h/MemBlock.hpp"

class MemoryAllocator {
private:
    MemoryAllocator();
    void mergeFreeBlocks(MemBlock* blk);
    void setupMemoryAllocator();
    void insertIntoUsedBlocks(MemBlock* blk);
public:
    MemBlock* usedBlocks;
    MemBlock* freeBlocks;
    MemoryAllocator(const MemoryAllocator&) = delete;
    MemoryAllocator& operator=(const MemoryAllocator&) = delete;
    static MemoryAllocator& getInstance();
    void* mem_alloc(size_t size);
    int mem_free(void* ptr);
};

#endif //PROJEKAT_OS_MEMORYALLOCATOR_H