//
// Created by os on 5/13/24.
//

#ifndef PROJEKAT_SYSCALL_CPP_HPP
#define PROJEKAT_SYSCALL_CPP_HPP

#include "../lib/hw.h"
#include "syscall_c.hpp"

typedef TCB* thread_t;

void* operator new (size_t n);

void operator delete (void* ptr) noexcept;

class Thread {
public:
    int start();
    virtual ~Thread();
    static void dispatch();
    Thread(void (*body)(void*), void* arg);
protected:
    Thread();
    virtual void run() {};
private:
    void* arg;
    thread_t handle;
    void (*body)(void* );
    static void wrapper(void* t);
};

class Semaphore {
public:
//    Semaphore(int val = 1);
//    virtual ~Semaphore();
//    int wait();
//    int tryWait();
//    int signal();
//private:
//    sem_t myHandle;
};

#endif //PROJEKAT_SYSCALL_CPP_HPP
