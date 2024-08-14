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
    TCB* mainT = TCB::createThread(nullptr, nullptr);
    thread[0] = TCB::createThread(workerBodyA, nullptr);
    printString("Thread 0 created\n");
    thread[1] = TCB::createThread(workerBodyB, nullptr);
    printString("Thread 1 created\n");
    thread[2] = TCB::createThread(workerBodyB, nullptr);
    thread[3] = TCB::createThread(workerBodyA, nullptr);
    thread[4] = TCB::createThread(workerBodyB, nullptr);
    TCB::running = Scheduler::get();
//    thread[1] = TCB::createThread(nullptr, nullptr, nullptr);

    while(!thread[0]->isFinished() && !thread[1]->isFinished()) {
        TCB::yield();
    }
    printInteger(mainT->isFinished());
    printString("Finished");
}
