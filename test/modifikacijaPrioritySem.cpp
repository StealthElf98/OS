//
// Created by os on 9/8/24.
//
#include "../h/TCB.hpp"
#include "../test/printing.hpp"
#include "../h/syscall_cpp.hpp"

static Semaphore *prioritySem;

class A:public Thread {
public:
    explicit A(Semaphore* sem):Thread() {
        this->sharedSem = sem;
        printString("Napravljena nit sa id = ");
        printInt(handle->getId());
        printString("\n");
    }

    Semaphore* sharedSem;
    void run() override {
        workA();
    }

    void workA() {

        int id = getTId();
        for(int i = 0; i < 3; i++) {

            printString("ID: ");
            printInt(id);
            printString(": Approaching...\n");
            sharedSem->wait();
            printString("ENTERED shared thread id = ");
            printInt(id);
            printString("\n");
            for(int j = 0; j <= id*4000; j++) {
                //busy wait
            }
            printString("DISPATCH shared thread id = ");
            printInt(id);
            printString("\n");

            thread_dispatch();

            printString("GOT BACK AND EXITING shared thread id = ");
            printInt(id);
            printString("\n");

            sharedSem->signal();
            thread_dispatch();
        }
        printInt(id);
        printString(" : Finished!\n");
    }
};

void modifikacijaPrioritySem() {
    Thread* threads[20];

    prioritySem = new Semaphore(5);
    prioritySem->togglePriority();

    for(int i = 0; i < 20; i++) {
        threads[i] = new A(prioritySem);
    }

    for(int i = 0; i < 20; i++) {
        threads[i]->start();
    }

    for(int i = 0; i < 20; i++) {
        threads[i]->join();
    }
}