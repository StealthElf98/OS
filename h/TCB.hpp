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
    void incrementMemory(int increment) { this->allocatedBlocks+= increment; }
    void pingThread() { this->pinged = true; }
    void setPinged(bool value) { this->pinged = value; }
    int getAllocatedBlocks() const { return this->allocatedBlocks; }
    int getRunTime() const { return this->runTime; }
    void incrementTime() { this->runTime++; }
    static TCB* createThread(Body body, void* arg);
    static void dispatch();
    static void yield();
    static TCB* running;
    static void wrapper();
    bool pinged;
    static int getThreadId() { return running->threadId; }
    int getId() { return threadId; }
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
    int allocatedBlocks;
    int runTime;
    static uint64 constexpr STACK_SIZE = 1024;
    static int id;
    static void contextSwitch(Context* oldContext, Context* runningContext);
};

#endif //OS_TCB_HPP
