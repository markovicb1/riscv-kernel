//
// Created by os on 6/21/22.
//

#include "../h/TCB.hpp"

TCB *TCB::running = nullptr;

uint64 TCB::timeSliceCounter = 0;

TCB *TCB::createThread(Body body, void* args)
{
    TCB* tcb = new TCB(body, DEFAULT_TIME_SLICE, args);
    return tcb;
}

void TCB::yield()
{
    //upisati a1 da bude neka vrednost svojstvena samo za ecall iz yielda!
    uint64 funcCode = 0x0f;
    __asm__ volatile("mv a0, %[regA0]" : : [regA0] "rm"(funcCode)); //kod 0x0F

    __asm__ volatile ("ecall");
}

void TCB::dispatch()
{
    TCB *old = TCB::running;
    if (!old->isFinished()) { Scheduler::put(old); }
    TCB::running = Scheduler::get();
    TCB::contextSwitch(&old->context, &TCB::running->context);
}

void TCB::threadWrapper()
{
    running->body(running->args);
    running->setFinished(true);
    TCB::yield();
}

TCB *TCB::createThreadNonScheduler(TCB::Body body, void *args) {
    TCB* tcb = new TCB(body, DEFAULT_TIME_SLICE, args,-1);
    return tcb;
}

