//
// Created by os on 5/13/24.
//
#include "../h/syscall_c.hpp"

enum OPERATIONS {
    ALLOC = 0x01, DEALLOC = 0x02, T_CREATE = 0x11, T_EXIT = 0x12, T_DISPATCH = 0x13,
    SEM_OPEN = 0x21, SEM_CLOSE = 0x22, SEM_WAIT = 0x23, SEM_SIGNAL = 0x24,
    SEM_TIMED = 0x25, SEM_TRY = 0x26, T_SLEEP = 0x31, GETC = 0x41, PUTC = 0x42
};

void* mem_alloc(size_t size){
    size = (size%MEM_BLOCK_SIZE == 0) ? size : ((size + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE) * MEM_BLOCK_SIZE;

    __asm__ volatile ("mv a1, %0" : : "r"(size));
    __asm__ volatile ("mv a0, %0": : "r"(ALLOC));
    __asm__ volatile ("ecall");

    void* val;
    __asm__ volatile ("mv %0, a0" : "=r"(val));
    return val;
}

int mem_free(void* ptr){
    __asm__ volatile ("mv a1, %0" : : "r"(ptr));
    __asm__ volatile ("mv a0, %0": : "r"(DEALLOC));
    __asm__ volatile ("ecall");

    uint64 val;
    __asm__ volatile ("mv %0, a0" : "=r"(val));
    return (int)val;
}
