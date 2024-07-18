//
// Created by os on 7/4/24.
//

#ifndef OS_TCB_HPP
#define OS_TCB_HPP

#include "../lib/hw.h"
#include "../h/Scheduler.hpp"

using Body = void (*)(void*);

class TCB {
private:
    TCB(Body body, void* args) :
            body(body),
            args(args),
            stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
            context({(uint64) &body,
                     stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0
                    }),
            finished(false),
            blocked(false)
    {
        if (body != nullptr) { Scheduler::getInstance().put(this); }
    }

    struct Context {
        uint64 ra;
        uint64 sp;
    };

    Body body;
    void* args;
    uint64* stack;
    Context context;
    bool finished;
    bool blocked;
    static uint64 constexpr STACK_SIZE = 1024;
    static void contextSwitch(Context* oldContext, Context* runningContext);
public:
    bool isBlocked() const { return blocked; }
    bool isFinished() const { return finished; }
    void setFinished(bool finished) { TCB::finished = finished; }
    static TCB* createThread(Body body, void* arg);
    static void dispatch();
    void threadWrapper();
    static void yield();
    static TCB* running;
};

#endif //OS_TCB_HPP
