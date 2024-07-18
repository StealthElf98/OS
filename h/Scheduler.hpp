//
// Created by os on 7/1/24.
//

#ifndef OS_SCHEDULER_HPP
#define OS_SCHEDULER_HPP

#include "../utils/list.hpp"

class TCB;

class Scheduler
{
private:
    static List<TCB> readyThreadQueue;
    Scheduler();
public:
    Scheduler(const Scheduler&) = delete;
    Scheduler& operator=(const Scheduler&) = delete;

    static Scheduler& getInstance();

    TCB* get();
    void put(TCB* tcb);
};

#endif //OS_SCHEDULER_HPP
