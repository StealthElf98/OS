//
// Created by os on 7/4/24.
//

#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

TCB *TCB::running = nullptr;

void TCB::dispatch() {
    TCB *old = running;
    if (!old->isFinished() && !old->isBlocked()) { Scheduler::getInstance().put(old); }
    running = Scheduler::getInstance().get();

    if (old != running) {
        TCB::contextSwitch(&old->context, &running->context);
    }
}

TCB* TCB::createThread(Body body) {
    return new TCB(body);
}