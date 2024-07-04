//
// Created by os on 5/13/24.
//

#include "../h/Riscv.hpp"
#include "../lib/console.h"

enum OPERATIONS {
    ALLOC = 0x01, DEALLOC = 0x02, T_CREATE = 0x11, T_EXIT = 0x12, T_DISPATCH = 0x13,
    SEM_OPEN = 0x21, SEM_CLOSE = 0x22, SEM_WAIT = 0x23, SEM_SIGNAL = 0x24,
    SEM_TIMED = 0x25, SEM_TRY = 0x26, T_SLEEP = 0x31, GETC = 0x41, PUTC = 0x42
};

uint64 timerCount = 0;

void Riscv::handleSupervisorTrap() {
    uint64 cause = r_scause();

    if(cause == 0x0000000000000009 || cause == 0x0000000000000008) {
//        uint64 volatile sepc = r_sepc() + 4;
//        uint64 volatile sstatus = r_sstatus();

        uint64 opCode = Riscv::read_a0();

        if(opCode == ALLOC) {
            __putc('a');
            __putc('\n');
        } else if(opCode == DEALLOC) {

        } else if(opCode == T_CREATE) {

        } else if(opCode == T_EXIT) {

        } else if(opCode == T_DISPATCH) {

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