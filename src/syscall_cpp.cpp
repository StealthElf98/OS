//
// Created by os on 5/13/24.
//
#include "../h/syscall_cpp.hpp"
#include "../test/printing.hpp"

void* operator new (size_t n) {
    return mem_alloc(n);
}

void operator delete (void* ptr) noexcept {
    mem_free(ptr);
}

void* operator new[] (size_t n) {
    return mem_alloc(n);
}

void operator delete[] (void* p) noexcept {
    mem_free(p);
}

Thread::Thread(void (*body)(void *), void *arg) {
    thread_create(&handle, body, arg);
    parent = nullptr;
    Scheduler::removeDoubleThread();
}

Thread::Thread(): Thread(wrapper, this) {}

Thread::~Thread() {
    thread_exit();
    delete (thread_t) handle;
}

void Thread::setParent(Thread* p) {
    parent = p;
    handle->setParent(p->handle);
}

void Thread::wrapper(void* t) {
    ((Thread*)t)->run();
}

int Thread::start() {
//    thread_create(&handle, body, arg);
    Scheduler::put((TCB*) handle); // proveriti da l' je ok
    return 0;
}

void Thread::dispatch() {
    thread_dispatch();
}

void Thread::joinAll() {
    join_all();
}

Semaphore::Semaphore(unsigned int init) {
    sem_open(&handle, init);
}

Semaphore::~Semaphore() {
    sem_close(handle);
    delete handle;
}

int Semaphore::wait() {
    return sem_wait(handle);;
}

int Semaphore::tryWait() {
    return sem_trywait(handle);
}

int Semaphore::signal() {
    return sem_signal(handle);
}

char Console::getc () {
    return ::getc();
}

void Console::putc (char c) {
    ::putc(c);
}