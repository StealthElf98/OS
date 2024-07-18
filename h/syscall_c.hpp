//
// Created by os on 5/13/24.
//

#ifndef PROJEKAT_SYSCALL_C_HPP
#define PROJEKAT_SYSCALL_C_HPP

#include "../lib/hw.h"

void* mem_alloc(size_t size);

int mem_free(void* p);

#endif //PROJEKAT_SYSCALL_C_HPP
