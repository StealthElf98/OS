//
// Created by os on 7/4/24.
//

#ifndef OS_TCB_HPP
#define OS_TCB_HPP

#include "../lib/hw.h"
#include "Scheduler.hpp"
#include "syscall_cpp.hpp"
#include "_sem.hpp"

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
    void joinAll();
    void setParent(TCB* p);
    void incChildCount();
    void decChildCount();
    ~TCB(){delete[] stack; delete joinAllSem;}
    TCB(Body body, void* args);
    _sem* joinAllSem;
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
    int childCount;
    TCB* parent;
    static uint64 constexpr STACK_SIZE = 1024;
    static void contextSwitch(Context* oldContext, Context* runningContext);
};

#endif //OS_TCB_HPP
