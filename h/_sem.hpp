//
// Created by os on 8/15/24.
//

#ifndef OS__SEM_HPP
#define OS__SEM_HPP

#include "list.hpp"

class _sem {
public:
    _sem(int val);
    _sem();
    ~_sem();
    int open();
    int close();
    int wait();
    int tryWait();
    int signla();
private:
    int value;
    bool ok;
    List waitingQueue;
};

#endif //OS__SEM_HPP
