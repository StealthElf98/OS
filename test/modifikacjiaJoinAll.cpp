//
// Created by os on 9/9/24.
//
#include "printing.hpp"
#include "../h/syscall_cpp.hpp"

static bool done = false;

class C: public Thread {
public:
    explicit C(): Thread() {
//        printString("Thread C created!\n");
    }

    void run() override {
        printString("C started doing something!\n");
        for(int i = 0; i < 40000; i++) {
            // busy wait
        }
        printString("C finished something!\n");
        thread_dispatch();
    }
};

class B: public Thread {
public:
    explicit B(): Thread() {
//        printString("Thread B created!\n");
    }
    Thread* bThreads[2];
    void run() override {
        for(int i = 0; i<2; i++) {
            bThreads[i] = new C();
            bThreads[i]->setParent(this);
            bThreads[i]->start();
            printString("Thread B created ");
            printInt(i);
            printString(". C thread\n");
        }
        printString("B did joinAll\n");
        this->joinAll();
        printString("B finished!\n");
        thread_dispatch();
    }
};

class A: public Thread {
public:
    explicit A(): Thread() {
//        printString("Thread A created!\n");
    }

    Thread* aThreads[4];
    void run() override {
        for(int i = 0; i<3; i++) {
            aThreads[i] = new C();
            aThreads[i]->setParent(this);
            aThreads[i]->start();
            printString("Thread A created ");
            printInt(i);
            printString(". C thread\n");
        }

        aThreads[3] = new B();
        aThreads[3]->setParent(this);
        aThreads[3]->start();
        printString("Thread A created ");
        printInt(1);
        printString(". B thread\n");
        printString("A did joinAll\n");
        this->joinAll();
        done = true;
        printString("A finished!\n");
        thread_dispatch();
    }
};


void modifikacjiaJoinAll() {
    Thread* threads[3];
    threads[0] = new A();
    printString("Thread A created!\n");
    threads[1] = new B();
    printString("Thread B created!\n");
    threads[2] = new C();
    printString("Thread C created!\n");

    for(int i = 0; i<3; i++)
        threads[i]->start();

    while(!done)
        thread_dispatch();
}