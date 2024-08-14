////
//// Created by os on 8/5/24.
////

#include "../lib/hw.h"
#include "../utils/print.hpp"
#include "../h/syscall_c.hpp"
#include "../h/TCB.hpp"

//static uint64 fibonacci(uint64 n)
//{
//    if (n == 0 || n == 1) { return n; }
//    if (n % 4 == 0) {
//        thread_dispatch();
//    }
//    return fibonacci(n - 1) + fibonacci(n - 2);
//}

void workerBodyA(void* arg) {
    while(1) {
        printString("A\n");
        TCB::dispatch();
    }
}
void workerBodyB(void* arg) {
    while(1){
        printString("B\n");
        TCB::dispatch();
    }
}

//
////void workerBodyB(void* arg)
////{
////    uint8 i = 10;
////    thread_join((thread_t) arg);
////    for (; i < 13; i++)
////    {
////        printString("B: i=");
////        printInt(i);
////        printString("\n");
////    }
////
////    printString("B: yield\n");
////    __asm__ ("li t1, 5");
////    thread_dispatch();
////
////
////    uint64 result = fibonacci(23);
////    printString("B: fibonaci=");
////    printInt(result);
////    printString("\n");
////
////    for (; i < 16; i++)
////    {
////        printString("B: i=");
////        printInt(i);
////        printString("\n");
////    }
////
////    thread_dispatch();
////}
//
////test semafora
////void workerBodyC(void* arg) {
////    printString("C: poziva se dispatch1.\n");
////    thread_dispatch();
////    printString("C: poziva se dispatch2..\n");
////    thread_dispatch();
////    printString("C: poziva se dispatch3...\n");
////    thread_dispatch();
////    printString("C: poziva se dispatch4....\n");
////    printString("C: Signal semafora!\n");
////    sem_close((sem_t) arg);
////    thread_dispatch();
////    printString("C: posle signala..\n");
////    printString("C: posle signala.2.\n");
////}
//
//
////void workerBodyD(void *arg) {
////    printString("D: Usli smo u D 1. put\n");
////    printString("D: Cekamo na semaforu..\n");
////
////    int returnValue = sem_wait((sem_t) arg);
////
////    printString("D: rezultat: ");
////    printInt(returnValue);
////    printString("\nD: izlazim automatski, pozdrav!\n");
////}
