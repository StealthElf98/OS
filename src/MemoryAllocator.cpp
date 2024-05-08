//
// Created by os on 4/3/24.
//

#include "../h/MemoryAllocator.h"

MemoryAllocator::MemoryAllocator() : usedBlocks(nullptr), freeBlocks(nullptr) {}

MemoryAllocator& MemoryAllocator::getInstance() {
    static MemoryAllocator instance;
    instance.freeBlocks = (MemBlock*)((char*)HEAP_START_ADDR);
    instance.freeBlocks->size = ((char*)HEAP_START_ADDR - (char*)HEAP_END_ADDR - sizeof(MemBlock));
    return instance;
}

void* MemoryAllocator::mem_alloc(size_t size) {
    if(size <= 0) return nullptr;
    size = (size%MEM_BLOCK_SIZE == 0 ? size : ((size + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE);

    MemBlock* currBlock = freeBlocks;
    MemBlock* prevBlock = nullptr;

    return nullptr; // No suitable block found
}

int MemoryAllocator::mem_free(void* ptr) {
    if(ptr == nullptr) return -1;
    if(ptr > HEAP_END_ADDR || ptr < HEAP_START_ADDR) return -2;

    MemBlock* currentBlock = usedBlocks;
    MemBlock* prevBlock = nullptr;

    // Find the block in the used list
    while (currentBlock && static_cast<void*>(currentBlock) != ptr) {
        prevBlock = currentBlock;
        currentBlock = currentBlock->next;
    }

    if (currentBlock) {
        //Removing block from used blocks list
        if (prevBlock)
            prevBlock->next = currentBlock->next;
        else
            usedBlocks = currentBlock->next;

        currentBlock->next = nullptr;

        //Adding block to free blocks list
        if(freeBlocks == nullptr) {
            freeBlocks = currentBlock;
        } else if((char*)currentBlock < (char*)freeBlocks) {
            currentBlock->next = freeBlocks;
            freeBlocks = currentBlock;
        } else {
            MemBlock* currFree;
            for(currFree = freeBlocks; currFree->next && (char*)(currFree->next) < (char*) currentBlock; currFree = currFree->next);

            currentBlock->next = currFree->next;
            currFree->next = currentBlock;
        }

        return 0; // Great Success
    }

    return -3; // Block not found or already free
}

void MemoryAllocator::mergeFreeBlocks(MemBlock* blk) {

}