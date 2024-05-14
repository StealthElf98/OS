//
// Created by os on 4/3/24.
//

#include "../h/MemoryAllocator.hpp"

MemoryAllocator::MemoryAllocator() : usedBlocks(nullptr), freeBlocks(nullptr) {
    setupMemoryAllocator();
}

MemoryAllocator& MemoryAllocator::getInstance() {
    static MemoryAllocator instance;
    return instance;
}

void* MemoryAllocator::mem_alloc(size_t size) {
    if(size <= 0) return nullptr;
    size = (size%MEM_BLOCK_SIZE == 0 ? size : ((size + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE);

    MemBlock* currBlock = freeBlocks;
    MemBlock* prevBlock = nullptr;

    for(; currBlock != nullptr; currBlock=currBlock->next) {
        if(currBlock->size > size) {
            MemBlock* blk = (MemBlock*)((char*)currBlock + size + sizeof(MemBlock));

            if(prevBlock)
                prevBlock->next = blk;

            blk->next = currBlock->next;
            blk->size = currBlock->size - size - sizeof(MemBlock);

            currBlock->size -= size;

            insertIntoUsedBlocks(currBlock);

            return (char*)currBlock + sizeof(MemBlock);
        } else if(currBlock->size == size) {
            if(prevBlock)
                prevBlock->next = currBlock->next;

            insertIntoUsedBlocks(currBlock);

            return (char*)currBlock + sizeof(MemBlock);
        }
        prevBlock = currBlock;
    }

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
            mergeFreeBlocks(currentBlock);
        } else {
            MemBlock* currFree;
            for(currFree = freeBlocks; currFree->next && (char*)(currFree->next) < (char*) currentBlock; currFree = currFree->next);

            currentBlock->next = currFree->next;
            currFree->next = currentBlock;

            mergeFreeBlocks(currentBlock);
            mergeFreeBlocks(prevBlock);
        }
        return 0; // Great Success
    }

    return -3; // Block not found or already free
}

void MemoryAllocator::insertIntoUsedBlocks(MemBlock* currBlock) {
    if(usedBlocks == nullptr) {
        usedBlocks = currBlock;
        currBlock->next = nullptr;
    } else if((char*)currBlock < (char*)usedBlocks) {
        currBlock->next = usedBlocks;
        usedBlocks = currBlock;
    } else {
        MemBlock* temp;
        for(temp = usedBlocks; temp->next && (char*)temp->next < (char*)currBlock; temp=temp->next);

        currBlock->next = temp->next;
        temp->next = currBlock;
    }
}

void MemoryAllocator::setupMemoryAllocator() {
    MemBlock* newBlock = (MemBlock*)((char*)HEAP_START_ADDR);
    newBlock->size = ((char*)HEAP_START_ADDR - (char*)HEAP_END_ADDR - sizeof(MemBlock));

    newBlock->next = nullptr;
    freeBlocks = newBlock;
}

void MemoryAllocator::mergeFreeBlocks(MemBlock* blk) {
    if(blk != nullptr && blk->next != nullptr && (char*)blk + blk->size + sizeof(MemBlock) == (char*)blk->next) {
        blk->size += blk->next->size;
        blk->next = blk->next->next;
    }
}