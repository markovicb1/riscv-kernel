//
// Created by os on 6/28/22.
//

#ifndef PROJECT_BASE_V1_1_KSEMAPHORE_HPP
#define PROJECT_BASE_V1_1_KSEMAPHORE_HPP
#include "../h/TCB.hpp"

class ksemaphore { //kernel klasa za semafore
public:
    static ksemaphore* createSemaphore(int val);
    void signal();
    void wait();

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

    void unblockAll();

protected:
    void block(); //blokira nit i stavlja je u red blokiranih
    void unblock(); //uzima nit iz reda blokiranih
private:
    static inline size_t alignBlock(size_t sz){
        return (sz + MEM_BLOCK_SIZE - 1) & ~(MEM_BLOCK_SIZE - 1);
    }
    ksemaphore(int val){
        if(val < 0)
            value = 0;
        else
            value = val;
    }
    int value;
    List<TCB>blockedThreads;
public:
    int getValue() const {
        return value;
    }
};


#endif //PROJECT_BASE_V1_1_KSEMAPHORE_HPP
