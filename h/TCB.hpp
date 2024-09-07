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
    static bool readyToPrintA;
    static bool readyToPrintB;
    static bool readyToPrintC;
    static int timeSliceCounter;

    static void join(TCB* handle);
    void releaseAll();
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
    static int getThreadId() { return running->threadId; }
    ~TCB(){delete[] stack;}
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
    int threadId;
    List joined;
    static uint64 constexpr STACK_SIZE = 1024;
    static int id;
    static void contextSwitch(Context* oldContext, Context* runningContext);
};

#endif //OS_TCB_HPP
