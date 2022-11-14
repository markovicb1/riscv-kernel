//
// Created by os on 6/27/22.
//

#ifndef PROJECT_BASE_V1_1_SYSCALL_CPP_HPP
#define PROJECT_BASE_V1_1_SYSCALL_CPP_HPP

#include "syscall_c.hpp"

//NAJVAZNIJE OOP APSTRAKCIJE

class Thread{
public:
    Thread(void (*body)(void*),void* arg);
    virtual ~Thread(){}

    int start();
    static void dispatch();
protected:
    Thread();
    virtual void run(){}
private:
    using thread_t = threadHandler::thread_t;
    thread_t myHandle;
    static void runWrapper(void* arg);
};

class Semaphore{
public:
    Semaphore(uint init = 1);
    virtual ~Semaphore(){}
    int wait();
    int signal();
private:
    semaphoreHandler::sem_t myHandle;
};

#endif //PROJECT_BASE_V1_1_SYSCALL_CPP_HPP
