//
// Created by os on 5/21/22.
//

#include "../h/printFunctions.hpp"
#include "../h/ABI.hpp"

uint64 lockPrint = 0;

//#define LOCK() while(copy_and_swap(lockPrint, 0, 1))
//#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    //LOCK();
    while (*string != '\0')
    {
        __putc(*string);
        string++;
    }
    //UNLOCK();
}

char* getString(char *buf, int max) {
    //LOCK();
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
        cc = __getc();
        if(cc < 1)
            break;
        c = cc;
        buf[i++] = c;
        if(c == '\n' || c == '\r')
            break;
    }
    buf[i] = '\0';

    //UNLOCK();
    return buf;
}

int stringToInt(const char *s) {
    int n;

    n = 0;
    while ('0' <= *s && *s <= '9')
        n = n * 10 + *s++ - '0';
    return n;
}

char digits[] = "0123456789ABCDEF";

void printInteger(int xx, int base, int sgn)
{
    //LOCK();
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    }

    i = 0;
    do{
        buf[i++] = digits[x % base];
    }while((x /= base) != 0);
    if(neg)
        buf[i++] = '-';

    while(--i >= 0)
        __putc(buf[i]);

    //UNLOCK();
}

/*void printString(char const *string)
{
    //uint64 sstatus = Machine::r_sstatus();
    //Machine::mc_sstatus(Machine::SSTATUS_SIE);
    while (*string != '\0')
    {
        __putc(*string);
        string++;
    }
    //Machine::ms_sstatus(sstatus & Machine::SSTATUS_SIE ? Machine::SSTATUS_SIE : 0);
}

void printInteger(uint64 integer)
{
    //uint64 sstatus = Machine::r_sstatus();
    //Machine::mc_sstatus(Machine::SSTATUS_SIE);
    static char digits[] = "0123456789";
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if (integer < 0)
    {
        neg = 1;
        x = -integer;
    } else
    {
        x = integer;
    }

    i = 0;
    do
    {
        buf[i++] = digits[x % 10];
    } while ((x /= 10) != 0);
    if (neg)
        buf[i++] = '-';

    while (--i >= 0) { __putc(buf[i]); }
    //Machine::ms_sstatus(sstatus & Machine::SSTATUS_SIE ? Machine::SSTATUS_SIE : 0);
}
*/