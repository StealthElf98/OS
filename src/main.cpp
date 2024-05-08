//
// Created by os on 5/8/24.
//

#include "../h/MemoryAllocator.h"

int main() {
    MemoryAllocator& allocator = MemoryAllocator::getInstance();
    allocator.mem_alloc(100);

    return 0;
}