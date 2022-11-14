//
// Created by os on 6/21/22.
//

#ifndef PROJECT_BASE_V1_1_TCB_HPP
#define PROJECT_BASE_V1_1_TCB_HPP

#include "../h/Scheduler.hpp"

class TCB //glavna, interna apstrakcija lakog procesa tj niti
{
public:
    ~TCB() { delete[] stack; }

    bool isFinished() const { return finished; }

    void setFinished(bool value) { finished = value; }

    uint64 getTimeSlice() const { return timeSlice; } //od interesa za asinh. promena konteksta

    using Body = void (*)(void*);

    static TCB *createThread(Body body, void *args); //factory static metoda koja menja konstruktor

    static TCB* createThreadNonScheduler(Body body, void *args); //spec slucaj za pravljenje toka bez stavljanja u red spremnih

    static void yield(); //promena konteksta na zahtev

    static TCB *running; //trenutna nit koja se izvrsava

    void* operator new(size_t size){
        return MemoryAllocator::mem_alloc(alignBlock(size + sizeof(MemoryBlock))/MEM_BLOCK_SIZE);
    }
    void* operator new[](size_t size){
        return MemoryAllocator::mem_alloc(alignBlock(size + sizeof(MemoryBlock))/MEM_BLOCK_SIZE);
    }
    void operator delete(void* ptr){
        MemoryAllocator::mem_free(ptr);
    }
    void operator delete[](void* ptr){
        MemoryAllocator::mem_free(ptr);
    }
private:

    static inline size_t alignBlock(size_t sz){
        return (sz + MEM_BLOCK_SIZE - 1) & ~(MEM_BLOCK_SIZE - 1);
    }
    TCB(Body body, uint64 timeSlice, void * args)
    {
        this->body = body;
        this->args = args;
        if(body != nullptr){
           this->stack = (uint64*)MemoryAllocator::mem_alloc(alignBlock(sizeof(uint64)*DEFAULT_STACK_SIZE + sizeof(MemoryBlock))/MEM_BLOCK_SIZE);
        }
        else{
            this->stack = nullptr;
        }
        this->context = {(uint64) &threadWrapper,
                         stack != nullptr ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0
        };
        this->timeSlice = timeSlice;
        this->finished = false;
        if (body != nullptr) { Scheduler::put(this); }
    }

    TCB(Body body, uint64 timeSlice, void * args, int nonSch) //specijalni konstruktor za spec static metodu
    {
        this->body = body;
        this->args = args;
        if(body != nullptr){
            this->stack = (uint64*)MemoryAllocator::mem_alloc(alignBlock(sizeof(uint64)*DEFAULT_STACK_SIZE + sizeof(MemoryBlock))/MEM_BLOCK_SIZE);
        }
        else{
            this->stack = nullptr;
        }
        this->context = {(uint64) &threadWrapper,
                         stack != nullptr ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0
        };
        this->timeSlice = timeSlice;
        this->finished = false;

    }

    struct threadContext
    {
        uint64 ra; //ret addr
        uint64 sp; //sp
    };

    Body body;
    void* args;
    uint64 *stack;
    threadContext context;
    uint64 timeSlice;
    bool finished;

    friend class Machine;
    friend class threadHandler;
    static void threadWrapper();

    static void contextSwitch(threadContext *oldContext, threadContext *runningContext); //def u asm fajlu

    static void dispatch();

    static uint64 timeSliceCounter;

};


#endif //PROJECT_BASE_V1_1_TCB_HPP
