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
    Riscv::w_stvec((uint64) &Riscv::interruptVectorTable + 1);

    static TCB* thread[10];
    thread[0] = TCB::createThread(workerBodyA, nullptr);
    thread[1] = TCB::createThread(workerBodyB, nullptr);
    TCB::running = Scheduler::get();

    while(!thread[0]->isFinished() && !thread[1]->isFinished()) {
        TCB::yield();
    }
    printString("Finished");
}
