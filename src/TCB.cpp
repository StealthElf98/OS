//
// Created by os on 7/4/24.
//

#include "../h/TCB.hpp"
#include "../h/Riscv.hpp"

TCB* TCB::running = nullptr;

TCB::TCB(TCB::Body body, void *args) : body(body), args(args), stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
        context({(uint64) &body,stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0}), finished(false), blocked(false)
{
    if (body != nullptr) { Scheduler::put(this); }
}

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
    Scheduler::put(*tHandle);
    return *tHandle;
}

void TCB::threadWrapper() {
    Riscv::popSppSpie();
    running->body(running->args);
    running->setFinished(true);
//    thread_dispatch();
}