//
// Created by os on 5/13/24.
//

#include "../h/Riscv.hpp"

enum OPERATIONS {
    ALLOC = 0x01, DEALLOC = 0x02, T_CREATE = 0x11, T_EXIT = 0x12, T_DISPATCH = 0x13,
    SEM_OPEN = 0x21, SEM_CLOSE = 0x22, SEM_WAIT = 0x23, SEM_SIGNAL = 0x24,
    SEM_TIMED = 0x25, SEM_TRY = 0x26, T_SLEEP = 0x31, GETC = 0x41, PUTC = 0x42
};

void Riscv::handleSupervisorTrap() {
    uint64 cause = r_scause();

    if(cause == 0x0000000000000009 || cause == 0x0000000000000008) {
//        uint64 sepc = r_sepc() + 4;
//        uint64 sstatus = r_sstatus();

    }
}