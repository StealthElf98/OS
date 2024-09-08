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

int Thread::currentlyRunning = 0;
ThreadList Thread::waitingThreads;
int Thread::maxRunning = 0;

Thread::Thread(void (*body)(void *), void *arg) {
    thread_create(&handle, body, arg);
    Scheduler::removeDoubleThread();
}

Thread::Thread(): Thread(wrapper, this) {}

Thread::~Thread() {
    thread_exit();
    delete (thread_t) handle;
}

void Thread::wrapper(void* t) {
    ((Thread*)t)->run();
}

int Thread::start() {
//    thread_create(&handle, body, arg);
    if(currentlyRunning >= maxRunning) {
        waitingThreads.addLast(this);
    } else {
        Scheduler::put((TCB*) handle);
        currentlyRunning++;
    }
    return 0;
}

void Thread::startFromQueue() {
    if(waitingThreads.peekFirst()) {
        Thread* temp = waitingThreads.removeFirst();
        Scheduler::put(temp->handle);
    } else {
        currentlyRunning--;
    }
}

void Thread::dispatch() {
    thread_dispatch();
}

void Thread::join() {
    thread_join(handle);
}

int Thread::getThreadId() {
    return thread_get_id();
}

void Thread::SetMaximumThreads(int num_of_threads) {
    maxRunning = num_of_threads;
}

void Thread::setRunning(Thread* thread) {
    TCB::running = thread->handle;
}

void Thread::pingThread() {
    ping(handle);
}

bool Thread::isPinged() {
    return handle->pinged;
}

int Thread::numOfAllocatedBlocks() {
    return handle->getAllocatedBlocks();
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