//
// Created by os on 7/1/24.
//
#include "../h/Scheduler.hpp"

List<TCB> Scheduler::readyThreadQueue;

TCB* Scheduler::get()
{
    return readyThreadQueue.removeFirst();
}

void Scheduler::put(TCB* tcb)
{
    readyThreadQueue.addLast(tcb);
}
