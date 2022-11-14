//
// Created by os on 6/21/22.
//

#ifndef PROJECT_BASE_V1_1_SCHEDULER_HPP
#define PROJECT_BASE_V1_1_SCHEDULER_HPP
#include "../h/utilFunctions.hpp"

class TCB;
//Singleton klasa za rasporedjivanje niti
class Scheduler
{
private:

    friend class TCB;
public:
    static List<TCB> readyThreadQueue;
    static TCB *get();
    static int numOfThreads;
    static void put(TCB *ccb);

};

#endif //PROJECT_BASE_V1_1_SCHEDULER_HPP