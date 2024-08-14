//
// Created by os on 7/1/24.
//
#include "../h/Scheduler.hpp"

List Scheduler::readyThreadQueue;

TCB* Scheduler::get()
{
    return Scheduler::readyThreadQueue.removeFirst();
}

void Scheduler::put(TCB* tcb)
{
    Scheduler::readyThreadQueue.addLast(tcb);
}