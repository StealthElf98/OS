//
// Created by os on 5/13/24.
//

#ifndef PROJEKAT_SYSCALL_CPP_HPP
#define PROJEKAT_SYSCALL_CPP_HPP

#include "../lib/hw.h"
#include "syscall_c.hpp"

//typedef TCB* thread_t;

void* operator new (size_t n);

void operator delete (void* ptr) noexcept;

class Thread {
//public:
//    Thread(void (*body)(void*), void* arg);
//    virtual ~Thread();
//    int start();
//    static void dispatch();
//protected:
//    Thread();
//    virtual void run() {}
//private:
//    thread_t handle;
//    void (*body)(void* );
//    void* arg;
};

class Semaphore {

};

#endif //PROJEKAT_SYSCALL_CPP_HPP
