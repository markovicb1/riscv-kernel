//
// Created by os on 6/27/22.
//

#include "../h/syscall_cpp.hpp"
#include "../h/Scheduler.hpp"

Thread::Thread(void (*body)(void *), void *arg) { //posix stvaranje niti
    thread_create(&myHandle,body,arg);
}

int Thread::start() {
    Scheduler::put(myHandle);
    return 0;
}

void Thread::dispatch() {
    thread_dispatch();
}

Thread::Thread() { //objektno stvaranje niti -
    thread_create_non_sheduler(&myHandle,runWrapper, this);
}

void Thread::runWrapper(void *arg) {
    Thread *thread = (Thread*)arg;
    thread->run();
}

Semaphore::Semaphore(uint init) {
    sem_open(&myHandle,init);
}

int Semaphore::wait() {
    return sem_wait(myHandle);
}

int Semaphore::signal() {
    return sem_signal(myHandle);
}
