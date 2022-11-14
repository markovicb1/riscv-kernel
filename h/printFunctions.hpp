//
// Created by os on 5/21/22.
//

#ifndef PROJECT_BASE_V1_1_PRINTFUNCTIONS_HPP
#define PROJECT_BASE_V1_1_PRINTFUNCTIONS_HPP
#include "../lib/console.h"
#include "../lib/hw.h"
//preuzet kod iz test primera

typedef unsigned long uint64;

//extern "C" uint64 copy_and_swap(uint64 &lock, uint64 expected, uint64 desired);

void printString(char const *string);

char* getString(char *buf, int max);

int stringToInt(const char *s);

void printInteger(int xx, int base=10, int sgn=0);

#endif //PROJECT_BASE_V1_1_PRINTFUNCTIONS_HPP
