//
// Created by os on 8/15/24.
//

#include "../h/_sem.hpp"

_sem::_sem(int val): value(val), ok(true) {}

_sem::_sem(): value(1), ok(true) {}

_sem::~_sem() {
    value = 0;
}

int _sem::open() {
    return 1;
}

int _sem::close() {
    return 1;
}

int _sem::wait() {
    return 1;
}

int _sem::tryWait() {
    return 1;
}

int _sem::signla() {
    return 1;
}