//
// Created by os on 7/4/24.
//

#ifndef OS_TCB_HPP
#define OS_TCB_HPP

#include "../lib/hw.h"
#include "Scheduler.hpp"
#include "syscall_cpp.hpp"
#include "../h/_sem.hpp"

class TCB {
public:
    using Body = void (*)(void*);
    bool isBlocked() const { return blocked; }
    bool isFinished() const { return finished; }
    void setFinished(bool finished) { TCB::finished = finished; }
    void setBlocked(bool blocked) {TCB::blocked = blocked; }
    char* receive();
    void send(TCB* handle, char* message);
    bool hasMessage();
    void putMessage(char* m);
    static TCB* createThread(Body body, void* arg);
    static void dispatch();
    static void yield();
    static TCB* running;
    static void wrapper();
    ~TCB();
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
    _sem* yesMessage;
    _sem* noMessage;
    char* message;
    static uint64 constexpr STACK_SIZE = 1024;
    static void contextSwitch(Context* oldContext, Context* runningContext);
};

#endif //OS_TCB_HPP
