//
// Created by os on 5/13/24.
//

#ifndef PROJEKAT_SYSCALL_CPP_HPP
#define PROJEKAT_SYSCALL_CPP_HPP

#include "../lib/hw.h"
#include "syscall_c.hpp"
#include "_sem.hpp"

void* operator new (size_t n);
void operator delete (void* ptr) noexcept;
void *operator new[] (size_t n);
void operator delete[] (void* p) noexcept;

typedef TCB* thread_t;

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

typedef _sem* sem_t;

class Semaphore {
public:
    Semaphore (unsigned init = 1);
    virtual ~Semaphore ();
    int wait();
    int signal();
    int tryWait();
private:
    sem_t handle;
};

class Console {
public:
    static char getc ();
    static void putc (char c);
};


#endif //PROJEKAT_SYSCALL_CPP_HPP
