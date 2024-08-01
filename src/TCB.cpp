//
// Created by os on 7/4/24.
//

#include "../h/TCB.hpp"
#include "../h/Riscv.hpp"

TCB* TCB::running = nullptr;

void TCB::dispatch() {
    TCB *old = running;
    if (!old->isFinished() && !old->isBlocked()) { Scheduler::put(old); }
    running = Scheduler::get();

    if (old != running) {
        TCB::contextSwitch(&old->context, &running->context);
    }
}

void TCB::yield() {
    __asm__ volatile ("mv a0, %0" : : "r"(0x13));
    __asm__ volatile ("ecall");
}

TCB* TCB::createThread(TCB** tHandle, Body body, void* args) {
    *tHandle = new TCB(body, args);
    return *tHandle;
}

void TCB::threadWrapper() {
    Riscv::popSppSpie();
    running->body(running->args);
    running->setFinished(true);
//    thread_dispatch();
}