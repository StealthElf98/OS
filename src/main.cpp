//
// Created by os on 5/8/24.
//

#include "../h/MemoryAllocator.hpp"
#include "../lib/console.h"
#include "../h/Riscv.hpp"

int main() {
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    MemoryAllocator& allocator = MemoryAllocator::getInstance();
    allocator.mem_alloc(100);


    return 0;
}