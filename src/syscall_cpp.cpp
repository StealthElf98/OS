//
// Created by os on 5/13/24.
//
#include "../h/syscall_cpp.hpp"
#include "../h/syscall_c.hpp"
#include "../h/Scheduler.hpp"

void* operator new (size_t n) {
    return mem_alloc(n);
}

void operator delete (void* ptr) noexcept {
    mem_free(ptr);
}

void *operator new[] (size_t n) {
    return mem_alloc(n);
}

void operator delete[] (void* p) noexcept {
    mem_free(p);
}

//Thread::Thread(void (*body)(void *), void *arg) {
//    thread_create(&handle, body, arg);
//}
//
//int Thread::start() {
//    Scheduler::put((thread_t) handle); // proveriti da l je ok
//
//    return 0;
//}
//
//void Thread::dispatch() {
//    thread_dispatch();
//}