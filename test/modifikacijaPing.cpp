//
// Created by os on 9/8/24.
//
#include "../h/TCB.hpp"
#include "../test/printing.hpp"

//static bool pendingA = false;
//static bool pendingB = false;
//static bool pendingC = false;
//
//class A:public Thread {
//public:
//    A():Thread() {}
//
//    void run() override {
//        workA();
//    }
//
//    void workA() {
//        int* test = new int[600];
//        test[0] = 1;
//        for(int i = 0; i < 10; i++) {
//            for(uint64 j = 0; j < 300000000; j++) {
//
//            }
//
//            printString("A: ");
//            printInt(i);
//            printString("\n");
//            if(this->isPinged()) {
//                printString("A allocated ");
//                printInt(this->numOfAllocatedBlocks());
//                printString(" blocks\n");
//            }
//            thread_dispatch();
//        }
//        pendingA = true;
//    }
//};

//class B:public Thread {
//public:
//    B():Thread() {}
//
//    void run() override {
//        workB();
//    }
//
//    void workB() {
//        for(int i = 0; i < 10; i++) {
//            for(uint64 j = 0; j < 300000000; j++) {
//
//            }
//            printString("B: ");
//            printInt(i);
//            printString("\n");
//            thread_dispatch();
//        }
//        pendingB = true;
//    }
//};
//
//class C:public Thread {
//public:
//
//    C(Thread* t) {
//        toPing = t;
//    }
//    Thread* toPing;
////    C(void* t):Thread() {toPing = (Thread*)t;}
//
//    void run() override {
//        workC();
//    }
//
//    void workC() {
//
//        for(int i = 0; i < 10; i++) {
//            for(uint64 j = 0; j < 300000000; j++) {
//
//            }
//            printString("C: ");
//            printInt(i);
//            printString("\n");
//            if(i == 5) {
//                printString("C: Pinging A..\n");
//                toPing->pingThread();
//            }
//            thread_dispatch();
//        }
//        pendingC = true;
//    }
//};


void modifikacijaPing() {
//    Thread *threads[3];
//
//    threads[0] = new A();
//    printString("A created!\n");
//    threads[1] = new B();
//    printString("B created!\n");
//    threads[2] = new C(threads[0]);
//    printString("C created!\n");
//
//    threads[0]->start();
//    threads[1]->start();
//    threads[2]->start();
//
//    while(!pendingA && !pendingB && !pendingC) {
//        thread_dispatch();
//    }
//    thread_dispatch();
//    threads[0]->join();
//    threads[1]->join();
//    threads[2]->join();
}