//
// Created by os on 7/4/24.
//

#include "../h/TCB.hpp"
#include "../h/Riscv.hpp"
#include "../test/printing.hpp"

TCB* TCB::running = nullptr;

TCB::TCB(TCB::Body body, void* args) {
    this->body = body;
    this->args = args;
    stack = (body != nullptr) ? new uint64[STACK_SIZE] : nullptr;
    context = {(uint64) &wrapper, stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0};
    finished = false;
    blocked = false;

    message = nullptr;
    yesMessage = new _sem(1);
    noMessage = new _sem(0);
}

TCB::~TCB() {
    delete[] stack;
    delete yesMessage;
    delete noMessage;
}

char* TCB::receive() {
    TCB::running->noMessage->wait();
    char* m = message;
    TCB::running->message = nullptr;
    TCB::running->yesMessage->signal();
    return (char*)m;
}

void TCB::send(TCB* handle, char* message) {
    handle->yesMessage->wait();
    handle->putMessage(message);
    handle->noMessage->signal();
}

bool TCB::hasMessage() {
    return message != nullptr;
}

void TCB::putMessage(char* m) {
    message = m;
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

TCB* TCB::createThread(Body body, void* args) {
    TCB* tHandle = new TCB(body, args);
    Scheduler::put(tHandle);
    return tHandle;
}

void TCB::wrapper() {
    Riscv::popSppSpie();
    running->body(running->args);
    running->setFinished(true);
    thread_dispatch();
}