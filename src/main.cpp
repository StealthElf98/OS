//
// Created by os on 5/8/24.
//

#include "../h/MemoryAllocator.hpp"
#include "../h/Riscv.hpp"
#include "../lib/console.h"
#include "../h/syscall_c.hpp"

void main() {
    Riscv::w_stvec((uint64) &Riscv::interruptVectorTable);
//    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
//    __asm__ volatile ("mv a1, %0" : : "r"(0x10));
//    __asm__ volatile ("mv a0, %0": : "r"(0x01));
//    __asm__ volatile ("ecall");

    char* allocated = (char*)mem_alloc(0x10);
    char* allocated2 = (char*)mem_alloc(0x79);
    mem_free(allocated);
    mem_free(allocated2);
//    MemoryAllocator& allocator = MemoryAllocator::getInstance();
//
//    allocator.mem_alloc(64);
//    char* to_dealloc = (char*)allocator.mem_alloc(100);
//    allocator.mem_free(to_dealloc);
//    allocator.mem_alloc(28);
}