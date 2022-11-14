//
// Created by os on 5/20/22.
//

#ifndef PROJECT_BASE_V1_1_ABI_HPP
#define PROJECT_BASE_V1_1_ABI_HPP

#include "../lib/hw.h"

struct MemoryBlock{
    size_t size; //neto velicina, bez zaglavlja -> sizeof(MemoryBlock)
    struct MemoryBlock* nextBlock; //pokazivac na "data" deo u okviru bloka -> dakle pokazivac na blok pomeren za offset od sizeof(MemoryBlock)
};

class MemoryAllocator{
private:
    MemoryAllocator(){} //nikada ne koristi jer stvaranje objekta nije od interesa
    static MemoryBlock* head;
    static MemoryBlock* tail;
    static int called;
    static MemoryBlock* getMemoryBlock(size_t size);
    static int appendMemoryBlock(MemoryBlock* block);
    static uint64 maxMemorySize;
    static uint64 currentMemorySize;
public:
    static void instantiate(); //glavna "memorijska" funkcija koja zamenjuje konstruktor u potpunosti (ne vraca objekat)
    static MemoryBlock* getHead();
    static void* mem_alloc(size_t); //din. zauzimanje memorije
    static int mem_free(void*); //din. oslobadjanje memorije
};

class Machine{
private:
    Machine(){} //takodje Singleton klasa, nije od interesa objekat
    static void callerFunction(int funcCode,void* par1,void* par2, void* par3); //razvrsavac funkcija u handleru
    static void handleSuperVisorTrap(); //handler prekida
public:

    static void SppSpie();
    static void superVisorTrap(); //prekidna rutina - asemblerski kod

    //USLUZNE FUNKCIJE ZA BRZI RAD SA SISTEMSKIM REGISTRIMA (SKOLSKI KOD)

    // read register scause
    static uint64 r_scause();

    // write register scause
    static void w_scause(uint64 scause);

    // read register sepc
    static uint64 r_sepc();

    // write register sepc
    static void w_sepc(uint64 sepc);

    // read register stvec
    static uint64 r_stvec();

    // write register stvec
    static void w_stvec(uint64 stvec);

    // read register stval
    static uint64 r_stval();

    // write register stval
    static void w_stval(uint64 stval);

    enum BitMaskSip
    {
        SIP_SSIP = (1 << 1),
        SIP_STIP = (1 << 5),
        SIP_SEIP = (1 << 9),
    };

    // mask set register sip
    static void ms_sip(uint64 mask);

    // mask clear register sip
    static void mc_sip(uint64 mask);

    // read register sip
    static uint64 r_sip();

    // write register sip
    static void w_sip(uint64 sip);

    enum BitMaskSstatus
    {
        SSTATUS_SIE = (1 << 1),
        SSTATUS_SPIE = (1 << 5),
        SSTATUS_SPP = (1 << 8),
    };

    // mask set register sstatus
    static void ms_sstatus(uint64 mask);

    // mask clear register sstatus
    static void mc_sstatus(uint64 mask);

    // read register sstatus
    static uint64 r_sstatus();

    // write register sstatus
    static void w_sstatus(uint64 sstatus);
};

inline uint64 Machine::r_scause()
{
    uint64 volatile scause;
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    return scause;
}

inline void Machine::w_scause(uint64 scause)
{
    __asm__ volatile ("csrw scause, %[scause]" : : [scause] "r"(scause));
}

inline uint64 Machine::r_sepc()
{
    uint64 volatile sepc;
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    return sepc;
}

inline void Machine::w_sepc(uint64 sepc)
{
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
}

inline uint64 Machine::r_stvec()
{
    uint64 volatile stvec;
    __asm__ volatile ("csrr %[stvec], stvec" : [stvec] "=r"(stvec));
    return stvec;
}

inline void Machine::w_stvec(uint64 stvec)
{
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
}

inline uint64 Machine::r_stval()
{
    uint64 volatile stval;
    __asm__ volatile ("csrr %[stval], stval" : [stval] "=r"(stval));
    return stval;
}

inline void Machine::w_stval(uint64 stval)
{
    __asm__ volatile ("csrw stval, %[stval]" : : [stval] "r"(stval));
}

inline void Machine::ms_sip(uint64 mask)
{
    __asm__ volatile ("csrs sip, %[mask]" : : [mask] "r"(mask));
}

inline void Machine::mc_sip(uint64 mask)
{
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
}

inline uint64 Machine::r_sip()
{
    uint64 volatile sip;
    __asm__ volatile ("csrr %[sip], sip" : [sip] "=r"(sip));
    return sip;
}

inline void Machine::w_sip(uint64 sip)
{
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}

inline void Machine::ms_sstatus(uint64 mask)
{
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
}

inline void Machine::mc_sstatus(uint64 mask)
{
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
}

inline uint64 Machine::r_sstatus()
{
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    return sstatus;
}

inline void Machine::w_sstatus(uint64 sstatus)
{
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
}

//USLUZNA SINGLETON KLASA ZA OPERACIJE NAD NITIMA - OKRUZUJUCA KLASA ZA NITI

class TCB;
class threadHandler{
public:
    using _thread = TCB;
    typedef _thread* thread_t;
    static int thread_create(thread_t* handle,void(*start_routine)(void*),void* arg, void* stack_space); //stvara nit, i upisuje rez createThread-a u handle
    static int thread_create_non_sheduler(thread_t* handle,void(*start_routine)(void*),void* arg, void* stack_space); //za razliku od prethodne metode, ova ne stavlja nit odmah u Rasporedjivac tj Scheduler
    static int thread_exit(); //gasi tekucu nit
    static void thread_dispatch(); //poziva promenu konteksta
private:
    threadHandler(){}
};

//USLUZNA SINGLETON KLASA ZA OPERACIJE NAD SEMAFORIMA - OKRUZUJUCA KLASA ZA SEMAFORE

class ksemaphore;
class semaphoreHandler{
public:
    using _sem = ksemaphore;
    typedef _sem* sem_t;
    static int sem_open(sem_t* handle, uint init); //otvara tj. stvara semafor sa referencom na rucku handle
    static int sem_wait(sem_t id);
    static int sem_signal(sem_t id);
    static int sem_close(sem_t handle); //zatvaranje semafora odnosno oslobadjanje njegovih resursa
private:
    semaphoreHandler(){} //konstruktor nije od interesa
};

#endif //PROJECT_BASE_V1_1_ABI_HPP
