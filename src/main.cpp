//
// Created by os on 5/8/24.
//

#include "../h/MemoryAllocator.hpp"
#include "../h/Riscv.hpp"
#include "../lib/console.h"

void main() {
    __putc('M');
    __putc('a');
    __putc('i');
    __putc('n');
    __putc('\n');
//    Riscv::w_stvec((uint64) &Riscv::interruptVectorTable);
    __putc('1');
//    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    __putc('2');

    MemoryAllocator& allocator = MemoryAllocator::getInstance();

    allocator.mem_alloc(64);
//    allocator.mem_alloc(128);
    char* to_dealloc = (char*)allocator.mem_alloc(100);
    allocator.mem_free(to_dealloc);
    allocator.mem_alloc(28);
    allocator.mem_alloc(512);
}