//
// Created by os on 5/13/24.
//

#include "../h/Riscv.hpp"
#include "../lib/console.h"
#include "../h/MemoryAllocator.hpp"
#include "../h/TCB.hpp"

enum OPERATIONS {
    ALLOC = 0x01, DEALLOC = 0x02, T_CREATE = 0x11, T_EXIT = 0x12, T_DISPATCH = 0x13,
    SEM_OPEN = 0x21, SEM_CLOSE = 0x22, SEM_WAIT = 0x23, SEM_SIGNAL = 0x24,
    SEM_TIMED = 0x25, SEM_TRY = 0x26, T_SLEEP = 0x31, GETC = 0x41, PUTC = 0x42
};

enum INTERRUPTS {
    SOFT_INT = 0x8000000000000001UL, HARD_INT = 0x8000000000000009UL,
    USER_MODE = 0x0000000000000008UL, SYS_MODE = 0x0000000000000009UL
};

uint64 timerCount = 0;

void Riscv::handleSupervisorTrap() {
    uint64 cause = r_scause();

    if(cause == SYS_MODE || cause == USER_MODE) {
//        uint64 volatile sepc = r_sepc() + 4;
//        uint64 volatile sstatus = r_sstatus();

        uint64 opCode = Riscv::read_a0();

        if(opCode == ALLOC) {
            uint64 size;

            // a1 vrednost iz funkcije mem_alloc
            __asm__ volatile ("mv %0, a1" : "=r" (size));
            void* ptr = MemoryAllocator::getInstance().mem_alloc(size);

            // 10*8(fp) je a0, 11*8(fp) je a1 ... (x8 == fp)
            __asm__ volatile ("sw %0, 80(fp)"::"r"(ptr)); //sw=32b, sd=64b

        } else if(opCode == DEALLOC) {
            void* ptr;
            __asm__ volatile ("mv %0, a1" : "=r" (ptr));

            int val = MemoryAllocator::getInstance().mem_free(ptr);

            __asm__ volatile ("sd %0, 80(fp)"::"r"(val));
        } else if(opCode == T_CREATE) {

        } else if(opCode == T_EXIT) {
            TCB::running->setFinished(true);
            TCB::dispatch();
        } else if(opCode == T_DISPATCH) {
            TCB::dispatch();
        } else if(opCode == SEM_OPEN) {

        } else if(opCode == SEM_CLOSE) {

        } else if(opCode == SEM_WAIT) {

        } else if(opCode == SEM_SIGNAL) {

        } else if(opCode == SEM_TIMED) {

        } else if(opCode == SEM_TRY) {

        } else if(opCode == T_SLEEP) {

        } else if(opCode == GETC) {

        } else if(opCode == PUTC) {

        } else {

        }

        w_sstatus(cause);
    }
//    if(cause == (0x01UL << 63 | 0x01)) {
//        timerCount++;
//        if(timerCount >= 50) {
//            __putc('a');
//            __putc('\n');
//            timerCount = 0;
//        }
//        __asm__ volatile ("csrc sip, 0x02");
//    }
//    console_handler();
}

void Riscv::popSppSpie()
{
    __asm__ volatile ("csrw sepc, ra");
    __asm__ volatile ("sret");
}