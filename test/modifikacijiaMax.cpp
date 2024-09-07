//
// Created by os on 9/7/24.
//
#include "../h/TCB.hpp"
#include "../test/printing.hpp"

static int count = 0;

class A:public Thread {
public:
    A():Thread() {}

    void run() override {
        workA();
    }

    void workA() {
        int id = getThreadId();
        printString("Thread id= ");
        printInt(id);
        printString(": START!\n");

        for(int i = 0; i < 5; i++) {
            int id = getThreadId();
            printString("Thread id= ");
            printInt(id);
            printString(": Hello!\n");
//            for(int j = 0; j < 10000000*id; j++) {
//
//            }
        thread_dispatch();
        }
        count++;
        printString("Thread id= ");
        printInt(id);
        printString(": Finished!\n");
    }
};

void modifikacijaMax() {
    Thread *threads[20];

    for(int i = 0; i < 20; i++) {
        threads[i] = new A();
    }

    for(int i = 0; i < 20; i++) {
        threads[i]->start();
    }

    while(count < 20) {
        thread_dispatch();
    }
//    for(int i = 0; i < 20; i++) {
//        threads[i]->join();
//    }

    printString("\nMain Finished maxThreads!\n");
}