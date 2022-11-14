//
// Created by os on 5/20/22.
//

#include "../h/ABI.hpp"
#include "../h/printFunctions.hpp"
#include "../h/TCB.hpp"
#include "../h/ksemaphore.hpp"

//DEO ZA ALOKACIJU MEMORIJE

//NAPOMENA: POKAZIVAC NA BLOK ZAPRAVO POKAZUJE NA NJEGOV DATA DEO, A NE NA BUKVALNI POCETAK STRUKTURE
MemoryBlock* MemoryAllocator::head = nullptr;
MemoryBlock* MemoryAllocator::tail = nullptr;
int MemoryAllocator::called = 0;
uint64 MemoryAllocator::maxMemorySize = (size_t)(HEAP_END_ADDR) - (size_t) HEAP_START_ADDR - sizeof(MemoryBlock);
uint64 MemoryAllocator::currentMemorySize = 0;

void MemoryAllocator::instantiate() { //funkcija se poziva samo 1, i to da bi se ceo prostor predstavio 1 slobodnim mem blokom
    if(!called){
        head = (MemoryBlock*)HEAP_START_ADDR;
        size_t memSize = (size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR - sizeof(MemoryBlock); //oduzima se i zaglavlje headera, tj ovo je stvarna velicina za podatke
        head->size = memSize;
        head->nextBlock = nullptr;

        tail = head;

        currentMemorySize = memSize;
        maxMemorySize = memSize;

        called = 1;
    }
}

MemoryBlock *MemoryAllocator::getHead() {
    return head;
}

int MemoryAllocator::appendMemoryBlock(MemoryBlock *block) {//moguce dodavanje samo ako dodavanje ne prekoracuje dozvoljen prostor
    if(!head){ //samo ako se sve obrise
        head = tail = block;
        return 0;
    }
    else{
        uint64 tryMem = currentMemorySize + block->size + sizeof(MemoryBlock);
        //printInteger(maxMemorySize);
        if(currentMemorySize == maxMemorySize)
            return -2; //greska oznacava da je popunjen ceo mem prostor
        else if(tryMem > maxMemorySize){
            return -2;
        }
        else{
            tail->nextBlock = block;
            tail = block;
            currentMemorySize += (block->size + sizeof(MemoryBlock));
            return 0;
        }
    }
}
//dobijanje memorije preko first fit algoritma
MemoryBlock *MemoryAllocator::getMemoryBlock(size_t sz) { //ovaj sz je zapravo BROJ blokova - takva mi je inicijalna implementacija bila
    sz *= MEM_BLOCK_SIZE;
    if(currentMemorySize == 0)
        return nullptr;
    if(sz == maxMemorySize){
        MemoryBlock* ret = head;
        head = nullptr;
        ret = (MemoryBlock*)((char*)ret + sizeof(MemoryBlock)); //pomeramo za zaglavlje
        currentMemorySize = 0;
        return ret;
    }

    MemoryBlock* previous = nullptr;
    MemoryBlock* current = head;

    while(current){
        if(current->size < sz){ //pretraga se zavrsava onda kada se pronadje blok cija je velicina >= od zadate
            previous = current;
            current = current->nextBlock;
        }
        else //current je blok ciji size je veci od trazenog
            break;
    }

    if(!current) //ako nema takvog bloka, while je prosao kroz ceo ciklus, nema slobodne odgovarajuce memorije
        return nullptr;
    else{ //ako ima:
        if(current->size - sz >= MEM_BLOCK_SIZE + sizeof(MemoryBlock)){ //odrezak veci od 64B + zaglavlje -> ulancavamo ga u listu slobodnih mem blokova

            size_t ptrOffset = sz + sizeof(MemoryBlock); //velicina zaglavlja "objekta" + sama njegova velicina za podatke
            MemoryBlock* newBlock = (MemoryBlock*)((char*)current + ptrOffset); //ovo je pokazivac na odrezak koji treba da ulancamo u listu

            newBlock->size = current->size - sz - sizeof(MemoryBlock); //ovaj novi blok je zapravo velicine odreska bez zaglavlja, a njegov nextBlock je onaj sto je i pre bio next
            newBlock->nextBlock = current->nextBlock;

            if(!previous){ //dakle prvi element odmah odgovara
                head = newBlock;
            }
            else{
                previous->nextBlock = newBlock; //izbacuje se current iz liste slobodnih mem blokova
            }

            current->size = sz;
            current->nextBlock = nullptr;
            currentMemorySize -= (sz + sizeof(MemoryBlock));
            current = (MemoryBlock*)((char*)current + sizeof(MemoryBlock)); //pomeramo za zaglavlje
            return current;
        }
        else{//odrezak je manji od 64B -> mora interna fragmentacija, odnosno ne ostaje nikakav odrezak, ceo mem blok izbacujemo iz strukture
            previous->nextBlock = current->nextBlock;

            currentMemorySize -= (current->size + sizeof(MemoryBlock));
            current->nextBlock = nullptr;
            current = (MemoryBlock*)((char*)current + sizeof(MemoryBlock)); //pomeramo za zaglavlje
            return current;
        }
    }
}

void *MemoryAllocator::mem_alloc(size_t sz) {
    return (void*)getMemoryBlock(sz); //ako vraca nullptr onda je u pitanju greska sa mem prostorom
}

int MemoryAllocator::mem_free(void * ptr) {
    //ptr pokazuje zapravo na Memorijski blok koji je onda od mem_alloca bio dobijen
    MemoryBlock* block = (MemoryBlock*)((char*)ptr - sizeof(MemoryBlock));
    if(!block)
        return -1;
    else
        return appendMemoryBlock(block);
}

//FUNKCIJE ZA OBAVLJANJE PREKIDA

void Machine::callerFunction(int funcCode,void* par1,void* par2, void* par3){ //obradjuje sistemske pozive - poziva odg funkcije

    if(funcCode == 0x01){
        void* ret = MemoryAllocator::mem_alloc((size_t)par1);
        __asm__ volatile ("mv x10, %[povratna]" : : [povratna]"r"(ret)); //upisujemo povratnu vrednost u reg a0
    }
    else if(funcCode == 0x02){
        int ret = MemoryAllocator::mem_free(par1);
        __asm__ volatile ("mv x10, %[povratna]" : : [povratna]"r"(ret));
    }
    else if(funcCode == 0x11){
        int ret = threadHandler::thread_create((threadHandler::thread_t*)par1,(void(*)(void*))par2,par3, nullptr);
        __asm__ volatile ("mv x10, %[povratna]" : : [povratna]"r"(ret));
    }
    else if(funcCode == 0x12){
        int ret = threadHandler::thread_exit();
        __asm__ volatile ("mv x10, %[povratna]" : : [povratna]"r"(ret));
    }
    else if(funcCode == 0x13){
        threadHandler::thread_dispatch();
    }
    else if(funcCode == 0x14){
        int ret = threadHandler::thread_create_non_sheduler((threadHandler::thread_t*)par1,(void(*)(void*))par2,par3, nullptr);
        __asm__ volatile ("mv x10, %[povratna]" : : [povratna]"r"(ret));
    }
    else if(funcCode == 0x21){
        int ret = semaphoreHandler::sem_open((semaphoreHandler::sem_t*)par1,(int)(size_t)par2);
        __asm__ volatile ("mv x10, %[povratna]" : : [povratna]"r"(ret));
    }
    else if(funcCode == 0x22){
        int ret = semaphoreHandler::sem_close((semaphoreHandler::sem_t)par1);
        __asm__ volatile ("mv x10, %[povratna]" : : [povratna]"r"(ret));
    }
    else if(funcCode == 0x23){
        int ret = semaphoreHandler::sem_wait((semaphoreHandler::sem_t)par1);
        __asm__ volatile ("mv x10, %[povratna]" : : [povratna]"r"(ret));
    }
    else if(funcCode == 0x24){
        int ret = semaphoreHandler::sem_signal((semaphoreHandler::sem_t)par1);
        __asm__ volatile ("mv x10, %[povratna]" : : [povratna]"r"(ret));
    }
    else if(funcCode == 0x25){
        mc_sstatus(SSTATUS_SPP); //ulazi u kor rezim
    }
    else{ //ovde dolazi iz ecall kada ga zove yield, sinhrono

        uint64 sepc = r_sepc() + 4;
        uint64 sstatus = r_sstatus();
        TCB::timeSliceCounter = 0; //prilagodjeno nadogradnji za asinhrone prekide
        TCB::dispatch();
        w_sstatus(sstatus);
        w_sepc(sepc);
        return;
    }

    uint64 temp = r_sepc();
    temp+=4;
    w_sepc(temp);
    mc_sip(SIP_SSIP);
}

void Machine::handleSuperVisorTrap(){ //funkcija koja se poziva iz trap rutine, ona obezbedjuje odgovarajuci poziv odgovarajucoj funkciji
    uint64 scauseVar, a0Var, a1Var, a2Var, a3Var;
    //scauceVar - razlog ulaska u sis rezim; a0Var - kod funkcije koja se poziva u ABIju; a1Var - parametar sis poziva

    __asm__ volatile ("csrr %[razlog], scause" : [razlog] "=r"(scauseVar)); //ovaj blok nam omogucava da prepoznamo do kojeg prekida je doslo
    __asm__ volatile ("mv %[kod], x10" : [kod]"=r"(a0Var));
    __asm__ volatile ("mv %[param0], x11" : [param0]"=r"(a1Var));
    __asm__ volatile ("mv %[param1], x12" : [param1]"=r"(a2Var));
    __asm__ volatile ("mv %[param2], x13" : [param2]"=r"(a3Var));

    bool bnt = scauseVar >> 63;
    scauseVar = scauseVar & 0x7ffffff;

    if(bnt){
        if(scauseVar == 1){
            //tajmer
        }
        else if(scauseVar == 9){
            //hardverski prekid, za konzolu!
            console_handler();
        }
        else{
            //spoljasnji hardverski prekid, nepoznato
            printString("Ovo je nepoznati problem!\n");
        }
    }
    else{
        switch (scauseVar) {
            case 2:
                printString("ilegalna instrukcija\n"); break; //ileg instrukcija
            case 5:
                printString("Nedozvoljena adresa citanja\n");
                printInteger(r_stval());
                printString("\n"); break; //nedozvoljena adresa citanja
            case 7:
                printString("Nedozvoljena adresa upisa\n");break; //nedozvoljena adresa upisa
            case 8: case 9:
                callerFunction(a0Var,(void *)a1Var, (void *)a2Var, (void *)a3Var); break;
            default: break;//greska
        }
    }

}

void Machine::SppSpie(){
    __asm__ volatile("csrw sepc, ra");

    __asm__ volatile("sret");
}

//FUNKCIJE ZA NITI - U OKVIRU USLUZNE KLASE

int threadHandler::thread_create(threadHandler::thread_t *handle, void (*start_routine)(void *), void *arg, void* stack_space) {
    *handle = TCB::createThread(start_routine,arg);
    if(!*handle)
        return -1;
    return 0;
}

int threadHandler::thread_exit() {
    TCB::running->setFinished(true);
    TCB::yield();
    return 0;
}

void threadHandler::thread_dispatch() {
    TCB::dispatch();
}


int threadHandler::thread_create_non_sheduler(threadHandler::thread_t *handle, void (*start_routine)(void *), void *arg,
                                              void *stack_space) {
    *handle = TCB::createThreadNonScheduler(start_routine,arg);
    if(!*handle)
        return -1;
    return 0;
}

//FUNKCIJE ZA SEMAFORE - U OKVIRU USLUZNE KLASE

int semaphoreHandler::sem_open(semaphoreHandler::sem_t *handle, uint init) {
    *handle = ksemaphore::createSemaphore(init);
    if(!handle)
        return -1;
    return 0;
}

int semaphoreHandler::sem_wait(semaphoreHandler::sem_t id) {
    if(!id)
        return -1;
    id->wait();
    return 0;
}

int semaphoreHandler::sem_signal(semaphoreHandler::sem_t id) {
    if(!id)
        return -1;
    id->signal();
    return 0;
}

int semaphoreHandler::sem_close(semaphoreHandler::sem_t handle) {
    if(!handle)
        return -1;
    handle->unblockAll();
    delete handle;
    handle = nullptr;
    return 0;
}

/*
 switch (funcCode) {
        case 1:{
            void* ret = MemoryAllocator::mem_alloc((size_t)par1);
            __asm__ volatile ("mv x10, %[povratna]" : : [povratna]"r"(ret)); //upisujemo povratnu vrednost u reg a0
            break;
        }
        case 2:{
            int ret = MemoryAllocator::mem_free(par1);
            __asm__ volatile ("mv x10, %[povratna]" : : [povratna]"r"(ret));
            break;
        }
        case 17:{
            int ret = threadHandler::thread_create((threadHandler::thread_t*)par1,(void(*)(void*))par2,par3, nullptr);
            __asm__ volatile ("mv x10, %[povratna]" : : [povratna]"r"(ret));
            break;
        }
        case 18:{
            int ret = threadHandler::thread_exit();
            __asm__ volatile ("mv x10, %[povratna]" : : [povratna]"r"(ret));
            break;
        }
        case 19:{
            threadHandler::thread_dispatch();
            break;
        }
        case 20:{
            int ret = threadHandler::thread_create_non_sheduler((threadHandler::thread_t*)par1,(void(*)(void*))par2,par3, nullptr);
            __asm__ volatile ("mv x10, %[povratna]" : : [povratna]"r"(ret));
            break;
        }
        case 33:{
            int ret = semaphoreHandler::sem_open((semaphoreHandler::sem_t*)par1,(int)(size_t)par2);
            __asm__ volatile ("mv x10, %[povratna]" : : [povratna]"r"(ret));
            break;
        }
        case 34:{
            int ret = semaphoreHandler::sem_close((semaphoreHandler::sem_t)par1);
            __asm__ volatile ("mv x10, %[povratna]" : : [povratna]"r"(ret));
            break;
        }
        case 35:{
            int ret = semaphoreHandler::sem_wait((semaphoreHandler::sem_t)par1);
            __asm__ volatile ("mv x10, %[povratna]" : : [povratna]"r"(ret));
            break;
        }
        case 36:{
            int ret = semaphoreHandler::sem_signal((semaphoreHandler::sem_t)par1);
            __asm__ volatile ("mv x10, %[povratna]" : : [povratna]"r"(ret));
            break;
        }
        case 37:{
            mc_sstatus(SSTATUS_SPP); //ulazi u korisnicki rezim
            break;
        }
        default:{
            //ovde dolazi iz ecall kada ga zove yield, sinhrono
            uint64 sepc = r_sepc() + 4;
            uint64 sstatus = r_sstatus();
            TCB::timeSliceCounter = 0; //prilagodjeno nadogradnji za asinhrone prekide
            TCB::dispatch();
            w_sstatus(sstatus);
            w_sepc(sepc);
            return;
        }
    }
 */

/*

 */