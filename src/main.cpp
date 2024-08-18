//
// Created by os on 5/8/24.
//

#include "../h/MemoryAllocator.hpp"
#include "../h/Riscv.hpp"
#include "../lib/console.h"
#include "../h/syscall_c.h"
#include "../h/TCB.hpp"
#include "../utils/printing.hpp"
#include "../utils/workers.hpp"

void main() {
    TCB *threads[5];

    Riscv::w_stvec((uint64) &Riscv::interruptVectorTable + 1);
//    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    TCB *pcb = new TCB(nullptr, nullptr);
    TCB::running = pcb;
    threads[0] = TCB::createThread(workerBodyA,nullptr);
    threads[1] = TCB::createThread(workerBodyB,nullptr);

    while(!pcb->isFinished()) {
        thread_dispatch();
    }

    threads[0]->setFinished(true);
    printString("Vratio se u main\n");
}
