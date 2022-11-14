//
// Created by os on 5/21/22.
//

#include "../h/syscall_c.hpp"


inline size_t alignBlock(size_t sz){
    return (sz + MEM_BLOCK_SIZE - 1) & ~(MEM_BLOCK_SIZE - 1);
}

void* mem_alloc(size_t size){ //a0 je x10 a1 je x11 itd
    uint64 funcCode = 0x01;
    uint64 funcParam = alignBlock(size + sizeof(MemoryBlock))/MEM_BLOCK_SIZE; //ovde bi trebalo da se radi konverzija, mada sam ja to uradio u okviru ABI-a

    __asm__ volatile("mv a1, %[regA1]" : : [regA1] "rm"(funcParam)); //broj blokova
    __asm__ volatile("mv a0, %[regA0]" : : [regA0] "rm"(funcCode)); //kod 0x01

    __asm__ volatile("ecall");

    void* res;
    __asm__ volatile ("mv %[ime], x10" : [ime]"=r"(res));
    return res;
}

int mem_free(void* ptr){
    uint64 funcCode = 0x02;
    __asm__ volatile("mv a1, %[regA1]" : : [regA1] "rm"(ptr)); //pokazivac na odg. blok
    __asm__ volatile("mv a0, %[regA0]" : : [regA0] "rm"(funcCode)); //kod 0x02 za mem free

    __asm__ volatile("ecall");

    int res;
    __asm__ volatile ("mv %[ime], x10" : [ime]"=r"(res));
    return res;
}
int thread_create(threadHandler::thread_t* handle, void(*start_routine)(void*),void* arg){
    uint64 funcCode = 0x11;
    __asm__ volatile("mv a3, %[regA3]" : : [regA3] "rm"(arg));
    __asm__ volatile("mv a2, %[regA2]" : : [regA2] "rm"(start_routine));
    __asm__ volatile("mv a1, %[regA1]" : : [regA1] "rm"(handle)); //rucka niti
    __asm__ volatile("mv a0, %[regA0]" : : [regA0] "rm"(funcCode)); //kod

    __asm__ volatile("ecall");

    int res;
    __asm__ volatile ("mv %[ime], x10" : [ime]"=r"(res));
    return res;
}
int thread_exit(){
    uint64 funcCode = 0x12;
    __asm__ volatile("mv a0, %[regA0]" : : [regA0] "rm"(funcCode)); //kod

    __asm__ volatile("ecall");

    int res;
    __asm__ volatile ("mv %[ime], x10" : [ime]"=r"(res));
    return res;
}
void thread_dispatch(){
    uint64 funcCode = 0x13;
    __asm__ volatile("mv a0, %[regA0]" : : [regA0] "rm"(funcCode)); //kod

    __asm__ volatile("ecall");

    return;
}

int thread_create_non_sheduler(threadHandler::thread_t* handle, void(*start_routine)(void*),void* arg){
    uint64 funcCode = 0x14;
    __asm__ volatile("mv a3, %[regA3]" : : [regA3] "rm"(arg));
    __asm__ volatile("mv a2, %[regA2]" : : [regA2] "rm"(start_routine));
    __asm__ volatile("mv a1, %[regA1]" : : [regA1] "rm"(handle)); //rucka niti
    __asm__ volatile("mv a0, %[regA0]" : : [regA0] "rm"(funcCode)); //kod

    __asm__ volatile("ecall");

    int res;
    __asm__ volatile ("mv %[ime], x10" : [ime]"=r"(res));
    return res;
}

int sem_open(semaphoreHandler::sem_t* handle,uint init){
    uint64 funcCode = 0x21;
    __asm__ volatile("mv a2, %[regA2]" : : [regA2] "rm"(init));
    __asm__ volatile("mv a1, %[regA1]" : : [regA1] "rm"(handle)); //rucka semafora
    __asm__ volatile("mv a0, %[regA0]" : : [regA0] "rm"(funcCode)); //kod

    __asm__ volatile("ecall");

    int res;
    __asm__ volatile ("mv %[ime], x10" : [ime]"=r"(res));
    return res;
}

int sem_close(semaphoreHandler::sem_t handle){
    uint64 funcCode = 0x22;
    __asm__ volatile("mv a1, %[regA1]" : : [regA1] "rm"(handle)); //rucka semafora
    __asm__ volatile("mv a0, %[regA0]" : : [regA0] "rm"(funcCode)); //kod

    __asm__ volatile("ecall");

    int res;
    __asm__ volatile ("mv %[ime], x10" : [ime]"=r"(res));
    return res;
}

int sem_wait(semaphoreHandler::sem_t id){
    uint64 funcCode = 0x23;
    __asm__ volatile("mv a1, %[regA1]" : : [regA1] "rm"(id)); //rucka semafora
    __asm__ volatile("mv a0, %[regA0]" : : [regA0] "rm"(funcCode)); //kod

    __asm__ volatile("ecall");

    int res;
    __asm__ volatile ("mv %[ime], x10" : [ime]"=r"(res));
    return res;
}

int sem_signal(semaphoreHandler::sem_t id){
    uint64 funcCode = 0x24;
    __asm__ volatile("mv a1, %[regA1]" : : [regA1] "rm"(id)); //rucka semafora
    __asm__ volatile("mv a0, %[regA0]" : : [regA0] "rm"(funcCode)); //kod

    __asm__ volatile("ecall");

    int res;
    __asm__ volatile ("mv %[ime], x10" : [ime]"=r"(res));
    return res;
}