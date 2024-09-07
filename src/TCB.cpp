//
// Created by os on 7/4/24.
//

#include "../h/TCB.hpp"
#include "../h/Riscv.hpp"
#include "../test/printing.hpp"

TCB* TCB::running = nullptr;
bool TCB::readyToPrintA = false;
bool TCB::readyToPrintB = false;
bool TCB::readyToPrintC = false;
int TCB::timeSliceCounter = 0;
int TCB::id = 0;

TCB::TCB(TCB::Body body, void* args) {
    this->body = body;
    this->args = args;
    stack = (body != nullptr) ? new uint64[STACK_SIZE] : nullptr;
    context = {(uint64) &wrapper, stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0};
    finished = false;
    blocked = false;
    threadId = id++;
}

void TCB::dispatch() {
    TCB* old = running;
    if (!old->isFinished() && !old->isBlocked())
        Scheduler::put(old);

    running = Scheduler::get();

    TCB::contextSwitch(&old->context, &running->context);
}

void TCB::yield() {
    __asm__ volatile ("mv a0, %0" : : "r"(0x13));
    __asm__ volatile ("ecall");
}

void TCB::join(TCB* handle) {
    if(!handle->isFinished()) {
        running->setBlocked(true);
        handle->joined.addLast(running);
    }
}

void TCB::releaseAll() {
    while(this->joined.peekFirst()) {
        TCB* tcb = this->joined.removeFirst();
        tcb->setBlocked(false);
        Scheduler::put(tcb);
    }
}

TCB* TCB::createThread(Body body, void* args) {
    TCB* tHandle = new TCB(body, args);
    Scheduler::put(tHandle);
    return tHandle;
}

void TCB::wrapper() {
    Riscv::popSppSpie();
    running->body(running->args);
    running->setFinished(true);
    running->releaseAll();
    Thread::startFromQueue();
    thread_dispatch();
}