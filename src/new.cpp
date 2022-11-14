#include "../h/syscall_c.hpp"

void* operator new(uint64 n){

    void* ret = mem_alloc(n);
    return ret;
}

void* operator new[](uint64 n){
    void* ret = mem_alloc(n);
    return ret;
}

void operator delete(void* ptr) noexcept{
    mem_free(ptr);
}

void operator delete[](void* ptr) noexcept{
   mem_free(ptr);
}