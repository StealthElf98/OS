//
// Created by os on 5/13/24.
//

#ifndef PROJEKAT_SYSCALL_C_HPP
#define PROJEKAT_SYSCALL_C_HPP

#include "../lib/hw.h"
class _thread;
typedef _thread* thread_t;

void* mem_alloc(size_t size);

int mem_free(void* p);

int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg);

void thread_dispatch();
#endif //PROJEKAT_SYSCALL_C_HPP
