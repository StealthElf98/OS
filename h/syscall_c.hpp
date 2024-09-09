//
// Created by os on 5/13/24.
//

#ifndef PROJEKAT_SYSCALL_C_HPP
#define PROJEKAT_SYSCALL_C_HPP

#include "../lib/hw.h"
#include "TCB.hpp"
#include "_sem.hpp"

void* mem_alloc(size_t size);

int mem_free(void* p);

typedef TCB* thread_t;

int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg);

void thread_dispatch();

int thread_exit();

typedef _sem* sem_t;

int sem_open(sem_t* handle,unsigned init);

int sem_close(sem_t handle);

int sem_wait(sem_t id);

int sem_trywait(sem_t id);

int sem_signal(sem_t id);

void join_all();
//inline int getRetVal() {
//    uint64 val;
//    __asm__ volatile ("mv %0, a0" : "=r"(val));
//    return (int)val;
//}

char getc();

void putc(char c);

#endif //PROJEKAT_SYSCALL_C_HPP
