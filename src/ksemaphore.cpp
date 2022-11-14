//
// Created by os on 6/28/22.
//

#include "../h/ksemaphore.hpp"

ksemaphore *ksemaphore::createSemaphore(int val) {
    ksemaphore* sem = new ksemaphore(val);
    return sem;
}

void ksemaphore::block() {
    blockedThreads.addLast(TCB::running);
    TCB::yield();
}

void ksemaphore::unblock() {
    Scheduler::put(blockedThreads.removeFirst());
}

void ksemaphore::wait() {
value--;
if(value < 0)
    block();
}

void ksemaphore::signal() {
value++;
if(value < 0)
    unblock();
}

void ksemaphore::unblockAll() {
    while (!blockedThreads.removeFirst());
}
