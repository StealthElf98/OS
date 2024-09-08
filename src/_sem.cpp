//
// Created by os on 8/15/24.
//

#include "../h/_sem.hpp"
#include "../h/TCB.hpp"
#include "../test/printing.hpp"

_sem::_sem(int val): value(val), ok(true), priority(false) {}

_sem::_sem(): value(1), ok(true) {}

_sem::~_sem() {
    if(ok)
        close();
}

int _sem::close() {
    if (!ok){
        return -1; // Semaphore is not open or some other error
    }
    ok = false;
    TCB* temp;
    if(priority) {
        while(waitingQueue.peekFirstWithPriority() != nullptr) {
            temp = waitingQueue.removeFirstWithPriority();
            temp->setBlocked(false);
            Scheduler::put(temp);
        }
    } else {
        while(waitingQueue.peekFirst() != nullptr) {
            temp = waitingQueue.removeFirst();
            temp->setBlocked(false);
            Scheduler::put(temp);
        }
    }


    return 0;
}

int _sem::wait() {
    if (!ok)
        return -1; // Semaphore is not open or some other error

    if (--value < 0) {
        // The semaphore is locked, add the thread to the waiting queue
        printInt(TCB::running->getId());
        TCB::running->setBlocked(true);
        waitingQueue.addLast(TCB::running);
        thread_dispatch();
    }
    return 0;
}

int _sem::tryWait() {
    if (!ok)
        return -1; // Semaphore is not open or some other error

    else if (value <= 0) {
        return 1;
    } else {
        value--;
        return 0;
    }
}

int _sem::signal() {
    if (!ok)
        return -1; // Semaphore is not open or some other error

    if(++value <= 0 && waitingQueue.peekFirst() != nullptr) { // maybe check if there is any blocked threads first
        TCB* readyThread;
        if(priority) {
            readyThread = waitingQueue.removeFirstWithPriority();
        }
        else
            readyThread = waitingQueue.removeFirst();

        readyThread->setBlocked(false);
        Scheduler::put(readyThread);
    }
    return 0;
}
