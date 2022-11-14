#ifndef XV6_THREADS_C_API_TEST_HPP
#define XV6_THREADS_C_API_TEST_HPP

#include "../h/syscall_c.hpp"

//#include "printing.hpp"
#include "../h/TCB.hpp"
using thread_t = threadHandler::thread_t;
bool finishedAt = false;
bool finishedBt = false;
bool finishedCt = false;
bool finishedDt = false;

uint64 fibonacciT(uint64 n) {
    if (n == 0 || n == 1) { return n; }
    if (n % 10 == 0) { thread_dispatch(); }
    return fibonacciT(n - 1) + fibonacciT(n - 2);
}

void workerBodyAt(void* arg) {
    for (uint64 i = 0; i < 10; i++) {
        printString("A: i="); printInteger(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
        }
    }
    printString("A finished!\n");
    finishedAt = true;
}

void workerBodyBt(void* arg) {
    for (uint64 i = 0; i < 16; i++) {
        printString("B: i="); printInteger(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
        }
    }
    printString("B finished!\n");
    finishedBt = true;
    thread_dispatch();
}

void workerBodyCt(void* arg) {
    uint8 i = 0;
    for (; i < 3; i++) {
        printString("C: i="); printInteger(i); printString("\n");
    }

    printString("C: dispatch\n");
    __asm__ ("li t1, 7");
    thread_dispatch();

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));

    printString("C: t1="); printInteger(t1); printString("\n");

    uint64 result = fibonacciT(12);
    printString("C: fibonaci="); printInteger(result); printString("\n");

    for (; i < 6; i++) {
        printString("C: i="); printInteger(i); printString("\n");
    }

    printString("A finished!\n");
    finishedCt = true;
    thread_dispatch();
}

void workerBodyDt(void* arg) {
    uint8 i = 10;
    for (; i < 13; i++) {
        printString("D: i="); printInteger(i); printString("\n");
    }

    printString("D: dispatch\n");
    __asm__ ("li t1, 5");
    thread_dispatch();

    uint64 result = fibonacciT(16);
    printString("D: fibonaci="); printInteger(result); printString("\n");

    for (; i < 16; i++) {
        printString("D: i="); printInteger(i); printString("\n");
    }

    printString("D finished!\n");
    finishedDt = true;
    thread_dispatch();
}


void Threads_C_API_test() {
    thread_t threads[4];

    thread_create(&threads[0], workerBodyAt, nullptr);
    printString("ThreadA created\n");

    thread_create(&threads[1], workerBodyBt, nullptr);
    printString("ThreadB created\n");

    thread_create(&threads[2], workerBodyCt, nullptr);
    printString("ThreadC created\n");

    thread_create(&threads[3], workerBodyDt, nullptr);
    printString("ThreadD created\n");

    while (!(finishedAt && finishedBt && finishedCt && finishedDt)) {
        thread_dispatch();
    }

    for (auto &thread: threads) { delete thread; }
}

#endif //XV6_THREADS_C_API_TEST_HPP
