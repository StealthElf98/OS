//
// Created by os on 5/8/24.
//

#include "../h/MemoryAllocator.hpp"
#include "../h/Riscv.hpp"
#include "../lib/console.h"
#include "../h/syscall_c.hpp"
#include "../h/TCB.hpp"
#include "../test/printing.hpp"

extern void userMain();

void main() {
    Riscv::w_stvec((uint64) &Riscv::interruptVectorTable + 1);

    static TCB* pcb = new TCB(nullptr, nullptr);
    TCB::running = pcb;

    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    static TCB* mainThread;
    thread_create(&mainThread, (void (*)(void *)) (userMain), nullptr);

    __asm__ volatile ("mv a0, %0": : "r"(0x51));
    __asm__ volatile ("ecall");

    while (!mainThread->isFinished()) {
        thread_dispatch();
    }
    delete mainThread;
    delete pcb;

    printString("Back in main\n");
}
