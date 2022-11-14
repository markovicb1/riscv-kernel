# riscv-kernel // Multithreaded, time-sharing kernel for RISC-V ISA

## About the project

This project represents simple, yet fully functional kernel for RISC-V architecture. It is completely made from scratch, meaning it fully lies on the most basic concepts of C/C++ programming languages. Additionaly, no external (nor internal) library is used in creation process.

The whole project was sophomore year's biggest obstacle, which was covered on ***Operating Systems 1*** course at the School of Electrical Engineering @ University of Belgrade :serbia:

## Kernel overview

- Memory allocator
- Threads
- Semaphores
- HW and SW interupts
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
