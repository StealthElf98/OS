//
// Created by os on 7/4/24.
//

#ifndef OS_TCB_HPP
#define OS_TCB_HPP

#include "../lib/hw.h"
#include "Scheduler.hpp"
#include "syscall_cpp.hpp"

class TCB {
public:
    using Body = void (*)(void*);
    bool isBlocked() const { return blocked; }
    bool isFinished() const { return finished; }
    void setFinished(bool finished) { TCB::finished = finished; }
    void setBlocked(bool blocked) {TCB::blocked = blocked; }
    static TCB* createThread(Body body, void* arg);
    static void dispatch();
    static void yield();
    static TCB* running;
    static void wrapper();
    ~TCB(){delete[] stack; delete canSendl; delete canReceive;}
    TCB(Body body, void* args);
private:

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
    _sem* canSend;
    _sem* canReceive;
    static uint64 constexpr STACK_SIZE = 1024;
    static void contextSwitch(Context* oldContext, Context* runningContext);
};

#endif //OS_TCB_HPP
