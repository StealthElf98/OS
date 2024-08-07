//
// Created by os on 5/8/24.
//

#include "../h/MemoryAllocator.hpp"
#include "../h/Riscv.hpp"
#include "../lib/console.h"
#include "../h/syscall_c.hpp"
#include "../h/TCB.hpp"
#include "../utils/print.hpp"
#include "../utils/workers.hpp"

void main() {
    Riscv::w_stvec((uint64) &Riscv::interruptVectorTable);
//    char* allocated = (char*)mem_alloc(0x10);
//    char* allocated2 = (char*)mem_alloc(0x79);
//    char* allocated3 = (char*)mem_alloc(0x70);
//    mem_free(allocated2);
//    mem_free(allocated);
//    mem_free(allocated3);

    static TCB* thread[10];

    TCB::createThread(&thread[0],nullptr, nullptr);
    printString("Thread 0 created");
    TCB::createThread(&thread[1], nullptr, nullptr);
    printString("Thread 1 created");
    TCB::running = thread[0];
//    thread[1] = TCB::createThread(nullptr, nullptr, nullptr);

    while(!thread[0]->isFinished() && !thread[1]->isFinished()) {
        TCB::yield();
    }

    printString("Finished");
}
