//
// Created by os on 6/21/22.
//

#ifndef PROJECT_BASE_V1_1_UTILFUNCTIONS_HPP
#define PROJECT_BASE_V1_1_UTILFUNCTIONS_HPP
#include "../h/printFunctions.hpp"
#include "../h/ABI.hpp"

template<typename T>
class List
{
private:
    struct Elem
    {
        T *data;
        Elem *next;

        Elem(T *data, Elem *next) : data(data), next(next) {}
    };

    Elem *head, *tail;
    static inline size_t alignBlock(size_t sz){
        return (sz + MEM_BLOCK_SIZE - 1) & ~(MEM_BLOCK_SIZE - 1);
    }
public:

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

    List() : head(0), tail(0) {}

    List(const List<T> &) = delete;

    List<T> &operator=(const List<T> &) = delete;

    void addFirst(T *data)
    {
        Elem *elem = (Elem*)MemoryAllocator::mem_alloc(alignBlock(sizeof(Elem) + sizeof(MemoryBlock))/MEM_BLOCK_SIZE); //OVO NIJE DOBRO
        elem->data = data;
        elem->next = head;
        head = elem;
        if (!tail) { tail = head; }
    }

    void addLast(T *data)
    {
        //Elem *elem = new Elem(data, 0);
        Elem* elem = (Elem*)MemoryAllocator::mem_alloc(alignBlock(sizeof(Elem) + sizeof(MemoryBlock))/MEM_BLOCK_SIZE);
        elem->data = data;
        elem->next = nullptr;
        if (tail)
        {
            tail->next = elem;
            tail = elem;
        } else
        {
            head = tail = elem;
        }
    }

    T *removeFirst()
    {
        if (!head) { return 0; }

        Elem *elem = head;
        head = head->next;
        if (!head) { tail = 0; }

        T *ret = elem->data;
        MemoryAllocator::mem_free(elem);
        return ret;
    }

    T *peekFirst()
    {
        if (!head) { return 0; }
        return head->data;
    }

    T *removeLast()
    {
        if (!head) { return 0; }

        Elem *prev = 0;
        for (Elem *curr = head; curr && curr != tail; curr = curr->next)
        {
            prev = curr;
        }

        Elem *elem = tail;
        if (prev) { prev->next = 0; }
        else { head = 0; }
        tail = prev;

        T *ret = elem->data;
         MemoryAllocator::mem_free(elem);
        return ret;
    }

    T *peekLast()
    {
        if (!tail) { return 0; }
        return tail->data;
    }
};

#endif //PROJECT_BASE_V1_1_UTILFUNCTIONS_HPP
