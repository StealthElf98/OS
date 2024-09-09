//
// Created by os on 9/8/24.
//

#include "../h/syscall_cpp.hpp"
#include "printing.hpp"

static bool aDone = false;
static bool bDone = false;
static bool cDone = false;

static Thread* threads[3];

class A: public Thread {
public:
    explicit A():Thread() {
        printString("Thread A created\n");
    }

    void run() override {
        for(int i = 0; i<5; i++) {
            char* msg = (char*)("Nit A -> Nit B\n");
            threads[1]->send(msg);
            msg = (char*)("Nit A -> Nit C\n");
            threads[2]->send(msg);
            char* m = receive();
            printString(m);
            printString("A ");
            printInt(i);
            printString(". iteracija zavrsena\n");
        }
        aDone = true;
        thread_dispatch();
    }
};

class B: public Thread {
public:
    explicit B():Thread() {
        printString("Thread B created\n");
    }

    void run() override {
        for(int i = 0; i<5; i++) {
            char* msg = (char*)("Nit B -> Nit C #1\n");
            threads[2]->send(msg);
            msg = (char*)("Nit B -> Nit C #2\n");
            threads[2]->send(msg);
            msg = receive();
            printString(msg);
            msg = receive();
            printString(msg);
            printString("B ");
            printInt(i);
            printString(". iteracija zavrsena\n");
        }
        bDone = true;
        thread_dispatch();
    }
};

class C: public Thread {
public:
    explicit C():Thread(){
        printString("Thread C created\n");
    }

    void run() override {
        for(int i = 0; i<5; i++) {
            char* m = (char*)receive();
            printString(m);
            m = receive();
            printString(m);
            m = receive();
            printString(m);

            char* msg = (char*)("Nit C -> Nit B\n");
            threads[1]->send(msg);
            msg = (char*)("Nit C -> Nit A\n");
            threads[0]->send(msg);
            printString("C ");
            printInt(i);
            printString(". iteracija zavrsena\n");
        }
        cDone = true;
        thread_dispatch();
    }
};

void modifikacijaSR() {
    threads[0] = new A();
    threads[1] = new B();
    threads[2] = new C();

    for(int i = 0; i<3; i++)
        threads[i]->start();

    while(!aDone && !bDone && !cDone) {
        thread_dispatch();
    }
}