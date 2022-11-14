//
// Created by os on 5/21/22.
//

#ifndef PROJECT_BASE_V1_1_SYSCALL_C_HPP
#define PROJECT_BASE_V1_1_SYSCALL_C_HPP

#include "../h/ABI.hpp"

//FUNKCIJE ZA OPERACIJE SA MEMORIJOM
void *mem_alloc(size_t size);
int mem_free(void* ptr);

//FUNKCIJE ZA OPERACIJE SA LAKIM PROCESIMA
int thread_create(threadHandler::thread_t* handle, void(*start_routine)(void*),void* arg);
int thread_exit();
void thread_dispatch();
int thread_create_non_sheduler(threadHandler::thread_t* handle, void(*start_routine)(void*),void* arg);

//FUNKCIJE ZA RAD SA SEMAFORIMA
int sem_open(semaphoreHandler::sem_t* handle,uint init);
int sem_close(semaphoreHandler::sem_t handle);
int sem_wait(semaphoreHandler::sem_t id);
int sem_signal(semaphoreHandler::sem_t id);

#endif //PROJECT_BASE_V1_1_SYSCALL_C_HPP

