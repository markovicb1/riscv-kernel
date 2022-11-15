# riscv-kernel // Multithreaded, time-sharing kernel for RISC-V ISA

## About the project

This project represents simple, yet fully functional kernel for RISC-V architecture. It is completely made from scratch, meaning it fully lies on the most basic concepts of C/C++ programming languages. Additionaly, no external (nor internal) library is used in creation process.

The whole project was sophomore year's biggest obstacle, which was covered on ***Operating Systems 1*** course at the School of Electrical Engineering @ University of Belgrade :serbia:

## Kernel overview

- Memory allocator
- Threads
- Semaphores
- HW and SW interrupts
- System and user modes
- Process FIFO Scheduler
- Many more discussed in the following paragraphs

## Important notes

**userMain** is used as ordinary main in other projects, where **main** in this case is used only in system mode (regime), it prepares whole kernel for user activities - initialization of memory and preparing for userMain and user mode.

Kernel and user app are compiled as one .exe file which is then run on the host OS - modified version of MIT's xv6 OS. Using QEMU emulator, xv6 creates virtual space for our .exe file, making it see the whole system as it's own HW with one whole available memory space.

Kernel supports 3 different layers connected to users app:

- Application Binary Interface / ABI
- C Application Programming Interface / C API
- C++ Application Programming Interface / C++ API

![gtv](https://user-images.githubusercontent.com/115867204/201788720-e1cd77fc-ed25-4e16-a2bf-0a2fe7487f8a.jpg)

## Application Binary Interface - ABI

ABI is the lowest layer in kernel hierarchy and is completly made for system mode, or more precisely, it is set of system calls that are used in higher levels. It transfers all the variables and return values from upper level to the processors registers.

ABI is made of the following classes:

- MemoryAllocator - for dynamic allocations in user apps and for initial instatiation of whole memory
- Machine - set of methods that are composed of assebly code, working with processors registers
- threadHandler - handler class that wraps real thread procedures, made in C API
- semaphoreHandler - handler class that wraps real sempahore procedures, made in C API

### Memory Allocation

The smallest blocklike unit in memory is object of structure called MemoryBlock, which stores info about how much of size (size_t, in bytes) does the block use (without structures header), and a pointer to next available MemoryBlock.

Initialy, MemoryAllocator allocates whole memory as one available block.

MemoryAllocator uses 2 fundamental methods used in all the upper layers as well as in the user apps:

- `void* mem_alloc(size_t sz)` -> returns pointer to the newly allocated block in memory, or returns nullptr if some error occured
  - It uses `FirstFit` algorithm for block choosing. More on this algorithm can be read [here](https://www.geeksforgeeks.org/program-first-fit-algorithm-memory-management/)
- `int mem_free(void* ptr)` -> returns 0 if everything is good, in other case it returns corresponding error code
  - It is a must to pass a pointer of previously allocated block from `mem_alloc` to this function in order for this function to work properly!
  - `mem_free` appends the block pointed by the passed argument to the `tail` - the last available block tracked in MemoryAllocator.

Table of used constants in Memory managment defined in hw.lib (all are extern)
| Return type | Name | About |
| ----------- | ---- | ----- |
| const void* | HEAP_START_ADDR | Start address of the virtual memory used by processes and kernel itself |
| const void* | HEAP_END_ADDR | End address of the virtual memory used by processes and kernel itself |
| const size_t | MEM_BLOCK_SIZE | The unit used for memory allocation |

Initial memory size is then (size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR - sizeof(MemoryBlock), or one whole block.

### Interrupt handling

Every computer system has SW and HW interrupts, as a way to do various different tasks. Kernel handles interrupts in a void Machine::handleSuperVisorTrap() method, called from the trap routine (assembly code[^1]). It distinguishes several interrupt causes, here are some:

- Timer interrupt, for time-sharing processor context change
- Console interrupt
- External hardware interrupt
- Illegal instruction
- Read permission denied
- Write permission denied
- Software interrupt
  - This one is used most of the time since it calls void Machine::callerFunction(...), the true wrapper that calls particular system call according to the function code passed as the first argument

More on Computer interrupts can be read [here](https://en.wikipedia.org/wiki/Interrupt)

## C Aplication Programming Interface - C API

C API is a layer above the ABI. It consists of the classic methods as wrappers of ABI methods, making it an ABI wrapper.

C API provides classical, procedural programming interface of system calls in C language. It implements these methods:

| Code | Function | About |
| ---- | -------- | ----- |
| 0x01 | void* mem_alloc(size_t size); | Allocates at least size bytes, rounded to MEM_BLOCK_SIZE. Returns pointer to the allocated block or nullptr for error |
| 0x02 | int mem_free(void* ptr); | Frees memory pointed by ptr. Returns 0 if everything is good. Behaves undefined if passed argument isn't valid pointer. |
| 0x11 | int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg); | Starts thread on start_routine with arguments stored in arg. If everything is good, handle gets value of system handle of that process (TCB*) |
| 0x12 | int thread_exit(); | Kills current thread and changes context of processor. Returns 0 if everything is good, otherwise returns error code |
| 0x13 | void thread_dispatch(); | Potentially changes context of processor giving processor to another, or same thread |
| 0x14 | int thread_create_non_scheduler(thread_t* handle, void(*start_routine)(void*), void* arg); | Creates thread but doesn't store it in Scheduler. Used for Semaphores |
| 0x21 | int sem_open(sem_t* handle, unsigned init); | Creates Semaphore with initial value of init. If everything is good, handle gets the value of system handle for that particulat semaphore |
| 0x22 | int sem_close(sem_t handle); | Frees Semaphore identified by the given handle. All threads in semaphore's Wait Queue are deblocked |
| 0x23 | int sem_wait(sem_t handle); | Does wait operation on given semaphore. Returns 0 if everything is correct |
| 0x24 | int sem_signal(sem_t handle); | Does signal operation on given semaphore. Returns 0 if everything is correct |

Special function code is also 0x25 when processor enters the system mode.


[^1]: RISC-V ISA Assembly guide as well as other important staff are available in projects official documentation [here](https://riscv.org/technical/specifications/), ISA Specification
