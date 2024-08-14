//
// Created by os on 5/13/24.
//

#ifndef PROJEKAT_SYSCALL_C_HPP
#define PROJEKAT_SYSCALL_C_HPP

#include "../lib/hw.h"
#include "TCB.hpp"

void* mem_alloc(size_t size);

int mem_free(void* p);

typedef TCB* thread_t;

int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg);

void thread_dispatch();

int thread_exit();
#endif //PROJEKAT_SYSCALL_C_HPP
