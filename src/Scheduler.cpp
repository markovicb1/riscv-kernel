//
// Created by os on 6/21/22.
//

#include "../h/Scheduler.hpp"

List<TCB> Scheduler::readyThreadQueue;
int Scheduler::numOfThreads = 0;
TCB *Scheduler::get()
{
    numOfThreads--;
    return readyThreadQueue.removeFirst();
}

void Scheduler::put(TCB *ccb)
{
    readyThreadQueue.addLast(ccb);
    numOfThreads++;
}

