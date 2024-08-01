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
public:
    static TCB* get();
    static void put(TCB* tcb);
};

#endif //OS_SCHEDULER_HPP
