#include "../h/TCB.hpp"
#include "../h/userMain.hpp"
#include "../h/syscall_c.hpp"
void functionHelper(void* thr){ //omotac korisnicke funkcije
    uint64 funcCode = 0x25;
    __asm__ volatile("mv a0, %[fc]"::[fc]"r"(funcCode));
    __asm__ volatile("ecall"); //prebacivanje na korisnicki rezim - izlazak iz sistemskog
    userMain();
}

int main(){
    __asm__ volatile("csrw stvec, %[trap]" : : [trap] "r" (&Machine::superVisorTrap)); //pripremanje osnovnih stvari u sis.r
    MemoryAllocator::instantiate();

    TCB* threads[2];

    thread_create(&threads[0], nullptr, nullptr);
    TCB::running = threads[0];

    thread_create(&threads[1],functionHelper, nullptr);
    while(!(threads[1]->isFinished())) thread_dispatch();

    return 0;
}

/*
 MemoryAllocator::instantiate();
    __asm__ volatile("csrw stvec, %[trap]" : : [trap] "r" (&Machine::superVisorTrap));

    TCB *threads[2];
    thread_create(&threads[0],nullptr,nullptr);
    TCB::running=threads[0];

    thread_create(&threads[1],functionHelper,nullptr);

    while(!(threads[1]->isFinished())) thread_dispatch();
    for(auto &thr:threads){delete thr;}


    return 0;
 */
