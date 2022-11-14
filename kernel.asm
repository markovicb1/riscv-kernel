
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00007117          	auipc	sp,0x7
    80000004:	3e813103          	ld	sp,1000(sp) # 800073e8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	72d020ef          	jal	ra,80002f48 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <_ZN7Machine14superVisorTrapEv>:
.global _ZN7Machine14superVisorTrapEv
.align 4
.type _ZN7Machine14superVisorTrapEv, @function
#_ZN7Machine14superVisorTrapEv
_ZN7Machine14superVisorTrapEv:
    addi sp, sp, -256
    80001000:	f0010113          	addi	sp,sp,-256
    #cuvanje svih registara
    .irp index,0,1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index,\index*8(sp)
    .endr
    80001004:	00013023          	sd	zero,0(sp)
    80001008:	00113423          	sd	ra,8(sp)
    8000100c:	00213823          	sd	sp,16(sp)
    80001010:	00313c23          	sd	gp,24(sp)
    80001014:	02413023          	sd	tp,32(sp)
    80001018:	02513423          	sd	t0,40(sp)
    8000101c:	02613823          	sd	t1,48(sp)
    80001020:	02713c23          	sd	t2,56(sp)
    80001024:	04813023          	sd	s0,64(sp)
    80001028:	04913423          	sd	s1,72(sp)
    8000102c:	04b13c23          	sd	a1,88(sp)
    80001030:	06c13023          	sd	a2,96(sp)
    80001034:	06d13423          	sd	a3,104(sp)
    80001038:	06e13823          	sd	a4,112(sp)
    8000103c:	06f13c23          	sd	a5,120(sp)
    80001040:	09013023          	sd	a6,128(sp)
    80001044:	09113423          	sd	a7,136(sp)
    80001048:	09213823          	sd	s2,144(sp)
    8000104c:	09313c23          	sd	s3,152(sp)
    80001050:	0b413023          	sd	s4,160(sp)
    80001054:	0b513423          	sd	s5,168(sp)
    80001058:	0b613823          	sd	s6,176(sp)
    8000105c:	0b713c23          	sd	s7,184(sp)
    80001060:	0d813023          	sd	s8,192(sp)
    80001064:	0d913423          	sd	s9,200(sp)
    80001068:	0da13823          	sd	s10,208(sp)
    8000106c:	0db13c23          	sd	s11,216(sp)
    80001070:	0fc13023          	sd	t3,224(sp)
    80001074:	0fd13423          	sd	t4,232(sp)
    80001078:	0fe13823          	sd	t5,240(sp)
    8000107c:	0ff13c23          	sd	t6,248(sp)

    call _ZN7Machine20handleSuperVisorTrapEv
    80001080:	581010ef          	jal	ra,80002e00 <_ZN7Machine20handleSuperVisorTrapEv>


    #skidanje sa steka svih registara, TREBA KORISTIIT SSCRAP JER GA PREVODILAC NE MENJA
    .irp index,0,1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,21
    ld x\index,\index*8(sp)
    .endr
    80001084:	00013003          	ld	zero,0(sp)
    80001088:	00813083          	ld	ra,8(sp)
    8000108c:	01013103          	ld	sp,16(sp)
    80001090:	01813183          	ld	gp,24(sp)
    80001094:	02013203          	ld	tp,32(sp)
    80001098:	02813283          	ld	t0,40(sp)
    8000109c:	03013303          	ld	t1,48(sp)
    800010a0:	03813383          	ld	t2,56(sp)
    800010a4:	04013403          	ld	s0,64(sp)
    800010a8:	04813483          	ld	s1,72(sp)
    800010ac:	05813583          	ld	a1,88(sp)
    800010b0:	06013603          	ld	a2,96(sp)
    800010b4:	06813683          	ld	a3,104(sp)
    800010b8:	07013703          	ld	a4,112(sp)
    800010bc:	07813783          	ld	a5,120(sp)
    800010c0:	08013803          	ld	a6,128(sp)
    800010c4:	08813883          	ld	a7,136(sp)
    800010c8:	09013903          	ld	s2,144(sp)
    800010cc:	09813983          	ld	s3,152(sp)
    800010d0:	0a013a03          	ld	s4,160(sp)
    800010d4:	0a813a83          	ld	s5,168(sp)
    800010d8:	0b013b03          	ld	s6,176(sp)
    800010dc:	0b813b83          	ld	s7,184(sp)
    800010e0:	0c013c03          	ld	s8,192(sp)
    800010e4:	0c813c83          	ld	s9,200(sp)
    800010e8:	0d013d03          	ld	s10,208(sp)
    800010ec:	0d813d83          	ld	s11,216(sp)
    800010f0:	0e013e03          	ld	t3,224(sp)
    800010f4:	0e813e83          	ld	t4,232(sp)
    800010f8:	0f013f03          	ld	t5,240(sp)
    800010fc:	0a813a83          	ld	s5,168(sp)

    addi sp, sp, 256
    80001100:	10010113          	addi	sp,sp,256
    80001104:	10200073          	sret
	...

0000000080001110 <_ZN3TCB13contextSwitchEPNS_13threadContextES1_>:
.global _ZN3TCB13contextSwitchEPNS_13threadContextES1_
.type _ZN3TCB13contextSwitchEPNS_13threadContextES1_, @function
_ZN3TCB13contextSwitchEPNS_13threadContextES1_:
    sd ra, 0 * 8(a0)
    80001110:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 1 * 8(a0)
    80001114:	00253423          	sd	sp,8(a0)
    #sada upisujemo vrednosti za newContext
    ld ra, 0 * 8(a1)
    80001118:	0005b083          	ld	ra,0(a1)
    ld sp, 1 * 8(a1)
    8000111c:	0085b103          	ld	sp,8(a1)
    ret
    80001120:	00008067          	ret

0000000080001124 <_Z9mem_allocm>:

inline size_t alignBlock(size_t sz){
    return (sz + MEM_BLOCK_SIZE - 1) & ~(MEM_BLOCK_SIZE - 1);
}

void* mem_alloc(size_t size){ //a0 je x10 a1 je x11 itd
    80001124:	ff010113          	addi	sp,sp,-16
    80001128:	00813423          	sd	s0,8(sp)
    8000112c:	01010413          	addi	s0,sp,16
    return (sz + MEM_BLOCK_SIZE - 1) & ~(MEM_BLOCK_SIZE - 1);
    80001130:	04f50513          	addi	a0,a0,79
    uint64 funcCode = 0x01;
    uint64 funcParam = alignBlock(size + sizeof(MemoryBlock))/MEM_BLOCK_SIZE; //ovde bi trebalo da se radi konverzija, mada sam ja to uradio u okviru ABI-a
    80001134:	00655513          	srli	a0,a0,0x6

    __asm__ volatile("mv a1, %[regA1]" : : [regA1] "rm"(funcParam)); //broj blokova
    80001138:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %[regA0]" : : [regA0] "rm"(funcCode)); //kod 0x01
    8000113c:	00100793          	li	a5,1
    80001140:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    80001144:	00000073          	ecall

    void* res;
    __asm__ volatile ("mv %[ime], x10" : [ime]"=r"(res));
    80001148:	00050513          	mv	a0,a0
    return res;
}
    8000114c:	00813403          	ld	s0,8(sp)
    80001150:	01010113          	addi	sp,sp,16
    80001154:	00008067          	ret

0000000080001158 <_Z8mem_freePv>:

int mem_free(void* ptr){
    80001158:	ff010113          	addi	sp,sp,-16
    8000115c:	00813423          	sd	s0,8(sp)
    80001160:	01010413          	addi	s0,sp,16
    uint64 funcCode = 0x02;
    __asm__ volatile("mv a1, %[regA1]" : : [regA1] "rm"(ptr)); //pokazivac na odg. blok
    80001164:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %[regA0]" : : [regA0] "rm"(funcCode)); //kod 0x02 za mem free
    80001168:	00200793          	li	a5,2
    8000116c:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    80001170:	00000073          	ecall

    int res;
    __asm__ volatile ("mv %[ime], x10" : [ime]"=r"(res));
    80001174:	00050513          	mv	a0,a0
    return res;
}
    80001178:	0005051b          	sext.w	a0,a0
    8000117c:	00813403          	ld	s0,8(sp)
    80001180:	01010113          	addi	sp,sp,16
    80001184:	00008067          	ret

0000000080001188 <_Z13thread_createPP3TCBPFvPvES2_>:
int thread_create(threadHandler::thread_t* handle, void(*start_routine)(void*),void* arg){
    80001188:	ff010113          	addi	sp,sp,-16
    8000118c:	00813423          	sd	s0,8(sp)
    80001190:	01010413          	addi	s0,sp,16
    uint64 funcCode = 0x11;
    __asm__ volatile("mv a3, %[regA3]" : : [regA3] "rm"(arg));
    80001194:	00060693          	mv	a3,a2
    __asm__ volatile("mv a2, %[regA2]" : : [regA2] "rm"(start_routine));
    80001198:	00058613          	mv	a2,a1
    __asm__ volatile("mv a1, %[regA1]" : : [regA1] "rm"(handle)); //rucka niti
    8000119c:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %[regA0]" : : [regA0] "rm"(funcCode)); //kod
    800011a0:	01100793          	li	a5,17
    800011a4:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    800011a8:	00000073          	ecall

    int res;
    __asm__ volatile ("mv %[ime], x10" : [ime]"=r"(res));
    800011ac:	00050513          	mv	a0,a0
    return res;
}
    800011b0:	0005051b          	sext.w	a0,a0
    800011b4:	00813403          	ld	s0,8(sp)
    800011b8:	01010113          	addi	sp,sp,16
    800011bc:	00008067          	ret

00000000800011c0 <_Z11thread_exitv>:
int thread_exit(){
    800011c0:	ff010113          	addi	sp,sp,-16
    800011c4:	00813423          	sd	s0,8(sp)
    800011c8:	01010413          	addi	s0,sp,16
    uint64 funcCode = 0x12;
    __asm__ volatile("mv a0, %[regA0]" : : [regA0] "rm"(funcCode)); //kod
    800011cc:	01200793          	li	a5,18
    800011d0:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    800011d4:	00000073          	ecall

    int res;
    __asm__ volatile ("mv %[ime], x10" : [ime]"=r"(res));
    800011d8:	00050513          	mv	a0,a0
    return res;
}
    800011dc:	0005051b          	sext.w	a0,a0
    800011e0:	00813403          	ld	s0,8(sp)
    800011e4:	01010113          	addi	sp,sp,16
    800011e8:	00008067          	ret

00000000800011ec <_Z15thread_dispatchv>:
void thread_dispatch(){
    800011ec:	ff010113          	addi	sp,sp,-16
    800011f0:	00813423          	sd	s0,8(sp)
    800011f4:	01010413          	addi	s0,sp,16
    uint64 funcCode = 0x13;
    __asm__ volatile("mv a0, %[regA0]" : : [regA0] "rm"(funcCode)); //kod
    800011f8:	01300793          	li	a5,19
    800011fc:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    80001200:	00000073          	ecall

    return;
}
    80001204:	00813403          	ld	s0,8(sp)
    80001208:	01010113          	addi	sp,sp,16
    8000120c:	00008067          	ret

0000000080001210 <_Z26thread_create_non_shedulerPP3TCBPFvPvES2_>:

int thread_create_non_sheduler(threadHandler::thread_t* handle, void(*start_routine)(void*),void* arg){
    80001210:	ff010113          	addi	sp,sp,-16
    80001214:	00813423          	sd	s0,8(sp)
    80001218:	01010413          	addi	s0,sp,16
    uint64 funcCode = 0x14;
    __asm__ volatile("mv a3, %[regA3]" : : [regA3] "rm"(arg));
    8000121c:	00060693          	mv	a3,a2
    __asm__ volatile("mv a2, %[regA2]" : : [regA2] "rm"(start_routine));
    80001220:	00058613          	mv	a2,a1
    __asm__ volatile("mv a1, %[regA1]" : : [regA1] "rm"(handle)); //rucka niti
    80001224:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %[regA0]" : : [regA0] "rm"(funcCode)); //kod
    80001228:	01400793          	li	a5,20
    8000122c:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    80001230:	00000073          	ecall

    int res;
    __asm__ volatile ("mv %[ime], x10" : [ime]"=r"(res));
    80001234:	00050513          	mv	a0,a0
    return res;
}
    80001238:	0005051b          	sext.w	a0,a0
    8000123c:	00813403          	ld	s0,8(sp)
    80001240:	01010113          	addi	sp,sp,16
    80001244:	00008067          	ret

0000000080001248 <_Z8sem_openPP10ksemaphorej>:

int sem_open(semaphoreHandler::sem_t* handle,uint init){
    80001248:	ff010113          	addi	sp,sp,-16
    8000124c:	00813423          	sd	s0,8(sp)
    80001250:	01010413          	addi	s0,sp,16
    uint64 funcCode = 0x21;
    __asm__ volatile("mv a2, %[regA2]" : : [regA2] "rm"(init));
    80001254:	00058613          	mv	a2,a1
    __asm__ volatile("mv a1, %[regA1]" : : [regA1] "rm"(handle)); //rucka semafora
    80001258:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %[regA0]" : : [regA0] "rm"(funcCode)); //kod
    8000125c:	02100793          	li	a5,33
    80001260:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    80001264:	00000073          	ecall

    int res;
    __asm__ volatile ("mv %[ime], x10" : [ime]"=r"(res));
    80001268:	00050513          	mv	a0,a0
    return res;
}
    8000126c:	0005051b          	sext.w	a0,a0
    80001270:	00813403          	ld	s0,8(sp)
    80001274:	01010113          	addi	sp,sp,16
    80001278:	00008067          	ret

000000008000127c <_Z9sem_closeP10ksemaphore>:

int sem_close(semaphoreHandler::sem_t handle){
    8000127c:	ff010113          	addi	sp,sp,-16
    80001280:	00813423          	sd	s0,8(sp)
    80001284:	01010413          	addi	s0,sp,16
    uint64 funcCode = 0x22;
    __asm__ volatile("mv a1, %[regA1]" : : [regA1] "rm"(handle)); //rucka semafora
    80001288:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %[regA0]" : : [regA0] "rm"(funcCode)); //kod
    8000128c:	02200793          	li	a5,34
    80001290:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    80001294:	00000073          	ecall

    int res;
    __asm__ volatile ("mv %[ime], x10" : [ime]"=r"(res));
    80001298:	00050513          	mv	a0,a0
    return res;
}
    8000129c:	0005051b          	sext.w	a0,a0
    800012a0:	00813403          	ld	s0,8(sp)
    800012a4:	01010113          	addi	sp,sp,16
    800012a8:	00008067          	ret

00000000800012ac <_Z8sem_waitP10ksemaphore>:

int sem_wait(semaphoreHandler::sem_t id){
    800012ac:	ff010113          	addi	sp,sp,-16
    800012b0:	00813423          	sd	s0,8(sp)
    800012b4:	01010413          	addi	s0,sp,16
    uint64 funcCode = 0x23;
    __asm__ volatile("mv a1, %[regA1]" : : [regA1] "rm"(id)); //rucka semafora
    800012b8:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %[regA0]" : : [regA0] "rm"(funcCode)); //kod
    800012bc:	02300793          	li	a5,35
    800012c0:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    800012c4:	00000073          	ecall

    int res;
    __asm__ volatile ("mv %[ime], x10" : [ime]"=r"(res));
    800012c8:	00050513          	mv	a0,a0
    return res;
}
    800012cc:	0005051b          	sext.w	a0,a0
    800012d0:	00813403          	ld	s0,8(sp)
    800012d4:	01010113          	addi	sp,sp,16
    800012d8:	00008067          	ret

00000000800012dc <_Z10sem_signalP10ksemaphore>:

int sem_signal(semaphoreHandler::sem_t id){
    800012dc:	ff010113          	addi	sp,sp,-16
    800012e0:	00813423          	sd	s0,8(sp)
    800012e4:	01010413          	addi	s0,sp,16
    uint64 funcCode = 0x24;
    __asm__ volatile("mv a1, %[regA1]" : : [regA1] "rm"(id)); //rucka semafora
    800012e8:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %[regA0]" : : [regA0] "rm"(funcCode)); //kod
    800012ec:	02400793          	li	a5,36
    800012f0:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    800012f4:	00000073          	ecall

    int res;
    __asm__ volatile ("mv %[ime], x10" : [ime]"=r"(res));
    800012f8:	00050513          	mv	a0,a0
    return res;
    800012fc:	0005051b          	sext.w	a0,a0
    80001300:	00813403          	ld	s0,8(sp)
    80001304:	01010113          	addi	sp,sp,16
    80001308:	00008067          	ret

000000008000130c <_ZN10ksemaphore15createSemaphoreEi>:
// Created by os on 6/28/22.
//

#include "../h/ksemaphore.hpp"

ksemaphore *ksemaphore::createSemaphore(int val) {
    8000130c:	fe010113          	addi	sp,sp,-32
    80001310:	00113c23          	sd	ra,24(sp)
    80001314:	00813823          	sd	s0,16(sp)
    80001318:	00913423          	sd	s1,8(sp)
    8000131c:	02010413          	addi	s0,sp,32
    80001320:	00050493          	mv	s1,a0
    static ksemaphore* createSemaphore(int val);
    void signal();
    void wait();

    void* operator new(size_t size){
        return MemoryAllocator::mem_alloc(alignBlock(size + sizeof(MemoryBlock))/MEM_BLOCK_SIZE);
    80001324:	00100513          	li	a0,1
    80001328:	00001097          	auipc	ra,0x1
    8000132c:	6a4080e7          	jalr	1700(ra) # 800029cc <_ZN15MemoryAllocator9mem_allocEm>
    }
    void operator delete[](void* ptr){
        MemoryAllocator::mem_free(ptr);
    }

    List() : head(0), tail(0) {}
    80001330:	00053423          	sd	zero,8(a0)
    80001334:	00053823          	sd	zero,16(a0)
private:
    static inline size_t alignBlock(size_t sz){
        return (sz + MEM_BLOCK_SIZE - 1) & ~(MEM_BLOCK_SIZE - 1);
    }
    ksemaphore(int val){
        if(val < 0)
    80001338:	0004ce63          	bltz	s1,80001354 <_ZN10ksemaphore15createSemaphoreEi+0x48>
            value = 0;
        else
            value = val;
    8000133c:	00952023          	sw	s1,0(a0)
    ksemaphore* sem = new ksemaphore(val);
    return sem;
}
    80001340:	01813083          	ld	ra,24(sp)
    80001344:	01013403          	ld	s0,16(sp)
    80001348:	00813483          	ld	s1,8(sp)
    8000134c:	02010113          	addi	sp,sp,32
    80001350:	00008067          	ret
            value = 0;
    80001354:	00052023          	sw	zero,0(a0)
    80001358:	fe9ff06f          	j	80001340 <_ZN10ksemaphore15createSemaphoreEi+0x34>

000000008000135c <_ZN10ksemaphore5blockEv>:

void ksemaphore::block() {
    8000135c:	fe010113          	addi	sp,sp,-32
    80001360:	00113c23          	sd	ra,24(sp)
    80001364:	00813823          	sd	s0,16(sp)
    80001368:	00913423          	sd	s1,8(sp)
    8000136c:	01213023          	sd	s2,0(sp)
    80001370:	02010413          	addi	s0,sp,32
    80001374:	00050493          	mv	s1,a0
    blockedThreads.addLast(TCB::running);
    80001378:	00006797          	auipc	a5,0x6
    8000137c:	0787b783          	ld	a5,120(a5) # 800073f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001380:	0007b903          	ld	s2,0(a5)
    }

    void addLast(T *data)
    {
        //Elem *elem = new Elem(data, 0);
        Elem* elem = (Elem*)MemoryAllocator::mem_alloc(alignBlock(sizeof(Elem) + sizeof(MemoryBlock))/MEM_BLOCK_SIZE);
    80001384:	00100513          	li	a0,1
    80001388:	00001097          	auipc	ra,0x1
    8000138c:	644080e7          	jalr	1604(ra) # 800029cc <_ZN15MemoryAllocator9mem_allocEm>
        elem->data = data;
    80001390:	01253023          	sd	s2,0(a0)
        elem->next = nullptr;
    80001394:	00053423          	sd	zero,8(a0)
        if (tail)
    80001398:	0104b783          	ld	a5,16(s1)
    8000139c:	02078663          	beqz	a5,800013c8 <_ZN10ksemaphore5blockEv+0x6c>
        {
            tail->next = elem;
    800013a0:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    800013a4:	00a4b823          	sd	a0,16(s1)
    TCB::yield();
    800013a8:	00001097          	auipc	ra,0x1
    800013ac:	1f4080e7          	jalr	500(ra) # 8000259c <_ZN3TCB5yieldEv>
}
    800013b0:	01813083          	ld	ra,24(sp)
    800013b4:	01013403          	ld	s0,16(sp)
    800013b8:	00813483          	ld	s1,8(sp)
    800013bc:	00013903          	ld	s2,0(sp)
    800013c0:	02010113          	addi	sp,sp,32
    800013c4:	00008067          	ret
        } else
        {
            head = tail = elem;
    800013c8:	00a4b823          	sd	a0,16(s1)
    800013cc:	00a4b423          	sd	a0,8(s1)
    800013d0:	fd9ff06f          	j	800013a8 <_ZN10ksemaphore5blockEv+0x4c>

00000000800013d4 <_ZN10ksemaphore7unblockEv>:

void ksemaphore::unblock() {
    800013d4:	fe010113          	addi	sp,sp,-32
    800013d8:	00113c23          	sd	ra,24(sp)
    800013dc:	00813823          	sd	s0,16(sp)
    800013e0:	00913423          	sd	s1,8(sp)
    800013e4:	02010413          	addi	s0,sp,32
    800013e8:	00050793          	mv	a5,a0
        }
    }

    T *removeFirst()
    {
        if (!head) { return 0; }
    800013ec:	00853503          	ld	a0,8(a0)
    800013f0:	04050263          	beqz	a0,80001434 <_ZN10ksemaphore7unblockEv+0x60>

        Elem *elem = head;
        head = head->next;
    800013f4:	00853703          	ld	a4,8(a0)
    800013f8:	00e7b423          	sd	a4,8(a5)
        if (!head) { tail = 0; }
    800013fc:	02070863          	beqz	a4,8000142c <_ZN10ksemaphore7unblockEv+0x58>

        T *ret = elem->data;
    80001400:	00053483          	ld	s1,0(a0)
        MemoryAllocator::mem_free(elem);
    80001404:	00001097          	auipc	ra,0x1
    80001408:	5f0080e7          	jalr	1520(ra) # 800029f4 <_ZN15MemoryAllocator8mem_freeEPv>
    Scheduler::put(blockedThreads.removeFirst());
    8000140c:	00048513          	mv	a0,s1
    80001410:	00001097          	auipc	ra,0x1
    80001414:	a8c080e7          	jalr	-1396(ra) # 80001e9c <_ZN9Scheduler3putEP3TCB>
}
    80001418:	01813083          	ld	ra,24(sp)
    8000141c:	01013403          	ld	s0,16(sp)
    80001420:	00813483          	ld	s1,8(sp)
    80001424:	02010113          	addi	sp,sp,32
    80001428:	00008067          	ret
        if (!head) { tail = 0; }
    8000142c:	0007b823          	sd	zero,16(a5)
    80001430:	fd1ff06f          	j	80001400 <_ZN10ksemaphore7unblockEv+0x2c>
        if (!head) { return 0; }
    80001434:	00050493          	mv	s1,a0
    80001438:	fd5ff06f          	j	8000140c <_ZN10ksemaphore7unblockEv+0x38>

000000008000143c <_ZN10ksemaphore4waitEv>:

void ksemaphore::wait() {
value--;
    8000143c:	00052783          	lw	a5,0(a0)
    80001440:	fff7879b          	addiw	a5,a5,-1
    80001444:	00f52023          	sw	a5,0(a0)
if(value < 0)
    80001448:	02079713          	slli	a4,a5,0x20
    8000144c:	00074463          	bltz	a4,80001454 <_ZN10ksemaphore4waitEv+0x18>
    80001450:	00008067          	ret
void ksemaphore::wait() {
    80001454:	ff010113          	addi	sp,sp,-16
    80001458:	00113423          	sd	ra,8(sp)
    8000145c:	00813023          	sd	s0,0(sp)
    80001460:	01010413          	addi	s0,sp,16
    block();
    80001464:	00000097          	auipc	ra,0x0
    80001468:	ef8080e7          	jalr	-264(ra) # 8000135c <_ZN10ksemaphore5blockEv>
}
    8000146c:	00813083          	ld	ra,8(sp)
    80001470:	00013403          	ld	s0,0(sp)
    80001474:	01010113          	addi	sp,sp,16
    80001478:	00008067          	ret

000000008000147c <_ZN10ksemaphore6signalEv>:

void ksemaphore::signal() {
value++;
    8000147c:	00052783          	lw	a5,0(a0)
    80001480:	0017879b          	addiw	a5,a5,1
    80001484:	00f52023          	sw	a5,0(a0)
if(value < 0)
    80001488:	02079713          	slli	a4,a5,0x20
    8000148c:	00074463          	bltz	a4,80001494 <_ZN10ksemaphore6signalEv+0x18>
    80001490:	00008067          	ret
void ksemaphore::signal() {
    80001494:	ff010113          	addi	sp,sp,-16
    80001498:	00113423          	sd	ra,8(sp)
    8000149c:	00813023          	sd	s0,0(sp)
    800014a0:	01010413          	addi	s0,sp,16
    unblock();
    800014a4:	00000097          	auipc	ra,0x0
    800014a8:	f30080e7          	jalr	-208(ra) # 800013d4 <_ZN10ksemaphore7unblockEv>
}
    800014ac:	00813083          	ld	ra,8(sp)
    800014b0:	00013403          	ld	s0,0(sp)
    800014b4:	01010113          	addi	sp,sp,16
    800014b8:	00008067          	ret

00000000800014bc <_ZN10ksemaphore10unblockAllEv>:

void ksemaphore::unblockAll() {
    800014bc:	fe010113          	addi	sp,sp,-32
    800014c0:	00113c23          	sd	ra,24(sp)
    800014c4:	00813823          	sd	s0,16(sp)
    800014c8:	00913423          	sd	s1,8(sp)
    800014cc:	01213023          	sd	s2,0(sp)
    800014d0:	02010413          	addi	s0,sp,32
    800014d4:	00050493          	mv	s1,a0
    800014d8:	0180006f          	j	800014f0 <_ZN10ksemaphore10unblockAllEv+0x34>
        if (!head) { tail = 0; }
    800014dc:	0004b823          	sd	zero,16(s1)
        T *ret = elem->data;
    800014e0:	00053903          	ld	s2,0(a0)
        MemoryAllocator::mem_free(elem);
    800014e4:	00001097          	auipc	ra,0x1
    800014e8:	510080e7          	jalr	1296(ra) # 800029f4 <_ZN15MemoryAllocator8mem_freeEPv>
    while (!blockedThreads.removeFirst());
    800014ec:	00091e63          	bnez	s2,80001508 <_ZN10ksemaphore10unblockAllEv+0x4c>
        if (!head) { return 0; }
    800014f0:	0084b503          	ld	a0,8(s1)
    800014f4:	fe050ee3          	beqz	a0,800014f0 <_ZN10ksemaphore10unblockAllEv+0x34>
        head = head->next;
    800014f8:	00853783          	ld	a5,8(a0)
    800014fc:	00f4b423          	sd	a5,8(s1)
        if (!head) { tail = 0; }
    80001500:	fe0790e3          	bnez	a5,800014e0 <_ZN10ksemaphore10unblockAllEv+0x24>
    80001504:	fd9ff06f          	j	800014dc <_ZN10ksemaphore10unblockAllEv+0x20>
}
    80001508:	01813083          	ld	ra,24(sp)
    8000150c:	01013403          	ld	s0,16(sp)
    80001510:	00813483          	ld	s1,8(sp)
    80001514:	00013903          	ld	s2,0(sp)
    80001518:	02010113          	addi	sp,sp,32
    8000151c:	00008067          	ret

0000000080001520 <_Z9fibonaccim>:
bool finishedA = false;
bool finishedB = false;
bool finishedC = false;
bool finishedD = false;

uint64 fibonacci(uint64 n) {
    80001520:	fe010113          	addi	sp,sp,-32
    80001524:	00113c23          	sd	ra,24(sp)
    80001528:	00813823          	sd	s0,16(sp)
    8000152c:	00913423          	sd	s1,8(sp)
    80001530:	01213023          	sd	s2,0(sp)
    80001534:	02010413          	addi	s0,sp,32
    80001538:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    8000153c:	00100793          	li	a5,1
    80001540:	02a7f863          	bgeu	a5,a0,80001570 <_Z9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80001544:	00a00793          	li	a5,10
    80001548:	02f577b3          	remu	a5,a0,a5
    8000154c:	02078e63          	beqz	a5,80001588 <_Z9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80001550:	fff48513          	addi	a0,s1,-1
    80001554:	00000097          	auipc	ra,0x0
    80001558:	fcc080e7          	jalr	-52(ra) # 80001520 <_Z9fibonaccim>
    8000155c:	00050913          	mv	s2,a0
    80001560:	ffe48513          	addi	a0,s1,-2
    80001564:	00000097          	auipc	ra,0x0
    80001568:	fbc080e7          	jalr	-68(ra) # 80001520 <_Z9fibonaccim>
    8000156c:	00a90533          	add	a0,s2,a0
}
    80001570:	01813083          	ld	ra,24(sp)
    80001574:	01013403          	ld	s0,16(sp)
    80001578:	00813483          	ld	s1,8(sp)
    8000157c:	00013903          	ld	s2,0(sp)
    80001580:	02010113          	addi	sp,sp,32
    80001584:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80001588:	00000097          	auipc	ra,0x0
    8000158c:	c64080e7          	jalr	-924(ra) # 800011ec <_Z15thread_dispatchv>
    80001590:	fc1ff06f          	j	80001550 <_Z9fibonaccim+0x30>

0000000080001594 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80001594:	fe010113          	addi	sp,sp,-32
    80001598:	00113c23          	sd	ra,24(sp)
    8000159c:	00813823          	sd	s0,16(sp)
    800015a0:	00913423          	sd	s1,8(sp)
    800015a4:	01213023          	sd	s2,0(sp)
    800015a8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800015ac:	00000913          	li	s2,0
    800015b0:	0380006f          	j	800015e8 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInteger(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800015b4:	00000097          	auipc	ra,0x0
    800015b8:	c38080e7          	jalr	-968(ra) # 800011ec <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800015bc:	00148493          	addi	s1,s1,1
    800015c0:	000027b7          	lui	a5,0x2
    800015c4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800015c8:	0097ee63          	bltu	a5,s1,800015e4 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800015cc:	00000713          	li	a4,0
    800015d0:	000077b7          	lui	a5,0x7
    800015d4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800015d8:	fce7eee3          	bltu	a5,a4,800015b4 <_ZN7WorkerA11workerBodyAEPv+0x20>
    800015dc:	00170713          	addi	a4,a4,1
    800015e0:	ff1ff06f          	j	800015d0 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800015e4:	00190913          	addi	s2,s2,1
    800015e8:	00900793          	li	a5,9
    800015ec:	0527e063          	bltu	a5,s2,8000162c <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInteger(i); printString("\n");
    800015f0:	00005517          	auipc	a0,0x5
    800015f4:	a3050513          	addi	a0,a0,-1488 # 80006020 <CONSOLE_STATUS+0x10>
    800015f8:	00001097          	auipc	ra,0x1
    800015fc:	ce0080e7          	jalr	-800(ra) # 800022d8 <_Z11printStringPKc>
    80001600:	00000613          	li	a2,0
    80001604:	00a00593          	li	a1,10
    80001608:	0009051b          	sext.w	a0,s2
    8000160c:	00001097          	auipc	ra,0x1
    80001610:	df4080e7          	jalr	-524(ra) # 80002400 <_Z12printIntegeriii>
    80001614:	00005517          	auipc	a0,0x5
    80001618:	c8c50513          	addi	a0,a0,-884 # 800062a0 <CONSOLE_STATUS+0x290>
    8000161c:	00001097          	auipc	ra,0x1
    80001620:	cbc080e7          	jalr	-836(ra) # 800022d8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80001624:	00000493          	li	s1,0
    80001628:	f99ff06f          	j	800015c0 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    8000162c:	00005517          	auipc	a0,0x5
    80001630:	9fc50513          	addi	a0,a0,-1540 # 80006028 <CONSOLE_STATUS+0x18>
    80001634:	00001097          	auipc	ra,0x1
    80001638:	ca4080e7          	jalr	-860(ra) # 800022d8 <_Z11printStringPKc>
    finishedA = true;
    8000163c:	00100793          	li	a5,1
    80001640:	00006717          	auipc	a4,0x6
    80001644:	e0f70823          	sb	a5,-496(a4) # 80007450 <finishedA>
}
    80001648:	01813083          	ld	ra,24(sp)
    8000164c:	01013403          	ld	s0,16(sp)
    80001650:	00813483          	ld	s1,8(sp)
    80001654:	00013903          	ld	s2,0(sp)
    80001658:	02010113          	addi	sp,sp,32
    8000165c:	00008067          	ret

0000000080001660 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80001660:	fe010113          	addi	sp,sp,-32
    80001664:	00113c23          	sd	ra,24(sp)
    80001668:	00813823          	sd	s0,16(sp)
    8000166c:	00913423          	sd	s1,8(sp)
    80001670:	01213023          	sd	s2,0(sp)
    80001674:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80001678:	00000913          	li	s2,0
    8000167c:	0380006f          	j	800016b4 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInteger(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80001680:	00000097          	auipc	ra,0x0
    80001684:	b6c080e7          	jalr	-1172(ra) # 800011ec <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80001688:	00148493          	addi	s1,s1,1
    8000168c:	000027b7          	lui	a5,0x2
    80001690:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80001694:	0097ee63          	bltu	a5,s1,800016b0 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80001698:	00000713          	li	a4,0
    8000169c:	000077b7          	lui	a5,0x7
    800016a0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800016a4:	fce7eee3          	bltu	a5,a4,80001680 <_ZN7WorkerB11workerBodyBEPv+0x20>
    800016a8:	00170713          	addi	a4,a4,1
    800016ac:	ff1ff06f          	j	8000169c <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    800016b0:	00190913          	addi	s2,s2,1
    800016b4:	00f00793          	li	a5,15
    800016b8:	0527e063          	bltu	a5,s2,800016f8 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInteger(i); printString("\n");
    800016bc:	00005517          	auipc	a0,0x5
    800016c0:	97c50513          	addi	a0,a0,-1668 # 80006038 <CONSOLE_STATUS+0x28>
    800016c4:	00001097          	auipc	ra,0x1
    800016c8:	c14080e7          	jalr	-1004(ra) # 800022d8 <_Z11printStringPKc>
    800016cc:	00000613          	li	a2,0
    800016d0:	00a00593          	li	a1,10
    800016d4:	0009051b          	sext.w	a0,s2
    800016d8:	00001097          	auipc	ra,0x1
    800016dc:	d28080e7          	jalr	-728(ra) # 80002400 <_Z12printIntegeriii>
    800016e0:	00005517          	auipc	a0,0x5
    800016e4:	bc050513          	addi	a0,a0,-1088 # 800062a0 <CONSOLE_STATUS+0x290>
    800016e8:	00001097          	auipc	ra,0x1
    800016ec:	bf0080e7          	jalr	-1040(ra) # 800022d8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800016f0:	00000493          	li	s1,0
    800016f4:	f99ff06f          	j	8000168c <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    800016f8:	00005517          	auipc	a0,0x5
    800016fc:	94850513          	addi	a0,a0,-1720 # 80006040 <CONSOLE_STATUS+0x30>
    80001700:	00001097          	auipc	ra,0x1
    80001704:	bd8080e7          	jalr	-1064(ra) # 800022d8 <_Z11printStringPKc>
    finishedB = true;
    80001708:	00100793          	li	a5,1
    8000170c:	00006717          	auipc	a4,0x6
    80001710:	d4f702a3          	sb	a5,-699(a4) # 80007451 <finishedB>
    thread_dispatch();
    80001714:	00000097          	auipc	ra,0x0
    80001718:	ad8080e7          	jalr	-1320(ra) # 800011ec <_Z15thread_dispatchv>
}
    8000171c:	01813083          	ld	ra,24(sp)
    80001720:	01013403          	ld	s0,16(sp)
    80001724:	00813483          	ld	s1,8(sp)
    80001728:	00013903          	ld	s2,0(sp)
    8000172c:	02010113          	addi	sp,sp,32
    80001730:	00008067          	ret

0000000080001734 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80001734:	fe010113          	addi	sp,sp,-32
    80001738:	00113c23          	sd	ra,24(sp)
    8000173c:	00813823          	sd	s0,16(sp)
    80001740:	00913423          	sd	s1,8(sp)
    80001744:	01213023          	sd	s2,0(sp)
    80001748:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    8000174c:	00000493          	li	s1,0
    80001750:	0400006f          	j	80001790 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInteger(i); printString("\n");
    80001754:	00005517          	auipc	a0,0x5
    80001758:	8fc50513          	addi	a0,a0,-1796 # 80006050 <CONSOLE_STATUS+0x40>
    8000175c:	00001097          	auipc	ra,0x1
    80001760:	b7c080e7          	jalr	-1156(ra) # 800022d8 <_Z11printStringPKc>
    80001764:	00000613          	li	a2,0
    80001768:	00a00593          	li	a1,10
    8000176c:	00048513          	mv	a0,s1
    80001770:	00001097          	auipc	ra,0x1
    80001774:	c90080e7          	jalr	-880(ra) # 80002400 <_Z12printIntegeriii>
    80001778:	00005517          	auipc	a0,0x5
    8000177c:	b2850513          	addi	a0,a0,-1240 # 800062a0 <CONSOLE_STATUS+0x290>
    80001780:	00001097          	auipc	ra,0x1
    80001784:	b58080e7          	jalr	-1192(ra) # 800022d8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80001788:	0014849b          	addiw	s1,s1,1
    8000178c:	0ff4f493          	andi	s1,s1,255
    80001790:	00200793          	li	a5,2
    80001794:	fc97f0e3          	bgeu	a5,s1,80001754 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80001798:	00005517          	auipc	a0,0x5
    8000179c:	8c050513          	addi	a0,a0,-1856 # 80006058 <CONSOLE_STATUS+0x48>
    800017a0:	00001097          	auipc	ra,0x1
    800017a4:	b38080e7          	jalr	-1224(ra) # 800022d8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800017a8:	00700313          	li	t1,7
    thread_dispatch();
    800017ac:	00000097          	auipc	ra,0x0
    800017b0:	a40080e7          	jalr	-1472(ra) # 800011ec <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800017b4:	00030913          	mv	s2,t1

    printString("C: t1="); printInteger(t1); printString("\n");
    800017b8:	00005517          	auipc	a0,0x5
    800017bc:	8b050513          	addi	a0,a0,-1872 # 80006068 <CONSOLE_STATUS+0x58>
    800017c0:	00001097          	auipc	ra,0x1
    800017c4:	b18080e7          	jalr	-1256(ra) # 800022d8 <_Z11printStringPKc>
    800017c8:	00000613          	li	a2,0
    800017cc:	00a00593          	li	a1,10
    800017d0:	0009051b          	sext.w	a0,s2
    800017d4:	00001097          	auipc	ra,0x1
    800017d8:	c2c080e7          	jalr	-980(ra) # 80002400 <_Z12printIntegeriii>
    800017dc:	00005517          	auipc	a0,0x5
    800017e0:	ac450513          	addi	a0,a0,-1340 # 800062a0 <CONSOLE_STATUS+0x290>
    800017e4:	00001097          	auipc	ra,0x1
    800017e8:	af4080e7          	jalr	-1292(ra) # 800022d8 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    800017ec:	00c00513          	li	a0,12
    800017f0:	00000097          	auipc	ra,0x0
    800017f4:	d30080e7          	jalr	-720(ra) # 80001520 <_Z9fibonaccim>
    800017f8:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInteger(result); printString("\n");
    800017fc:	00005517          	auipc	a0,0x5
    80001800:	87450513          	addi	a0,a0,-1932 # 80006070 <CONSOLE_STATUS+0x60>
    80001804:	00001097          	auipc	ra,0x1
    80001808:	ad4080e7          	jalr	-1324(ra) # 800022d8 <_Z11printStringPKc>
    8000180c:	00000613          	li	a2,0
    80001810:	00a00593          	li	a1,10
    80001814:	0009051b          	sext.w	a0,s2
    80001818:	00001097          	auipc	ra,0x1
    8000181c:	be8080e7          	jalr	-1048(ra) # 80002400 <_Z12printIntegeriii>
    80001820:	00005517          	auipc	a0,0x5
    80001824:	a8050513          	addi	a0,a0,-1408 # 800062a0 <CONSOLE_STATUS+0x290>
    80001828:	00001097          	auipc	ra,0x1
    8000182c:	ab0080e7          	jalr	-1360(ra) # 800022d8 <_Z11printStringPKc>
    80001830:	0400006f          	j	80001870 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInteger(i); printString("\n");
    80001834:	00005517          	auipc	a0,0x5
    80001838:	81c50513          	addi	a0,a0,-2020 # 80006050 <CONSOLE_STATUS+0x40>
    8000183c:	00001097          	auipc	ra,0x1
    80001840:	a9c080e7          	jalr	-1380(ra) # 800022d8 <_Z11printStringPKc>
    80001844:	00000613          	li	a2,0
    80001848:	00a00593          	li	a1,10
    8000184c:	00048513          	mv	a0,s1
    80001850:	00001097          	auipc	ra,0x1
    80001854:	bb0080e7          	jalr	-1104(ra) # 80002400 <_Z12printIntegeriii>
    80001858:	00005517          	auipc	a0,0x5
    8000185c:	a4850513          	addi	a0,a0,-1464 # 800062a0 <CONSOLE_STATUS+0x290>
    80001860:	00001097          	auipc	ra,0x1
    80001864:	a78080e7          	jalr	-1416(ra) # 800022d8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80001868:	0014849b          	addiw	s1,s1,1
    8000186c:	0ff4f493          	andi	s1,s1,255
    80001870:	00500793          	li	a5,5
    80001874:	fc97f0e3          	bgeu	a5,s1,80001834 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    80001878:	00004517          	auipc	a0,0x4
    8000187c:	7b050513          	addi	a0,a0,1968 # 80006028 <CONSOLE_STATUS+0x18>
    80001880:	00001097          	auipc	ra,0x1
    80001884:	a58080e7          	jalr	-1448(ra) # 800022d8 <_Z11printStringPKc>
    finishedC = true;
    80001888:	00100793          	li	a5,1
    8000188c:	00006717          	auipc	a4,0x6
    80001890:	bcf70323          	sb	a5,-1082(a4) # 80007452 <finishedC>
    thread_dispatch();
    80001894:	00000097          	auipc	ra,0x0
    80001898:	958080e7          	jalr	-1704(ra) # 800011ec <_Z15thread_dispatchv>
}
    8000189c:	01813083          	ld	ra,24(sp)
    800018a0:	01013403          	ld	s0,16(sp)
    800018a4:	00813483          	ld	s1,8(sp)
    800018a8:	00013903          	ld	s2,0(sp)
    800018ac:	02010113          	addi	sp,sp,32
    800018b0:	00008067          	ret

00000000800018b4 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    800018b4:	fe010113          	addi	sp,sp,-32
    800018b8:	00113c23          	sd	ra,24(sp)
    800018bc:	00813823          	sd	s0,16(sp)
    800018c0:	00913423          	sd	s1,8(sp)
    800018c4:	01213023          	sd	s2,0(sp)
    800018c8:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800018cc:	00a00493          	li	s1,10
    800018d0:	0400006f          	j	80001910 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInteger(i); printString("\n");
    800018d4:	00004517          	auipc	a0,0x4
    800018d8:	7ac50513          	addi	a0,a0,1964 # 80006080 <CONSOLE_STATUS+0x70>
    800018dc:	00001097          	auipc	ra,0x1
    800018e0:	9fc080e7          	jalr	-1540(ra) # 800022d8 <_Z11printStringPKc>
    800018e4:	00000613          	li	a2,0
    800018e8:	00a00593          	li	a1,10
    800018ec:	00048513          	mv	a0,s1
    800018f0:	00001097          	auipc	ra,0x1
    800018f4:	b10080e7          	jalr	-1264(ra) # 80002400 <_Z12printIntegeriii>
    800018f8:	00005517          	auipc	a0,0x5
    800018fc:	9a850513          	addi	a0,a0,-1624 # 800062a0 <CONSOLE_STATUS+0x290>
    80001900:	00001097          	auipc	ra,0x1
    80001904:	9d8080e7          	jalr	-1576(ra) # 800022d8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80001908:	0014849b          	addiw	s1,s1,1
    8000190c:	0ff4f493          	andi	s1,s1,255
    80001910:	00c00793          	li	a5,12
    80001914:	fc97f0e3          	bgeu	a5,s1,800018d4 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80001918:	00004517          	auipc	a0,0x4
    8000191c:	77050513          	addi	a0,a0,1904 # 80006088 <CONSOLE_STATUS+0x78>
    80001920:	00001097          	auipc	ra,0x1
    80001924:	9b8080e7          	jalr	-1608(ra) # 800022d8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80001928:	00500313          	li	t1,5
    thread_dispatch();
    8000192c:	00000097          	auipc	ra,0x0
    80001930:	8c0080e7          	jalr	-1856(ra) # 800011ec <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80001934:	01000513          	li	a0,16
    80001938:	00000097          	auipc	ra,0x0
    8000193c:	be8080e7          	jalr	-1048(ra) # 80001520 <_Z9fibonaccim>
    80001940:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInteger(result); printString("\n");
    80001944:	00004517          	auipc	a0,0x4
    80001948:	75450513          	addi	a0,a0,1876 # 80006098 <CONSOLE_STATUS+0x88>
    8000194c:	00001097          	auipc	ra,0x1
    80001950:	98c080e7          	jalr	-1652(ra) # 800022d8 <_Z11printStringPKc>
    80001954:	00000613          	li	a2,0
    80001958:	00a00593          	li	a1,10
    8000195c:	0009051b          	sext.w	a0,s2
    80001960:	00001097          	auipc	ra,0x1
    80001964:	aa0080e7          	jalr	-1376(ra) # 80002400 <_Z12printIntegeriii>
    80001968:	00005517          	auipc	a0,0x5
    8000196c:	93850513          	addi	a0,a0,-1736 # 800062a0 <CONSOLE_STATUS+0x290>
    80001970:	00001097          	auipc	ra,0x1
    80001974:	968080e7          	jalr	-1688(ra) # 800022d8 <_Z11printStringPKc>
    80001978:	0400006f          	j	800019b8 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInteger(i); printString("\n");
    8000197c:	00004517          	auipc	a0,0x4
    80001980:	70450513          	addi	a0,a0,1796 # 80006080 <CONSOLE_STATUS+0x70>
    80001984:	00001097          	auipc	ra,0x1
    80001988:	954080e7          	jalr	-1708(ra) # 800022d8 <_Z11printStringPKc>
    8000198c:	00000613          	li	a2,0
    80001990:	00a00593          	li	a1,10
    80001994:	00048513          	mv	a0,s1
    80001998:	00001097          	auipc	ra,0x1
    8000199c:	a68080e7          	jalr	-1432(ra) # 80002400 <_Z12printIntegeriii>
    800019a0:	00005517          	auipc	a0,0x5
    800019a4:	90050513          	addi	a0,a0,-1792 # 800062a0 <CONSOLE_STATUS+0x290>
    800019a8:	00001097          	auipc	ra,0x1
    800019ac:	930080e7          	jalr	-1744(ra) # 800022d8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800019b0:	0014849b          	addiw	s1,s1,1
    800019b4:	0ff4f493          	andi	s1,s1,255
    800019b8:	00f00793          	li	a5,15
    800019bc:	fc97f0e3          	bgeu	a5,s1,8000197c <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    800019c0:	00004517          	auipc	a0,0x4
    800019c4:	6e850513          	addi	a0,a0,1768 # 800060a8 <CONSOLE_STATUS+0x98>
    800019c8:	00001097          	auipc	ra,0x1
    800019cc:	910080e7          	jalr	-1776(ra) # 800022d8 <_Z11printStringPKc>
    finishedD = true;
    800019d0:	00100793          	li	a5,1
    800019d4:	00006717          	auipc	a4,0x6
    800019d8:	a6f70fa3          	sb	a5,-1409(a4) # 80007453 <finishedD>
    thread_dispatch();
    800019dc:	00000097          	auipc	ra,0x0
    800019e0:	810080e7          	jalr	-2032(ra) # 800011ec <_Z15thread_dispatchv>
}
    800019e4:	01813083          	ld	ra,24(sp)
    800019e8:	01013403          	ld	s0,16(sp)
    800019ec:	00813483          	ld	s1,8(sp)
    800019f0:	00013903          	ld	s2,0(sp)
    800019f4:	02010113          	addi	sp,sp,32
    800019f8:	00008067          	ret

00000000800019fc <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    800019fc:	fc010113          	addi	sp,sp,-64
    80001a00:	02113c23          	sd	ra,56(sp)
    80001a04:	02813823          	sd	s0,48(sp)
    80001a08:	02913423          	sd	s1,40(sp)
    80001a0c:	03213023          	sd	s2,32(sp)
    80001a10:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80001a14:	01000513          	li	a0,16
    80001a18:	00000097          	auipc	ra,0x0
    80001a1c:	538080e7          	jalr	1336(ra) # 80001f50 <_Znwm>
    80001a20:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80001a24:	00000097          	auipc	ra,0x0
    80001a28:	748080e7          	jalr	1864(ra) # 8000216c <_ZN6ThreadC1Ev>
    80001a2c:	00006797          	auipc	a5,0x6
    80001a30:	8a478793          	addi	a5,a5,-1884 # 800072d0 <_ZTV7WorkerA+0x10>
    80001a34:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80001a38:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80001a3c:	00004517          	auipc	a0,0x4
    80001a40:	67c50513          	addi	a0,a0,1660 # 800060b8 <CONSOLE_STATUS+0xa8>
    80001a44:	00001097          	auipc	ra,0x1
    80001a48:	894080e7          	jalr	-1900(ra) # 800022d8 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80001a4c:	01000513          	li	a0,16
    80001a50:	00000097          	auipc	ra,0x0
    80001a54:	500080e7          	jalr	1280(ra) # 80001f50 <_Znwm>
    80001a58:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80001a5c:	00000097          	auipc	ra,0x0
    80001a60:	710080e7          	jalr	1808(ra) # 8000216c <_ZN6ThreadC1Ev>
    80001a64:	00006797          	auipc	a5,0x6
    80001a68:	89478793          	addi	a5,a5,-1900 # 800072f8 <_ZTV7WorkerB+0x10>
    80001a6c:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80001a70:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80001a74:	00004517          	auipc	a0,0x4
    80001a78:	65c50513          	addi	a0,a0,1628 # 800060d0 <CONSOLE_STATUS+0xc0>
    80001a7c:	00001097          	auipc	ra,0x1
    80001a80:	85c080e7          	jalr	-1956(ra) # 800022d8 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80001a84:	01000513          	li	a0,16
    80001a88:	00000097          	auipc	ra,0x0
    80001a8c:	4c8080e7          	jalr	1224(ra) # 80001f50 <_Znwm>
    80001a90:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80001a94:	00000097          	auipc	ra,0x0
    80001a98:	6d8080e7          	jalr	1752(ra) # 8000216c <_ZN6ThreadC1Ev>
    80001a9c:	00006797          	auipc	a5,0x6
    80001aa0:	88478793          	addi	a5,a5,-1916 # 80007320 <_ZTV7WorkerC+0x10>
    80001aa4:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80001aa8:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80001aac:	00004517          	auipc	a0,0x4
    80001ab0:	63c50513          	addi	a0,a0,1596 # 800060e8 <CONSOLE_STATUS+0xd8>
    80001ab4:	00001097          	auipc	ra,0x1
    80001ab8:	824080e7          	jalr	-2012(ra) # 800022d8 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80001abc:	01000513          	li	a0,16
    80001ac0:	00000097          	auipc	ra,0x0
    80001ac4:	490080e7          	jalr	1168(ra) # 80001f50 <_Znwm>
    80001ac8:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80001acc:	00000097          	auipc	ra,0x0
    80001ad0:	6a0080e7          	jalr	1696(ra) # 8000216c <_ZN6ThreadC1Ev>
    80001ad4:	00006797          	auipc	a5,0x6
    80001ad8:	87478793          	addi	a5,a5,-1932 # 80007348 <_ZTV7WorkerD+0x10>
    80001adc:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80001ae0:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80001ae4:	00004517          	auipc	a0,0x4
    80001ae8:	61c50513          	addi	a0,a0,1564 # 80006100 <CONSOLE_STATUS+0xf0>
    80001aec:	00000097          	auipc	ra,0x0
    80001af0:	7ec080e7          	jalr	2028(ra) # 800022d8 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80001af4:	00000493          	li	s1,0
    80001af8:	00300793          	li	a5,3
    80001afc:	0297c663          	blt	a5,s1,80001b28 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80001b00:	00349793          	slli	a5,s1,0x3
    80001b04:	fe040713          	addi	a4,s0,-32
    80001b08:	00f707b3          	add	a5,a4,a5
    80001b0c:	fe07b503          	ld	a0,-32(a5)
    80001b10:	00000097          	auipc	ra,0x0
    80001b14:	604080e7          	jalr	1540(ra) # 80002114 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80001b18:	0014849b          	addiw	s1,s1,1
    80001b1c:	fddff06f          	j	80001af8 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80001b20:	00000097          	auipc	ra,0x0
    80001b24:	624080e7          	jalr	1572(ra) # 80002144 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80001b28:	00006797          	auipc	a5,0x6
    80001b2c:	9287c783          	lbu	a5,-1752(a5) # 80007450 <finishedA>
    80001b30:	fe0788e3          	beqz	a5,80001b20 <_Z20Threads_CPP_API_testv+0x124>
    80001b34:	00006797          	auipc	a5,0x6
    80001b38:	91d7c783          	lbu	a5,-1763(a5) # 80007451 <finishedB>
    80001b3c:	fe0782e3          	beqz	a5,80001b20 <_Z20Threads_CPP_API_testv+0x124>
    80001b40:	00006797          	auipc	a5,0x6
    80001b44:	9127c783          	lbu	a5,-1774(a5) # 80007452 <finishedC>
    80001b48:	fc078ce3          	beqz	a5,80001b20 <_Z20Threads_CPP_API_testv+0x124>
    80001b4c:	00006797          	auipc	a5,0x6
    80001b50:	9077c783          	lbu	a5,-1785(a5) # 80007453 <finishedD>
    80001b54:	fc0786e3          	beqz	a5,80001b20 <_Z20Threads_CPP_API_testv+0x124>
    }

    for (auto thread: threads) { delete thread; }
    80001b58:	fc040493          	addi	s1,s0,-64
    80001b5c:	0080006f          	j	80001b64 <_Z20Threads_CPP_API_testv+0x168>
    80001b60:	00848493          	addi	s1,s1,8
    80001b64:	fe040793          	addi	a5,s0,-32
    80001b68:	08f48663          	beq	s1,a5,80001bf4 <_Z20Threads_CPP_API_testv+0x1f8>
    80001b6c:	0004b503          	ld	a0,0(s1)
    80001b70:	fe0508e3          	beqz	a0,80001b60 <_Z20Threads_CPP_API_testv+0x164>
    80001b74:	00053783          	ld	a5,0(a0)
    80001b78:	0087b783          	ld	a5,8(a5)
    80001b7c:	000780e7          	jalr	a5
    80001b80:	fe1ff06f          	j	80001b60 <_Z20Threads_CPP_API_testv+0x164>
    80001b84:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80001b88:	00048513          	mv	a0,s1
    80001b8c:	00000097          	auipc	ra,0x0
    80001b90:	414080e7          	jalr	1044(ra) # 80001fa0 <_ZdlPv>
    80001b94:	00090513          	mv	a0,s2
    80001b98:	00007097          	auipc	ra,0x7
    80001b9c:	9e0080e7          	jalr	-1568(ra) # 80008578 <_Unwind_Resume>
    80001ba0:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80001ba4:	00048513          	mv	a0,s1
    80001ba8:	00000097          	auipc	ra,0x0
    80001bac:	3f8080e7          	jalr	1016(ra) # 80001fa0 <_ZdlPv>
    80001bb0:	00090513          	mv	a0,s2
    80001bb4:	00007097          	auipc	ra,0x7
    80001bb8:	9c4080e7          	jalr	-1596(ra) # 80008578 <_Unwind_Resume>
    80001bbc:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80001bc0:	00048513          	mv	a0,s1
    80001bc4:	00000097          	auipc	ra,0x0
    80001bc8:	3dc080e7          	jalr	988(ra) # 80001fa0 <_ZdlPv>
    80001bcc:	00090513          	mv	a0,s2
    80001bd0:	00007097          	auipc	ra,0x7
    80001bd4:	9a8080e7          	jalr	-1624(ra) # 80008578 <_Unwind_Resume>
    80001bd8:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80001bdc:	00048513          	mv	a0,s1
    80001be0:	00000097          	auipc	ra,0x0
    80001be4:	3c0080e7          	jalr	960(ra) # 80001fa0 <_ZdlPv>
    80001be8:	00090513          	mv	a0,s2
    80001bec:	00007097          	auipc	ra,0x7
    80001bf0:	98c080e7          	jalr	-1652(ra) # 80008578 <_Unwind_Resume>
}
    80001bf4:	03813083          	ld	ra,56(sp)
    80001bf8:	03013403          	ld	s0,48(sp)
    80001bfc:	02813483          	ld	s1,40(sp)
    80001c00:	02013903          	ld	s2,32(sp)
    80001c04:	04010113          	addi	sp,sp,64
    80001c08:	00008067          	ret

0000000080001c0c <_Z8userMainv>:
//#include "../test/ConsumerProducer_CPP_API_test.hpp" // zadatak 4. CPP API i asinhrona promena konteksta

#include "../h/userMain.hpp"
//#include "../h/Threads_C_API_test.hpp"
#include "../h/Threads_CPP_API_test.hpp"
void userMain() {
    80001c0c:	ff010113          	addi	sp,sp,-16
    80001c10:	00113423          	sd	ra,8(sp)
    80001c14:	00813023          	sd	s0,0(sp)
    80001c18:	01010413          	addi	s0,sp,16
    //Threads_C_API_test(); // zadatak 2., niti C API i sinhrona promena konteksta
    Threads_CPP_API_test(); // zadatak 2., niti CPP API i sinhrona promena konteksta
    80001c1c:	00000097          	auipc	ra,0x0
    80001c20:	de0080e7          	jalr	-544(ra) # 800019fc <_Z20Threads_CPP_API_testv>
    //producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

    //testSleeping(); // thread_sleep test C API
   // ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega

    80001c24:	00813083          	ld	ra,8(sp)
    80001c28:	00013403          	ld	s0,0(sp)
    80001c2c:	01010113          	addi	sp,sp,16
    80001c30:	00008067          	ret

0000000080001c34 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80001c34:	ff010113          	addi	sp,sp,-16
    80001c38:	00813423          	sd	s0,8(sp)
    80001c3c:	01010413          	addi	s0,sp,16
    80001c40:	00813403          	ld	s0,8(sp)
    80001c44:	01010113          	addi	sp,sp,16
    80001c48:	00008067          	ret

0000000080001c4c <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80001c4c:	ff010113          	addi	sp,sp,-16
    80001c50:	00813423          	sd	s0,8(sp)
    80001c54:	01010413          	addi	s0,sp,16
    80001c58:	00813403          	ld	s0,8(sp)
    80001c5c:	01010113          	addi	sp,sp,16
    80001c60:	00008067          	ret

0000000080001c64 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80001c64:	ff010113          	addi	sp,sp,-16
    80001c68:	00813423          	sd	s0,8(sp)
    80001c6c:	01010413          	addi	s0,sp,16
    80001c70:	00813403          	ld	s0,8(sp)
    80001c74:	01010113          	addi	sp,sp,16
    80001c78:	00008067          	ret

0000000080001c7c <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80001c7c:	ff010113          	addi	sp,sp,-16
    80001c80:	00813423          	sd	s0,8(sp)
    80001c84:	01010413          	addi	s0,sp,16
    80001c88:	00813403          	ld	s0,8(sp)
    80001c8c:	01010113          	addi	sp,sp,16
    80001c90:	00008067          	ret

0000000080001c94 <_ZN7WorkerAD0Ev>:
    80001c94:	ff010113          	addi	sp,sp,-16
    80001c98:	00113423          	sd	ra,8(sp)
    80001c9c:	00813023          	sd	s0,0(sp)
    80001ca0:	01010413          	addi	s0,sp,16
    80001ca4:	00000097          	auipc	ra,0x0
    80001ca8:	2fc080e7          	jalr	764(ra) # 80001fa0 <_ZdlPv>
    80001cac:	00813083          	ld	ra,8(sp)
    80001cb0:	00013403          	ld	s0,0(sp)
    80001cb4:	01010113          	addi	sp,sp,16
    80001cb8:	00008067          	ret

0000000080001cbc <_ZN7WorkerBD0Ev>:
class WorkerB: public Thread {
    80001cbc:	ff010113          	addi	sp,sp,-16
    80001cc0:	00113423          	sd	ra,8(sp)
    80001cc4:	00813023          	sd	s0,0(sp)
    80001cc8:	01010413          	addi	s0,sp,16
    80001ccc:	00000097          	auipc	ra,0x0
    80001cd0:	2d4080e7          	jalr	724(ra) # 80001fa0 <_ZdlPv>
    80001cd4:	00813083          	ld	ra,8(sp)
    80001cd8:	00013403          	ld	s0,0(sp)
    80001cdc:	01010113          	addi	sp,sp,16
    80001ce0:	00008067          	ret

0000000080001ce4 <_ZN7WorkerCD0Ev>:
class WorkerC: public Thread {
    80001ce4:	ff010113          	addi	sp,sp,-16
    80001ce8:	00113423          	sd	ra,8(sp)
    80001cec:	00813023          	sd	s0,0(sp)
    80001cf0:	01010413          	addi	s0,sp,16
    80001cf4:	00000097          	auipc	ra,0x0
    80001cf8:	2ac080e7          	jalr	684(ra) # 80001fa0 <_ZdlPv>
    80001cfc:	00813083          	ld	ra,8(sp)
    80001d00:	00013403          	ld	s0,0(sp)
    80001d04:	01010113          	addi	sp,sp,16
    80001d08:	00008067          	ret

0000000080001d0c <_ZN7WorkerDD0Ev>:
class WorkerD: public Thread {
    80001d0c:	ff010113          	addi	sp,sp,-16
    80001d10:	00113423          	sd	ra,8(sp)
    80001d14:	00813023          	sd	s0,0(sp)
    80001d18:	01010413          	addi	s0,sp,16
    80001d1c:	00000097          	auipc	ra,0x0
    80001d20:	284080e7          	jalr	644(ra) # 80001fa0 <_ZdlPv>
    80001d24:	00813083          	ld	ra,8(sp)
    80001d28:	00013403          	ld	s0,0(sp)
    80001d2c:	01010113          	addi	sp,sp,16
    80001d30:	00008067          	ret

0000000080001d34 <_ZN7WorkerA3runEv>:
    void run() override {
    80001d34:	ff010113          	addi	sp,sp,-16
    80001d38:	00113423          	sd	ra,8(sp)
    80001d3c:	00813023          	sd	s0,0(sp)
    80001d40:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80001d44:	00000593          	li	a1,0
    80001d48:	00000097          	auipc	ra,0x0
    80001d4c:	84c080e7          	jalr	-1972(ra) # 80001594 <_ZN7WorkerA11workerBodyAEPv>
    }
    80001d50:	00813083          	ld	ra,8(sp)
    80001d54:	00013403          	ld	s0,0(sp)
    80001d58:	01010113          	addi	sp,sp,16
    80001d5c:	00008067          	ret

0000000080001d60 <_ZN7WorkerB3runEv>:
    void run() override {
    80001d60:	ff010113          	addi	sp,sp,-16
    80001d64:	00113423          	sd	ra,8(sp)
    80001d68:	00813023          	sd	s0,0(sp)
    80001d6c:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80001d70:	00000593          	li	a1,0
    80001d74:	00000097          	auipc	ra,0x0
    80001d78:	8ec080e7          	jalr	-1812(ra) # 80001660 <_ZN7WorkerB11workerBodyBEPv>
    }
    80001d7c:	00813083          	ld	ra,8(sp)
    80001d80:	00013403          	ld	s0,0(sp)
    80001d84:	01010113          	addi	sp,sp,16
    80001d88:	00008067          	ret

0000000080001d8c <_ZN7WorkerC3runEv>:
    void run() override {
    80001d8c:	ff010113          	addi	sp,sp,-16
    80001d90:	00113423          	sd	ra,8(sp)
    80001d94:	00813023          	sd	s0,0(sp)
    80001d98:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80001d9c:	00000593          	li	a1,0
    80001da0:	00000097          	auipc	ra,0x0
    80001da4:	994080e7          	jalr	-1644(ra) # 80001734 <_ZN7WorkerC11workerBodyCEPv>
    }
    80001da8:	00813083          	ld	ra,8(sp)
    80001dac:	00013403          	ld	s0,0(sp)
    80001db0:	01010113          	addi	sp,sp,16
    80001db4:	00008067          	ret

0000000080001db8 <_ZN7WorkerD3runEv>:
    void run() override {
    80001db8:	ff010113          	addi	sp,sp,-16
    80001dbc:	00113423          	sd	ra,8(sp)
    80001dc0:	00813023          	sd	s0,0(sp)
    80001dc4:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80001dc8:	00000593          	li	a1,0
    80001dcc:	00000097          	auipc	ra,0x0
    80001dd0:	ae8080e7          	jalr	-1304(ra) # 800018b4 <_ZN7WorkerD11workerBodyDEPv>
    }
    80001dd4:	00813083          	ld	ra,8(sp)
    80001dd8:	00013403          	ld	s0,0(sp)
    80001ddc:	01010113          	addi	sp,sp,16
    80001de0:	00008067          	ret

0000000080001de4 <_Z41__static_initialization_and_destruction_0ii>:

void Scheduler::put(TCB *ccb)
{
    readyThreadQueue.addLast(ccb);
    numOfThreads++;
}
    80001de4:	ff010113          	addi	sp,sp,-16
    80001de8:	00813423          	sd	s0,8(sp)
    80001dec:	01010413          	addi	s0,sp,16
    80001df0:	00100793          	li	a5,1
    80001df4:	00f50863          	beq	a0,a5,80001e04 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80001df8:	00813403          	ld	s0,8(sp)
    80001dfc:	01010113          	addi	sp,sp,16
    80001e00:	00008067          	ret
    80001e04:	000107b7          	lui	a5,0x10
    80001e08:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001e0c:	fef596e3          	bne	a1,a5,80001df8 <_Z41__static_initialization_and_destruction_0ii+0x14>
    }
    void operator delete[](void* ptr){
        MemoryAllocator::mem_free(ptr);
    }

    List() : head(0), tail(0) {}
    80001e10:	00005797          	auipc	a5,0x5
    80001e14:	64878793          	addi	a5,a5,1608 # 80007458 <_ZN9Scheduler16readyThreadQueueE>
    80001e18:	0007b023          	sd	zero,0(a5)
    80001e1c:	0007b423          	sd	zero,8(a5)
    80001e20:	fd9ff06f          	j	80001df8 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080001e24 <_ZN9Scheduler3getEv>:
{
    80001e24:	fe010113          	addi	sp,sp,-32
    80001e28:	00113c23          	sd	ra,24(sp)
    80001e2c:	00813823          	sd	s0,16(sp)
    80001e30:	00913423          	sd	s1,8(sp)
    80001e34:	02010413          	addi	s0,sp,32
    numOfThreads--;
    80001e38:	00005797          	auipc	a5,0x5
    80001e3c:	62078793          	addi	a5,a5,1568 # 80007458 <_ZN9Scheduler16readyThreadQueueE>
    80001e40:	0107a703          	lw	a4,16(a5)
    80001e44:	fff7071b          	addiw	a4,a4,-1
    80001e48:	00e7a823          	sw	a4,16(a5)
        }
    }

    T *removeFirst()
    {
        if (!head) { return 0; }
    80001e4c:	0007b503          	ld	a0,0(a5)
    80001e50:	04050263          	beqz	a0,80001e94 <_ZN9Scheduler3getEv+0x70>

        Elem *elem = head;
        head = head->next;
    80001e54:	00853783          	ld	a5,8(a0)
    80001e58:	00005717          	auipc	a4,0x5
    80001e5c:	60f73023          	sd	a5,1536(a4) # 80007458 <_ZN9Scheduler16readyThreadQueueE>
        if (!head) { tail = 0; }
    80001e60:	02078463          	beqz	a5,80001e88 <_ZN9Scheduler3getEv+0x64>

        T *ret = elem->data;
    80001e64:	00053483          	ld	s1,0(a0)
        MemoryAllocator::mem_free(elem);
    80001e68:	00001097          	auipc	ra,0x1
    80001e6c:	b8c080e7          	jalr	-1140(ra) # 800029f4 <_ZN15MemoryAllocator8mem_freeEPv>
}
    80001e70:	00048513          	mv	a0,s1
    80001e74:	01813083          	ld	ra,24(sp)
    80001e78:	01013403          	ld	s0,16(sp)
    80001e7c:	00813483          	ld	s1,8(sp)
    80001e80:	02010113          	addi	sp,sp,32
    80001e84:	00008067          	ret
        if (!head) { tail = 0; }
    80001e88:	00005797          	auipc	a5,0x5
    80001e8c:	5c07bc23          	sd	zero,1496(a5) # 80007460 <_ZN9Scheduler16readyThreadQueueE+0x8>
    80001e90:	fd5ff06f          	j	80001e64 <_ZN9Scheduler3getEv+0x40>
        if (!head) { return 0; }
    80001e94:	00050493          	mv	s1,a0
    return readyThreadQueue.removeFirst();
    80001e98:	fd9ff06f          	j	80001e70 <_ZN9Scheduler3getEv+0x4c>

0000000080001e9c <_ZN9Scheduler3putEP3TCB>:
{
    80001e9c:	fe010113          	addi	sp,sp,-32
    80001ea0:	00113c23          	sd	ra,24(sp)
    80001ea4:	00813823          	sd	s0,16(sp)
    80001ea8:	00913423          	sd	s1,8(sp)
    80001eac:	02010413          	addi	s0,sp,32
    80001eb0:	00050493          	mv	s1,a0
        Elem* elem = (Elem*)MemoryAllocator::mem_alloc(alignBlock(sizeof(Elem) + sizeof(MemoryBlock))/MEM_BLOCK_SIZE);
    80001eb4:	00100513          	li	a0,1
    80001eb8:	00001097          	auipc	ra,0x1
    80001ebc:	b14080e7          	jalr	-1260(ra) # 800029cc <_ZN15MemoryAllocator9mem_allocEm>
        elem->data = data;
    80001ec0:	00953023          	sd	s1,0(a0)
        elem->next = nullptr;
    80001ec4:	00053423          	sd	zero,8(a0)
        if (tail)
    80001ec8:	00005797          	auipc	a5,0x5
    80001ecc:	5987b783          	ld	a5,1432(a5) # 80007460 <_ZN9Scheduler16readyThreadQueueE+0x8>
    80001ed0:	02078c63          	beqz	a5,80001f08 <_ZN9Scheduler3putEP3TCB+0x6c>
            tail->next = elem;
    80001ed4:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80001ed8:	00005797          	auipc	a5,0x5
    80001edc:	58a7b423          	sd	a0,1416(a5) # 80007460 <_ZN9Scheduler16readyThreadQueueE+0x8>
    numOfThreads++;
    80001ee0:	00005717          	auipc	a4,0x5
    80001ee4:	57870713          	addi	a4,a4,1400 # 80007458 <_ZN9Scheduler16readyThreadQueueE>
    80001ee8:	01072783          	lw	a5,16(a4)
    80001eec:	0017879b          	addiw	a5,a5,1
    80001ef0:	00f72823          	sw	a5,16(a4)
}
    80001ef4:	01813083          	ld	ra,24(sp)
    80001ef8:	01013403          	ld	s0,16(sp)
    80001efc:	00813483          	ld	s1,8(sp)
    80001f00:	02010113          	addi	sp,sp,32
    80001f04:	00008067          	ret
            head = tail = elem;
    80001f08:	00005797          	auipc	a5,0x5
    80001f0c:	55078793          	addi	a5,a5,1360 # 80007458 <_ZN9Scheduler16readyThreadQueueE>
    80001f10:	00a7b423          	sd	a0,8(a5)
    80001f14:	00a7b023          	sd	a0,0(a5)
    80001f18:	fc9ff06f          	j	80001ee0 <_ZN9Scheduler3putEP3TCB+0x44>

0000000080001f1c <_GLOBAL__sub_I__ZN9Scheduler16readyThreadQueueE>:
    80001f1c:	ff010113          	addi	sp,sp,-16
    80001f20:	00113423          	sd	ra,8(sp)
    80001f24:	00813023          	sd	s0,0(sp)
    80001f28:	01010413          	addi	s0,sp,16
    80001f2c:	000105b7          	lui	a1,0x10
    80001f30:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80001f34:	00100513          	li	a0,1
    80001f38:	00000097          	auipc	ra,0x0
    80001f3c:	eac080e7          	jalr	-340(ra) # 80001de4 <_Z41__static_initialization_and_destruction_0ii>
    80001f40:	00813083          	ld	ra,8(sp)
    80001f44:	00013403          	ld	s0,0(sp)
    80001f48:	01010113          	addi	sp,sp,16
    80001f4c:	00008067          	ret

0000000080001f50 <_Znwm>:
#include "../h/syscall_c.hpp"

void* operator new(uint64 n){
    80001f50:	ff010113          	addi	sp,sp,-16
    80001f54:	00113423          	sd	ra,8(sp)
    80001f58:	00813023          	sd	s0,0(sp)
    80001f5c:	01010413          	addi	s0,sp,16

    void* ret = mem_alloc(n);
    80001f60:	fffff097          	auipc	ra,0xfffff
    80001f64:	1c4080e7          	jalr	452(ra) # 80001124 <_Z9mem_allocm>
    return ret;
}
    80001f68:	00813083          	ld	ra,8(sp)
    80001f6c:	00013403          	ld	s0,0(sp)
    80001f70:	01010113          	addi	sp,sp,16
    80001f74:	00008067          	ret

0000000080001f78 <_Znam>:

void* operator new[](uint64 n){
    80001f78:	ff010113          	addi	sp,sp,-16
    80001f7c:	00113423          	sd	ra,8(sp)
    80001f80:	00813023          	sd	s0,0(sp)
    80001f84:	01010413          	addi	s0,sp,16
    void* ret = mem_alloc(n);
    80001f88:	fffff097          	auipc	ra,0xfffff
    80001f8c:	19c080e7          	jalr	412(ra) # 80001124 <_Z9mem_allocm>
    return ret;
}
    80001f90:	00813083          	ld	ra,8(sp)
    80001f94:	00013403          	ld	s0,0(sp)
    80001f98:	01010113          	addi	sp,sp,16
    80001f9c:	00008067          	ret

0000000080001fa0 <_ZdlPv>:

void operator delete(void* ptr) noexcept{
    80001fa0:	ff010113          	addi	sp,sp,-16
    80001fa4:	00113423          	sd	ra,8(sp)
    80001fa8:	00813023          	sd	s0,0(sp)
    80001fac:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80001fb0:	fffff097          	auipc	ra,0xfffff
    80001fb4:	1a8080e7          	jalr	424(ra) # 80001158 <_Z8mem_freePv>
}
    80001fb8:	00813083          	ld	ra,8(sp)
    80001fbc:	00013403          	ld	s0,0(sp)
    80001fc0:	01010113          	addi	sp,sp,16
    80001fc4:	00008067          	ret

0000000080001fc8 <_ZdaPv>:

void operator delete[](void* ptr) noexcept{
    80001fc8:	ff010113          	addi	sp,sp,-16
    80001fcc:	00113423          	sd	ra,8(sp)
    80001fd0:	00813023          	sd	s0,0(sp)
    80001fd4:	01010413          	addi	s0,sp,16
   mem_free(ptr);
    80001fd8:	fffff097          	auipc	ra,0xfffff
    80001fdc:	180080e7          	jalr	384(ra) # 80001158 <_Z8mem_freePv>
    80001fe0:	00813083          	ld	ra,8(sp)
    80001fe4:	00013403          	ld	s0,0(sp)
    80001fe8:	01010113          	addi	sp,sp,16
    80001fec:	00008067          	ret

0000000080001ff0 <_Z14functionHelperPv>:
#include "../h/TCB.hpp"
#include "../h/userMain.hpp"
#include "../h/syscall_c.hpp"
void functionHelper(void* thr){ //omotac korisnicke funkcije
    80001ff0:	ff010113          	addi	sp,sp,-16
    80001ff4:	00113423          	sd	ra,8(sp)
    80001ff8:	00813023          	sd	s0,0(sp)
    80001ffc:	01010413          	addi	s0,sp,16
    uint64 funcCode = 0x25;
    __asm__ volatile("mv a0, %[fc]"::[fc]"r"(funcCode));
    80002000:	02500793          	li	a5,37
    80002004:	00078513          	mv	a0,a5
    __asm__ volatile("ecall"); //prebacivanje na korisnicki rezim - izlazak iz sistemskog
    80002008:	00000073          	ecall
    userMain();
    8000200c:	00000097          	auipc	ra,0x0
    80002010:	c00080e7          	jalr	-1024(ra) # 80001c0c <_Z8userMainv>
}
    80002014:	00813083          	ld	ra,8(sp)
    80002018:	00013403          	ld	s0,0(sp)
    8000201c:	01010113          	addi	sp,sp,16
    80002020:	00008067          	ret

0000000080002024 <main>:

int main(){
    80002024:	fe010113          	addi	sp,sp,-32
    80002028:	00113c23          	sd	ra,24(sp)
    8000202c:	00813823          	sd	s0,16(sp)
    80002030:	02010413          	addi	s0,sp,32
    __asm__ volatile("csrw stvec, %[trap]" : : [trap] "r" (&Machine::superVisorTrap)); //pripremanje osnovnih stvari u sis.r
    80002034:	00005797          	auipc	a5,0x5
    80002038:	3ac7b783          	ld	a5,940(a5) # 800073e0 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000203c:	10579073          	csrw	stvec,a5
    MemoryAllocator::instantiate();
    80002040:	00000097          	auipc	ra,0x0
    80002044:	75c080e7          	jalr	1884(ra) # 8000279c <_ZN15MemoryAllocator11instantiateEv>

    TCB* threads[2];

    thread_create(&threads[0], nullptr, nullptr);
    80002048:	00000613          	li	a2,0
    8000204c:	00000593          	li	a1,0
    80002050:	fe040513          	addi	a0,s0,-32
    80002054:	fffff097          	auipc	ra,0xfffff
    80002058:	134080e7          	jalr	308(ra) # 80001188 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::running = threads[0];
    8000205c:	fe043703          	ld	a4,-32(s0)
    80002060:	00005797          	auipc	a5,0x5
    80002064:	3907b783          	ld	a5,912(a5) # 800073f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002068:	00e7b023          	sd	a4,0(a5)

    thread_create(&threads[1],functionHelper, nullptr);
    8000206c:	00000613          	li	a2,0
    80002070:	00000597          	auipc	a1,0x0
    80002074:	f8058593          	addi	a1,a1,-128 # 80001ff0 <_Z14functionHelperPv>
    80002078:	fe840513          	addi	a0,s0,-24
    8000207c:	fffff097          	auipc	ra,0xfffff
    80002080:	10c080e7          	jalr	268(ra) # 80001188 <_Z13thread_createPP3TCBPFvPvES2_>
    while(!(threads[1]->isFinished())) thread_dispatch();
    80002084:	fe843783          	ld	a5,-24(s0)
class TCB //glavna, interna apstrakcija lakog procesa tj niti
{
public:
    ~TCB() { delete[] stack; }

    bool isFinished() const { return finished; }
    80002088:	0307c783          	lbu	a5,48(a5)
    8000208c:	00079863          	bnez	a5,8000209c <main+0x78>
    80002090:	fffff097          	auipc	ra,0xfffff
    80002094:	15c080e7          	jalr	348(ra) # 800011ec <_Z15thread_dispatchv>
    80002098:	fedff06f          	j	80002084 <main+0x60>

    return 0;
}
    8000209c:	00000513          	li	a0,0
    800020a0:	01813083          	ld	ra,24(sp)
    800020a4:	01013403          	ld	s0,16(sp)
    800020a8:	02010113          	addi	sp,sp,32
    800020ac:	00008067          	ret

00000000800020b0 <_ZN6Thread10runWrapperEPv>:

Thread::Thread() { //objektno stvaranje niti -
    thread_create_non_sheduler(&myHandle,runWrapper, this);
}

void Thread::runWrapper(void *arg) {
    800020b0:	ff010113          	addi	sp,sp,-16
    800020b4:	00113423          	sd	ra,8(sp)
    800020b8:	00813023          	sd	s0,0(sp)
    800020bc:	01010413          	addi	s0,sp,16
    Thread *thread = (Thread*)arg;
    thread->run();
    800020c0:	00053783          	ld	a5,0(a0)
    800020c4:	0107b783          	ld	a5,16(a5)
    800020c8:	000780e7          	jalr	a5
}
    800020cc:	00813083          	ld	ra,8(sp)
    800020d0:	00013403          	ld	s0,0(sp)
    800020d4:	01010113          	addi	sp,sp,16
    800020d8:	00008067          	ret

00000000800020dc <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) { //posix stvaranje niti
    800020dc:	ff010113          	addi	sp,sp,-16
    800020e0:	00113423          	sd	ra,8(sp)
    800020e4:	00813023          	sd	s0,0(sp)
    800020e8:	01010413          	addi	s0,sp,16
    800020ec:	00005797          	auipc	a5,0x5
    800020f0:	28c78793          	addi	a5,a5,652 # 80007378 <_ZTV6Thread+0x10>
    800020f4:	00f53023          	sd	a5,0(a0)
    thread_create(&myHandle,body,arg);
    800020f8:	00850513          	addi	a0,a0,8
    800020fc:	fffff097          	auipc	ra,0xfffff
    80002100:	08c080e7          	jalr	140(ra) # 80001188 <_Z13thread_createPP3TCBPFvPvES2_>
}
    80002104:	00813083          	ld	ra,8(sp)
    80002108:	00013403          	ld	s0,0(sp)
    8000210c:	01010113          	addi	sp,sp,16
    80002110:	00008067          	ret

0000000080002114 <_ZN6Thread5startEv>:
int Thread::start() {
    80002114:	ff010113          	addi	sp,sp,-16
    80002118:	00113423          	sd	ra,8(sp)
    8000211c:	00813023          	sd	s0,0(sp)
    80002120:	01010413          	addi	s0,sp,16
    Scheduler::put(myHandle);
    80002124:	00853503          	ld	a0,8(a0)
    80002128:	00000097          	auipc	ra,0x0
    8000212c:	d74080e7          	jalr	-652(ra) # 80001e9c <_ZN9Scheduler3putEP3TCB>
}
    80002130:	00000513          	li	a0,0
    80002134:	00813083          	ld	ra,8(sp)
    80002138:	00013403          	ld	s0,0(sp)
    8000213c:	01010113          	addi	sp,sp,16
    80002140:	00008067          	ret

0000000080002144 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80002144:	ff010113          	addi	sp,sp,-16
    80002148:	00113423          	sd	ra,8(sp)
    8000214c:	00813023          	sd	s0,0(sp)
    80002150:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80002154:	fffff097          	auipc	ra,0xfffff
    80002158:	098080e7          	jalr	152(ra) # 800011ec <_Z15thread_dispatchv>
}
    8000215c:	00813083          	ld	ra,8(sp)
    80002160:	00013403          	ld	s0,0(sp)
    80002164:	01010113          	addi	sp,sp,16
    80002168:	00008067          	ret

000000008000216c <_ZN6ThreadC1Ev>:
Thread::Thread() { //objektno stvaranje niti -
    8000216c:	ff010113          	addi	sp,sp,-16
    80002170:	00113423          	sd	ra,8(sp)
    80002174:	00813023          	sd	s0,0(sp)
    80002178:	01010413          	addi	s0,sp,16
    8000217c:	00005797          	auipc	a5,0x5
    80002180:	1fc78793          	addi	a5,a5,508 # 80007378 <_ZTV6Thread+0x10>
    80002184:	00f53023          	sd	a5,0(a0)
    thread_create_non_sheduler(&myHandle,runWrapper, this);
    80002188:	00050613          	mv	a2,a0
    8000218c:	00000597          	auipc	a1,0x0
    80002190:	f2458593          	addi	a1,a1,-220 # 800020b0 <_ZN6Thread10runWrapperEPv>
    80002194:	00850513          	addi	a0,a0,8
    80002198:	fffff097          	auipc	ra,0xfffff
    8000219c:	078080e7          	jalr	120(ra) # 80001210 <_Z26thread_create_non_shedulerPP3TCBPFvPvES2_>
}
    800021a0:	00813083          	ld	ra,8(sp)
    800021a4:	00013403          	ld	s0,0(sp)
    800021a8:	01010113          	addi	sp,sp,16
    800021ac:	00008067          	ret

00000000800021b0 <_ZN9SemaphoreC1Ej>:

Semaphore::Semaphore(uint init) {
    800021b0:	ff010113          	addi	sp,sp,-16
    800021b4:	00113423          	sd	ra,8(sp)
    800021b8:	00813023          	sd	s0,0(sp)
    800021bc:	01010413          	addi	s0,sp,16
    800021c0:	00005797          	auipc	a5,0x5
    800021c4:	1e078793          	addi	a5,a5,480 # 800073a0 <_ZTV9Semaphore+0x10>
    800021c8:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle,init);
    800021cc:	00850513          	addi	a0,a0,8
    800021d0:	fffff097          	auipc	ra,0xfffff
    800021d4:	078080e7          	jalr	120(ra) # 80001248 <_Z8sem_openPP10ksemaphorej>
}
    800021d8:	00813083          	ld	ra,8(sp)
    800021dc:	00013403          	ld	s0,0(sp)
    800021e0:	01010113          	addi	sp,sp,16
    800021e4:	00008067          	ret

00000000800021e8 <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    800021e8:	ff010113          	addi	sp,sp,-16
    800021ec:	00113423          	sd	ra,8(sp)
    800021f0:	00813023          	sd	s0,0(sp)
    800021f4:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    800021f8:	00853503          	ld	a0,8(a0)
    800021fc:	fffff097          	auipc	ra,0xfffff
    80002200:	0b0080e7          	jalr	176(ra) # 800012ac <_Z8sem_waitP10ksemaphore>
}
    80002204:	00813083          	ld	ra,8(sp)
    80002208:	00013403          	ld	s0,0(sp)
    8000220c:	01010113          	addi	sp,sp,16
    80002210:	00008067          	ret

0000000080002214 <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    80002214:	ff010113          	addi	sp,sp,-16
    80002218:	00113423          	sd	ra,8(sp)
    8000221c:	00813023          	sd	s0,0(sp)
    80002220:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    80002224:	00853503          	ld	a0,8(a0)
    80002228:	fffff097          	auipc	ra,0xfffff
    8000222c:	0b4080e7          	jalr	180(ra) # 800012dc <_Z10sem_signalP10ksemaphore>
}
    80002230:	00813083          	ld	ra,8(sp)
    80002234:	00013403          	ld	s0,0(sp)
    80002238:	01010113          	addi	sp,sp,16
    8000223c:	00008067          	ret

0000000080002240 <_ZN6ThreadD1Ev>:
//NAJVAZNIJE OOP APSTRAKCIJE

class Thread{
public:
    Thread(void (*body)(void*),void* arg);
    virtual ~Thread(){}
    80002240:	ff010113          	addi	sp,sp,-16
    80002244:	00813423          	sd	s0,8(sp)
    80002248:	01010413          	addi	s0,sp,16
    8000224c:	00813403          	ld	s0,8(sp)
    80002250:	01010113          	addi	sp,sp,16
    80002254:	00008067          	ret

0000000080002258 <_ZN6Thread3runEv>:

    int start();
    static void dispatch();
protected:
    Thread();
    virtual void run(){}
    80002258:	ff010113          	addi	sp,sp,-16
    8000225c:	00813423          	sd	s0,8(sp)
    80002260:	01010413          	addi	s0,sp,16
    80002264:	00813403          	ld	s0,8(sp)
    80002268:	01010113          	addi	sp,sp,16
    8000226c:	00008067          	ret

0000000080002270 <_ZN9SemaphoreD1Ev>:
};

class Semaphore{
public:
    Semaphore(uint init = 1);
    virtual ~Semaphore(){}
    80002270:	ff010113          	addi	sp,sp,-16
    80002274:	00813423          	sd	s0,8(sp)
    80002278:	01010413          	addi	s0,sp,16
    8000227c:	00813403          	ld	s0,8(sp)
    80002280:	01010113          	addi	sp,sp,16
    80002284:	00008067          	ret

0000000080002288 <_ZN6ThreadD0Ev>:
    virtual ~Thread(){}
    80002288:	ff010113          	addi	sp,sp,-16
    8000228c:	00113423          	sd	ra,8(sp)
    80002290:	00813023          	sd	s0,0(sp)
    80002294:	01010413          	addi	s0,sp,16
    80002298:	00000097          	auipc	ra,0x0
    8000229c:	d08080e7          	jalr	-760(ra) # 80001fa0 <_ZdlPv>
    800022a0:	00813083          	ld	ra,8(sp)
    800022a4:	00013403          	ld	s0,0(sp)
    800022a8:	01010113          	addi	sp,sp,16
    800022ac:	00008067          	ret

00000000800022b0 <_ZN9SemaphoreD0Ev>:
    virtual ~Semaphore(){}
    800022b0:	ff010113          	addi	sp,sp,-16
    800022b4:	00113423          	sd	ra,8(sp)
    800022b8:	00813023          	sd	s0,0(sp)
    800022bc:	01010413          	addi	s0,sp,16
    800022c0:	00000097          	auipc	ra,0x0
    800022c4:	ce0080e7          	jalr	-800(ra) # 80001fa0 <_ZdlPv>
    800022c8:	00813083          	ld	ra,8(sp)
    800022cc:	00013403          	ld	s0,0(sp)
    800022d0:	01010113          	addi	sp,sp,16
    800022d4:	00008067          	ret

00000000800022d8 <_Z11printStringPKc>:

//#define LOCK() while(copy_and_swap(lockPrint, 0, 1))
//#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    800022d8:	fe010113          	addi	sp,sp,-32
    800022dc:	00113c23          	sd	ra,24(sp)
    800022e0:	00813823          	sd	s0,16(sp)
    800022e4:	00913423          	sd	s1,8(sp)
    800022e8:	02010413          	addi	s0,sp,32
    800022ec:	00050493          	mv	s1,a0
    //LOCK();
    while (*string != '\0')
    800022f0:	0004c503          	lbu	a0,0(s1)
    800022f4:	00050a63          	beqz	a0,80002308 <_Z11printStringPKc+0x30>
    {
        __putc(*string);
    800022f8:	00003097          	auipc	ra,0x3
    800022fc:	d14080e7          	jalr	-748(ra) # 8000500c <__putc>
        string++;
    80002300:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80002304:	fedff06f          	j	800022f0 <_Z11printStringPKc+0x18>
    }
    //UNLOCK();
}
    80002308:	01813083          	ld	ra,24(sp)
    8000230c:	01013403          	ld	s0,16(sp)
    80002310:	00813483          	ld	s1,8(sp)
    80002314:	02010113          	addi	sp,sp,32
    80002318:	00008067          	ret

000000008000231c <_Z9getStringPci>:

char* getString(char *buf, int max) {
    8000231c:	fd010113          	addi	sp,sp,-48
    80002320:	02113423          	sd	ra,40(sp)
    80002324:	02813023          	sd	s0,32(sp)
    80002328:	00913c23          	sd	s1,24(sp)
    8000232c:	01213823          	sd	s2,16(sp)
    80002330:	01313423          	sd	s3,8(sp)
    80002334:	01413023          	sd	s4,0(sp)
    80002338:	03010413          	addi	s0,sp,48
    8000233c:	00050993          	mv	s3,a0
    80002340:	00058a13          	mv	s4,a1
    //LOCK();
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80002344:	00000913          	li	s2,0
    80002348:	00090493          	mv	s1,s2
    8000234c:	0019091b          	addiw	s2,s2,1
    80002350:	03495a63          	bge	s2,s4,80002384 <_Z9getStringPci+0x68>
        cc = __getc();
    80002354:	00003097          	auipc	ra,0x3
    80002358:	cf4080e7          	jalr	-780(ra) # 80005048 <__getc>
        if(cc < 1)
    8000235c:	02050463          	beqz	a0,80002384 <_Z9getStringPci+0x68>
            break;
        c = cc;
        buf[i++] = c;
    80002360:	009984b3          	add	s1,s3,s1
    80002364:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80002368:	00a00793          	li	a5,10
    8000236c:	00f50a63          	beq	a0,a5,80002380 <_Z9getStringPci+0x64>
    80002370:	00d00793          	li	a5,13
    80002374:	fcf51ae3          	bne	a0,a5,80002348 <_Z9getStringPci+0x2c>
        buf[i++] = c;
    80002378:	00090493          	mv	s1,s2
    8000237c:	0080006f          	j	80002384 <_Z9getStringPci+0x68>
    80002380:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80002384:	009984b3          	add	s1,s3,s1
    80002388:	00048023          	sb	zero,0(s1)

    //UNLOCK();
    return buf;
}
    8000238c:	00098513          	mv	a0,s3
    80002390:	02813083          	ld	ra,40(sp)
    80002394:	02013403          	ld	s0,32(sp)
    80002398:	01813483          	ld	s1,24(sp)
    8000239c:	01013903          	ld	s2,16(sp)
    800023a0:	00813983          	ld	s3,8(sp)
    800023a4:	00013a03          	ld	s4,0(sp)
    800023a8:	03010113          	addi	sp,sp,48
    800023ac:	00008067          	ret

00000000800023b0 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    800023b0:	ff010113          	addi	sp,sp,-16
    800023b4:	00813423          	sd	s0,8(sp)
    800023b8:	01010413          	addi	s0,sp,16
    800023bc:	00050693          	mv	a3,a0
    int n;

    n = 0;
    800023c0:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    800023c4:	0006c603          	lbu	a2,0(a3)
    800023c8:	fd06071b          	addiw	a4,a2,-48
    800023cc:	0ff77713          	andi	a4,a4,255
    800023d0:	00900793          	li	a5,9
    800023d4:	02e7e063          	bltu	a5,a4,800023f4 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    800023d8:	0025179b          	slliw	a5,a0,0x2
    800023dc:	00a787bb          	addw	a5,a5,a0
    800023e0:	0017979b          	slliw	a5,a5,0x1
    800023e4:	00168693          	addi	a3,a3,1
    800023e8:	00c787bb          	addw	a5,a5,a2
    800023ec:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    800023f0:	fd5ff06f          	j	800023c4 <_Z11stringToIntPKc+0x14>
    return n;
}
    800023f4:	00813403          	ld	s0,8(sp)
    800023f8:	01010113          	addi	sp,sp,16
    800023fc:	00008067          	ret

0000000080002400 <_Z12printIntegeriii>:

char digits[] = "0123456789ABCDEF";

void printInteger(int xx, int base, int sgn)
{
    80002400:	fd010113          	addi	sp,sp,-48
    80002404:	02113423          	sd	ra,40(sp)
    80002408:	02813023          	sd	s0,32(sp)
    8000240c:	00913c23          	sd	s1,24(sp)
    80002410:	03010413          	addi	s0,sp,48
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80002414:	00060463          	beqz	a2,8000241c <_Z12printIntegeriii+0x1c>
    80002418:	08054463          	bltz	a0,800024a0 <_Z12printIntegeriii+0xa0>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    8000241c:	0005051b          	sext.w	a0,a0
    neg = 0;
    80002420:	00000813          	li	a6,0
    }

    i = 0;
    80002424:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80002428:	0005879b          	sext.w	a5,a1
    8000242c:	02b5773b          	remuw	a4,a0,a1
    80002430:	00048613          	mv	a2,s1
    80002434:	0014849b          	addiw	s1,s1,1
    80002438:	02071693          	slli	a3,a4,0x20
    8000243c:	0206d693          	srli	a3,a3,0x20
    80002440:	00005717          	auipc	a4,0x5
    80002444:	f7070713          	addi	a4,a4,-144 # 800073b0 <digits>
    80002448:	00d70733          	add	a4,a4,a3
    8000244c:	00074683          	lbu	a3,0(a4)
    80002450:	fe040713          	addi	a4,s0,-32
    80002454:	00c70733          	add	a4,a4,a2
    80002458:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    8000245c:	0005071b          	sext.w	a4,a0
    80002460:	02b5553b          	divuw	a0,a0,a1
    80002464:	fcf772e3          	bgeu	a4,a5,80002428 <_Z12printIntegeriii+0x28>
    if(neg)
    80002468:	00080c63          	beqz	a6,80002480 <_Z12printIntegeriii+0x80>
        buf[i++] = '-';
    8000246c:	fe040793          	addi	a5,s0,-32
    80002470:	009784b3          	add	s1,a5,s1
    80002474:	02d00793          	li	a5,45
    80002478:	fef48823          	sb	a5,-16(s1)
    8000247c:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80002480:	fff4849b          	addiw	s1,s1,-1
    80002484:	0204c463          	bltz	s1,800024ac <_Z12printIntegeriii+0xac>
        __putc(buf[i]);
    80002488:	fe040793          	addi	a5,s0,-32
    8000248c:	009787b3          	add	a5,a5,s1
    80002490:	ff07c503          	lbu	a0,-16(a5)
    80002494:	00003097          	auipc	ra,0x3
    80002498:	b78080e7          	jalr	-1160(ra) # 8000500c <__putc>
    8000249c:	fe5ff06f          	j	80002480 <_Z12printIntegeriii+0x80>
        x = -xx;
    800024a0:	40a0053b          	negw	a0,a0
        neg = 1;
    800024a4:	00100813          	li	a6,1
        x = -xx;
    800024a8:	f7dff06f          	j	80002424 <_Z12printIntegeriii+0x24>

    //UNLOCK();
}
    800024ac:	02813083          	ld	ra,40(sp)
    800024b0:	02013403          	ld	s0,32(sp)
    800024b4:	01813483          	ld	s1,24(sp)
    800024b8:	03010113          	addi	sp,sp,48
    800024bc:	00008067          	ret

00000000800024c0 <_ZN3TCB12createThreadEPFvPvES0_>:
TCB *TCB::running = nullptr;

uint64 TCB::timeSliceCounter = 0;

TCB *TCB::createThread(Body body, void* args)
{
    800024c0:	fd010113          	addi	sp,sp,-48
    800024c4:	02113423          	sd	ra,40(sp)
    800024c8:	02813023          	sd	s0,32(sp)
    800024cc:	00913c23          	sd	s1,24(sp)
    800024d0:	01213823          	sd	s2,16(sp)
    800024d4:	01313423          	sd	s3,8(sp)
    800024d8:	03010413          	addi	s0,sp,48
    800024dc:	00050913          	mv	s2,a0
    800024e0:	00058993          	mv	s3,a1
    static void yield(); //promena konteksta na zahtev

    static TCB *running; //trenutna nit koja se izvrsava

    void* operator new(size_t size){
        return MemoryAllocator::mem_alloc(alignBlock(size + sizeof(MemoryBlock))/MEM_BLOCK_SIZE);
    800024e4:	00200513          	li	a0,2
    800024e8:	00000097          	auipc	ra,0x0
    800024ec:	4e4080e7          	jalr	1252(ra) # 800029cc <_ZN15MemoryAllocator9mem_allocEm>
    800024f0:	00050493          	mv	s1,a0
    static inline size_t alignBlock(size_t sz){
        return (sz + MEM_BLOCK_SIZE - 1) & ~(MEM_BLOCK_SIZE - 1);
    }
    TCB(Body body, uint64 timeSlice, void * args)
    {
        this->body = body;
    800024f4:	01253023          	sd	s2,0(a0)
        this->args = args;
    800024f8:	01353423          	sd	s3,8(a0)
        if(body != nullptr){
    800024fc:	04090a63          	beqz	s2,80002550 <_ZN3TCB12createThreadEPFvPvES0_+0x90>
           this->stack = (uint64*)MemoryAllocator::mem_alloc(alignBlock(sizeof(uint64)*DEFAULT_STACK_SIZE + sizeof(MemoryBlock))/MEM_BLOCK_SIZE);
    80002500:	20100513          	li	a0,513
    80002504:	00000097          	auipc	ra,0x0
    80002508:	4c8080e7          	jalr	1224(ra) # 800029cc <_ZN15MemoryAllocator9mem_allocEm>
    8000250c:	00a4b823          	sd	a0,16(s1)
        }
        else{
            this->stack = nullptr;
        }
        this->context = {(uint64) &threadWrapper,
                         stack != nullptr ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0
    80002510:	0104b783          	ld	a5,16(s1)
    80002514:	04078263          	beqz	a5,80002558 <_ZN3TCB12createThreadEPFvPvES0_+0x98>
    80002518:	00008737          	lui	a4,0x8
    8000251c:	00e787b3          	add	a5,a5,a4
        this->context = {(uint64) &threadWrapper,
    80002520:	00000717          	auipc	a4,0x0
    80002524:	0a070713          	addi	a4,a4,160 # 800025c0 <_ZN3TCB13threadWrapperEv>
    80002528:	00e4bc23          	sd	a4,24(s1)
    8000252c:	02f4b023          	sd	a5,32(s1)
        };
        this->timeSlice = timeSlice;
    80002530:	00200793          	li	a5,2
    80002534:	02f4b423          	sd	a5,40(s1)
        this->finished = false;
    80002538:	02048823          	sb	zero,48(s1)
        if (body != nullptr) { Scheduler::put(this); }
    8000253c:	04090063          	beqz	s2,8000257c <_ZN3TCB12createThreadEPFvPvES0_+0xbc>
    80002540:	00048513          	mv	a0,s1
    80002544:	00000097          	auipc	ra,0x0
    80002548:	958080e7          	jalr	-1704(ra) # 80001e9c <_ZN9Scheduler3putEP3TCB>
    8000254c:	0300006f          	j	8000257c <_ZN3TCB12createThreadEPFvPvES0_+0xbc>
            this->stack = nullptr;
    80002550:	00053823          	sd	zero,16(a0)
    80002554:	fbdff06f          	j	80002510 <_ZN3TCB12createThreadEPFvPvES0_+0x50>
                         stack != nullptr ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0
    80002558:	00000793          	li	a5,0
    8000255c:	fc5ff06f          	j	80002520 <_ZN3TCB12createThreadEPFvPvES0_+0x60>
    80002560:	00050913          	mv	s2,a0
        MemoryAllocator::mem_free(ptr);
    80002564:	00048513          	mv	a0,s1
    80002568:	00000097          	auipc	ra,0x0
    8000256c:	48c080e7          	jalr	1164(ra) # 800029f4 <_ZN15MemoryAllocator8mem_freeEPv>
    80002570:	00090513          	mv	a0,s2
    80002574:	00006097          	auipc	ra,0x6
    80002578:	004080e7          	jalr	4(ra) # 80008578 <_Unwind_Resume>
    TCB* tcb = new TCB(body, DEFAULT_TIME_SLICE, args);
    return tcb;
}
    8000257c:	00048513          	mv	a0,s1
    80002580:	02813083          	ld	ra,40(sp)
    80002584:	02013403          	ld	s0,32(sp)
    80002588:	01813483          	ld	s1,24(sp)
    8000258c:	01013903          	ld	s2,16(sp)
    80002590:	00813983          	ld	s3,8(sp)
    80002594:	03010113          	addi	sp,sp,48
    80002598:	00008067          	ret

000000008000259c <_ZN3TCB5yieldEv>:

void TCB::yield()
{
    8000259c:	ff010113          	addi	sp,sp,-16
    800025a0:	00813423          	sd	s0,8(sp)
    800025a4:	01010413          	addi	s0,sp,16
    //upisati a1 da bude neka vrednost svojstvena samo za ecall iz yielda!
    uint64 funcCode = 0x0f;
    __asm__ volatile("mv a0, %[regA0]" : : [regA0] "rm"(funcCode)); //kod 0x0F
    800025a8:	00f00793          	li	a5,15
    800025ac:	00078513          	mv	a0,a5

    __asm__ volatile ("ecall");
    800025b0:	00000073          	ecall
}
    800025b4:	00813403          	ld	s0,8(sp)
    800025b8:	01010113          	addi	sp,sp,16
    800025bc:	00008067          	ret

00000000800025c0 <_ZN3TCB13threadWrapperEv>:
    TCB::running = Scheduler::get();
    TCB::contextSwitch(&old->context, &TCB::running->context);
}

void TCB::threadWrapper()
{
    800025c0:	fe010113          	addi	sp,sp,-32
    800025c4:	00113c23          	sd	ra,24(sp)
    800025c8:	00813823          	sd	s0,16(sp)
    800025cc:	00913423          	sd	s1,8(sp)
    800025d0:	02010413          	addi	s0,sp,32
    running->body(running->args);
    800025d4:	00005497          	auipc	s1,0x5
    800025d8:	ea448493          	addi	s1,s1,-348 # 80007478 <_ZN3TCB7runningE>
    800025dc:	0004b783          	ld	a5,0(s1)
    800025e0:	0007b703          	ld	a4,0(a5)
    800025e4:	0087b503          	ld	a0,8(a5)
    800025e8:	000700e7          	jalr	a4
    running->setFinished(true);
    800025ec:	0004b783          	ld	a5,0(s1)
    void setFinished(bool value) { finished = value; }
    800025f0:	00100713          	li	a4,1
    800025f4:	02e78823          	sb	a4,48(a5)
    TCB::yield();
    800025f8:	00000097          	auipc	ra,0x0
    800025fc:	fa4080e7          	jalr	-92(ra) # 8000259c <_ZN3TCB5yieldEv>
}
    80002600:	01813083          	ld	ra,24(sp)
    80002604:	01013403          	ld	s0,16(sp)
    80002608:	00813483          	ld	s1,8(sp)
    8000260c:	02010113          	addi	sp,sp,32
    80002610:	00008067          	ret

0000000080002614 <_ZN3TCB8dispatchEv>:
{
    80002614:	fe010113          	addi	sp,sp,-32
    80002618:	00113c23          	sd	ra,24(sp)
    8000261c:	00813823          	sd	s0,16(sp)
    80002620:	00913423          	sd	s1,8(sp)
    80002624:	02010413          	addi	s0,sp,32
    TCB *old = TCB::running;
    80002628:	00005497          	auipc	s1,0x5
    8000262c:	e504b483          	ld	s1,-432(s1) # 80007478 <_ZN3TCB7runningE>
    bool isFinished() const { return finished; }
    80002630:	0304c783          	lbu	a5,48(s1)
    if (!old->isFinished()) { Scheduler::put(old); }
    80002634:	02078c63          	beqz	a5,8000266c <_ZN3TCB8dispatchEv+0x58>
    TCB::running = Scheduler::get();
    80002638:	fffff097          	auipc	ra,0xfffff
    8000263c:	7ec080e7          	jalr	2028(ra) # 80001e24 <_ZN9Scheduler3getEv>
    80002640:	00005797          	auipc	a5,0x5
    80002644:	e2a7bc23          	sd	a0,-456(a5) # 80007478 <_ZN3TCB7runningE>
    TCB::contextSwitch(&old->context, &TCB::running->context);
    80002648:	01850593          	addi	a1,a0,24
    8000264c:	01848513          	addi	a0,s1,24
    80002650:	fffff097          	auipc	ra,0xfffff
    80002654:	ac0080e7          	jalr	-1344(ra) # 80001110 <_ZN3TCB13contextSwitchEPNS_13threadContextES1_>
}
    80002658:	01813083          	ld	ra,24(sp)
    8000265c:	01013403          	ld	s0,16(sp)
    80002660:	00813483          	ld	s1,8(sp)
    80002664:	02010113          	addi	sp,sp,32
    80002668:	00008067          	ret
    if (!old->isFinished()) { Scheduler::put(old); }
    8000266c:	00048513          	mv	a0,s1
    80002670:	00000097          	auipc	ra,0x0
    80002674:	82c080e7          	jalr	-2004(ra) # 80001e9c <_ZN9Scheduler3putEP3TCB>
    80002678:	fc1ff06f          	j	80002638 <_ZN3TCB8dispatchEv+0x24>

000000008000267c <_ZN3TCB24createThreadNonSchedulerEPFvPvES0_>:

TCB *TCB::createThreadNonScheduler(TCB::Body body, void *args) {
    8000267c:	fd010113          	addi	sp,sp,-48
    80002680:	02113423          	sd	ra,40(sp)
    80002684:	02813023          	sd	s0,32(sp)
    80002688:	00913c23          	sd	s1,24(sp)
    8000268c:	01213823          	sd	s2,16(sp)
    80002690:	01313423          	sd	s3,8(sp)
    80002694:	03010413          	addi	s0,sp,48
    80002698:	00050913          	mv	s2,a0
    8000269c:	00058993          	mv	s3,a1
        return MemoryAllocator::mem_alloc(alignBlock(size + sizeof(MemoryBlock))/MEM_BLOCK_SIZE);
    800026a0:	00200513          	li	a0,2
    800026a4:	00000097          	auipc	ra,0x0
    800026a8:	328080e7          	jalr	808(ra) # 800029cc <_ZN15MemoryAllocator9mem_allocEm>
    800026ac:	00050493          	mv	s1,a0
    }

    TCB(Body body, uint64 timeSlice, void * args, int nonSch) //specijalni konstruktor za spec static metodu
    {
        this->body = body;
    800026b0:	01253023          	sd	s2,0(a0)
        this->args = args;
    800026b4:	01353423          	sd	s3,8(a0)
        if(body != nullptr){
    800026b8:	06090063          	beqz	s2,80002718 <_ZN3TCB24createThreadNonSchedulerEPFvPvES0_+0x9c>
            this->stack = (uint64*)MemoryAllocator::mem_alloc(alignBlock(sizeof(uint64)*DEFAULT_STACK_SIZE + sizeof(MemoryBlock))/MEM_BLOCK_SIZE);
    800026bc:	20100513          	li	a0,513
    800026c0:	00000097          	auipc	ra,0x0
    800026c4:	30c080e7          	jalr	780(ra) # 800029cc <_ZN15MemoryAllocator9mem_allocEm>
    800026c8:	00a4b823          	sd	a0,16(s1)
        }
        else{
            this->stack = nullptr;
        }
        this->context = {(uint64) &threadWrapper,
                         stack != nullptr ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0
    800026cc:	0104b783          	ld	a5,16(s1)
    800026d0:	04078863          	beqz	a5,80002720 <_ZN3TCB24createThreadNonSchedulerEPFvPvES0_+0xa4>
    800026d4:	00008737          	lui	a4,0x8
    800026d8:	00e787b3          	add	a5,a5,a4
        this->context = {(uint64) &threadWrapper,
    800026dc:	00000717          	auipc	a4,0x0
    800026e0:	ee470713          	addi	a4,a4,-284 # 800025c0 <_ZN3TCB13threadWrapperEv>
    800026e4:	00e4bc23          	sd	a4,24(s1)
    800026e8:	02f4b023          	sd	a5,32(s1)
        };
        this->timeSlice = timeSlice;
    800026ec:	00200793          	li	a5,2
    800026f0:	02f4b423          	sd	a5,40(s1)
        this->finished = false;
    800026f4:	02048823          	sb	zero,48(s1)
    TCB* tcb = new TCB(body, DEFAULT_TIME_SLICE, args,-1);
    return tcb;
}
    800026f8:	00048513          	mv	a0,s1
    800026fc:	02813083          	ld	ra,40(sp)
    80002700:	02013403          	ld	s0,32(sp)
    80002704:	01813483          	ld	s1,24(sp)
    80002708:	01013903          	ld	s2,16(sp)
    8000270c:	00813983          	ld	s3,8(sp)
    80002710:	03010113          	addi	sp,sp,48
    80002714:	00008067          	ret
            this->stack = nullptr;
    80002718:	00053823          	sd	zero,16(a0)
    8000271c:	fb1ff06f          	j	800026cc <_ZN3TCB24createThreadNonSchedulerEPFvPvES0_+0x50>
                         stack != nullptr ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0
    80002720:	00000793          	li	a5,0
    80002724:	fb9ff06f          	j	800026dc <_ZN3TCB24createThreadNonSchedulerEPFvPvES0_+0x60>
    80002728:	00050913          	mv	s2,a0
        MemoryAllocator::mem_free(ptr);
    8000272c:	00048513          	mv	a0,s1
    80002730:	00000097          	auipc	ra,0x0
    80002734:	2c4080e7          	jalr	708(ra) # 800029f4 <_ZN15MemoryAllocator8mem_freeEPv>
    80002738:	00090513          	mv	a0,s2
    8000273c:	00006097          	auipc	ra,0x6
    80002740:	e3c080e7          	jalr	-452(ra) # 80008578 <_Unwind_Resume>

0000000080002744 <_Z41__static_initialization_and_destruction_0ii>:
        return -1;
    handle->unblockAll();
    delete handle;
    handle = nullptr;
    return 0;
}
    80002744:	ff010113          	addi	sp,sp,-16
    80002748:	00813423          	sd	s0,8(sp)
    8000274c:	01010413          	addi	s0,sp,16
    80002750:	00100793          	li	a5,1
    80002754:	00f50863          	beq	a0,a5,80002764 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80002758:	00813403          	ld	s0,8(sp)
    8000275c:	01010113          	addi	sp,sp,16
    80002760:	00008067          	ret
    80002764:	000107b7          	lui	a5,0x10
    80002768:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    8000276c:	fef596e3          	bne	a1,a5,80002758 <_Z41__static_initialization_and_destruction_0ii+0x14>
uint64 MemoryAllocator::maxMemorySize = (size_t)(HEAP_END_ADDR) - (size_t) HEAP_START_ADDR - sizeof(MemoryBlock);
    80002770:	00005797          	auipc	a5,0x5
    80002774:	c887b783          	ld	a5,-888(a5) # 800073f8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002778:	0007b783          	ld	a5,0(a5)
    8000277c:	00005717          	auipc	a4,0x5
    80002780:	c5473703          	ld	a4,-940(a4) # 800073d0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002784:	00073703          	ld	a4,0(a4)
    80002788:	40e787b3          	sub	a5,a5,a4
    8000278c:	ff078793          	addi	a5,a5,-16
    80002790:	00005717          	auipc	a4,0x5
    80002794:	cef73c23          	sd	a5,-776(a4) # 80007488 <_ZN15MemoryAllocator13maxMemorySizeE>
}
    80002798:	fc1ff06f          	j	80002758 <_Z41__static_initialization_and_destruction_0ii+0x14>

000000008000279c <_ZN15MemoryAllocator11instantiateEv>:
void MemoryAllocator::instantiate() { //funkcija se poziva samo 1, i to da bi se ceo prostor predstavio 1 slobodnim mem blokom
    8000279c:	ff010113          	addi	sp,sp,-16
    800027a0:	00813423          	sd	s0,8(sp)
    800027a4:	01010413          	addi	s0,sp,16
    if(!called){
    800027a8:	00005797          	auipc	a5,0x5
    800027ac:	ce87a783          	lw	a5,-792(a5) # 80007490 <_ZN15MemoryAllocator6calledE>
    800027b0:	04079863          	bnez	a5,80002800 <_ZN15MemoryAllocator11instantiateEv+0x64>
        head = (MemoryBlock*)HEAP_START_ADDR;
    800027b4:	00005797          	auipc	a5,0x5
    800027b8:	c1c7b783          	ld	a5,-996(a5) # 800073d0 <_GLOBAL_OFFSET_TABLE_+0x8>
    800027bc:	0007b683          	ld	a3,0(a5)
    800027c0:	00005717          	auipc	a4,0x5
    800027c4:	cc870713          	addi	a4,a4,-824 # 80007488 <_ZN15MemoryAllocator13maxMemorySizeE>
    800027c8:	00d73823          	sd	a3,16(a4)
        size_t memSize = (size_t)HEAP_END_ADDR - (size_t)HEAP_START_ADDR - sizeof(MemoryBlock); //oduzima se i zaglavlje headera, tj ovo je stvarna velicina za podatke
    800027cc:	00005797          	auipc	a5,0x5
    800027d0:	c2c7b783          	ld	a5,-980(a5) # 800073f8 <_GLOBAL_OFFSET_TABLE_+0x30>
    800027d4:	0007b783          	ld	a5,0(a5)
    800027d8:	40d787b3          	sub	a5,a5,a3
    800027dc:	ff078793          	addi	a5,a5,-16
        head->size = memSize;
    800027e0:	00f6b023          	sd	a5,0(a3)
        head->nextBlock = nullptr;
    800027e4:	01073683          	ld	a3,16(a4)
    800027e8:	0006b423          	sd	zero,8(a3)
        tail = head;
    800027ec:	00d73c23          	sd	a3,24(a4)
        currentMemorySize = memSize;
    800027f0:	02f73023          	sd	a5,32(a4)
        maxMemorySize = memSize;
    800027f4:	00f73023          	sd	a5,0(a4)
        called = 1;
    800027f8:	00100793          	li	a5,1
    800027fc:	00f72423          	sw	a5,8(a4)
}
    80002800:	00813403          	ld	s0,8(sp)
    80002804:	01010113          	addi	sp,sp,16
    80002808:	00008067          	ret

000000008000280c <_ZN15MemoryAllocator7getHeadEv>:
MemoryBlock *MemoryAllocator::getHead() {
    8000280c:	ff010113          	addi	sp,sp,-16
    80002810:	00813423          	sd	s0,8(sp)
    80002814:	01010413          	addi	s0,sp,16
}
    80002818:	00005517          	auipc	a0,0x5
    8000281c:	c8053503          	ld	a0,-896(a0) # 80007498 <_ZN15MemoryAllocator4headE>
    80002820:	00813403          	ld	s0,8(sp)
    80002824:	01010113          	addi	sp,sp,16
    80002828:	00008067          	ret

000000008000282c <_ZN15MemoryAllocator17appendMemoryBlockEP11MemoryBlock>:
int MemoryAllocator::appendMemoryBlock(MemoryBlock *block) {//moguce dodavanje samo ako dodavanje ne prekoracuje dozvoljen prostor
    8000282c:	ff010113          	addi	sp,sp,-16
    80002830:	00813423          	sd	s0,8(sp)
    80002834:	01010413          	addi	s0,sp,16
    if(!head){ //samo ako se sve obrise
    80002838:	00005797          	auipc	a5,0x5
    8000283c:	c607b783          	ld	a5,-928(a5) # 80007498 <_ZN15MemoryAllocator4headE>
    80002840:	04078e63          	beqz	a5,8000289c <_ZN15MemoryAllocator17appendMemoryBlockEP11MemoryBlock+0x70>
        uint64 tryMem = currentMemorySize + block->size + sizeof(MemoryBlock);
    80002844:	00053703          	ld	a4,0(a0)
    80002848:	00005697          	auipc	a3,0x5
    8000284c:	c4068693          	addi	a3,a3,-960 # 80007488 <_ZN15MemoryAllocator13maxMemorySizeE>
    80002850:	0206b783          	ld	a5,32(a3)
    80002854:	00f70733          	add	a4,a4,a5
    80002858:	01070713          	addi	a4,a4,16
        if(currentMemorySize == maxMemorySize)
    8000285c:	0006b683          	ld	a3,0(a3)
    80002860:	04d78a63          	beq	a5,a3,800028b4 <_ZN15MemoryAllocator17appendMemoryBlockEP11MemoryBlock+0x88>
        else if(tryMem > maxMemorySize){
    80002864:	04e6ec63          	bltu	a3,a4,800028bc <_ZN15MemoryAllocator17appendMemoryBlockEP11MemoryBlock+0x90>
            tail->nextBlock = block;
    80002868:	00005717          	auipc	a4,0x5
    8000286c:	c2070713          	addi	a4,a4,-992 # 80007488 <_ZN15MemoryAllocator13maxMemorySizeE>
    80002870:	01873683          	ld	a3,24(a4)
    80002874:	00a6b423          	sd	a0,8(a3)
            tail = block;
    80002878:	00a73c23          	sd	a0,24(a4)
            currentMemorySize += (block->size + sizeof(MemoryBlock));
    8000287c:	00053683          	ld	a3,0(a0)
    80002880:	00d787b3          	add	a5,a5,a3
    80002884:	01078793          	addi	a5,a5,16
    80002888:	02f73023          	sd	a5,32(a4)
            return 0;
    8000288c:	00000513          	li	a0,0
}
    80002890:	00813403          	ld	s0,8(sp)
    80002894:	01010113          	addi	sp,sp,16
    80002898:	00008067          	ret
        head = tail = block;
    8000289c:	00005797          	auipc	a5,0x5
    800028a0:	bec78793          	addi	a5,a5,-1044 # 80007488 <_ZN15MemoryAllocator13maxMemorySizeE>
    800028a4:	00a7bc23          	sd	a0,24(a5)
    800028a8:	00a7b823          	sd	a0,16(a5)
        return 0;
    800028ac:	00000513          	li	a0,0
    800028b0:	fe1ff06f          	j	80002890 <_ZN15MemoryAllocator17appendMemoryBlockEP11MemoryBlock+0x64>
            return -2; //greska oznacava da je popunjen ceo mem prostor
    800028b4:	ffe00513          	li	a0,-2
    800028b8:	fd9ff06f          	j	80002890 <_ZN15MemoryAllocator17appendMemoryBlockEP11MemoryBlock+0x64>
            return -2;
    800028bc:	ffe00513          	li	a0,-2
    800028c0:	fd1ff06f          	j	80002890 <_ZN15MemoryAllocator17appendMemoryBlockEP11MemoryBlock+0x64>

00000000800028c4 <_ZN15MemoryAllocator14getMemoryBlockEm>:
MemoryBlock *MemoryAllocator::getMemoryBlock(size_t sz) { //ovaj sz je zapravo BROJ blokova - takva mi je inicijalna implementacija bila
    800028c4:	ff010113          	addi	sp,sp,-16
    800028c8:	00813423          	sd	s0,8(sp)
    800028cc:	01010413          	addi	s0,sp,16
    if(currentMemorySize == 0)
    800028d0:	00005617          	auipc	a2,0x5
    800028d4:	bd863603          	ld	a2,-1064(a2) # 800074a8 <_ZN15MemoryAllocator17currentMemorySizeE>
    800028d8:	0e060663          	beqz	a2,800029c4 <_ZN15MemoryAllocator14getMemoryBlockEm+0x100>
    800028dc:	00651713          	slli	a4,a0,0x6
    if(sz == maxMemorySize){
    800028e0:	00005797          	auipc	a5,0x5
    800028e4:	ba87b783          	ld	a5,-1112(a5) # 80007488 <_ZN15MemoryAllocator13maxMemorySizeE>
    800028e8:	00e78a63          	beq	a5,a4,800028fc <_ZN15MemoryAllocator14getMemoryBlockEm+0x38>
    MemoryBlock* current = head;
    800028ec:	00005517          	auipc	a0,0x5
    800028f0:	bac53503          	ld	a0,-1108(a0) # 80007498 <_ZN15MemoryAllocator4headE>
    MemoryBlock* previous = nullptr;
    800028f4:	00000693          	li	a3,0
    800028f8:	0280006f          	j	80002920 <_ZN15MemoryAllocator14getMemoryBlockEm+0x5c>
        MemoryBlock* ret = head;
    800028fc:	00005797          	auipc	a5,0x5
    80002900:	b8c78793          	addi	a5,a5,-1140 # 80007488 <_ZN15MemoryAllocator13maxMemorySizeE>
    80002904:	0107b503          	ld	a0,16(a5)
        head = nullptr;
    80002908:	0007b823          	sd	zero,16(a5)
        ret = (MemoryBlock*)((char*)ret + sizeof(MemoryBlock)); //pomeramo za zaglavlje
    8000290c:	01050513          	addi	a0,a0,16
        currentMemorySize = 0;
    80002910:	0207b023          	sd	zero,32(a5)
        return ret;
    80002914:	0700006f          	j	80002984 <_ZN15MemoryAllocator14getMemoryBlockEm+0xc0>
            previous = current;
    80002918:	00050693          	mv	a3,a0
            current = current->nextBlock;
    8000291c:	00853503          	ld	a0,8(a0)
    while(current){
    80002920:	00050663          	beqz	a0,8000292c <_ZN15MemoryAllocator14getMemoryBlockEm+0x68>
        if(current->size < sz){ //pretraga se zavrsava onda kada se pronadje blok cija je velicina >= od zadate
    80002924:	00053783          	ld	a5,0(a0)
    80002928:	fee7e8e3          	bltu	a5,a4,80002918 <_ZN15MemoryAllocator14getMemoryBlockEm+0x54>
    if(!current) //ako nema takvog bloka, while je prosao kroz ceo ciklus, nema slobodne odgovarajuce memorije
    8000292c:	04050c63          	beqz	a0,80002984 <_ZN15MemoryAllocator14getMemoryBlockEm+0xc0>
        if(current->size - sz >= MEM_BLOCK_SIZE + sizeof(MemoryBlock)){ //odrezak veci od 64B + zaglavlje -> ulancavamo ga u listu slobodnih mem blokova
    80002930:	00053783          	ld	a5,0(a0)
    80002934:	40e787b3          	sub	a5,a5,a4
    80002938:	04f00593          	li	a1,79
    8000293c:	06f5f063          	bgeu	a1,a5,8000299c <_ZN15MemoryAllocator14getMemoryBlockEm+0xd8>
            size_t ptrOffset = sz + sizeof(MemoryBlock); //velicina zaglavlja "objekta" + sama njegova velicina za podatke
    80002940:	01070613          	addi	a2,a4,16
            MemoryBlock* newBlock = (MemoryBlock*)((char*)current + ptrOffset); //ovo je pokazivac na odrezak koji treba da ulancamo u listu
    80002944:	00c50633          	add	a2,a0,a2
            newBlock->size = current->size - sz - sizeof(MemoryBlock); //ovaj novi blok je zapravo velicine odreska bez zaglavlja, a njegov nextBlock je onaj sto je i pre bio next
    80002948:	ff078793          	addi	a5,a5,-16
    8000294c:	00f63023          	sd	a5,0(a2)
            newBlock->nextBlock = current->nextBlock;
    80002950:	00853783          	ld	a5,8(a0)
    80002954:	00f63423          	sd	a5,8(a2)
            if(!previous){ //dakle prvi element odmah odgovara
    80002958:	02068c63          	beqz	a3,80002990 <_ZN15MemoryAllocator14getMemoryBlockEm+0xcc>
                previous->nextBlock = newBlock; //izbacuje se current iz liste slobodnih mem blokova
    8000295c:	00c6b423          	sd	a2,8(a3)
            current->size = sz;
    80002960:	00e53023          	sd	a4,0(a0)
            current->nextBlock = nullptr;
    80002964:	00053423          	sd	zero,8(a0)
            currentMemorySize -= (sz + sizeof(MemoryBlock));
    80002968:	00005697          	auipc	a3,0x5
    8000296c:	b2068693          	addi	a3,a3,-1248 # 80007488 <_ZN15MemoryAllocator13maxMemorySizeE>
    80002970:	0206b783          	ld	a5,32(a3)
    80002974:	40e78733          	sub	a4,a5,a4
    80002978:	ff070713          	addi	a4,a4,-16
    8000297c:	02e6b023          	sd	a4,32(a3)
            current = (MemoryBlock*)((char*)current + sizeof(MemoryBlock)); //pomeramo za zaglavlje
    80002980:	01050513          	addi	a0,a0,16
}
    80002984:	00813403          	ld	s0,8(sp)
    80002988:	01010113          	addi	sp,sp,16
    8000298c:	00008067          	ret
                head = newBlock;
    80002990:	00005797          	auipc	a5,0x5
    80002994:	b0c7b423          	sd	a2,-1272(a5) # 80007498 <_ZN15MemoryAllocator4headE>
    80002998:	fc9ff06f          	j	80002960 <_ZN15MemoryAllocator14getMemoryBlockEm+0x9c>
            previous->nextBlock = current->nextBlock;
    8000299c:	00853783          	ld	a5,8(a0)
    800029a0:	00f6b423          	sd	a5,8(a3)
            currentMemorySize -= (current->size + sizeof(MemoryBlock));
    800029a4:	00053783          	ld	a5,0(a0)
    800029a8:	40f60633          	sub	a2,a2,a5
    800029ac:	ff060613          	addi	a2,a2,-16
    800029b0:	00005797          	auipc	a5,0x5
    800029b4:	aec7bc23          	sd	a2,-1288(a5) # 800074a8 <_ZN15MemoryAllocator17currentMemorySizeE>
            current->nextBlock = nullptr;
    800029b8:	00053423          	sd	zero,8(a0)
            current = (MemoryBlock*)((char*)current + sizeof(MemoryBlock)); //pomeramo za zaglavlje
    800029bc:	01050513          	addi	a0,a0,16
            return current;
    800029c0:	fc5ff06f          	j	80002984 <_ZN15MemoryAllocator14getMemoryBlockEm+0xc0>
        return nullptr;
    800029c4:	00000513          	li	a0,0
    800029c8:	fbdff06f          	j	80002984 <_ZN15MemoryAllocator14getMemoryBlockEm+0xc0>

00000000800029cc <_ZN15MemoryAllocator9mem_allocEm>:
void *MemoryAllocator::mem_alloc(size_t sz) {
    800029cc:	ff010113          	addi	sp,sp,-16
    800029d0:	00113423          	sd	ra,8(sp)
    800029d4:	00813023          	sd	s0,0(sp)
    800029d8:	01010413          	addi	s0,sp,16
    return (void*)getMemoryBlock(sz); //ako vraca nullptr onda je u pitanju greska sa mem prostorom
    800029dc:	00000097          	auipc	ra,0x0
    800029e0:	ee8080e7          	jalr	-280(ra) # 800028c4 <_ZN15MemoryAllocator14getMemoryBlockEm>
}
    800029e4:	00813083          	ld	ra,8(sp)
    800029e8:	00013403          	ld	s0,0(sp)
    800029ec:	01010113          	addi	sp,sp,16
    800029f0:	00008067          	ret

00000000800029f4 <_ZN15MemoryAllocator8mem_freeEPv>:
    MemoryBlock* block = (MemoryBlock*)((char*)ptr - sizeof(MemoryBlock));
    800029f4:	ff050513          	addi	a0,a0,-16
    if(!block)
    800029f8:	02050663          	beqz	a0,80002a24 <_ZN15MemoryAllocator8mem_freeEPv+0x30>
int MemoryAllocator::mem_free(void * ptr) {
    800029fc:	ff010113          	addi	sp,sp,-16
    80002a00:	00113423          	sd	ra,8(sp)
    80002a04:	00813023          	sd	s0,0(sp)
    80002a08:	01010413          	addi	s0,sp,16
        return appendMemoryBlock(block);
    80002a0c:	00000097          	auipc	ra,0x0
    80002a10:	e20080e7          	jalr	-480(ra) # 8000282c <_ZN15MemoryAllocator17appendMemoryBlockEP11MemoryBlock>
}
    80002a14:	00813083          	ld	ra,8(sp)
    80002a18:	00013403          	ld	s0,0(sp)
    80002a1c:	01010113          	addi	sp,sp,16
    80002a20:	00008067          	ret
        return -1;
    80002a24:	fff00513          	li	a0,-1
}
    80002a28:	00008067          	ret

0000000080002a2c <_ZN7Machine7SppSpieEv>:
void Machine::SppSpie(){
    80002a2c:	ff010113          	addi	sp,sp,-16
    80002a30:	00813423          	sd	s0,8(sp)
    80002a34:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw sepc, ra");
    80002a38:	14109073          	csrw	sepc,ra
    __asm__ volatile("sret");
    80002a3c:	10200073          	sret
}
    80002a40:	00813403          	ld	s0,8(sp)
    80002a44:	01010113          	addi	sp,sp,16
    80002a48:	00008067          	ret

0000000080002a4c <_ZN13threadHandler13thread_createEPP3TCBPFvPvES3_S3_>:
int threadHandler::thread_create(threadHandler::thread_t *handle, void (*start_routine)(void *), void *arg, void* stack_space) {
    80002a4c:	fe010113          	addi	sp,sp,-32
    80002a50:	00113c23          	sd	ra,24(sp)
    80002a54:	00813823          	sd	s0,16(sp)
    80002a58:	00913423          	sd	s1,8(sp)
    80002a5c:	02010413          	addi	s0,sp,32
    80002a60:	00050493          	mv	s1,a0
    80002a64:	00058513          	mv	a0,a1
    *handle = TCB::createThread(start_routine,arg);
    80002a68:	00060593          	mv	a1,a2
    80002a6c:	00000097          	auipc	ra,0x0
    80002a70:	a54080e7          	jalr	-1452(ra) # 800024c0 <_ZN3TCB12createThreadEPFvPvES0_>
    80002a74:	00a4b023          	sd	a0,0(s1)
    if(!*handle)
    80002a78:	00050e63          	beqz	a0,80002a94 <_ZN13threadHandler13thread_createEPP3TCBPFvPvES3_S3_+0x48>
    return 0;
    80002a7c:	00000513          	li	a0,0
}
    80002a80:	01813083          	ld	ra,24(sp)
    80002a84:	01013403          	ld	s0,16(sp)
    80002a88:	00813483          	ld	s1,8(sp)
    80002a8c:	02010113          	addi	sp,sp,32
    80002a90:	00008067          	ret
        return -1;
    80002a94:	fff00513          	li	a0,-1
    80002a98:	fe9ff06f          	j	80002a80 <_ZN13threadHandler13thread_createEPP3TCBPFvPvES3_S3_+0x34>

0000000080002a9c <_ZN13threadHandler11thread_exitEv>:
int threadHandler::thread_exit() {
    80002a9c:	ff010113          	addi	sp,sp,-16
    80002aa0:	00113423          	sd	ra,8(sp)
    80002aa4:	00813023          	sd	s0,0(sp)
    80002aa8:	01010413          	addi	s0,sp,16
    TCB::running->setFinished(true);
    80002aac:	00005797          	auipc	a5,0x5
    80002ab0:	9447b783          	ld	a5,-1724(a5) # 800073f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002ab4:	0007b783          	ld	a5,0(a5)
    void setFinished(bool value) { finished = value; }
    80002ab8:	00100713          	li	a4,1
    80002abc:	02e78823          	sb	a4,48(a5)
    TCB::yield();
    80002ac0:	00000097          	auipc	ra,0x0
    80002ac4:	adc080e7          	jalr	-1316(ra) # 8000259c <_ZN3TCB5yieldEv>
}
    80002ac8:	00000513          	li	a0,0
    80002acc:	00813083          	ld	ra,8(sp)
    80002ad0:	00013403          	ld	s0,0(sp)
    80002ad4:	01010113          	addi	sp,sp,16
    80002ad8:	00008067          	ret

0000000080002adc <_ZN13threadHandler15thread_dispatchEv>:
void threadHandler::thread_dispatch() {
    80002adc:	ff010113          	addi	sp,sp,-16
    80002ae0:	00113423          	sd	ra,8(sp)
    80002ae4:	00813023          	sd	s0,0(sp)
    80002ae8:	01010413          	addi	s0,sp,16
    TCB::dispatch();
    80002aec:	00000097          	auipc	ra,0x0
    80002af0:	b28080e7          	jalr	-1240(ra) # 80002614 <_ZN3TCB8dispatchEv>
}
    80002af4:	00813083          	ld	ra,8(sp)
    80002af8:	00013403          	ld	s0,0(sp)
    80002afc:	01010113          	addi	sp,sp,16
    80002b00:	00008067          	ret

0000000080002b04 <_ZN13threadHandler26thread_create_non_shedulerEPP3TCBPFvPvES3_S3_>:
                                              void *stack_space) {
    80002b04:	fe010113          	addi	sp,sp,-32
    80002b08:	00113c23          	sd	ra,24(sp)
    80002b0c:	00813823          	sd	s0,16(sp)
    80002b10:	00913423          	sd	s1,8(sp)
    80002b14:	02010413          	addi	s0,sp,32
    80002b18:	00050493          	mv	s1,a0
    80002b1c:	00058513          	mv	a0,a1
    *handle = TCB::createThreadNonScheduler(start_routine,arg);
    80002b20:	00060593          	mv	a1,a2
    80002b24:	00000097          	auipc	ra,0x0
    80002b28:	b58080e7          	jalr	-1192(ra) # 8000267c <_ZN3TCB24createThreadNonSchedulerEPFvPvES0_>
    80002b2c:	00a4b023          	sd	a0,0(s1)
    if(!*handle)
    80002b30:	00050e63          	beqz	a0,80002b4c <_ZN13threadHandler26thread_create_non_shedulerEPP3TCBPFvPvES3_S3_+0x48>
    return 0;
    80002b34:	00000513          	li	a0,0
}
    80002b38:	01813083          	ld	ra,24(sp)
    80002b3c:	01013403          	ld	s0,16(sp)
    80002b40:	00813483          	ld	s1,8(sp)
    80002b44:	02010113          	addi	sp,sp,32
    80002b48:	00008067          	ret
        return -1;
    80002b4c:	fff00513          	li	a0,-1
    80002b50:	fe9ff06f          	j	80002b38 <_ZN13threadHandler26thread_create_non_shedulerEPP3TCBPFvPvES3_S3_+0x34>

0000000080002b54 <_ZN16semaphoreHandler8sem_openEPP10ksemaphorej>:
int semaphoreHandler::sem_open(semaphoreHandler::sem_t *handle, uint init) {
    80002b54:	fe010113          	addi	sp,sp,-32
    80002b58:	00113c23          	sd	ra,24(sp)
    80002b5c:	00813823          	sd	s0,16(sp)
    80002b60:	00913423          	sd	s1,8(sp)
    80002b64:	02010413          	addi	s0,sp,32
    80002b68:	00050493          	mv	s1,a0
    *handle = ksemaphore::createSemaphore(init);
    80002b6c:	00058513          	mv	a0,a1
    80002b70:	ffffe097          	auipc	ra,0xffffe
    80002b74:	79c080e7          	jalr	1948(ra) # 8000130c <_ZN10ksemaphore15createSemaphoreEi>
    80002b78:	00a4b023          	sd	a0,0(s1)
    if(!handle)
    80002b7c:	00048e63          	beqz	s1,80002b98 <_ZN16semaphoreHandler8sem_openEPP10ksemaphorej+0x44>
    return 0;
    80002b80:	00000513          	li	a0,0
}
    80002b84:	01813083          	ld	ra,24(sp)
    80002b88:	01013403          	ld	s0,16(sp)
    80002b8c:	00813483          	ld	s1,8(sp)
    80002b90:	02010113          	addi	sp,sp,32
    80002b94:	00008067          	ret
        return -1;
    80002b98:	fff00513          	li	a0,-1
    80002b9c:	fe9ff06f          	j	80002b84 <_ZN16semaphoreHandler8sem_openEPP10ksemaphorej+0x30>

0000000080002ba0 <_ZN16semaphoreHandler8sem_waitEP10ksemaphore>:
    if(!id)
    80002ba0:	02050863          	beqz	a0,80002bd0 <_ZN16semaphoreHandler8sem_waitEP10ksemaphore+0x30>
int semaphoreHandler::sem_wait(semaphoreHandler::sem_t id) {
    80002ba4:	ff010113          	addi	sp,sp,-16
    80002ba8:	00113423          	sd	ra,8(sp)
    80002bac:	00813023          	sd	s0,0(sp)
    80002bb0:	01010413          	addi	s0,sp,16
    id->wait();
    80002bb4:	fffff097          	auipc	ra,0xfffff
    80002bb8:	888080e7          	jalr	-1912(ra) # 8000143c <_ZN10ksemaphore4waitEv>
    return 0;
    80002bbc:	00000513          	li	a0,0
}
    80002bc0:	00813083          	ld	ra,8(sp)
    80002bc4:	00013403          	ld	s0,0(sp)
    80002bc8:	01010113          	addi	sp,sp,16
    80002bcc:	00008067          	ret
        return -1;
    80002bd0:	fff00513          	li	a0,-1
}
    80002bd4:	00008067          	ret

0000000080002bd8 <_ZN16semaphoreHandler10sem_signalEP10ksemaphore>:
    if(!id)
    80002bd8:	02050863          	beqz	a0,80002c08 <_ZN16semaphoreHandler10sem_signalEP10ksemaphore+0x30>
int semaphoreHandler::sem_signal(semaphoreHandler::sem_t id) {
    80002bdc:	ff010113          	addi	sp,sp,-16
    80002be0:	00113423          	sd	ra,8(sp)
    80002be4:	00813023          	sd	s0,0(sp)
    80002be8:	01010413          	addi	s0,sp,16
    id->signal();
    80002bec:	fffff097          	auipc	ra,0xfffff
    80002bf0:	890080e7          	jalr	-1904(ra) # 8000147c <_ZN10ksemaphore6signalEv>
    return 0;
    80002bf4:	00000513          	li	a0,0
}
    80002bf8:	00813083          	ld	ra,8(sp)
    80002bfc:	00013403          	ld	s0,0(sp)
    80002c00:	01010113          	addi	sp,sp,16
    80002c04:	00008067          	ret
        return -1;
    80002c08:	fff00513          	li	a0,-1
}
    80002c0c:	00008067          	ret

0000000080002c10 <_ZN16semaphoreHandler9sem_closeEP10ksemaphore>:
    if(!handle)
    80002c10:	04050463          	beqz	a0,80002c58 <_ZN16semaphoreHandler9sem_closeEP10ksemaphore+0x48>
int semaphoreHandler::sem_close(semaphoreHandler::sem_t handle) {
    80002c14:	fe010113          	addi	sp,sp,-32
    80002c18:	00113c23          	sd	ra,24(sp)
    80002c1c:	00813823          	sd	s0,16(sp)
    80002c20:	00913423          	sd	s1,8(sp)
    80002c24:	02010413          	addi	s0,sp,32
    80002c28:	00050493          	mv	s1,a0
    handle->unblockAll();
    80002c2c:	fffff097          	auipc	ra,0xfffff
    80002c30:	890080e7          	jalr	-1904(ra) # 800014bc <_ZN10ksemaphore10unblockAllEv>
        MemoryAllocator::mem_free(ptr);
    80002c34:	00048513          	mv	a0,s1
    80002c38:	00000097          	auipc	ra,0x0
    80002c3c:	dbc080e7          	jalr	-580(ra) # 800029f4 <_ZN15MemoryAllocator8mem_freeEPv>
    return 0;
    80002c40:	00000513          	li	a0,0
}
    80002c44:	01813083          	ld	ra,24(sp)
    80002c48:	01013403          	ld	s0,16(sp)
    80002c4c:	00813483          	ld	s1,8(sp)
    80002c50:	02010113          	addi	sp,sp,32
    80002c54:	00008067          	ret
        return -1;
    80002c58:	fff00513          	li	a0,-1
}
    80002c5c:	00008067          	ret

0000000080002c60 <_ZN7Machine14callerFunctionEiPvS0_S0_>:
void Machine::callerFunction(int funcCode,void* par1,void* par2, void* par3){ //obradjuje sistemske pozive - poziva odg funkcije
    80002c60:	fc010113          	addi	sp,sp,-64
    80002c64:	02113c23          	sd	ra,56(sp)
    80002c68:	02813823          	sd	s0,48(sp)
    80002c6c:	02913423          	sd	s1,40(sp)
    80002c70:	03213023          	sd	s2,32(sp)
    80002c74:	04010413          	addi	s0,sp,64
    80002c78:	00050793          	mv	a5,a0
    80002c7c:	00058513          	mv	a0,a1
    if(funcCode == 0x01){
    80002c80:	00100713          	li	a4,1
    80002c84:	06e78463          	beq	a5,a4,80002cec <_ZN7Machine14callerFunctionEiPvS0_S0_+0x8c>
    80002c88:	00060593          	mv	a1,a2
    80002c8c:	00068613          	mv	a2,a3
    else if(funcCode == 0x02){
    80002c90:	00200713          	li	a4,2
    80002c94:	08e78c63          	beq	a5,a4,80002d2c <_ZN7Machine14callerFunctionEiPvS0_S0_+0xcc>
    else if(funcCode == 0x11){
    80002c98:	01100713          	li	a4,17
    80002c9c:	0ae78063          	beq	a5,a4,80002d3c <_ZN7Machine14callerFunctionEiPvS0_S0_+0xdc>
    else if(funcCode == 0x12){
    80002ca0:	01200713          	li	a4,18
    80002ca4:	0ae78663          	beq	a5,a4,80002d50 <_ZN7Machine14callerFunctionEiPvS0_S0_+0xf0>
    else if(funcCode == 0x13){
    80002ca8:	01300713          	li	a4,19
    80002cac:	0ae78a63          	beq	a5,a4,80002d60 <_ZN7Machine14callerFunctionEiPvS0_S0_+0x100>
    else if(funcCode == 0x14){
    80002cb0:	01400713          	li	a4,20
    80002cb4:	0ae78c63          	beq	a5,a4,80002d6c <_ZN7Machine14callerFunctionEiPvS0_S0_+0x10c>
    else if(funcCode == 0x21){
    80002cb8:	02100713          	li	a4,33
    80002cbc:	0ce78263          	beq	a5,a4,80002d80 <_ZN7Machine14callerFunctionEiPvS0_S0_+0x120>
    else if(funcCode == 0x22){
    80002cc0:	02200713          	li	a4,34
    80002cc4:	0ce78863          	beq	a5,a4,80002d94 <_ZN7Machine14callerFunctionEiPvS0_S0_+0x134>
    else if(funcCode == 0x23){
    80002cc8:	02300713          	li	a4,35
    80002ccc:	0ce78c63          	beq	a5,a4,80002da4 <_ZN7Machine14callerFunctionEiPvS0_S0_+0x144>
    else if(funcCode == 0x24){
    80002cd0:	02400713          	li	a4,36
    80002cd4:	0ee78063          	beq	a5,a4,80002db4 <_ZN7Machine14callerFunctionEiPvS0_S0_+0x154>
    else if(funcCode == 0x25){
    80002cd8:	02500713          	li	a4,37
    80002cdc:	0ee79463          	bne	a5,a4,80002dc4 <_ZN7Machine14callerFunctionEiPvS0_S0_+0x164>
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
}

inline void Machine::mc_sstatus(uint64 mask)
{
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80002ce0:	10000793          	li	a5,256
    80002ce4:	1007b073          	csrc	sstatus,a5
}
    80002ce8:	0100006f          	j	80002cf8 <_ZN7Machine14callerFunctionEiPvS0_S0_+0x98>
        void* ret = MemoryAllocator::mem_alloc((size_t)par1);
    80002cec:	00000097          	auipc	ra,0x0
    80002cf0:	ce0080e7          	jalr	-800(ra) # 800029cc <_ZN15MemoryAllocator9mem_allocEm>
        __asm__ volatile ("mv x10, %[povratna]" : : [povratna]"r"(ret)); //upisujemo povratnu vrednost u reg a0
    80002cf4:	00050513          	mv	a0,a0
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002cf8:	141027f3          	csrr	a5,sepc
    80002cfc:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    80002d00:	fd843783          	ld	a5,-40(s0)
    temp+=4;
    80002d04:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80002d08:	14179073          	csrw	sepc,a5
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    80002d0c:	00200793          	li	a5,2
    80002d10:	1447b073          	csrc	sip,a5
}
    80002d14:	03813083          	ld	ra,56(sp)
    80002d18:	03013403          	ld	s0,48(sp)
    80002d1c:	02813483          	ld	s1,40(sp)
    80002d20:	02013903          	ld	s2,32(sp)
    80002d24:	04010113          	addi	sp,sp,64
    80002d28:	00008067          	ret
        int ret = MemoryAllocator::mem_free(par1);
    80002d2c:	00000097          	auipc	ra,0x0
    80002d30:	cc8080e7          	jalr	-824(ra) # 800029f4 <_ZN15MemoryAllocator8mem_freeEPv>
        __asm__ volatile ("mv x10, %[povratna]" : : [povratna]"r"(ret));
    80002d34:	00050513          	mv	a0,a0
    80002d38:	fc1ff06f          	j	80002cf8 <_ZN7Machine14callerFunctionEiPvS0_S0_+0x98>
        int ret = threadHandler::thread_create((threadHandler::thread_t*)par1,(void(*)(void*))par2,par3, nullptr);
    80002d3c:	00000693          	li	a3,0
    80002d40:	00000097          	auipc	ra,0x0
    80002d44:	d0c080e7          	jalr	-756(ra) # 80002a4c <_ZN13threadHandler13thread_createEPP3TCBPFvPvES3_S3_>
        __asm__ volatile ("mv x10, %[povratna]" : : [povratna]"r"(ret));
    80002d48:	00050513          	mv	a0,a0
    80002d4c:	fadff06f          	j	80002cf8 <_ZN7Machine14callerFunctionEiPvS0_S0_+0x98>
        int ret = threadHandler::thread_exit();
    80002d50:	00000097          	auipc	ra,0x0
    80002d54:	d4c080e7          	jalr	-692(ra) # 80002a9c <_ZN13threadHandler11thread_exitEv>
        __asm__ volatile ("mv x10, %[povratna]" : : [povratna]"r"(ret));
    80002d58:	00050513          	mv	a0,a0
    80002d5c:	f9dff06f          	j	80002cf8 <_ZN7Machine14callerFunctionEiPvS0_S0_+0x98>
        threadHandler::thread_dispatch();
    80002d60:	00000097          	auipc	ra,0x0
    80002d64:	d7c080e7          	jalr	-644(ra) # 80002adc <_ZN13threadHandler15thread_dispatchEv>
    80002d68:	f91ff06f          	j	80002cf8 <_ZN7Machine14callerFunctionEiPvS0_S0_+0x98>
        int ret = threadHandler::thread_create_non_sheduler((threadHandler::thread_t*)par1,(void(*)(void*))par2,par3, nullptr);
    80002d6c:	00000693          	li	a3,0
    80002d70:	00000097          	auipc	ra,0x0
    80002d74:	d94080e7          	jalr	-620(ra) # 80002b04 <_ZN13threadHandler26thread_create_non_shedulerEPP3TCBPFvPvES3_S3_>
        __asm__ volatile ("mv x10, %[povratna]" : : [povratna]"r"(ret));
    80002d78:	00050513          	mv	a0,a0
    80002d7c:	f7dff06f          	j	80002cf8 <_ZN7Machine14callerFunctionEiPvS0_S0_+0x98>
        int ret = semaphoreHandler::sem_open((semaphoreHandler::sem_t*)par1,(int)(size_t)par2);
    80002d80:	0005859b          	sext.w	a1,a1
    80002d84:	00000097          	auipc	ra,0x0
    80002d88:	dd0080e7          	jalr	-560(ra) # 80002b54 <_ZN16semaphoreHandler8sem_openEPP10ksemaphorej>
        __asm__ volatile ("mv x10, %[povratna]" : : [povratna]"r"(ret));
    80002d8c:	00050513          	mv	a0,a0
    80002d90:	f69ff06f          	j	80002cf8 <_ZN7Machine14callerFunctionEiPvS0_S0_+0x98>
        int ret = semaphoreHandler::sem_close((semaphoreHandler::sem_t)par1);
    80002d94:	00000097          	auipc	ra,0x0
    80002d98:	e7c080e7          	jalr	-388(ra) # 80002c10 <_ZN16semaphoreHandler9sem_closeEP10ksemaphore>
        __asm__ volatile ("mv x10, %[povratna]" : : [povratna]"r"(ret));
    80002d9c:	00050513          	mv	a0,a0
    80002da0:	f59ff06f          	j	80002cf8 <_ZN7Machine14callerFunctionEiPvS0_S0_+0x98>
        int ret = semaphoreHandler::sem_wait((semaphoreHandler::sem_t)par1);
    80002da4:	00000097          	auipc	ra,0x0
    80002da8:	dfc080e7          	jalr	-516(ra) # 80002ba0 <_ZN16semaphoreHandler8sem_waitEP10ksemaphore>
        __asm__ volatile ("mv x10, %[povratna]" : : [povratna]"r"(ret));
    80002dac:	00050513          	mv	a0,a0
    80002db0:	f49ff06f          	j	80002cf8 <_ZN7Machine14callerFunctionEiPvS0_S0_+0x98>
        int ret = semaphoreHandler::sem_signal((semaphoreHandler::sem_t)par1);
    80002db4:	00000097          	auipc	ra,0x0
    80002db8:	e24080e7          	jalr	-476(ra) # 80002bd8 <_ZN16semaphoreHandler10sem_signalEP10ksemaphore>
        __asm__ volatile ("mv x10, %[povratna]" : : [povratna]"r"(ret));
    80002dbc:	00050513          	mv	a0,a0
    80002dc0:	f39ff06f          	j	80002cf8 <_ZN7Machine14callerFunctionEiPvS0_S0_+0x98>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002dc4:	141027f3          	csrr	a5,sepc
    80002dc8:	fcf43823          	sd	a5,-48(s0)
    return sepc;
    80002dcc:	fd043483          	ld	s1,-48(s0)
        uint64 sepc = r_sepc() + 4;
    80002dd0:	00448493          	addi	s1,s1,4

inline uint64 Machine::r_sstatus()
{
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002dd4:	100027f3          	csrr	a5,sstatus
    80002dd8:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    80002ddc:	fc843903          	ld	s2,-56(s0)
        TCB::timeSliceCounter = 0; //prilagodjeno nadogradnji za asinhrone prekide
    80002de0:	00004797          	auipc	a5,0x4
    80002de4:	5f87b783          	ld	a5,1528(a5) # 800073d8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002de8:	0007b023          	sd	zero,0(a5)
        TCB::dispatch();
    80002dec:	00000097          	auipc	ra,0x0
    80002df0:	828080e7          	jalr	-2008(ra) # 80002614 <_ZN3TCB8dispatchEv>
}

inline void Machine::w_sstatus(uint64 sstatus)
{
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002df4:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80002df8:	14149073          	csrw	sepc,s1
        return;
    80002dfc:	f19ff06f          	j	80002d14 <_ZN7Machine14callerFunctionEiPvS0_S0_+0xb4>

0000000080002e00 <_ZN7Machine20handleSuperVisorTrapEv>:
void Machine::handleSuperVisorTrap(){ //funkcija koja se poziva iz trap rutine, ona obezbedjuje odgovarajuci poziv odgovarajucoj funkciji
    80002e00:	fe010113          	addi	sp,sp,-32
    80002e04:	00113c23          	sd	ra,24(sp)
    80002e08:	00813823          	sd	s0,16(sp)
    80002e0c:	02010413          	addi	s0,sp,32
    __asm__ volatile ("csrr %[razlog], scause" : [razlog] "=r"(scauseVar)); //ovaj blok nam omogucava da prepoznamo do kojeg prekida je doslo
    80002e10:	14202773          	csrr	a4,scause
    __asm__ volatile ("mv %[kod], x10" : [kod]"=r"(a0Var));
    80002e14:	00050513          	mv	a0,a0
    __asm__ volatile ("mv %[param0], x11" : [param0]"=r"(a1Var));
    80002e18:	00058593          	mv	a1,a1
    __asm__ volatile ("mv %[param1], x12" : [param1]"=r"(a2Var));
    80002e1c:	00060613          	mv	a2,a2
    __asm__ volatile ("mv %[param2], x13" : [param2]"=r"(a3Var));
    80002e20:	00068693          	mv	a3,a3
    scauseVar = scauseVar & 0x7ffffff;
    80002e24:	080007b7          	lui	a5,0x8000
    80002e28:	fff78793          	addi	a5,a5,-1 # 7ffffff <_entry-0x78000001>
    80002e2c:	00f777b3          	and	a5,a4,a5
    if(bnt){
    80002e30:	06074263          	bltz	a4,80002e94 <_ZN7Machine20handleSuperVisorTrapEv+0x94>
        switch (scauseVar) {
    80002e34:	00700713          	li	a4,7
    80002e38:	0ce78463          	beq	a5,a4,80002f00 <_ZN7Machine20handleSuperVisorTrapEv+0x100>
    80002e3c:	08f76a63          	bltu	a4,a5,80002ed0 <_ZN7Machine20handleSuperVisorTrapEv+0xd0>
    80002e40:	00200713          	li	a4,2
    80002e44:	0ae78463          	beq	a5,a4,80002eec <_ZN7Machine20handleSuperVisorTrapEv+0xec>
    80002e48:	00500713          	li	a4,5
    80002e4c:	06e79463          	bne	a5,a4,80002eb4 <_ZN7Machine20handleSuperVisorTrapEv+0xb4>
                printString("Nedozvoljena adresa citanja\n");
    80002e50:	00003517          	auipc	a0,0x3
    80002e54:	30050513          	addi	a0,a0,768 # 80006150 <CONSOLE_STATUS+0x140>
    80002e58:	fffff097          	auipc	ra,0xfffff
    80002e5c:	480080e7          	jalr	1152(ra) # 800022d8 <_Z11printStringPKc>
    __asm__ volatile ("csrr %[stval], stval" : [stval] "=r"(stval));
    80002e60:	143027f3          	csrr	a5,stval
    80002e64:	fef43423          	sd	a5,-24(s0)
    return stval;
    80002e68:	fe843503          	ld	a0,-24(s0)
                printInteger(r_stval());
    80002e6c:	00000613          	li	a2,0
    80002e70:	00a00593          	li	a1,10
    80002e74:	0005051b          	sext.w	a0,a0
    80002e78:	fffff097          	auipc	ra,0xfffff
    80002e7c:	588080e7          	jalr	1416(ra) # 80002400 <_Z12printIntegeriii>
                printString("\n"); break; //nedozvoljena adresa citanja
    80002e80:	00003517          	auipc	a0,0x3
    80002e84:	42050513          	addi	a0,a0,1056 # 800062a0 <CONSOLE_STATUS+0x290>
    80002e88:	fffff097          	auipc	ra,0xfffff
    80002e8c:	450080e7          	jalr	1104(ra) # 800022d8 <_Z11printStringPKc>
    80002e90:	0240006f          	j	80002eb4 <_ZN7Machine20handleSuperVisorTrapEv+0xb4>
        if(scauseVar == 1){
    80002e94:	00100713          	li	a4,1
    80002e98:	00e78e63          	beq	a5,a4,80002eb4 <_ZN7Machine20handleSuperVisorTrapEv+0xb4>
        else if(scauseVar == 9){
    80002e9c:	00900713          	li	a4,9
    80002ea0:	02e78263          	beq	a5,a4,80002ec4 <_ZN7Machine20handleSuperVisorTrapEv+0xc4>
            printString("Ovo je nepoznati problem!\n");
    80002ea4:	00003517          	auipc	a0,0x3
    80002ea8:	27450513          	addi	a0,a0,628 # 80006118 <CONSOLE_STATUS+0x108>
    80002eac:	fffff097          	auipc	ra,0xfffff
    80002eb0:	42c080e7          	jalr	1068(ra) # 800022d8 <_Z11printStringPKc>
}
    80002eb4:	01813083          	ld	ra,24(sp)
    80002eb8:	01013403          	ld	s0,16(sp)
    80002ebc:	02010113          	addi	sp,sp,32
    80002ec0:	00008067          	ret
            console_handler();
    80002ec4:	00002097          	auipc	ra,0x2
    80002ec8:	1bc080e7          	jalr	444(ra) # 80005080 <console_handler>
    80002ecc:	fe9ff06f          	j	80002eb4 <_ZN7Machine20handleSuperVisorTrapEv+0xb4>
        switch (scauseVar) {
    80002ed0:	ff878793          	addi	a5,a5,-8
    80002ed4:	00100713          	li	a4,1
    80002ed8:	fcf76ee3          	bltu	a4,a5,80002eb4 <_ZN7Machine20handleSuperVisorTrapEv+0xb4>
                callerFunction(a0Var,(void *)a1Var, (void *)a2Var, (void *)a3Var); break;
    80002edc:	0005051b          	sext.w	a0,a0
    80002ee0:	00000097          	auipc	ra,0x0
    80002ee4:	d80080e7          	jalr	-640(ra) # 80002c60 <_ZN7Machine14callerFunctionEiPvS0_S0_>
}
    80002ee8:	fcdff06f          	j	80002eb4 <_ZN7Machine20handleSuperVisorTrapEv+0xb4>
                printString("ilegalna instrukcija\n"); break; //ileg instrukcija
    80002eec:	00003517          	auipc	a0,0x3
    80002ef0:	24c50513          	addi	a0,a0,588 # 80006138 <CONSOLE_STATUS+0x128>
    80002ef4:	fffff097          	auipc	ra,0xfffff
    80002ef8:	3e4080e7          	jalr	996(ra) # 800022d8 <_Z11printStringPKc>
    80002efc:	fb9ff06f          	j	80002eb4 <_ZN7Machine20handleSuperVisorTrapEv+0xb4>
                printString("Nedozvoljena adresa upisa\n");break; //nedozvoljena adresa upisa
    80002f00:	00003517          	auipc	a0,0x3
    80002f04:	27050513          	addi	a0,a0,624 # 80006170 <CONSOLE_STATUS+0x160>
    80002f08:	fffff097          	auipc	ra,0xfffff
    80002f0c:	3d0080e7          	jalr	976(ra) # 800022d8 <_Z11printStringPKc>
    80002f10:	fa5ff06f          	j	80002eb4 <_ZN7Machine20handleSuperVisorTrapEv+0xb4>

0000000080002f14 <_GLOBAL__sub_I__ZN15MemoryAllocator4headE>:
}
    80002f14:	ff010113          	addi	sp,sp,-16
    80002f18:	00113423          	sd	ra,8(sp)
    80002f1c:	00813023          	sd	s0,0(sp)
    80002f20:	01010413          	addi	s0,sp,16
    80002f24:	000105b7          	lui	a1,0x10
    80002f28:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80002f2c:	00100513          	li	a0,1
    80002f30:	00000097          	auipc	ra,0x0
    80002f34:	814080e7          	jalr	-2028(ra) # 80002744 <_Z41__static_initialization_and_destruction_0ii>
    80002f38:	00813083          	ld	ra,8(sp)
    80002f3c:	00013403          	ld	s0,0(sp)
    80002f40:	01010113          	addi	sp,sp,16
    80002f44:	00008067          	ret

0000000080002f48 <start>:
    80002f48:	ff010113          	addi	sp,sp,-16
    80002f4c:	00813423          	sd	s0,8(sp)
    80002f50:	01010413          	addi	s0,sp,16
    80002f54:	300027f3          	csrr	a5,mstatus
    80002f58:	ffffe737          	lui	a4,0xffffe
    80002f5c:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff60ef>
    80002f60:	00e7f7b3          	and	a5,a5,a4
    80002f64:	00001737          	lui	a4,0x1
    80002f68:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80002f6c:	00e7e7b3          	or	a5,a5,a4
    80002f70:	30079073          	csrw	mstatus,a5
    80002f74:	00000797          	auipc	a5,0x0
    80002f78:	16078793          	addi	a5,a5,352 # 800030d4 <system_main>
    80002f7c:	34179073          	csrw	mepc,a5
    80002f80:	00000793          	li	a5,0
    80002f84:	18079073          	csrw	satp,a5
    80002f88:	000107b7          	lui	a5,0x10
    80002f8c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002f90:	30279073          	csrw	medeleg,a5
    80002f94:	30379073          	csrw	mideleg,a5
    80002f98:	104027f3          	csrr	a5,sie
    80002f9c:	2227e793          	ori	a5,a5,546
    80002fa0:	10479073          	csrw	sie,a5
    80002fa4:	fff00793          	li	a5,-1
    80002fa8:	00a7d793          	srli	a5,a5,0xa
    80002fac:	3b079073          	csrw	pmpaddr0,a5
    80002fb0:	00f00793          	li	a5,15
    80002fb4:	3a079073          	csrw	pmpcfg0,a5
    80002fb8:	f14027f3          	csrr	a5,mhartid
    80002fbc:	0200c737          	lui	a4,0x200c
    80002fc0:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002fc4:	0007869b          	sext.w	a3,a5
    80002fc8:	00269713          	slli	a4,a3,0x2
    80002fcc:	000f4637          	lui	a2,0xf4
    80002fd0:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002fd4:	00d70733          	add	a4,a4,a3
    80002fd8:	0037979b          	slliw	a5,a5,0x3
    80002fdc:	020046b7          	lui	a3,0x2004
    80002fe0:	00d787b3          	add	a5,a5,a3
    80002fe4:	00c585b3          	add	a1,a1,a2
    80002fe8:	00371693          	slli	a3,a4,0x3
    80002fec:	00004717          	auipc	a4,0x4
    80002ff0:	4c470713          	addi	a4,a4,1220 # 800074b0 <timer_scratch>
    80002ff4:	00b7b023          	sd	a1,0(a5)
    80002ff8:	00d70733          	add	a4,a4,a3
    80002ffc:	00f73c23          	sd	a5,24(a4)
    80003000:	02c73023          	sd	a2,32(a4)
    80003004:	34071073          	csrw	mscratch,a4
    80003008:	00000797          	auipc	a5,0x0
    8000300c:	6e878793          	addi	a5,a5,1768 # 800036f0 <timervec>
    80003010:	30579073          	csrw	mtvec,a5
    80003014:	300027f3          	csrr	a5,mstatus
    80003018:	0087e793          	ori	a5,a5,8
    8000301c:	30079073          	csrw	mstatus,a5
    80003020:	304027f3          	csrr	a5,mie
    80003024:	0807e793          	ori	a5,a5,128
    80003028:	30479073          	csrw	mie,a5
    8000302c:	f14027f3          	csrr	a5,mhartid
    80003030:	0007879b          	sext.w	a5,a5
    80003034:	00078213          	mv	tp,a5
    80003038:	30200073          	mret
    8000303c:	00813403          	ld	s0,8(sp)
    80003040:	01010113          	addi	sp,sp,16
    80003044:	00008067          	ret

0000000080003048 <timerinit>:
    80003048:	ff010113          	addi	sp,sp,-16
    8000304c:	00813423          	sd	s0,8(sp)
    80003050:	01010413          	addi	s0,sp,16
    80003054:	f14027f3          	csrr	a5,mhartid
    80003058:	0200c737          	lui	a4,0x200c
    8000305c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003060:	0007869b          	sext.w	a3,a5
    80003064:	00269713          	slli	a4,a3,0x2
    80003068:	000f4637          	lui	a2,0xf4
    8000306c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003070:	00d70733          	add	a4,a4,a3
    80003074:	0037979b          	slliw	a5,a5,0x3
    80003078:	020046b7          	lui	a3,0x2004
    8000307c:	00d787b3          	add	a5,a5,a3
    80003080:	00c585b3          	add	a1,a1,a2
    80003084:	00371693          	slli	a3,a4,0x3
    80003088:	00004717          	auipc	a4,0x4
    8000308c:	42870713          	addi	a4,a4,1064 # 800074b0 <timer_scratch>
    80003090:	00b7b023          	sd	a1,0(a5)
    80003094:	00d70733          	add	a4,a4,a3
    80003098:	00f73c23          	sd	a5,24(a4)
    8000309c:	02c73023          	sd	a2,32(a4)
    800030a0:	34071073          	csrw	mscratch,a4
    800030a4:	00000797          	auipc	a5,0x0
    800030a8:	64c78793          	addi	a5,a5,1612 # 800036f0 <timervec>
    800030ac:	30579073          	csrw	mtvec,a5
    800030b0:	300027f3          	csrr	a5,mstatus
    800030b4:	0087e793          	ori	a5,a5,8
    800030b8:	30079073          	csrw	mstatus,a5
    800030bc:	304027f3          	csrr	a5,mie
    800030c0:	0807e793          	ori	a5,a5,128
    800030c4:	30479073          	csrw	mie,a5
    800030c8:	00813403          	ld	s0,8(sp)
    800030cc:	01010113          	addi	sp,sp,16
    800030d0:	00008067          	ret

00000000800030d4 <system_main>:
    800030d4:	fe010113          	addi	sp,sp,-32
    800030d8:	00813823          	sd	s0,16(sp)
    800030dc:	00913423          	sd	s1,8(sp)
    800030e0:	00113c23          	sd	ra,24(sp)
    800030e4:	02010413          	addi	s0,sp,32
    800030e8:	00000097          	auipc	ra,0x0
    800030ec:	0c4080e7          	jalr	196(ra) # 800031ac <cpuid>
    800030f0:	00004497          	auipc	s1,0x4
    800030f4:	33048493          	addi	s1,s1,816 # 80007420 <started>
    800030f8:	02050263          	beqz	a0,8000311c <system_main+0x48>
    800030fc:	0004a783          	lw	a5,0(s1)
    80003100:	0007879b          	sext.w	a5,a5
    80003104:	fe078ce3          	beqz	a5,800030fc <system_main+0x28>
    80003108:	0ff0000f          	fence
    8000310c:	00003517          	auipc	a0,0x3
    80003110:	0b450513          	addi	a0,a0,180 # 800061c0 <CONSOLE_STATUS+0x1b0>
    80003114:	00001097          	auipc	ra,0x1
    80003118:	a78080e7          	jalr	-1416(ra) # 80003b8c <panic>
    8000311c:	00001097          	auipc	ra,0x1
    80003120:	9cc080e7          	jalr	-1588(ra) # 80003ae8 <consoleinit>
    80003124:	00001097          	auipc	ra,0x1
    80003128:	158080e7          	jalr	344(ra) # 8000427c <printfinit>
    8000312c:	00003517          	auipc	a0,0x3
    80003130:	17450513          	addi	a0,a0,372 # 800062a0 <CONSOLE_STATUS+0x290>
    80003134:	00001097          	auipc	ra,0x1
    80003138:	ab4080e7          	jalr	-1356(ra) # 80003be8 <__printf>
    8000313c:	00003517          	auipc	a0,0x3
    80003140:	05450513          	addi	a0,a0,84 # 80006190 <CONSOLE_STATUS+0x180>
    80003144:	00001097          	auipc	ra,0x1
    80003148:	aa4080e7          	jalr	-1372(ra) # 80003be8 <__printf>
    8000314c:	00003517          	auipc	a0,0x3
    80003150:	15450513          	addi	a0,a0,340 # 800062a0 <CONSOLE_STATUS+0x290>
    80003154:	00001097          	auipc	ra,0x1
    80003158:	a94080e7          	jalr	-1388(ra) # 80003be8 <__printf>
    8000315c:	00001097          	auipc	ra,0x1
    80003160:	4ac080e7          	jalr	1196(ra) # 80004608 <kinit>
    80003164:	00000097          	auipc	ra,0x0
    80003168:	148080e7          	jalr	328(ra) # 800032ac <trapinit>
    8000316c:	00000097          	auipc	ra,0x0
    80003170:	16c080e7          	jalr	364(ra) # 800032d8 <trapinithart>
    80003174:	00000097          	auipc	ra,0x0
    80003178:	5bc080e7          	jalr	1468(ra) # 80003730 <plicinit>
    8000317c:	00000097          	auipc	ra,0x0
    80003180:	5dc080e7          	jalr	1500(ra) # 80003758 <plicinithart>
    80003184:	00000097          	auipc	ra,0x0
    80003188:	078080e7          	jalr	120(ra) # 800031fc <userinit>
    8000318c:	0ff0000f          	fence
    80003190:	00100793          	li	a5,1
    80003194:	00003517          	auipc	a0,0x3
    80003198:	01450513          	addi	a0,a0,20 # 800061a8 <CONSOLE_STATUS+0x198>
    8000319c:	00f4a023          	sw	a5,0(s1)
    800031a0:	00001097          	auipc	ra,0x1
    800031a4:	a48080e7          	jalr	-1464(ra) # 80003be8 <__printf>
    800031a8:	0000006f          	j	800031a8 <system_main+0xd4>

00000000800031ac <cpuid>:
    800031ac:	ff010113          	addi	sp,sp,-16
    800031b0:	00813423          	sd	s0,8(sp)
    800031b4:	01010413          	addi	s0,sp,16
    800031b8:	00020513          	mv	a0,tp
    800031bc:	00813403          	ld	s0,8(sp)
    800031c0:	0005051b          	sext.w	a0,a0
    800031c4:	01010113          	addi	sp,sp,16
    800031c8:	00008067          	ret

00000000800031cc <mycpu>:
    800031cc:	ff010113          	addi	sp,sp,-16
    800031d0:	00813423          	sd	s0,8(sp)
    800031d4:	01010413          	addi	s0,sp,16
    800031d8:	00020793          	mv	a5,tp
    800031dc:	00813403          	ld	s0,8(sp)
    800031e0:	0007879b          	sext.w	a5,a5
    800031e4:	00779793          	slli	a5,a5,0x7
    800031e8:	00005517          	auipc	a0,0x5
    800031ec:	2f850513          	addi	a0,a0,760 # 800084e0 <cpus>
    800031f0:	00f50533          	add	a0,a0,a5
    800031f4:	01010113          	addi	sp,sp,16
    800031f8:	00008067          	ret

00000000800031fc <userinit>:
    800031fc:	ff010113          	addi	sp,sp,-16
    80003200:	00813423          	sd	s0,8(sp)
    80003204:	01010413          	addi	s0,sp,16
    80003208:	00813403          	ld	s0,8(sp)
    8000320c:	01010113          	addi	sp,sp,16
    80003210:	fffff317          	auipc	t1,0xfffff
    80003214:	e1430067          	jr	-492(t1) # 80002024 <main>

0000000080003218 <either_copyout>:
    80003218:	ff010113          	addi	sp,sp,-16
    8000321c:	00813023          	sd	s0,0(sp)
    80003220:	00113423          	sd	ra,8(sp)
    80003224:	01010413          	addi	s0,sp,16
    80003228:	02051663          	bnez	a0,80003254 <either_copyout+0x3c>
    8000322c:	00058513          	mv	a0,a1
    80003230:	00060593          	mv	a1,a2
    80003234:	0006861b          	sext.w	a2,a3
    80003238:	00002097          	auipc	ra,0x2
    8000323c:	c5c080e7          	jalr	-932(ra) # 80004e94 <__memmove>
    80003240:	00813083          	ld	ra,8(sp)
    80003244:	00013403          	ld	s0,0(sp)
    80003248:	00000513          	li	a0,0
    8000324c:	01010113          	addi	sp,sp,16
    80003250:	00008067          	ret
    80003254:	00003517          	auipc	a0,0x3
    80003258:	f9450513          	addi	a0,a0,-108 # 800061e8 <CONSOLE_STATUS+0x1d8>
    8000325c:	00001097          	auipc	ra,0x1
    80003260:	930080e7          	jalr	-1744(ra) # 80003b8c <panic>

0000000080003264 <either_copyin>:
    80003264:	ff010113          	addi	sp,sp,-16
    80003268:	00813023          	sd	s0,0(sp)
    8000326c:	00113423          	sd	ra,8(sp)
    80003270:	01010413          	addi	s0,sp,16
    80003274:	02059463          	bnez	a1,8000329c <either_copyin+0x38>
    80003278:	00060593          	mv	a1,a2
    8000327c:	0006861b          	sext.w	a2,a3
    80003280:	00002097          	auipc	ra,0x2
    80003284:	c14080e7          	jalr	-1004(ra) # 80004e94 <__memmove>
    80003288:	00813083          	ld	ra,8(sp)
    8000328c:	00013403          	ld	s0,0(sp)
    80003290:	00000513          	li	a0,0
    80003294:	01010113          	addi	sp,sp,16
    80003298:	00008067          	ret
    8000329c:	00003517          	auipc	a0,0x3
    800032a0:	f7450513          	addi	a0,a0,-140 # 80006210 <CONSOLE_STATUS+0x200>
    800032a4:	00001097          	auipc	ra,0x1
    800032a8:	8e8080e7          	jalr	-1816(ra) # 80003b8c <panic>

00000000800032ac <trapinit>:
    800032ac:	ff010113          	addi	sp,sp,-16
    800032b0:	00813423          	sd	s0,8(sp)
    800032b4:	01010413          	addi	s0,sp,16
    800032b8:	00813403          	ld	s0,8(sp)
    800032bc:	00003597          	auipc	a1,0x3
    800032c0:	f7c58593          	addi	a1,a1,-132 # 80006238 <CONSOLE_STATUS+0x228>
    800032c4:	00005517          	auipc	a0,0x5
    800032c8:	29c50513          	addi	a0,a0,668 # 80008560 <tickslock>
    800032cc:	01010113          	addi	sp,sp,16
    800032d0:	00001317          	auipc	t1,0x1
    800032d4:	5c830067          	jr	1480(t1) # 80004898 <initlock>

00000000800032d8 <trapinithart>:
    800032d8:	ff010113          	addi	sp,sp,-16
    800032dc:	00813423          	sd	s0,8(sp)
    800032e0:	01010413          	addi	s0,sp,16
    800032e4:	00000797          	auipc	a5,0x0
    800032e8:	2fc78793          	addi	a5,a5,764 # 800035e0 <kernelvec>
    800032ec:	10579073          	csrw	stvec,a5
    800032f0:	00813403          	ld	s0,8(sp)
    800032f4:	01010113          	addi	sp,sp,16
    800032f8:	00008067          	ret

00000000800032fc <usertrap>:
    800032fc:	ff010113          	addi	sp,sp,-16
    80003300:	00813423          	sd	s0,8(sp)
    80003304:	01010413          	addi	s0,sp,16
    80003308:	00813403          	ld	s0,8(sp)
    8000330c:	01010113          	addi	sp,sp,16
    80003310:	00008067          	ret

0000000080003314 <usertrapret>:
    80003314:	ff010113          	addi	sp,sp,-16
    80003318:	00813423          	sd	s0,8(sp)
    8000331c:	01010413          	addi	s0,sp,16
    80003320:	00813403          	ld	s0,8(sp)
    80003324:	01010113          	addi	sp,sp,16
    80003328:	00008067          	ret

000000008000332c <kerneltrap>:
    8000332c:	fe010113          	addi	sp,sp,-32
    80003330:	00813823          	sd	s0,16(sp)
    80003334:	00113c23          	sd	ra,24(sp)
    80003338:	00913423          	sd	s1,8(sp)
    8000333c:	02010413          	addi	s0,sp,32
    80003340:	142025f3          	csrr	a1,scause
    80003344:	100027f3          	csrr	a5,sstatus
    80003348:	0027f793          	andi	a5,a5,2
    8000334c:	10079c63          	bnez	a5,80003464 <kerneltrap+0x138>
    80003350:	142027f3          	csrr	a5,scause
    80003354:	0207ce63          	bltz	a5,80003390 <kerneltrap+0x64>
    80003358:	00003517          	auipc	a0,0x3
    8000335c:	f2850513          	addi	a0,a0,-216 # 80006280 <CONSOLE_STATUS+0x270>
    80003360:	00001097          	auipc	ra,0x1
    80003364:	888080e7          	jalr	-1912(ra) # 80003be8 <__printf>
    80003368:	141025f3          	csrr	a1,sepc
    8000336c:	14302673          	csrr	a2,stval
    80003370:	00003517          	auipc	a0,0x3
    80003374:	f2050513          	addi	a0,a0,-224 # 80006290 <CONSOLE_STATUS+0x280>
    80003378:	00001097          	auipc	ra,0x1
    8000337c:	870080e7          	jalr	-1936(ra) # 80003be8 <__printf>
    80003380:	00003517          	auipc	a0,0x3
    80003384:	f2850513          	addi	a0,a0,-216 # 800062a8 <CONSOLE_STATUS+0x298>
    80003388:	00001097          	auipc	ra,0x1
    8000338c:	804080e7          	jalr	-2044(ra) # 80003b8c <panic>
    80003390:	0ff7f713          	andi	a4,a5,255
    80003394:	00900693          	li	a3,9
    80003398:	04d70063          	beq	a4,a3,800033d8 <kerneltrap+0xac>
    8000339c:	fff00713          	li	a4,-1
    800033a0:	03f71713          	slli	a4,a4,0x3f
    800033a4:	00170713          	addi	a4,a4,1
    800033a8:	fae798e3          	bne	a5,a4,80003358 <kerneltrap+0x2c>
    800033ac:	00000097          	auipc	ra,0x0
    800033b0:	e00080e7          	jalr	-512(ra) # 800031ac <cpuid>
    800033b4:	06050663          	beqz	a0,80003420 <kerneltrap+0xf4>
    800033b8:	144027f3          	csrr	a5,sip
    800033bc:	ffd7f793          	andi	a5,a5,-3
    800033c0:	14479073          	csrw	sip,a5
    800033c4:	01813083          	ld	ra,24(sp)
    800033c8:	01013403          	ld	s0,16(sp)
    800033cc:	00813483          	ld	s1,8(sp)
    800033d0:	02010113          	addi	sp,sp,32
    800033d4:	00008067          	ret
    800033d8:	00000097          	auipc	ra,0x0
    800033dc:	3cc080e7          	jalr	972(ra) # 800037a4 <plic_claim>
    800033e0:	00a00793          	li	a5,10
    800033e4:	00050493          	mv	s1,a0
    800033e8:	06f50863          	beq	a0,a5,80003458 <kerneltrap+0x12c>
    800033ec:	fc050ce3          	beqz	a0,800033c4 <kerneltrap+0x98>
    800033f0:	00050593          	mv	a1,a0
    800033f4:	00003517          	auipc	a0,0x3
    800033f8:	e6c50513          	addi	a0,a0,-404 # 80006260 <CONSOLE_STATUS+0x250>
    800033fc:	00000097          	auipc	ra,0x0
    80003400:	7ec080e7          	jalr	2028(ra) # 80003be8 <__printf>
    80003404:	01013403          	ld	s0,16(sp)
    80003408:	01813083          	ld	ra,24(sp)
    8000340c:	00048513          	mv	a0,s1
    80003410:	00813483          	ld	s1,8(sp)
    80003414:	02010113          	addi	sp,sp,32
    80003418:	00000317          	auipc	t1,0x0
    8000341c:	3c430067          	jr	964(t1) # 800037dc <plic_complete>
    80003420:	00005517          	auipc	a0,0x5
    80003424:	14050513          	addi	a0,a0,320 # 80008560 <tickslock>
    80003428:	00001097          	auipc	ra,0x1
    8000342c:	494080e7          	jalr	1172(ra) # 800048bc <acquire>
    80003430:	00004717          	auipc	a4,0x4
    80003434:	ff470713          	addi	a4,a4,-12 # 80007424 <ticks>
    80003438:	00072783          	lw	a5,0(a4)
    8000343c:	00005517          	auipc	a0,0x5
    80003440:	12450513          	addi	a0,a0,292 # 80008560 <tickslock>
    80003444:	0017879b          	addiw	a5,a5,1
    80003448:	00f72023          	sw	a5,0(a4)
    8000344c:	00001097          	auipc	ra,0x1
    80003450:	53c080e7          	jalr	1340(ra) # 80004988 <release>
    80003454:	f65ff06f          	j	800033b8 <kerneltrap+0x8c>
    80003458:	00001097          	auipc	ra,0x1
    8000345c:	098080e7          	jalr	152(ra) # 800044f0 <uartintr>
    80003460:	fa5ff06f          	j	80003404 <kerneltrap+0xd8>
    80003464:	00003517          	auipc	a0,0x3
    80003468:	ddc50513          	addi	a0,a0,-548 # 80006240 <CONSOLE_STATUS+0x230>
    8000346c:	00000097          	auipc	ra,0x0
    80003470:	720080e7          	jalr	1824(ra) # 80003b8c <panic>

0000000080003474 <clockintr>:
    80003474:	fe010113          	addi	sp,sp,-32
    80003478:	00813823          	sd	s0,16(sp)
    8000347c:	00913423          	sd	s1,8(sp)
    80003480:	00113c23          	sd	ra,24(sp)
    80003484:	02010413          	addi	s0,sp,32
    80003488:	00005497          	auipc	s1,0x5
    8000348c:	0d848493          	addi	s1,s1,216 # 80008560 <tickslock>
    80003490:	00048513          	mv	a0,s1
    80003494:	00001097          	auipc	ra,0x1
    80003498:	428080e7          	jalr	1064(ra) # 800048bc <acquire>
    8000349c:	00004717          	auipc	a4,0x4
    800034a0:	f8870713          	addi	a4,a4,-120 # 80007424 <ticks>
    800034a4:	00072783          	lw	a5,0(a4)
    800034a8:	01013403          	ld	s0,16(sp)
    800034ac:	01813083          	ld	ra,24(sp)
    800034b0:	00048513          	mv	a0,s1
    800034b4:	0017879b          	addiw	a5,a5,1
    800034b8:	00813483          	ld	s1,8(sp)
    800034bc:	00f72023          	sw	a5,0(a4)
    800034c0:	02010113          	addi	sp,sp,32
    800034c4:	00001317          	auipc	t1,0x1
    800034c8:	4c430067          	jr	1220(t1) # 80004988 <release>

00000000800034cc <devintr>:
    800034cc:	142027f3          	csrr	a5,scause
    800034d0:	00000513          	li	a0,0
    800034d4:	0007c463          	bltz	a5,800034dc <devintr+0x10>
    800034d8:	00008067          	ret
    800034dc:	fe010113          	addi	sp,sp,-32
    800034e0:	00813823          	sd	s0,16(sp)
    800034e4:	00113c23          	sd	ra,24(sp)
    800034e8:	00913423          	sd	s1,8(sp)
    800034ec:	02010413          	addi	s0,sp,32
    800034f0:	0ff7f713          	andi	a4,a5,255
    800034f4:	00900693          	li	a3,9
    800034f8:	04d70c63          	beq	a4,a3,80003550 <devintr+0x84>
    800034fc:	fff00713          	li	a4,-1
    80003500:	03f71713          	slli	a4,a4,0x3f
    80003504:	00170713          	addi	a4,a4,1
    80003508:	00e78c63          	beq	a5,a4,80003520 <devintr+0x54>
    8000350c:	01813083          	ld	ra,24(sp)
    80003510:	01013403          	ld	s0,16(sp)
    80003514:	00813483          	ld	s1,8(sp)
    80003518:	02010113          	addi	sp,sp,32
    8000351c:	00008067          	ret
    80003520:	00000097          	auipc	ra,0x0
    80003524:	c8c080e7          	jalr	-884(ra) # 800031ac <cpuid>
    80003528:	06050663          	beqz	a0,80003594 <devintr+0xc8>
    8000352c:	144027f3          	csrr	a5,sip
    80003530:	ffd7f793          	andi	a5,a5,-3
    80003534:	14479073          	csrw	sip,a5
    80003538:	01813083          	ld	ra,24(sp)
    8000353c:	01013403          	ld	s0,16(sp)
    80003540:	00813483          	ld	s1,8(sp)
    80003544:	00200513          	li	a0,2
    80003548:	02010113          	addi	sp,sp,32
    8000354c:	00008067          	ret
    80003550:	00000097          	auipc	ra,0x0
    80003554:	254080e7          	jalr	596(ra) # 800037a4 <plic_claim>
    80003558:	00a00793          	li	a5,10
    8000355c:	00050493          	mv	s1,a0
    80003560:	06f50663          	beq	a0,a5,800035cc <devintr+0x100>
    80003564:	00100513          	li	a0,1
    80003568:	fa0482e3          	beqz	s1,8000350c <devintr+0x40>
    8000356c:	00048593          	mv	a1,s1
    80003570:	00003517          	auipc	a0,0x3
    80003574:	cf050513          	addi	a0,a0,-784 # 80006260 <CONSOLE_STATUS+0x250>
    80003578:	00000097          	auipc	ra,0x0
    8000357c:	670080e7          	jalr	1648(ra) # 80003be8 <__printf>
    80003580:	00048513          	mv	a0,s1
    80003584:	00000097          	auipc	ra,0x0
    80003588:	258080e7          	jalr	600(ra) # 800037dc <plic_complete>
    8000358c:	00100513          	li	a0,1
    80003590:	f7dff06f          	j	8000350c <devintr+0x40>
    80003594:	00005517          	auipc	a0,0x5
    80003598:	fcc50513          	addi	a0,a0,-52 # 80008560 <tickslock>
    8000359c:	00001097          	auipc	ra,0x1
    800035a0:	320080e7          	jalr	800(ra) # 800048bc <acquire>
    800035a4:	00004717          	auipc	a4,0x4
    800035a8:	e8070713          	addi	a4,a4,-384 # 80007424 <ticks>
    800035ac:	00072783          	lw	a5,0(a4)
    800035b0:	00005517          	auipc	a0,0x5
    800035b4:	fb050513          	addi	a0,a0,-80 # 80008560 <tickslock>
    800035b8:	0017879b          	addiw	a5,a5,1
    800035bc:	00f72023          	sw	a5,0(a4)
    800035c0:	00001097          	auipc	ra,0x1
    800035c4:	3c8080e7          	jalr	968(ra) # 80004988 <release>
    800035c8:	f65ff06f          	j	8000352c <devintr+0x60>
    800035cc:	00001097          	auipc	ra,0x1
    800035d0:	f24080e7          	jalr	-220(ra) # 800044f0 <uartintr>
    800035d4:	fadff06f          	j	80003580 <devintr+0xb4>
	...

00000000800035e0 <kernelvec>:
    800035e0:	f0010113          	addi	sp,sp,-256
    800035e4:	00113023          	sd	ra,0(sp)
    800035e8:	00213423          	sd	sp,8(sp)
    800035ec:	00313823          	sd	gp,16(sp)
    800035f0:	00413c23          	sd	tp,24(sp)
    800035f4:	02513023          	sd	t0,32(sp)
    800035f8:	02613423          	sd	t1,40(sp)
    800035fc:	02713823          	sd	t2,48(sp)
    80003600:	02813c23          	sd	s0,56(sp)
    80003604:	04913023          	sd	s1,64(sp)
    80003608:	04a13423          	sd	a0,72(sp)
    8000360c:	04b13823          	sd	a1,80(sp)
    80003610:	04c13c23          	sd	a2,88(sp)
    80003614:	06d13023          	sd	a3,96(sp)
    80003618:	06e13423          	sd	a4,104(sp)
    8000361c:	06f13823          	sd	a5,112(sp)
    80003620:	07013c23          	sd	a6,120(sp)
    80003624:	09113023          	sd	a7,128(sp)
    80003628:	09213423          	sd	s2,136(sp)
    8000362c:	09313823          	sd	s3,144(sp)
    80003630:	09413c23          	sd	s4,152(sp)
    80003634:	0b513023          	sd	s5,160(sp)
    80003638:	0b613423          	sd	s6,168(sp)
    8000363c:	0b713823          	sd	s7,176(sp)
    80003640:	0b813c23          	sd	s8,184(sp)
    80003644:	0d913023          	sd	s9,192(sp)
    80003648:	0da13423          	sd	s10,200(sp)
    8000364c:	0db13823          	sd	s11,208(sp)
    80003650:	0dc13c23          	sd	t3,216(sp)
    80003654:	0fd13023          	sd	t4,224(sp)
    80003658:	0fe13423          	sd	t5,232(sp)
    8000365c:	0ff13823          	sd	t6,240(sp)
    80003660:	ccdff0ef          	jal	ra,8000332c <kerneltrap>
    80003664:	00013083          	ld	ra,0(sp)
    80003668:	00813103          	ld	sp,8(sp)
    8000366c:	01013183          	ld	gp,16(sp)
    80003670:	02013283          	ld	t0,32(sp)
    80003674:	02813303          	ld	t1,40(sp)
    80003678:	03013383          	ld	t2,48(sp)
    8000367c:	03813403          	ld	s0,56(sp)
    80003680:	04013483          	ld	s1,64(sp)
    80003684:	04813503          	ld	a0,72(sp)
    80003688:	05013583          	ld	a1,80(sp)
    8000368c:	05813603          	ld	a2,88(sp)
    80003690:	06013683          	ld	a3,96(sp)
    80003694:	06813703          	ld	a4,104(sp)
    80003698:	07013783          	ld	a5,112(sp)
    8000369c:	07813803          	ld	a6,120(sp)
    800036a0:	08013883          	ld	a7,128(sp)
    800036a4:	08813903          	ld	s2,136(sp)
    800036a8:	09013983          	ld	s3,144(sp)
    800036ac:	09813a03          	ld	s4,152(sp)
    800036b0:	0a013a83          	ld	s5,160(sp)
    800036b4:	0a813b03          	ld	s6,168(sp)
    800036b8:	0b013b83          	ld	s7,176(sp)
    800036bc:	0b813c03          	ld	s8,184(sp)
    800036c0:	0c013c83          	ld	s9,192(sp)
    800036c4:	0c813d03          	ld	s10,200(sp)
    800036c8:	0d013d83          	ld	s11,208(sp)
    800036cc:	0d813e03          	ld	t3,216(sp)
    800036d0:	0e013e83          	ld	t4,224(sp)
    800036d4:	0e813f03          	ld	t5,232(sp)
    800036d8:	0f013f83          	ld	t6,240(sp)
    800036dc:	10010113          	addi	sp,sp,256
    800036e0:	10200073          	sret
    800036e4:	00000013          	nop
    800036e8:	00000013          	nop
    800036ec:	00000013          	nop

00000000800036f0 <timervec>:
    800036f0:	34051573          	csrrw	a0,mscratch,a0
    800036f4:	00b53023          	sd	a1,0(a0)
    800036f8:	00c53423          	sd	a2,8(a0)
    800036fc:	00d53823          	sd	a3,16(a0)
    80003700:	01853583          	ld	a1,24(a0)
    80003704:	02053603          	ld	a2,32(a0)
    80003708:	0005b683          	ld	a3,0(a1)
    8000370c:	00c686b3          	add	a3,a3,a2
    80003710:	00d5b023          	sd	a3,0(a1)
    80003714:	00200593          	li	a1,2
    80003718:	14459073          	csrw	sip,a1
    8000371c:	01053683          	ld	a3,16(a0)
    80003720:	00853603          	ld	a2,8(a0)
    80003724:	00053583          	ld	a1,0(a0)
    80003728:	34051573          	csrrw	a0,mscratch,a0
    8000372c:	30200073          	mret

0000000080003730 <plicinit>:
    80003730:	ff010113          	addi	sp,sp,-16
    80003734:	00813423          	sd	s0,8(sp)
    80003738:	01010413          	addi	s0,sp,16
    8000373c:	00813403          	ld	s0,8(sp)
    80003740:	0c0007b7          	lui	a5,0xc000
    80003744:	00100713          	li	a4,1
    80003748:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000374c:	00e7a223          	sw	a4,4(a5)
    80003750:	01010113          	addi	sp,sp,16
    80003754:	00008067          	ret

0000000080003758 <plicinithart>:
    80003758:	ff010113          	addi	sp,sp,-16
    8000375c:	00813023          	sd	s0,0(sp)
    80003760:	00113423          	sd	ra,8(sp)
    80003764:	01010413          	addi	s0,sp,16
    80003768:	00000097          	auipc	ra,0x0
    8000376c:	a44080e7          	jalr	-1468(ra) # 800031ac <cpuid>
    80003770:	0085171b          	slliw	a4,a0,0x8
    80003774:	0c0027b7          	lui	a5,0xc002
    80003778:	00e787b3          	add	a5,a5,a4
    8000377c:	40200713          	li	a4,1026
    80003780:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80003784:	00813083          	ld	ra,8(sp)
    80003788:	00013403          	ld	s0,0(sp)
    8000378c:	00d5151b          	slliw	a0,a0,0xd
    80003790:	0c2017b7          	lui	a5,0xc201
    80003794:	00a78533          	add	a0,a5,a0
    80003798:	00052023          	sw	zero,0(a0)
    8000379c:	01010113          	addi	sp,sp,16
    800037a0:	00008067          	ret

00000000800037a4 <plic_claim>:
    800037a4:	ff010113          	addi	sp,sp,-16
    800037a8:	00813023          	sd	s0,0(sp)
    800037ac:	00113423          	sd	ra,8(sp)
    800037b0:	01010413          	addi	s0,sp,16
    800037b4:	00000097          	auipc	ra,0x0
    800037b8:	9f8080e7          	jalr	-1544(ra) # 800031ac <cpuid>
    800037bc:	00813083          	ld	ra,8(sp)
    800037c0:	00013403          	ld	s0,0(sp)
    800037c4:	00d5151b          	slliw	a0,a0,0xd
    800037c8:	0c2017b7          	lui	a5,0xc201
    800037cc:	00a78533          	add	a0,a5,a0
    800037d0:	00452503          	lw	a0,4(a0)
    800037d4:	01010113          	addi	sp,sp,16
    800037d8:	00008067          	ret

00000000800037dc <plic_complete>:
    800037dc:	fe010113          	addi	sp,sp,-32
    800037e0:	00813823          	sd	s0,16(sp)
    800037e4:	00913423          	sd	s1,8(sp)
    800037e8:	00113c23          	sd	ra,24(sp)
    800037ec:	02010413          	addi	s0,sp,32
    800037f0:	00050493          	mv	s1,a0
    800037f4:	00000097          	auipc	ra,0x0
    800037f8:	9b8080e7          	jalr	-1608(ra) # 800031ac <cpuid>
    800037fc:	01813083          	ld	ra,24(sp)
    80003800:	01013403          	ld	s0,16(sp)
    80003804:	00d5179b          	slliw	a5,a0,0xd
    80003808:	0c201737          	lui	a4,0xc201
    8000380c:	00f707b3          	add	a5,a4,a5
    80003810:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80003814:	00813483          	ld	s1,8(sp)
    80003818:	02010113          	addi	sp,sp,32
    8000381c:	00008067          	ret

0000000080003820 <consolewrite>:
    80003820:	fb010113          	addi	sp,sp,-80
    80003824:	04813023          	sd	s0,64(sp)
    80003828:	04113423          	sd	ra,72(sp)
    8000382c:	02913c23          	sd	s1,56(sp)
    80003830:	03213823          	sd	s2,48(sp)
    80003834:	03313423          	sd	s3,40(sp)
    80003838:	03413023          	sd	s4,32(sp)
    8000383c:	01513c23          	sd	s5,24(sp)
    80003840:	05010413          	addi	s0,sp,80
    80003844:	06c05c63          	blez	a2,800038bc <consolewrite+0x9c>
    80003848:	00060993          	mv	s3,a2
    8000384c:	00050a13          	mv	s4,a0
    80003850:	00058493          	mv	s1,a1
    80003854:	00000913          	li	s2,0
    80003858:	fff00a93          	li	s5,-1
    8000385c:	01c0006f          	j	80003878 <consolewrite+0x58>
    80003860:	fbf44503          	lbu	a0,-65(s0)
    80003864:	0019091b          	addiw	s2,s2,1
    80003868:	00148493          	addi	s1,s1,1
    8000386c:	00001097          	auipc	ra,0x1
    80003870:	a9c080e7          	jalr	-1380(ra) # 80004308 <uartputc>
    80003874:	03298063          	beq	s3,s2,80003894 <consolewrite+0x74>
    80003878:	00048613          	mv	a2,s1
    8000387c:	00100693          	li	a3,1
    80003880:	000a0593          	mv	a1,s4
    80003884:	fbf40513          	addi	a0,s0,-65
    80003888:	00000097          	auipc	ra,0x0
    8000388c:	9dc080e7          	jalr	-1572(ra) # 80003264 <either_copyin>
    80003890:	fd5518e3          	bne	a0,s5,80003860 <consolewrite+0x40>
    80003894:	04813083          	ld	ra,72(sp)
    80003898:	04013403          	ld	s0,64(sp)
    8000389c:	03813483          	ld	s1,56(sp)
    800038a0:	02813983          	ld	s3,40(sp)
    800038a4:	02013a03          	ld	s4,32(sp)
    800038a8:	01813a83          	ld	s5,24(sp)
    800038ac:	00090513          	mv	a0,s2
    800038b0:	03013903          	ld	s2,48(sp)
    800038b4:	05010113          	addi	sp,sp,80
    800038b8:	00008067          	ret
    800038bc:	00000913          	li	s2,0
    800038c0:	fd5ff06f          	j	80003894 <consolewrite+0x74>

00000000800038c4 <consoleread>:
    800038c4:	f9010113          	addi	sp,sp,-112
    800038c8:	06813023          	sd	s0,96(sp)
    800038cc:	04913c23          	sd	s1,88(sp)
    800038d0:	05213823          	sd	s2,80(sp)
    800038d4:	05313423          	sd	s3,72(sp)
    800038d8:	05413023          	sd	s4,64(sp)
    800038dc:	03513c23          	sd	s5,56(sp)
    800038e0:	03613823          	sd	s6,48(sp)
    800038e4:	03713423          	sd	s7,40(sp)
    800038e8:	03813023          	sd	s8,32(sp)
    800038ec:	06113423          	sd	ra,104(sp)
    800038f0:	01913c23          	sd	s9,24(sp)
    800038f4:	07010413          	addi	s0,sp,112
    800038f8:	00060b93          	mv	s7,a2
    800038fc:	00050913          	mv	s2,a0
    80003900:	00058c13          	mv	s8,a1
    80003904:	00060b1b          	sext.w	s6,a2
    80003908:	00005497          	auipc	s1,0x5
    8000390c:	c8048493          	addi	s1,s1,-896 # 80008588 <cons>
    80003910:	00400993          	li	s3,4
    80003914:	fff00a13          	li	s4,-1
    80003918:	00a00a93          	li	s5,10
    8000391c:	05705e63          	blez	s7,80003978 <consoleread+0xb4>
    80003920:	09c4a703          	lw	a4,156(s1)
    80003924:	0984a783          	lw	a5,152(s1)
    80003928:	0007071b          	sext.w	a4,a4
    8000392c:	08e78463          	beq	a5,a4,800039b4 <consoleread+0xf0>
    80003930:	07f7f713          	andi	a4,a5,127
    80003934:	00e48733          	add	a4,s1,a4
    80003938:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000393c:	0017869b          	addiw	a3,a5,1
    80003940:	08d4ac23          	sw	a3,152(s1)
    80003944:	00070c9b          	sext.w	s9,a4
    80003948:	0b370663          	beq	a4,s3,800039f4 <consoleread+0x130>
    8000394c:	00100693          	li	a3,1
    80003950:	f9f40613          	addi	a2,s0,-97
    80003954:	000c0593          	mv	a1,s8
    80003958:	00090513          	mv	a0,s2
    8000395c:	f8e40fa3          	sb	a4,-97(s0)
    80003960:	00000097          	auipc	ra,0x0
    80003964:	8b8080e7          	jalr	-1864(ra) # 80003218 <either_copyout>
    80003968:	01450863          	beq	a0,s4,80003978 <consoleread+0xb4>
    8000396c:	001c0c13          	addi	s8,s8,1
    80003970:	fffb8b9b          	addiw	s7,s7,-1
    80003974:	fb5c94e3          	bne	s9,s5,8000391c <consoleread+0x58>
    80003978:	000b851b          	sext.w	a0,s7
    8000397c:	06813083          	ld	ra,104(sp)
    80003980:	06013403          	ld	s0,96(sp)
    80003984:	05813483          	ld	s1,88(sp)
    80003988:	05013903          	ld	s2,80(sp)
    8000398c:	04813983          	ld	s3,72(sp)
    80003990:	04013a03          	ld	s4,64(sp)
    80003994:	03813a83          	ld	s5,56(sp)
    80003998:	02813b83          	ld	s7,40(sp)
    8000399c:	02013c03          	ld	s8,32(sp)
    800039a0:	01813c83          	ld	s9,24(sp)
    800039a4:	40ab053b          	subw	a0,s6,a0
    800039a8:	03013b03          	ld	s6,48(sp)
    800039ac:	07010113          	addi	sp,sp,112
    800039b0:	00008067          	ret
    800039b4:	00001097          	auipc	ra,0x1
    800039b8:	1d8080e7          	jalr	472(ra) # 80004b8c <push_on>
    800039bc:	0984a703          	lw	a4,152(s1)
    800039c0:	09c4a783          	lw	a5,156(s1)
    800039c4:	0007879b          	sext.w	a5,a5
    800039c8:	fef70ce3          	beq	a4,a5,800039c0 <consoleread+0xfc>
    800039cc:	00001097          	auipc	ra,0x1
    800039d0:	234080e7          	jalr	564(ra) # 80004c00 <pop_on>
    800039d4:	0984a783          	lw	a5,152(s1)
    800039d8:	07f7f713          	andi	a4,a5,127
    800039dc:	00e48733          	add	a4,s1,a4
    800039e0:	01874703          	lbu	a4,24(a4)
    800039e4:	0017869b          	addiw	a3,a5,1
    800039e8:	08d4ac23          	sw	a3,152(s1)
    800039ec:	00070c9b          	sext.w	s9,a4
    800039f0:	f5371ee3          	bne	a4,s3,8000394c <consoleread+0x88>
    800039f4:	000b851b          	sext.w	a0,s7
    800039f8:	f96bf2e3          	bgeu	s7,s6,8000397c <consoleread+0xb8>
    800039fc:	08f4ac23          	sw	a5,152(s1)
    80003a00:	f7dff06f          	j	8000397c <consoleread+0xb8>

0000000080003a04 <consputc>:
    80003a04:	10000793          	li	a5,256
    80003a08:	00f50663          	beq	a0,a5,80003a14 <consputc+0x10>
    80003a0c:	00001317          	auipc	t1,0x1
    80003a10:	9f430067          	jr	-1548(t1) # 80004400 <uartputc_sync>
    80003a14:	ff010113          	addi	sp,sp,-16
    80003a18:	00113423          	sd	ra,8(sp)
    80003a1c:	00813023          	sd	s0,0(sp)
    80003a20:	01010413          	addi	s0,sp,16
    80003a24:	00800513          	li	a0,8
    80003a28:	00001097          	auipc	ra,0x1
    80003a2c:	9d8080e7          	jalr	-1576(ra) # 80004400 <uartputc_sync>
    80003a30:	02000513          	li	a0,32
    80003a34:	00001097          	auipc	ra,0x1
    80003a38:	9cc080e7          	jalr	-1588(ra) # 80004400 <uartputc_sync>
    80003a3c:	00013403          	ld	s0,0(sp)
    80003a40:	00813083          	ld	ra,8(sp)
    80003a44:	00800513          	li	a0,8
    80003a48:	01010113          	addi	sp,sp,16
    80003a4c:	00001317          	auipc	t1,0x1
    80003a50:	9b430067          	jr	-1612(t1) # 80004400 <uartputc_sync>

0000000080003a54 <consoleintr>:
    80003a54:	fe010113          	addi	sp,sp,-32
    80003a58:	00813823          	sd	s0,16(sp)
    80003a5c:	00913423          	sd	s1,8(sp)
    80003a60:	01213023          	sd	s2,0(sp)
    80003a64:	00113c23          	sd	ra,24(sp)
    80003a68:	02010413          	addi	s0,sp,32
    80003a6c:	00005917          	auipc	s2,0x5
    80003a70:	b1c90913          	addi	s2,s2,-1252 # 80008588 <cons>
    80003a74:	00050493          	mv	s1,a0
    80003a78:	00090513          	mv	a0,s2
    80003a7c:	00001097          	auipc	ra,0x1
    80003a80:	e40080e7          	jalr	-448(ra) # 800048bc <acquire>
    80003a84:	02048c63          	beqz	s1,80003abc <consoleintr+0x68>
    80003a88:	0a092783          	lw	a5,160(s2)
    80003a8c:	09892703          	lw	a4,152(s2)
    80003a90:	07f00693          	li	a3,127
    80003a94:	40e7873b          	subw	a4,a5,a4
    80003a98:	02e6e263          	bltu	a3,a4,80003abc <consoleintr+0x68>
    80003a9c:	00d00713          	li	a4,13
    80003aa0:	04e48063          	beq	s1,a4,80003ae0 <consoleintr+0x8c>
    80003aa4:	07f7f713          	andi	a4,a5,127
    80003aa8:	00e90733          	add	a4,s2,a4
    80003aac:	0017879b          	addiw	a5,a5,1
    80003ab0:	0af92023          	sw	a5,160(s2)
    80003ab4:	00970c23          	sb	s1,24(a4)
    80003ab8:	08f92e23          	sw	a5,156(s2)
    80003abc:	01013403          	ld	s0,16(sp)
    80003ac0:	01813083          	ld	ra,24(sp)
    80003ac4:	00813483          	ld	s1,8(sp)
    80003ac8:	00013903          	ld	s2,0(sp)
    80003acc:	00005517          	auipc	a0,0x5
    80003ad0:	abc50513          	addi	a0,a0,-1348 # 80008588 <cons>
    80003ad4:	02010113          	addi	sp,sp,32
    80003ad8:	00001317          	auipc	t1,0x1
    80003adc:	eb030067          	jr	-336(t1) # 80004988 <release>
    80003ae0:	00a00493          	li	s1,10
    80003ae4:	fc1ff06f          	j	80003aa4 <consoleintr+0x50>

0000000080003ae8 <consoleinit>:
    80003ae8:	fe010113          	addi	sp,sp,-32
    80003aec:	00113c23          	sd	ra,24(sp)
    80003af0:	00813823          	sd	s0,16(sp)
    80003af4:	00913423          	sd	s1,8(sp)
    80003af8:	02010413          	addi	s0,sp,32
    80003afc:	00005497          	auipc	s1,0x5
    80003b00:	a8c48493          	addi	s1,s1,-1396 # 80008588 <cons>
    80003b04:	00048513          	mv	a0,s1
    80003b08:	00002597          	auipc	a1,0x2
    80003b0c:	7b058593          	addi	a1,a1,1968 # 800062b8 <CONSOLE_STATUS+0x2a8>
    80003b10:	00001097          	auipc	ra,0x1
    80003b14:	d88080e7          	jalr	-632(ra) # 80004898 <initlock>
    80003b18:	00000097          	auipc	ra,0x0
    80003b1c:	7ac080e7          	jalr	1964(ra) # 800042c4 <uartinit>
    80003b20:	01813083          	ld	ra,24(sp)
    80003b24:	01013403          	ld	s0,16(sp)
    80003b28:	00000797          	auipc	a5,0x0
    80003b2c:	d9c78793          	addi	a5,a5,-612 # 800038c4 <consoleread>
    80003b30:	0af4bc23          	sd	a5,184(s1)
    80003b34:	00000797          	auipc	a5,0x0
    80003b38:	cec78793          	addi	a5,a5,-788 # 80003820 <consolewrite>
    80003b3c:	0cf4b023          	sd	a5,192(s1)
    80003b40:	00813483          	ld	s1,8(sp)
    80003b44:	02010113          	addi	sp,sp,32
    80003b48:	00008067          	ret

0000000080003b4c <console_read>:
    80003b4c:	ff010113          	addi	sp,sp,-16
    80003b50:	00813423          	sd	s0,8(sp)
    80003b54:	01010413          	addi	s0,sp,16
    80003b58:	00813403          	ld	s0,8(sp)
    80003b5c:	00005317          	auipc	t1,0x5
    80003b60:	ae433303          	ld	t1,-1308(t1) # 80008640 <devsw+0x10>
    80003b64:	01010113          	addi	sp,sp,16
    80003b68:	00030067          	jr	t1

0000000080003b6c <console_write>:
    80003b6c:	ff010113          	addi	sp,sp,-16
    80003b70:	00813423          	sd	s0,8(sp)
    80003b74:	01010413          	addi	s0,sp,16
    80003b78:	00813403          	ld	s0,8(sp)
    80003b7c:	00005317          	auipc	t1,0x5
    80003b80:	acc33303          	ld	t1,-1332(t1) # 80008648 <devsw+0x18>
    80003b84:	01010113          	addi	sp,sp,16
    80003b88:	00030067          	jr	t1

0000000080003b8c <panic>:
    80003b8c:	fe010113          	addi	sp,sp,-32
    80003b90:	00113c23          	sd	ra,24(sp)
    80003b94:	00813823          	sd	s0,16(sp)
    80003b98:	00913423          	sd	s1,8(sp)
    80003b9c:	02010413          	addi	s0,sp,32
    80003ba0:	00050493          	mv	s1,a0
    80003ba4:	00002517          	auipc	a0,0x2
    80003ba8:	71c50513          	addi	a0,a0,1820 # 800062c0 <CONSOLE_STATUS+0x2b0>
    80003bac:	00005797          	auipc	a5,0x5
    80003bb0:	b207ae23          	sw	zero,-1220(a5) # 800086e8 <pr+0x18>
    80003bb4:	00000097          	auipc	ra,0x0
    80003bb8:	034080e7          	jalr	52(ra) # 80003be8 <__printf>
    80003bbc:	00048513          	mv	a0,s1
    80003bc0:	00000097          	auipc	ra,0x0
    80003bc4:	028080e7          	jalr	40(ra) # 80003be8 <__printf>
    80003bc8:	00002517          	auipc	a0,0x2
    80003bcc:	6d850513          	addi	a0,a0,1752 # 800062a0 <CONSOLE_STATUS+0x290>
    80003bd0:	00000097          	auipc	ra,0x0
    80003bd4:	018080e7          	jalr	24(ra) # 80003be8 <__printf>
    80003bd8:	00100793          	li	a5,1
    80003bdc:	00004717          	auipc	a4,0x4
    80003be0:	84f72623          	sw	a5,-1972(a4) # 80007428 <panicked>
    80003be4:	0000006f          	j	80003be4 <panic+0x58>

0000000080003be8 <__printf>:
    80003be8:	f3010113          	addi	sp,sp,-208
    80003bec:	08813023          	sd	s0,128(sp)
    80003bf0:	07313423          	sd	s3,104(sp)
    80003bf4:	09010413          	addi	s0,sp,144
    80003bf8:	05813023          	sd	s8,64(sp)
    80003bfc:	08113423          	sd	ra,136(sp)
    80003c00:	06913c23          	sd	s1,120(sp)
    80003c04:	07213823          	sd	s2,112(sp)
    80003c08:	07413023          	sd	s4,96(sp)
    80003c0c:	05513c23          	sd	s5,88(sp)
    80003c10:	05613823          	sd	s6,80(sp)
    80003c14:	05713423          	sd	s7,72(sp)
    80003c18:	03913c23          	sd	s9,56(sp)
    80003c1c:	03a13823          	sd	s10,48(sp)
    80003c20:	03b13423          	sd	s11,40(sp)
    80003c24:	00005317          	auipc	t1,0x5
    80003c28:	aac30313          	addi	t1,t1,-1364 # 800086d0 <pr>
    80003c2c:	01832c03          	lw	s8,24(t1)
    80003c30:	00b43423          	sd	a1,8(s0)
    80003c34:	00c43823          	sd	a2,16(s0)
    80003c38:	00d43c23          	sd	a3,24(s0)
    80003c3c:	02e43023          	sd	a4,32(s0)
    80003c40:	02f43423          	sd	a5,40(s0)
    80003c44:	03043823          	sd	a6,48(s0)
    80003c48:	03143c23          	sd	a7,56(s0)
    80003c4c:	00050993          	mv	s3,a0
    80003c50:	4a0c1663          	bnez	s8,800040fc <__printf+0x514>
    80003c54:	60098c63          	beqz	s3,8000426c <__printf+0x684>
    80003c58:	0009c503          	lbu	a0,0(s3)
    80003c5c:	00840793          	addi	a5,s0,8
    80003c60:	f6f43c23          	sd	a5,-136(s0)
    80003c64:	00000493          	li	s1,0
    80003c68:	22050063          	beqz	a0,80003e88 <__printf+0x2a0>
    80003c6c:	00002a37          	lui	s4,0x2
    80003c70:	00018ab7          	lui	s5,0x18
    80003c74:	000f4b37          	lui	s6,0xf4
    80003c78:	00989bb7          	lui	s7,0x989
    80003c7c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80003c80:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80003c84:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80003c88:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80003c8c:	00148c9b          	addiw	s9,s1,1
    80003c90:	02500793          	li	a5,37
    80003c94:	01998933          	add	s2,s3,s9
    80003c98:	38f51263          	bne	a0,a5,8000401c <__printf+0x434>
    80003c9c:	00094783          	lbu	a5,0(s2)
    80003ca0:	00078c9b          	sext.w	s9,a5
    80003ca4:	1e078263          	beqz	a5,80003e88 <__printf+0x2a0>
    80003ca8:	0024849b          	addiw	s1,s1,2
    80003cac:	07000713          	li	a4,112
    80003cb0:	00998933          	add	s2,s3,s1
    80003cb4:	38e78a63          	beq	a5,a4,80004048 <__printf+0x460>
    80003cb8:	20f76863          	bltu	a4,a5,80003ec8 <__printf+0x2e0>
    80003cbc:	42a78863          	beq	a5,a0,800040ec <__printf+0x504>
    80003cc0:	06400713          	li	a4,100
    80003cc4:	40e79663          	bne	a5,a4,800040d0 <__printf+0x4e8>
    80003cc8:	f7843783          	ld	a5,-136(s0)
    80003ccc:	0007a603          	lw	a2,0(a5)
    80003cd0:	00878793          	addi	a5,a5,8
    80003cd4:	f6f43c23          	sd	a5,-136(s0)
    80003cd8:	42064a63          	bltz	a2,8000410c <__printf+0x524>
    80003cdc:	00a00713          	li	a4,10
    80003ce0:	02e677bb          	remuw	a5,a2,a4
    80003ce4:	00002d97          	auipc	s11,0x2
    80003ce8:	604d8d93          	addi	s11,s11,1540 # 800062e8 <digits>
    80003cec:	00900593          	li	a1,9
    80003cf0:	0006051b          	sext.w	a0,a2
    80003cf4:	00000c93          	li	s9,0
    80003cf8:	02079793          	slli	a5,a5,0x20
    80003cfc:	0207d793          	srli	a5,a5,0x20
    80003d00:	00fd87b3          	add	a5,s11,a5
    80003d04:	0007c783          	lbu	a5,0(a5)
    80003d08:	02e656bb          	divuw	a3,a2,a4
    80003d0c:	f8f40023          	sb	a5,-128(s0)
    80003d10:	14c5d863          	bge	a1,a2,80003e60 <__printf+0x278>
    80003d14:	06300593          	li	a1,99
    80003d18:	00100c93          	li	s9,1
    80003d1c:	02e6f7bb          	remuw	a5,a3,a4
    80003d20:	02079793          	slli	a5,a5,0x20
    80003d24:	0207d793          	srli	a5,a5,0x20
    80003d28:	00fd87b3          	add	a5,s11,a5
    80003d2c:	0007c783          	lbu	a5,0(a5)
    80003d30:	02e6d73b          	divuw	a4,a3,a4
    80003d34:	f8f400a3          	sb	a5,-127(s0)
    80003d38:	12a5f463          	bgeu	a1,a0,80003e60 <__printf+0x278>
    80003d3c:	00a00693          	li	a3,10
    80003d40:	00900593          	li	a1,9
    80003d44:	02d777bb          	remuw	a5,a4,a3
    80003d48:	02079793          	slli	a5,a5,0x20
    80003d4c:	0207d793          	srli	a5,a5,0x20
    80003d50:	00fd87b3          	add	a5,s11,a5
    80003d54:	0007c503          	lbu	a0,0(a5)
    80003d58:	02d757bb          	divuw	a5,a4,a3
    80003d5c:	f8a40123          	sb	a0,-126(s0)
    80003d60:	48e5f263          	bgeu	a1,a4,800041e4 <__printf+0x5fc>
    80003d64:	06300513          	li	a0,99
    80003d68:	02d7f5bb          	remuw	a1,a5,a3
    80003d6c:	02059593          	slli	a1,a1,0x20
    80003d70:	0205d593          	srli	a1,a1,0x20
    80003d74:	00bd85b3          	add	a1,s11,a1
    80003d78:	0005c583          	lbu	a1,0(a1)
    80003d7c:	02d7d7bb          	divuw	a5,a5,a3
    80003d80:	f8b401a3          	sb	a1,-125(s0)
    80003d84:	48e57263          	bgeu	a0,a4,80004208 <__printf+0x620>
    80003d88:	3e700513          	li	a0,999
    80003d8c:	02d7f5bb          	remuw	a1,a5,a3
    80003d90:	02059593          	slli	a1,a1,0x20
    80003d94:	0205d593          	srli	a1,a1,0x20
    80003d98:	00bd85b3          	add	a1,s11,a1
    80003d9c:	0005c583          	lbu	a1,0(a1)
    80003da0:	02d7d7bb          	divuw	a5,a5,a3
    80003da4:	f8b40223          	sb	a1,-124(s0)
    80003da8:	46e57663          	bgeu	a0,a4,80004214 <__printf+0x62c>
    80003dac:	02d7f5bb          	remuw	a1,a5,a3
    80003db0:	02059593          	slli	a1,a1,0x20
    80003db4:	0205d593          	srli	a1,a1,0x20
    80003db8:	00bd85b3          	add	a1,s11,a1
    80003dbc:	0005c583          	lbu	a1,0(a1)
    80003dc0:	02d7d7bb          	divuw	a5,a5,a3
    80003dc4:	f8b402a3          	sb	a1,-123(s0)
    80003dc8:	46ea7863          	bgeu	s4,a4,80004238 <__printf+0x650>
    80003dcc:	02d7f5bb          	remuw	a1,a5,a3
    80003dd0:	02059593          	slli	a1,a1,0x20
    80003dd4:	0205d593          	srli	a1,a1,0x20
    80003dd8:	00bd85b3          	add	a1,s11,a1
    80003ddc:	0005c583          	lbu	a1,0(a1)
    80003de0:	02d7d7bb          	divuw	a5,a5,a3
    80003de4:	f8b40323          	sb	a1,-122(s0)
    80003de8:	3eeaf863          	bgeu	s5,a4,800041d8 <__printf+0x5f0>
    80003dec:	02d7f5bb          	remuw	a1,a5,a3
    80003df0:	02059593          	slli	a1,a1,0x20
    80003df4:	0205d593          	srli	a1,a1,0x20
    80003df8:	00bd85b3          	add	a1,s11,a1
    80003dfc:	0005c583          	lbu	a1,0(a1)
    80003e00:	02d7d7bb          	divuw	a5,a5,a3
    80003e04:	f8b403a3          	sb	a1,-121(s0)
    80003e08:	42eb7e63          	bgeu	s6,a4,80004244 <__printf+0x65c>
    80003e0c:	02d7f5bb          	remuw	a1,a5,a3
    80003e10:	02059593          	slli	a1,a1,0x20
    80003e14:	0205d593          	srli	a1,a1,0x20
    80003e18:	00bd85b3          	add	a1,s11,a1
    80003e1c:	0005c583          	lbu	a1,0(a1)
    80003e20:	02d7d7bb          	divuw	a5,a5,a3
    80003e24:	f8b40423          	sb	a1,-120(s0)
    80003e28:	42ebfc63          	bgeu	s7,a4,80004260 <__printf+0x678>
    80003e2c:	02079793          	slli	a5,a5,0x20
    80003e30:	0207d793          	srli	a5,a5,0x20
    80003e34:	00fd8db3          	add	s11,s11,a5
    80003e38:	000dc703          	lbu	a4,0(s11)
    80003e3c:	00a00793          	li	a5,10
    80003e40:	00900c93          	li	s9,9
    80003e44:	f8e404a3          	sb	a4,-119(s0)
    80003e48:	00065c63          	bgez	a2,80003e60 <__printf+0x278>
    80003e4c:	f9040713          	addi	a4,s0,-112
    80003e50:	00f70733          	add	a4,a4,a5
    80003e54:	02d00693          	li	a3,45
    80003e58:	fed70823          	sb	a3,-16(a4)
    80003e5c:	00078c93          	mv	s9,a5
    80003e60:	f8040793          	addi	a5,s0,-128
    80003e64:	01978cb3          	add	s9,a5,s9
    80003e68:	f7f40d13          	addi	s10,s0,-129
    80003e6c:	000cc503          	lbu	a0,0(s9)
    80003e70:	fffc8c93          	addi	s9,s9,-1
    80003e74:	00000097          	auipc	ra,0x0
    80003e78:	b90080e7          	jalr	-1136(ra) # 80003a04 <consputc>
    80003e7c:	ffac98e3          	bne	s9,s10,80003e6c <__printf+0x284>
    80003e80:	00094503          	lbu	a0,0(s2)
    80003e84:	e00514e3          	bnez	a0,80003c8c <__printf+0xa4>
    80003e88:	1a0c1663          	bnez	s8,80004034 <__printf+0x44c>
    80003e8c:	08813083          	ld	ra,136(sp)
    80003e90:	08013403          	ld	s0,128(sp)
    80003e94:	07813483          	ld	s1,120(sp)
    80003e98:	07013903          	ld	s2,112(sp)
    80003e9c:	06813983          	ld	s3,104(sp)
    80003ea0:	06013a03          	ld	s4,96(sp)
    80003ea4:	05813a83          	ld	s5,88(sp)
    80003ea8:	05013b03          	ld	s6,80(sp)
    80003eac:	04813b83          	ld	s7,72(sp)
    80003eb0:	04013c03          	ld	s8,64(sp)
    80003eb4:	03813c83          	ld	s9,56(sp)
    80003eb8:	03013d03          	ld	s10,48(sp)
    80003ebc:	02813d83          	ld	s11,40(sp)
    80003ec0:	0d010113          	addi	sp,sp,208
    80003ec4:	00008067          	ret
    80003ec8:	07300713          	li	a4,115
    80003ecc:	1ce78a63          	beq	a5,a4,800040a0 <__printf+0x4b8>
    80003ed0:	07800713          	li	a4,120
    80003ed4:	1ee79e63          	bne	a5,a4,800040d0 <__printf+0x4e8>
    80003ed8:	f7843783          	ld	a5,-136(s0)
    80003edc:	0007a703          	lw	a4,0(a5)
    80003ee0:	00878793          	addi	a5,a5,8
    80003ee4:	f6f43c23          	sd	a5,-136(s0)
    80003ee8:	28074263          	bltz	a4,8000416c <__printf+0x584>
    80003eec:	00002d97          	auipc	s11,0x2
    80003ef0:	3fcd8d93          	addi	s11,s11,1020 # 800062e8 <digits>
    80003ef4:	00f77793          	andi	a5,a4,15
    80003ef8:	00fd87b3          	add	a5,s11,a5
    80003efc:	0007c683          	lbu	a3,0(a5)
    80003f00:	00f00613          	li	a2,15
    80003f04:	0007079b          	sext.w	a5,a4
    80003f08:	f8d40023          	sb	a3,-128(s0)
    80003f0c:	0047559b          	srliw	a1,a4,0x4
    80003f10:	0047569b          	srliw	a3,a4,0x4
    80003f14:	00000c93          	li	s9,0
    80003f18:	0ee65063          	bge	a2,a4,80003ff8 <__printf+0x410>
    80003f1c:	00f6f693          	andi	a3,a3,15
    80003f20:	00dd86b3          	add	a3,s11,a3
    80003f24:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80003f28:	0087d79b          	srliw	a5,a5,0x8
    80003f2c:	00100c93          	li	s9,1
    80003f30:	f8d400a3          	sb	a3,-127(s0)
    80003f34:	0cb67263          	bgeu	a2,a1,80003ff8 <__printf+0x410>
    80003f38:	00f7f693          	andi	a3,a5,15
    80003f3c:	00dd86b3          	add	a3,s11,a3
    80003f40:	0006c583          	lbu	a1,0(a3)
    80003f44:	00f00613          	li	a2,15
    80003f48:	0047d69b          	srliw	a3,a5,0x4
    80003f4c:	f8b40123          	sb	a1,-126(s0)
    80003f50:	0047d593          	srli	a1,a5,0x4
    80003f54:	28f67e63          	bgeu	a2,a5,800041f0 <__printf+0x608>
    80003f58:	00f6f693          	andi	a3,a3,15
    80003f5c:	00dd86b3          	add	a3,s11,a3
    80003f60:	0006c503          	lbu	a0,0(a3)
    80003f64:	0087d813          	srli	a6,a5,0x8
    80003f68:	0087d69b          	srliw	a3,a5,0x8
    80003f6c:	f8a401a3          	sb	a0,-125(s0)
    80003f70:	28b67663          	bgeu	a2,a1,800041fc <__printf+0x614>
    80003f74:	00f6f693          	andi	a3,a3,15
    80003f78:	00dd86b3          	add	a3,s11,a3
    80003f7c:	0006c583          	lbu	a1,0(a3)
    80003f80:	00c7d513          	srli	a0,a5,0xc
    80003f84:	00c7d69b          	srliw	a3,a5,0xc
    80003f88:	f8b40223          	sb	a1,-124(s0)
    80003f8c:	29067a63          	bgeu	a2,a6,80004220 <__printf+0x638>
    80003f90:	00f6f693          	andi	a3,a3,15
    80003f94:	00dd86b3          	add	a3,s11,a3
    80003f98:	0006c583          	lbu	a1,0(a3)
    80003f9c:	0107d813          	srli	a6,a5,0x10
    80003fa0:	0107d69b          	srliw	a3,a5,0x10
    80003fa4:	f8b402a3          	sb	a1,-123(s0)
    80003fa8:	28a67263          	bgeu	a2,a0,8000422c <__printf+0x644>
    80003fac:	00f6f693          	andi	a3,a3,15
    80003fb0:	00dd86b3          	add	a3,s11,a3
    80003fb4:	0006c683          	lbu	a3,0(a3)
    80003fb8:	0147d79b          	srliw	a5,a5,0x14
    80003fbc:	f8d40323          	sb	a3,-122(s0)
    80003fc0:	21067663          	bgeu	a2,a6,800041cc <__printf+0x5e4>
    80003fc4:	02079793          	slli	a5,a5,0x20
    80003fc8:	0207d793          	srli	a5,a5,0x20
    80003fcc:	00fd8db3          	add	s11,s11,a5
    80003fd0:	000dc683          	lbu	a3,0(s11)
    80003fd4:	00800793          	li	a5,8
    80003fd8:	00700c93          	li	s9,7
    80003fdc:	f8d403a3          	sb	a3,-121(s0)
    80003fe0:	00075c63          	bgez	a4,80003ff8 <__printf+0x410>
    80003fe4:	f9040713          	addi	a4,s0,-112
    80003fe8:	00f70733          	add	a4,a4,a5
    80003fec:	02d00693          	li	a3,45
    80003ff0:	fed70823          	sb	a3,-16(a4)
    80003ff4:	00078c93          	mv	s9,a5
    80003ff8:	f8040793          	addi	a5,s0,-128
    80003ffc:	01978cb3          	add	s9,a5,s9
    80004000:	f7f40d13          	addi	s10,s0,-129
    80004004:	000cc503          	lbu	a0,0(s9)
    80004008:	fffc8c93          	addi	s9,s9,-1
    8000400c:	00000097          	auipc	ra,0x0
    80004010:	9f8080e7          	jalr	-1544(ra) # 80003a04 <consputc>
    80004014:	ff9d18e3          	bne	s10,s9,80004004 <__printf+0x41c>
    80004018:	0100006f          	j	80004028 <__printf+0x440>
    8000401c:	00000097          	auipc	ra,0x0
    80004020:	9e8080e7          	jalr	-1560(ra) # 80003a04 <consputc>
    80004024:	000c8493          	mv	s1,s9
    80004028:	00094503          	lbu	a0,0(s2)
    8000402c:	c60510e3          	bnez	a0,80003c8c <__printf+0xa4>
    80004030:	e40c0ee3          	beqz	s8,80003e8c <__printf+0x2a4>
    80004034:	00004517          	auipc	a0,0x4
    80004038:	69c50513          	addi	a0,a0,1692 # 800086d0 <pr>
    8000403c:	00001097          	auipc	ra,0x1
    80004040:	94c080e7          	jalr	-1716(ra) # 80004988 <release>
    80004044:	e49ff06f          	j	80003e8c <__printf+0x2a4>
    80004048:	f7843783          	ld	a5,-136(s0)
    8000404c:	03000513          	li	a0,48
    80004050:	01000d13          	li	s10,16
    80004054:	00878713          	addi	a4,a5,8
    80004058:	0007bc83          	ld	s9,0(a5)
    8000405c:	f6e43c23          	sd	a4,-136(s0)
    80004060:	00000097          	auipc	ra,0x0
    80004064:	9a4080e7          	jalr	-1628(ra) # 80003a04 <consputc>
    80004068:	07800513          	li	a0,120
    8000406c:	00000097          	auipc	ra,0x0
    80004070:	998080e7          	jalr	-1640(ra) # 80003a04 <consputc>
    80004074:	00002d97          	auipc	s11,0x2
    80004078:	274d8d93          	addi	s11,s11,628 # 800062e8 <digits>
    8000407c:	03ccd793          	srli	a5,s9,0x3c
    80004080:	00fd87b3          	add	a5,s11,a5
    80004084:	0007c503          	lbu	a0,0(a5)
    80004088:	fffd0d1b          	addiw	s10,s10,-1
    8000408c:	004c9c93          	slli	s9,s9,0x4
    80004090:	00000097          	auipc	ra,0x0
    80004094:	974080e7          	jalr	-1676(ra) # 80003a04 <consputc>
    80004098:	fe0d12e3          	bnez	s10,8000407c <__printf+0x494>
    8000409c:	f8dff06f          	j	80004028 <__printf+0x440>
    800040a0:	f7843783          	ld	a5,-136(s0)
    800040a4:	0007bc83          	ld	s9,0(a5)
    800040a8:	00878793          	addi	a5,a5,8
    800040ac:	f6f43c23          	sd	a5,-136(s0)
    800040b0:	000c9a63          	bnez	s9,800040c4 <__printf+0x4dc>
    800040b4:	1080006f          	j	800041bc <__printf+0x5d4>
    800040b8:	001c8c93          	addi	s9,s9,1
    800040bc:	00000097          	auipc	ra,0x0
    800040c0:	948080e7          	jalr	-1720(ra) # 80003a04 <consputc>
    800040c4:	000cc503          	lbu	a0,0(s9)
    800040c8:	fe0518e3          	bnez	a0,800040b8 <__printf+0x4d0>
    800040cc:	f5dff06f          	j	80004028 <__printf+0x440>
    800040d0:	02500513          	li	a0,37
    800040d4:	00000097          	auipc	ra,0x0
    800040d8:	930080e7          	jalr	-1744(ra) # 80003a04 <consputc>
    800040dc:	000c8513          	mv	a0,s9
    800040e0:	00000097          	auipc	ra,0x0
    800040e4:	924080e7          	jalr	-1756(ra) # 80003a04 <consputc>
    800040e8:	f41ff06f          	j	80004028 <__printf+0x440>
    800040ec:	02500513          	li	a0,37
    800040f0:	00000097          	auipc	ra,0x0
    800040f4:	914080e7          	jalr	-1772(ra) # 80003a04 <consputc>
    800040f8:	f31ff06f          	j	80004028 <__printf+0x440>
    800040fc:	00030513          	mv	a0,t1
    80004100:	00000097          	auipc	ra,0x0
    80004104:	7bc080e7          	jalr	1980(ra) # 800048bc <acquire>
    80004108:	b4dff06f          	j	80003c54 <__printf+0x6c>
    8000410c:	40c0053b          	negw	a0,a2
    80004110:	00a00713          	li	a4,10
    80004114:	02e576bb          	remuw	a3,a0,a4
    80004118:	00002d97          	auipc	s11,0x2
    8000411c:	1d0d8d93          	addi	s11,s11,464 # 800062e8 <digits>
    80004120:	ff700593          	li	a1,-9
    80004124:	02069693          	slli	a3,a3,0x20
    80004128:	0206d693          	srli	a3,a3,0x20
    8000412c:	00dd86b3          	add	a3,s11,a3
    80004130:	0006c683          	lbu	a3,0(a3)
    80004134:	02e557bb          	divuw	a5,a0,a4
    80004138:	f8d40023          	sb	a3,-128(s0)
    8000413c:	10b65e63          	bge	a2,a1,80004258 <__printf+0x670>
    80004140:	06300593          	li	a1,99
    80004144:	02e7f6bb          	remuw	a3,a5,a4
    80004148:	02069693          	slli	a3,a3,0x20
    8000414c:	0206d693          	srli	a3,a3,0x20
    80004150:	00dd86b3          	add	a3,s11,a3
    80004154:	0006c683          	lbu	a3,0(a3)
    80004158:	02e7d73b          	divuw	a4,a5,a4
    8000415c:	00200793          	li	a5,2
    80004160:	f8d400a3          	sb	a3,-127(s0)
    80004164:	bca5ece3          	bltu	a1,a0,80003d3c <__printf+0x154>
    80004168:	ce5ff06f          	j	80003e4c <__printf+0x264>
    8000416c:	40e007bb          	negw	a5,a4
    80004170:	00002d97          	auipc	s11,0x2
    80004174:	178d8d93          	addi	s11,s11,376 # 800062e8 <digits>
    80004178:	00f7f693          	andi	a3,a5,15
    8000417c:	00dd86b3          	add	a3,s11,a3
    80004180:	0006c583          	lbu	a1,0(a3)
    80004184:	ff100613          	li	a2,-15
    80004188:	0047d69b          	srliw	a3,a5,0x4
    8000418c:	f8b40023          	sb	a1,-128(s0)
    80004190:	0047d59b          	srliw	a1,a5,0x4
    80004194:	0ac75e63          	bge	a4,a2,80004250 <__printf+0x668>
    80004198:	00f6f693          	andi	a3,a3,15
    8000419c:	00dd86b3          	add	a3,s11,a3
    800041a0:	0006c603          	lbu	a2,0(a3)
    800041a4:	00f00693          	li	a3,15
    800041a8:	0087d79b          	srliw	a5,a5,0x8
    800041ac:	f8c400a3          	sb	a2,-127(s0)
    800041b0:	d8b6e4e3          	bltu	a3,a1,80003f38 <__printf+0x350>
    800041b4:	00200793          	li	a5,2
    800041b8:	e2dff06f          	j	80003fe4 <__printf+0x3fc>
    800041bc:	00002c97          	auipc	s9,0x2
    800041c0:	10cc8c93          	addi	s9,s9,268 # 800062c8 <CONSOLE_STATUS+0x2b8>
    800041c4:	02800513          	li	a0,40
    800041c8:	ef1ff06f          	j	800040b8 <__printf+0x4d0>
    800041cc:	00700793          	li	a5,7
    800041d0:	00600c93          	li	s9,6
    800041d4:	e0dff06f          	j	80003fe0 <__printf+0x3f8>
    800041d8:	00700793          	li	a5,7
    800041dc:	00600c93          	li	s9,6
    800041e0:	c69ff06f          	j	80003e48 <__printf+0x260>
    800041e4:	00300793          	li	a5,3
    800041e8:	00200c93          	li	s9,2
    800041ec:	c5dff06f          	j	80003e48 <__printf+0x260>
    800041f0:	00300793          	li	a5,3
    800041f4:	00200c93          	li	s9,2
    800041f8:	de9ff06f          	j	80003fe0 <__printf+0x3f8>
    800041fc:	00400793          	li	a5,4
    80004200:	00300c93          	li	s9,3
    80004204:	dddff06f          	j	80003fe0 <__printf+0x3f8>
    80004208:	00400793          	li	a5,4
    8000420c:	00300c93          	li	s9,3
    80004210:	c39ff06f          	j	80003e48 <__printf+0x260>
    80004214:	00500793          	li	a5,5
    80004218:	00400c93          	li	s9,4
    8000421c:	c2dff06f          	j	80003e48 <__printf+0x260>
    80004220:	00500793          	li	a5,5
    80004224:	00400c93          	li	s9,4
    80004228:	db9ff06f          	j	80003fe0 <__printf+0x3f8>
    8000422c:	00600793          	li	a5,6
    80004230:	00500c93          	li	s9,5
    80004234:	dadff06f          	j	80003fe0 <__printf+0x3f8>
    80004238:	00600793          	li	a5,6
    8000423c:	00500c93          	li	s9,5
    80004240:	c09ff06f          	j	80003e48 <__printf+0x260>
    80004244:	00800793          	li	a5,8
    80004248:	00700c93          	li	s9,7
    8000424c:	bfdff06f          	j	80003e48 <__printf+0x260>
    80004250:	00100793          	li	a5,1
    80004254:	d91ff06f          	j	80003fe4 <__printf+0x3fc>
    80004258:	00100793          	li	a5,1
    8000425c:	bf1ff06f          	j	80003e4c <__printf+0x264>
    80004260:	00900793          	li	a5,9
    80004264:	00800c93          	li	s9,8
    80004268:	be1ff06f          	j	80003e48 <__printf+0x260>
    8000426c:	00002517          	auipc	a0,0x2
    80004270:	06450513          	addi	a0,a0,100 # 800062d0 <CONSOLE_STATUS+0x2c0>
    80004274:	00000097          	auipc	ra,0x0
    80004278:	918080e7          	jalr	-1768(ra) # 80003b8c <panic>

000000008000427c <printfinit>:
    8000427c:	fe010113          	addi	sp,sp,-32
    80004280:	00813823          	sd	s0,16(sp)
    80004284:	00913423          	sd	s1,8(sp)
    80004288:	00113c23          	sd	ra,24(sp)
    8000428c:	02010413          	addi	s0,sp,32
    80004290:	00004497          	auipc	s1,0x4
    80004294:	44048493          	addi	s1,s1,1088 # 800086d0 <pr>
    80004298:	00048513          	mv	a0,s1
    8000429c:	00002597          	auipc	a1,0x2
    800042a0:	04458593          	addi	a1,a1,68 # 800062e0 <CONSOLE_STATUS+0x2d0>
    800042a4:	00000097          	auipc	ra,0x0
    800042a8:	5f4080e7          	jalr	1524(ra) # 80004898 <initlock>
    800042ac:	01813083          	ld	ra,24(sp)
    800042b0:	01013403          	ld	s0,16(sp)
    800042b4:	0004ac23          	sw	zero,24(s1)
    800042b8:	00813483          	ld	s1,8(sp)
    800042bc:	02010113          	addi	sp,sp,32
    800042c0:	00008067          	ret

00000000800042c4 <uartinit>:
    800042c4:	ff010113          	addi	sp,sp,-16
    800042c8:	00813423          	sd	s0,8(sp)
    800042cc:	01010413          	addi	s0,sp,16
    800042d0:	100007b7          	lui	a5,0x10000
    800042d4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800042d8:	f8000713          	li	a4,-128
    800042dc:	00e781a3          	sb	a4,3(a5)
    800042e0:	00300713          	li	a4,3
    800042e4:	00e78023          	sb	a4,0(a5)
    800042e8:	000780a3          	sb	zero,1(a5)
    800042ec:	00e781a3          	sb	a4,3(a5)
    800042f0:	00700693          	li	a3,7
    800042f4:	00d78123          	sb	a3,2(a5)
    800042f8:	00e780a3          	sb	a4,1(a5)
    800042fc:	00813403          	ld	s0,8(sp)
    80004300:	01010113          	addi	sp,sp,16
    80004304:	00008067          	ret

0000000080004308 <uartputc>:
    80004308:	00003797          	auipc	a5,0x3
    8000430c:	1207a783          	lw	a5,288(a5) # 80007428 <panicked>
    80004310:	00078463          	beqz	a5,80004318 <uartputc+0x10>
    80004314:	0000006f          	j	80004314 <uartputc+0xc>
    80004318:	fd010113          	addi	sp,sp,-48
    8000431c:	02813023          	sd	s0,32(sp)
    80004320:	00913c23          	sd	s1,24(sp)
    80004324:	01213823          	sd	s2,16(sp)
    80004328:	01313423          	sd	s3,8(sp)
    8000432c:	02113423          	sd	ra,40(sp)
    80004330:	03010413          	addi	s0,sp,48
    80004334:	00003917          	auipc	s2,0x3
    80004338:	0fc90913          	addi	s2,s2,252 # 80007430 <uart_tx_r>
    8000433c:	00093783          	ld	a5,0(s2)
    80004340:	00003497          	auipc	s1,0x3
    80004344:	0f848493          	addi	s1,s1,248 # 80007438 <uart_tx_w>
    80004348:	0004b703          	ld	a4,0(s1)
    8000434c:	02078693          	addi	a3,a5,32
    80004350:	00050993          	mv	s3,a0
    80004354:	02e69c63          	bne	a3,a4,8000438c <uartputc+0x84>
    80004358:	00001097          	auipc	ra,0x1
    8000435c:	834080e7          	jalr	-1996(ra) # 80004b8c <push_on>
    80004360:	00093783          	ld	a5,0(s2)
    80004364:	0004b703          	ld	a4,0(s1)
    80004368:	02078793          	addi	a5,a5,32
    8000436c:	00e79463          	bne	a5,a4,80004374 <uartputc+0x6c>
    80004370:	0000006f          	j	80004370 <uartputc+0x68>
    80004374:	00001097          	auipc	ra,0x1
    80004378:	88c080e7          	jalr	-1908(ra) # 80004c00 <pop_on>
    8000437c:	00093783          	ld	a5,0(s2)
    80004380:	0004b703          	ld	a4,0(s1)
    80004384:	02078693          	addi	a3,a5,32
    80004388:	fce688e3          	beq	a3,a4,80004358 <uartputc+0x50>
    8000438c:	01f77693          	andi	a3,a4,31
    80004390:	00004597          	auipc	a1,0x4
    80004394:	36058593          	addi	a1,a1,864 # 800086f0 <uart_tx_buf>
    80004398:	00d586b3          	add	a3,a1,a3
    8000439c:	00170713          	addi	a4,a4,1
    800043a0:	01368023          	sb	s3,0(a3)
    800043a4:	00e4b023          	sd	a4,0(s1)
    800043a8:	10000637          	lui	a2,0x10000
    800043ac:	02f71063          	bne	a4,a5,800043cc <uartputc+0xc4>
    800043b0:	0340006f          	j	800043e4 <uartputc+0xdc>
    800043b4:	00074703          	lbu	a4,0(a4)
    800043b8:	00f93023          	sd	a5,0(s2)
    800043bc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800043c0:	00093783          	ld	a5,0(s2)
    800043c4:	0004b703          	ld	a4,0(s1)
    800043c8:	00f70e63          	beq	a4,a5,800043e4 <uartputc+0xdc>
    800043cc:	00564683          	lbu	a3,5(a2)
    800043d0:	01f7f713          	andi	a4,a5,31
    800043d4:	00e58733          	add	a4,a1,a4
    800043d8:	0206f693          	andi	a3,a3,32
    800043dc:	00178793          	addi	a5,a5,1
    800043e0:	fc069ae3          	bnez	a3,800043b4 <uartputc+0xac>
    800043e4:	02813083          	ld	ra,40(sp)
    800043e8:	02013403          	ld	s0,32(sp)
    800043ec:	01813483          	ld	s1,24(sp)
    800043f0:	01013903          	ld	s2,16(sp)
    800043f4:	00813983          	ld	s3,8(sp)
    800043f8:	03010113          	addi	sp,sp,48
    800043fc:	00008067          	ret

0000000080004400 <uartputc_sync>:
    80004400:	ff010113          	addi	sp,sp,-16
    80004404:	00813423          	sd	s0,8(sp)
    80004408:	01010413          	addi	s0,sp,16
    8000440c:	00003717          	auipc	a4,0x3
    80004410:	01c72703          	lw	a4,28(a4) # 80007428 <panicked>
    80004414:	02071663          	bnez	a4,80004440 <uartputc_sync+0x40>
    80004418:	00050793          	mv	a5,a0
    8000441c:	100006b7          	lui	a3,0x10000
    80004420:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80004424:	02077713          	andi	a4,a4,32
    80004428:	fe070ce3          	beqz	a4,80004420 <uartputc_sync+0x20>
    8000442c:	0ff7f793          	andi	a5,a5,255
    80004430:	00f68023          	sb	a5,0(a3)
    80004434:	00813403          	ld	s0,8(sp)
    80004438:	01010113          	addi	sp,sp,16
    8000443c:	00008067          	ret
    80004440:	0000006f          	j	80004440 <uartputc_sync+0x40>

0000000080004444 <uartstart>:
    80004444:	ff010113          	addi	sp,sp,-16
    80004448:	00813423          	sd	s0,8(sp)
    8000444c:	01010413          	addi	s0,sp,16
    80004450:	00003617          	auipc	a2,0x3
    80004454:	fe060613          	addi	a2,a2,-32 # 80007430 <uart_tx_r>
    80004458:	00003517          	auipc	a0,0x3
    8000445c:	fe050513          	addi	a0,a0,-32 # 80007438 <uart_tx_w>
    80004460:	00063783          	ld	a5,0(a2)
    80004464:	00053703          	ld	a4,0(a0)
    80004468:	04f70263          	beq	a4,a5,800044ac <uartstart+0x68>
    8000446c:	100005b7          	lui	a1,0x10000
    80004470:	00004817          	auipc	a6,0x4
    80004474:	28080813          	addi	a6,a6,640 # 800086f0 <uart_tx_buf>
    80004478:	01c0006f          	j	80004494 <uartstart+0x50>
    8000447c:	0006c703          	lbu	a4,0(a3)
    80004480:	00f63023          	sd	a5,0(a2)
    80004484:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004488:	00063783          	ld	a5,0(a2)
    8000448c:	00053703          	ld	a4,0(a0)
    80004490:	00f70e63          	beq	a4,a5,800044ac <uartstart+0x68>
    80004494:	01f7f713          	andi	a4,a5,31
    80004498:	00e806b3          	add	a3,a6,a4
    8000449c:	0055c703          	lbu	a4,5(a1)
    800044a0:	00178793          	addi	a5,a5,1
    800044a4:	02077713          	andi	a4,a4,32
    800044a8:	fc071ae3          	bnez	a4,8000447c <uartstart+0x38>
    800044ac:	00813403          	ld	s0,8(sp)
    800044b0:	01010113          	addi	sp,sp,16
    800044b4:	00008067          	ret

00000000800044b8 <uartgetc>:
    800044b8:	ff010113          	addi	sp,sp,-16
    800044bc:	00813423          	sd	s0,8(sp)
    800044c0:	01010413          	addi	s0,sp,16
    800044c4:	10000737          	lui	a4,0x10000
    800044c8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800044cc:	0017f793          	andi	a5,a5,1
    800044d0:	00078c63          	beqz	a5,800044e8 <uartgetc+0x30>
    800044d4:	00074503          	lbu	a0,0(a4)
    800044d8:	0ff57513          	andi	a0,a0,255
    800044dc:	00813403          	ld	s0,8(sp)
    800044e0:	01010113          	addi	sp,sp,16
    800044e4:	00008067          	ret
    800044e8:	fff00513          	li	a0,-1
    800044ec:	ff1ff06f          	j	800044dc <uartgetc+0x24>

00000000800044f0 <uartintr>:
    800044f0:	100007b7          	lui	a5,0x10000
    800044f4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800044f8:	0017f793          	andi	a5,a5,1
    800044fc:	0a078463          	beqz	a5,800045a4 <uartintr+0xb4>
    80004500:	fe010113          	addi	sp,sp,-32
    80004504:	00813823          	sd	s0,16(sp)
    80004508:	00913423          	sd	s1,8(sp)
    8000450c:	00113c23          	sd	ra,24(sp)
    80004510:	02010413          	addi	s0,sp,32
    80004514:	100004b7          	lui	s1,0x10000
    80004518:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000451c:	0ff57513          	andi	a0,a0,255
    80004520:	fffff097          	auipc	ra,0xfffff
    80004524:	534080e7          	jalr	1332(ra) # 80003a54 <consoleintr>
    80004528:	0054c783          	lbu	a5,5(s1)
    8000452c:	0017f793          	andi	a5,a5,1
    80004530:	fe0794e3          	bnez	a5,80004518 <uartintr+0x28>
    80004534:	00003617          	auipc	a2,0x3
    80004538:	efc60613          	addi	a2,a2,-260 # 80007430 <uart_tx_r>
    8000453c:	00003517          	auipc	a0,0x3
    80004540:	efc50513          	addi	a0,a0,-260 # 80007438 <uart_tx_w>
    80004544:	00063783          	ld	a5,0(a2)
    80004548:	00053703          	ld	a4,0(a0)
    8000454c:	04f70263          	beq	a4,a5,80004590 <uartintr+0xa0>
    80004550:	100005b7          	lui	a1,0x10000
    80004554:	00004817          	auipc	a6,0x4
    80004558:	19c80813          	addi	a6,a6,412 # 800086f0 <uart_tx_buf>
    8000455c:	01c0006f          	j	80004578 <uartintr+0x88>
    80004560:	0006c703          	lbu	a4,0(a3)
    80004564:	00f63023          	sd	a5,0(a2)
    80004568:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000456c:	00063783          	ld	a5,0(a2)
    80004570:	00053703          	ld	a4,0(a0)
    80004574:	00f70e63          	beq	a4,a5,80004590 <uartintr+0xa0>
    80004578:	01f7f713          	andi	a4,a5,31
    8000457c:	00e806b3          	add	a3,a6,a4
    80004580:	0055c703          	lbu	a4,5(a1)
    80004584:	00178793          	addi	a5,a5,1
    80004588:	02077713          	andi	a4,a4,32
    8000458c:	fc071ae3          	bnez	a4,80004560 <uartintr+0x70>
    80004590:	01813083          	ld	ra,24(sp)
    80004594:	01013403          	ld	s0,16(sp)
    80004598:	00813483          	ld	s1,8(sp)
    8000459c:	02010113          	addi	sp,sp,32
    800045a0:	00008067          	ret
    800045a4:	00003617          	auipc	a2,0x3
    800045a8:	e8c60613          	addi	a2,a2,-372 # 80007430 <uart_tx_r>
    800045ac:	00003517          	auipc	a0,0x3
    800045b0:	e8c50513          	addi	a0,a0,-372 # 80007438 <uart_tx_w>
    800045b4:	00063783          	ld	a5,0(a2)
    800045b8:	00053703          	ld	a4,0(a0)
    800045bc:	04f70263          	beq	a4,a5,80004600 <uartintr+0x110>
    800045c0:	100005b7          	lui	a1,0x10000
    800045c4:	00004817          	auipc	a6,0x4
    800045c8:	12c80813          	addi	a6,a6,300 # 800086f0 <uart_tx_buf>
    800045cc:	01c0006f          	j	800045e8 <uartintr+0xf8>
    800045d0:	0006c703          	lbu	a4,0(a3)
    800045d4:	00f63023          	sd	a5,0(a2)
    800045d8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800045dc:	00063783          	ld	a5,0(a2)
    800045e0:	00053703          	ld	a4,0(a0)
    800045e4:	02f70063          	beq	a4,a5,80004604 <uartintr+0x114>
    800045e8:	01f7f713          	andi	a4,a5,31
    800045ec:	00e806b3          	add	a3,a6,a4
    800045f0:	0055c703          	lbu	a4,5(a1)
    800045f4:	00178793          	addi	a5,a5,1
    800045f8:	02077713          	andi	a4,a4,32
    800045fc:	fc071ae3          	bnez	a4,800045d0 <uartintr+0xe0>
    80004600:	00008067          	ret
    80004604:	00008067          	ret

0000000080004608 <kinit>:
    80004608:	fc010113          	addi	sp,sp,-64
    8000460c:	02913423          	sd	s1,40(sp)
    80004610:	fffff7b7          	lui	a5,0xfffff
    80004614:	00005497          	auipc	s1,0x5
    80004618:	0fb48493          	addi	s1,s1,251 # 8000970f <end+0xfff>
    8000461c:	02813823          	sd	s0,48(sp)
    80004620:	01313c23          	sd	s3,24(sp)
    80004624:	00f4f4b3          	and	s1,s1,a5
    80004628:	02113c23          	sd	ra,56(sp)
    8000462c:	03213023          	sd	s2,32(sp)
    80004630:	01413823          	sd	s4,16(sp)
    80004634:	01513423          	sd	s5,8(sp)
    80004638:	04010413          	addi	s0,sp,64
    8000463c:	000017b7          	lui	a5,0x1
    80004640:	01100993          	li	s3,17
    80004644:	00f487b3          	add	a5,s1,a5
    80004648:	01b99993          	slli	s3,s3,0x1b
    8000464c:	06f9e063          	bltu	s3,a5,800046ac <kinit+0xa4>
    80004650:	00004a97          	auipc	s5,0x4
    80004654:	0c0a8a93          	addi	s5,s5,192 # 80008710 <end>
    80004658:	0754ec63          	bltu	s1,s5,800046d0 <kinit+0xc8>
    8000465c:	0734fa63          	bgeu	s1,s3,800046d0 <kinit+0xc8>
    80004660:	00088a37          	lui	s4,0x88
    80004664:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80004668:	00003917          	auipc	s2,0x3
    8000466c:	dd890913          	addi	s2,s2,-552 # 80007440 <kmem>
    80004670:	00ca1a13          	slli	s4,s4,0xc
    80004674:	0140006f          	j	80004688 <kinit+0x80>
    80004678:	000017b7          	lui	a5,0x1
    8000467c:	00f484b3          	add	s1,s1,a5
    80004680:	0554e863          	bltu	s1,s5,800046d0 <kinit+0xc8>
    80004684:	0534f663          	bgeu	s1,s3,800046d0 <kinit+0xc8>
    80004688:	00001637          	lui	a2,0x1
    8000468c:	00100593          	li	a1,1
    80004690:	00048513          	mv	a0,s1
    80004694:	00000097          	auipc	ra,0x0
    80004698:	5e4080e7          	jalr	1508(ra) # 80004c78 <__memset>
    8000469c:	00093783          	ld	a5,0(s2)
    800046a0:	00f4b023          	sd	a5,0(s1)
    800046a4:	00993023          	sd	s1,0(s2)
    800046a8:	fd4498e3          	bne	s1,s4,80004678 <kinit+0x70>
    800046ac:	03813083          	ld	ra,56(sp)
    800046b0:	03013403          	ld	s0,48(sp)
    800046b4:	02813483          	ld	s1,40(sp)
    800046b8:	02013903          	ld	s2,32(sp)
    800046bc:	01813983          	ld	s3,24(sp)
    800046c0:	01013a03          	ld	s4,16(sp)
    800046c4:	00813a83          	ld	s5,8(sp)
    800046c8:	04010113          	addi	sp,sp,64
    800046cc:	00008067          	ret
    800046d0:	00002517          	auipc	a0,0x2
    800046d4:	c3050513          	addi	a0,a0,-976 # 80006300 <digits+0x18>
    800046d8:	fffff097          	auipc	ra,0xfffff
    800046dc:	4b4080e7          	jalr	1204(ra) # 80003b8c <panic>

00000000800046e0 <freerange>:
    800046e0:	fc010113          	addi	sp,sp,-64
    800046e4:	000017b7          	lui	a5,0x1
    800046e8:	02913423          	sd	s1,40(sp)
    800046ec:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800046f0:	009504b3          	add	s1,a0,s1
    800046f4:	fffff537          	lui	a0,0xfffff
    800046f8:	02813823          	sd	s0,48(sp)
    800046fc:	02113c23          	sd	ra,56(sp)
    80004700:	03213023          	sd	s2,32(sp)
    80004704:	01313c23          	sd	s3,24(sp)
    80004708:	01413823          	sd	s4,16(sp)
    8000470c:	01513423          	sd	s5,8(sp)
    80004710:	01613023          	sd	s6,0(sp)
    80004714:	04010413          	addi	s0,sp,64
    80004718:	00a4f4b3          	and	s1,s1,a0
    8000471c:	00f487b3          	add	a5,s1,a5
    80004720:	06f5e463          	bltu	a1,a5,80004788 <freerange+0xa8>
    80004724:	00004a97          	auipc	s5,0x4
    80004728:	feca8a93          	addi	s5,s5,-20 # 80008710 <end>
    8000472c:	0954e263          	bltu	s1,s5,800047b0 <freerange+0xd0>
    80004730:	01100993          	li	s3,17
    80004734:	01b99993          	slli	s3,s3,0x1b
    80004738:	0734fc63          	bgeu	s1,s3,800047b0 <freerange+0xd0>
    8000473c:	00058a13          	mv	s4,a1
    80004740:	00003917          	auipc	s2,0x3
    80004744:	d0090913          	addi	s2,s2,-768 # 80007440 <kmem>
    80004748:	00002b37          	lui	s6,0x2
    8000474c:	0140006f          	j	80004760 <freerange+0x80>
    80004750:	000017b7          	lui	a5,0x1
    80004754:	00f484b3          	add	s1,s1,a5
    80004758:	0554ec63          	bltu	s1,s5,800047b0 <freerange+0xd0>
    8000475c:	0534fa63          	bgeu	s1,s3,800047b0 <freerange+0xd0>
    80004760:	00001637          	lui	a2,0x1
    80004764:	00100593          	li	a1,1
    80004768:	00048513          	mv	a0,s1
    8000476c:	00000097          	auipc	ra,0x0
    80004770:	50c080e7          	jalr	1292(ra) # 80004c78 <__memset>
    80004774:	00093703          	ld	a4,0(s2)
    80004778:	016487b3          	add	a5,s1,s6
    8000477c:	00e4b023          	sd	a4,0(s1)
    80004780:	00993023          	sd	s1,0(s2)
    80004784:	fcfa76e3          	bgeu	s4,a5,80004750 <freerange+0x70>
    80004788:	03813083          	ld	ra,56(sp)
    8000478c:	03013403          	ld	s0,48(sp)
    80004790:	02813483          	ld	s1,40(sp)
    80004794:	02013903          	ld	s2,32(sp)
    80004798:	01813983          	ld	s3,24(sp)
    8000479c:	01013a03          	ld	s4,16(sp)
    800047a0:	00813a83          	ld	s5,8(sp)
    800047a4:	00013b03          	ld	s6,0(sp)
    800047a8:	04010113          	addi	sp,sp,64
    800047ac:	00008067          	ret
    800047b0:	00002517          	auipc	a0,0x2
    800047b4:	b5050513          	addi	a0,a0,-1200 # 80006300 <digits+0x18>
    800047b8:	fffff097          	auipc	ra,0xfffff
    800047bc:	3d4080e7          	jalr	980(ra) # 80003b8c <panic>

00000000800047c0 <kfree>:
    800047c0:	fe010113          	addi	sp,sp,-32
    800047c4:	00813823          	sd	s0,16(sp)
    800047c8:	00113c23          	sd	ra,24(sp)
    800047cc:	00913423          	sd	s1,8(sp)
    800047d0:	02010413          	addi	s0,sp,32
    800047d4:	03451793          	slli	a5,a0,0x34
    800047d8:	04079c63          	bnez	a5,80004830 <kfree+0x70>
    800047dc:	00004797          	auipc	a5,0x4
    800047e0:	f3478793          	addi	a5,a5,-204 # 80008710 <end>
    800047e4:	00050493          	mv	s1,a0
    800047e8:	04f56463          	bltu	a0,a5,80004830 <kfree+0x70>
    800047ec:	01100793          	li	a5,17
    800047f0:	01b79793          	slli	a5,a5,0x1b
    800047f4:	02f57e63          	bgeu	a0,a5,80004830 <kfree+0x70>
    800047f8:	00001637          	lui	a2,0x1
    800047fc:	00100593          	li	a1,1
    80004800:	00000097          	auipc	ra,0x0
    80004804:	478080e7          	jalr	1144(ra) # 80004c78 <__memset>
    80004808:	00003797          	auipc	a5,0x3
    8000480c:	c3878793          	addi	a5,a5,-968 # 80007440 <kmem>
    80004810:	0007b703          	ld	a4,0(a5)
    80004814:	01813083          	ld	ra,24(sp)
    80004818:	01013403          	ld	s0,16(sp)
    8000481c:	00e4b023          	sd	a4,0(s1)
    80004820:	0097b023          	sd	s1,0(a5)
    80004824:	00813483          	ld	s1,8(sp)
    80004828:	02010113          	addi	sp,sp,32
    8000482c:	00008067          	ret
    80004830:	00002517          	auipc	a0,0x2
    80004834:	ad050513          	addi	a0,a0,-1328 # 80006300 <digits+0x18>
    80004838:	fffff097          	auipc	ra,0xfffff
    8000483c:	354080e7          	jalr	852(ra) # 80003b8c <panic>

0000000080004840 <kalloc>:
    80004840:	fe010113          	addi	sp,sp,-32
    80004844:	00813823          	sd	s0,16(sp)
    80004848:	00913423          	sd	s1,8(sp)
    8000484c:	00113c23          	sd	ra,24(sp)
    80004850:	02010413          	addi	s0,sp,32
    80004854:	00003797          	auipc	a5,0x3
    80004858:	bec78793          	addi	a5,a5,-1044 # 80007440 <kmem>
    8000485c:	0007b483          	ld	s1,0(a5)
    80004860:	02048063          	beqz	s1,80004880 <kalloc+0x40>
    80004864:	0004b703          	ld	a4,0(s1)
    80004868:	00001637          	lui	a2,0x1
    8000486c:	00500593          	li	a1,5
    80004870:	00048513          	mv	a0,s1
    80004874:	00e7b023          	sd	a4,0(a5)
    80004878:	00000097          	auipc	ra,0x0
    8000487c:	400080e7          	jalr	1024(ra) # 80004c78 <__memset>
    80004880:	01813083          	ld	ra,24(sp)
    80004884:	01013403          	ld	s0,16(sp)
    80004888:	00048513          	mv	a0,s1
    8000488c:	00813483          	ld	s1,8(sp)
    80004890:	02010113          	addi	sp,sp,32
    80004894:	00008067          	ret

0000000080004898 <initlock>:
    80004898:	ff010113          	addi	sp,sp,-16
    8000489c:	00813423          	sd	s0,8(sp)
    800048a0:	01010413          	addi	s0,sp,16
    800048a4:	00813403          	ld	s0,8(sp)
    800048a8:	00b53423          	sd	a1,8(a0)
    800048ac:	00052023          	sw	zero,0(a0)
    800048b0:	00053823          	sd	zero,16(a0)
    800048b4:	01010113          	addi	sp,sp,16
    800048b8:	00008067          	ret

00000000800048bc <acquire>:
    800048bc:	fe010113          	addi	sp,sp,-32
    800048c0:	00813823          	sd	s0,16(sp)
    800048c4:	00913423          	sd	s1,8(sp)
    800048c8:	00113c23          	sd	ra,24(sp)
    800048cc:	01213023          	sd	s2,0(sp)
    800048d0:	02010413          	addi	s0,sp,32
    800048d4:	00050493          	mv	s1,a0
    800048d8:	10002973          	csrr	s2,sstatus
    800048dc:	100027f3          	csrr	a5,sstatus
    800048e0:	ffd7f793          	andi	a5,a5,-3
    800048e4:	10079073          	csrw	sstatus,a5
    800048e8:	fffff097          	auipc	ra,0xfffff
    800048ec:	8e4080e7          	jalr	-1820(ra) # 800031cc <mycpu>
    800048f0:	07852783          	lw	a5,120(a0)
    800048f4:	06078e63          	beqz	a5,80004970 <acquire+0xb4>
    800048f8:	fffff097          	auipc	ra,0xfffff
    800048fc:	8d4080e7          	jalr	-1836(ra) # 800031cc <mycpu>
    80004900:	07852783          	lw	a5,120(a0)
    80004904:	0004a703          	lw	a4,0(s1)
    80004908:	0017879b          	addiw	a5,a5,1
    8000490c:	06f52c23          	sw	a5,120(a0)
    80004910:	04071063          	bnez	a4,80004950 <acquire+0x94>
    80004914:	00100713          	li	a4,1
    80004918:	00070793          	mv	a5,a4
    8000491c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80004920:	0007879b          	sext.w	a5,a5
    80004924:	fe079ae3          	bnez	a5,80004918 <acquire+0x5c>
    80004928:	0ff0000f          	fence
    8000492c:	fffff097          	auipc	ra,0xfffff
    80004930:	8a0080e7          	jalr	-1888(ra) # 800031cc <mycpu>
    80004934:	01813083          	ld	ra,24(sp)
    80004938:	01013403          	ld	s0,16(sp)
    8000493c:	00a4b823          	sd	a0,16(s1)
    80004940:	00013903          	ld	s2,0(sp)
    80004944:	00813483          	ld	s1,8(sp)
    80004948:	02010113          	addi	sp,sp,32
    8000494c:	00008067          	ret
    80004950:	0104b903          	ld	s2,16(s1)
    80004954:	fffff097          	auipc	ra,0xfffff
    80004958:	878080e7          	jalr	-1928(ra) # 800031cc <mycpu>
    8000495c:	faa91ce3          	bne	s2,a0,80004914 <acquire+0x58>
    80004960:	00002517          	auipc	a0,0x2
    80004964:	9a850513          	addi	a0,a0,-1624 # 80006308 <digits+0x20>
    80004968:	fffff097          	auipc	ra,0xfffff
    8000496c:	224080e7          	jalr	548(ra) # 80003b8c <panic>
    80004970:	00195913          	srli	s2,s2,0x1
    80004974:	fffff097          	auipc	ra,0xfffff
    80004978:	858080e7          	jalr	-1960(ra) # 800031cc <mycpu>
    8000497c:	00197913          	andi	s2,s2,1
    80004980:	07252e23          	sw	s2,124(a0)
    80004984:	f75ff06f          	j	800048f8 <acquire+0x3c>

0000000080004988 <release>:
    80004988:	fe010113          	addi	sp,sp,-32
    8000498c:	00813823          	sd	s0,16(sp)
    80004990:	00113c23          	sd	ra,24(sp)
    80004994:	00913423          	sd	s1,8(sp)
    80004998:	01213023          	sd	s2,0(sp)
    8000499c:	02010413          	addi	s0,sp,32
    800049a0:	00052783          	lw	a5,0(a0)
    800049a4:	00079a63          	bnez	a5,800049b8 <release+0x30>
    800049a8:	00002517          	auipc	a0,0x2
    800049ac:	96850513          	addi	a0,a0,-1688 # 80006310 <digits+0x28>
    800049b0:	fffff097          	auipc	ra,0xfffff
    800049b4:	1dc080e7          	jalr	476(ra) # 80003b8c <panic>
    800049b8:	01053903          	ld	s2,16(a0)
    800049bc:	00050493          	mv	s1,a0
    800049c0:	fffff097          	auipc	ra,0xfffff
    800049c4:	80c080e7          	jalr	-2036(ra) # 800031cc <mycpu>
    800049c8:	fea910e3          	bne	s2,a0,800049a8 <release+0x20>
    800049cc:	0004b823          	sd	zero,16(s1)
    800049d0:	0ff0000f          	fence
    800049d4:	0f50000f          	fence	iorw,ow
    800049d8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800049dc:	ffffe097          	auipc	ra,0xffffe
    800049e0:	7f0080e7          	jalr	2032(ra) # 800031cc <mycpu>
    800049e4:	100027f3          	csrr	a5,sstatus
    800049e8:	0027f793          	andi	a5,a5,2
    800049ec:	04079a63          	bnez	a5,80004a40 <release+0xb8>
    800049f0:	07852783          	lw	a5,120(a0)
    800049f4:	02f05e63          	blez	a5,80004a30 <release+0xa8>
    800049f8:	fff7871b          	addiw	a4,a5,-1
    800049fc:	06e52c23          	sw	a4,120(a0)
    80004a00:	00071c63          	bnez	a4,80004a18 <release+0x90>
    80004a04:	07c52783          	lw	a5,124(a0)
    80004a08:	00078863          	beqz	a5,80004a18 <release+0x90>
    80004a0c:	100027f3          	csrr	a5,sstatus
    80004a10:	0027e793          	ori	a5,a5,2
    80004a14:	10079073          	csrw	sstatus,a5
    80004a18:	01813083          	ld	ra,24(sp)
    80004a1c:	01013403          	ld	s0,16(sp)
    80004a20:	00813483          	ld	s1,8(sp)
    80004a24:	00013903          	ld	s2,0(sp)
    80004a28:	02010113          	addi	sp,sp,32
    80004a2c:	00008067          	ret
    80004a30:	00002517          	auipc	a0,0x2
    80004a34:	90050513          	addi	a0,a0,-1792 # 80006330 <digits+0x48>
    80004a38:	fffff097          	auipc	ra,0xfffff
    80004a3c:	154080e7          	jalr	340(ra) # 80003b8c <panic>
    80004a40:	00002517          	auipc	a0,0x2
    80004a44:	8d850513          	addi	a0,a0,-1832 # 80006318 <digits+0x30>
    80004a48:	fffff097          	auipc	ra,0xfffff
    80004a4c:	144080e7          	jalr	324(ra) # 80003b8c <panic>

0000000080004a50 <holding>:
    80004a50:	00052783          	lw	a5,0(a0)
    80004a54:	00079663          	bnez	a5,80004a60 <holding+0x10>
    80004a58:	00000513          	li	a0,0
    80004a5c:	00008067          	ret
    80004a60:	fe010113          	addi	sp,sp,-32
    80004a64:	00813823          	sd	s0,16(sp)
    80004a68:	00913423          	sd	s1,8(sp)
    80004a6c:	00113c23          	sd	ra,24(sp)
    80004a70:	02010413          	addi	s0,sp,32
    80004a74:	01053483          	ld	s1,16(a0)
    80004a78:	ffffe097          	auipc	ra,0xffffe
    80004a7c:	754080e7          	jalr	1876(ra) # 800031cc <mycpu>
    80004a80:	01813083          	ld	ra,24(sp)
    80004a84:	01013403          	ld	s0,16(sp)
    80004a88:	40a48533          	sub	a0,s1,a0
    80004a8c:	00153513          	seqz	a0,a0
    80004a90:	00813483          	ld	s1,8(sp)
    80004a94:	02010113          	addi	sp,sp,32
    80004a98:	00008067          	ret

0000000080004a9c <push_off>:
    80004a9c:	fe010113          	addi	sp,sp,-32
    80004aa0:	00813823          	sd	s0,16(sp)
    80004aa4:	00113c23          	sd	ra,24(sp)
    80004aa8:	00913423          	sd	s1,8(sp)
    80004aac:	02010413          	addi	s0,sp,32
    80004ab0:	100024f3          	csrr	s1,sstatus
    80004ab4:	100027f3          	csrr	a5,sstatus
    80004ab8:	ffd7f793          	andi	a5,a5,-3
    80004abc:	10079073          	csrw	sstatus,a5
    80004ac0:	ffffe097          	auipc	ra,0xffffe
    80004ac4:	70c080e7          	jalr	1804(ra) # 800031cc <mycpu>
    80004ac8:	07852783          	lw	a5,120(a0)
    80004acc:	02078663          	beqz	a5,80004af8 <push_off+0x5c>
    80004ad0:	ffffe097          	auipc	ra,0xffffe
    80004ad4:	6fc080e7          	jalr	1788(ra) # 800031cc <mycpu>
    80004ad8:	07852783          	lw	a5,120(a0)
    80004adc:	01813083          	ld	ra,24(sp)
    80004ae0:	01013403          	ld	s0,16(sp)
    80004ae4:	0017879b          	addiw	a5,a5,1
    80004ae8:	06f52c23          	sw	a5,120(a0)
    80004aec:	00813483          	ld	s1,8(sp)
    80004af0:	02010113          	addi	sp,sp,32
    80004af4:	00008067          	ret
    80004af8:	0014d493          	srli	s1,s1,0x1
    80004afc:	ffffe097          	auipc	ra,0xffffe
    80004b00:	6d0080e7          	jalr	1744(ra) # 800031cc <mycpu>
    80004b04:	0014f493          	andi	s1,s1,1
    80004b08:	06952e23          	sw	s1,124(a0)
    80004b0c:	fc5ff06f          	j	80004ad0 <push_off+0x34>

0000000080004b10 <pop_off>:
    80004b10:	ff010113          	addi	sp,sp,-16
    80004b14:	00813023          	sd	s0,0(sp)
    80004b18:	00113423          	sd	ra,8(sp)
    80004b1c:	01010413          	addi	s0,sp,16
    80004b20:	ffffe097          	auipc	ra,0xffffe
    80004b24:	6ac080e7          	jalr	1708(ra) # 800031cc <mycpu>
    80004b28:	100027f3          	csrr	a5,sstatus
    80004b2c:	0027f793          	andi	a5,a5,2
    80004b30:	04079663          	bnez	a5,80004b7c <pop_off+0x6c>
    80004b34:	07852783          	lw	a5,120(a0)
    80004b38:	02f05a63          	blez	a5,80004b6c <pop_off+0x5c>
    80004b3c:	fff7871b          	addiw	a4,a5,-1
    80004b40:	06e52c23          	sw	a4,120(a0)
    80004b44:	00071c63          	bnez	a4,80004b5c <pop_off+0x4c>
    80004b48:	07c52783          	lw	a5,124(a0)
    80004b4c:	00078863          	beqz	a5,80004b5c <pop_off+0x4c>
    80004b50:	100027f3          	csrr	a5,sstatus
    80004b54:	0027e793          	ori	a5,a5,2
    80004b58:	10079073          	csrw	sstatus,a5
    80004b5c:	00813083          	ld	ra,8(sp)
    80004b60:	00013403          	ld	s0,0(sp)
    80004b64:	01010113          	addi	sp,sp,16
    80004b68:	00008067          	ret
    80004b6c:	00001517          	auipc	a0,0x1
    80004b70:	7c450513          	addi	a0,a0,1988 # 80006330 <digits+0x48>
    80004b74:	fffff097          	auipc	ra,0xfffff
    80004b78:	018080e7          	jalr	24(ra) # 80003b8c <panic>
    80004b7c:	00001517          	auipc	a0,0x1
    80004b80:	79c50513          	addi	a0,a0,1948 # 80006318 <digits+0x30>
    80004b84:	fffff097          	auipc	ra,0xfffff
    80004b88:	008080e7          	jalr	8(ra) # 80003b8c <panic>

0000000080004b8c <push_on>:
    80004b8c:	fe010113          	addi	sp,sp,-32
    80004b90:	00813823          	sd	s0,16(sp)
    80004b94:	00113c23          	sd	ra,24(sp)
    80004b98:	00913423          	sd	s1,8(sp)
    80004b9c:	02010413          	addi	s0,sp,32
    80004ba0:	100024f3          	csrr	s1,sstatus
    80004ba4:	100027f3          	csrr	a5,sstatus
    80004ba8:	0027e793          	ori	a5,a5,2
    80004bac:	10079073          	csrw	sstatus,a5
    80004bb0:	ffffe097          	auipc	ra,0xffffe
    80004bb4:	61c080e7          	jalr	1564(ra) # 800031cc <mycpu>
    80004bb8:	07852783          	lw	a5,120(a0)
    80004bbc:	02078663          	beqz	a5,80004be8 <push_on+0x5c>
    80004bc0:	ffffe097          	auipc	ra,0xffffe
    80004bc4:	60c080e7          	jalr	1548(ra) # 800031cc <mycpu>
    80004bc8:	07852783          	lw	a5,120(a0)
    80004bcc:	01813083          	ld	ra,24(sp)
    80004bd0:	01013403          	ld	s0,16(sp)
    80004bd4:	0017879b          	addiw	a5,a5,1
    80004bd8:	06f52c23          	sw	a5,120(a0)
    80004bdc:	00813483          	ld	s1,8(sp)
    80004be0:	02010113          	addi	sp,sp,32
    80004be4:	00008067          	ret
    80004be8:	0014d493          	srli	s1,s1,0x1
    80004bec:	ffffe097          	auipc	ra,0xffffe
    80004bf0:	5e0080e7          	jalr	1504(ra) # 800031cc <mycpu>
    80004bf4:	0014f493          	andi	s1,s1,1
    80004bf8:	06952e23          	sw	s1,124(a0)
    80004bfc:	fc5ff06f          	j	80004bc0 <push_on+0x34>

0000000080004c00 <pop_on>:
    80004c00:	ff010113          	addi	sp,sp,-16
    80004c04:	00813023          	sd	s0,0(sp)
    80004c08:	00113423          	sd	ra,8(sp)
    80004c0c:	01010413          	addi	s0,sp,16
    80004c10:	ffffe097          	auipc	ra,0xffffe
    80004c14:	5bc080e7          	jalr	1468(ra) # 800031cc <mycpu>
    80004c18:	100027f3          	csrr	a5,sstatus
    80004c1c:	0027f793          	andi	a5,a5,2
    80004c20:	04078463          	beqz	a5,80004c68 <pop_on+0x68>
    80004c24:	07852783          	lw	a5,120(a0)
    80004c28:	02f05863          	blez	a5,80004c58 <pop_on+0x58>
    80004c2c:	fff7879b          	addiw	a5,a5,-1
    80004c30:	06f52c23          	sw	a5,120(a0)
    80004c34:	07853783          	ld	a5,120(a0)
    80004c38:	00079863          	bnez	a5,80004c48 <pop_on+0x48>
    80004c3c:	100027f3          	csrr	a5,sstatus
    80004c40:	ffd7f793          	andi	a5,a5,-3
    80004c44:	10079073          	csrw	sstatus,a5
    80004c48:	00813083          	ld	ra,8(sp)
    80004c4c:	00013403          	ld	s0,0(sp)
    80004c50:	01010113          	addi	sp,sp,16
    80004c54:	00008067          	ret
    80004c58:	00001517          	auipc	a0,0x1
    80004c5c:	70050513          	addi	a0,a0,1792 # 80006358 <digits+0x70>
    80004c60:	fffff097          	auipc	ra,0xfffff
    80004c64:	f2c080e7          	jalr	-212(ra) # 80003b8c <panic>
    80004c68:	00001517          	auipc	a0,0x1
    80004c6c:	6d050513          	addi	a0,a0,1744 # 80006338 <digits+0x50>
    80004c70:	fffff097          	auipc	ra,0xfffff
    80004c74:	f1c080e7          	jalr	-228(ra) # 80003b8c <panic>

0000000080004c78 <__memset>:
    80004c78:	ff010113          	addi	sp,sp,-16
    80004c7c:	00813423          	sd	s0,8(sp)
    80004c80:	01010413          	addi	s0,sp,16
    80004c84:	1a060e63          	beqz	a2,80004e40 <__memset+0x1c8>
    80004c88:	40a007b3          	neg	a5,a0
    80004c8c:	0077f793          	andi	a5,a5,7
    80004c90:	00778693          	addi	a3,a5,7
    80004c94:	00b00813          	li	a6,11
    80004c98:	0ff5f593          	andi	a1,a1,255
    80004c9c:	fff6071b          	addiw	a4,a2,-1
    80004ca0:	1b06e663          	bltu	a3,a6,80004e4c <__memset+0x1d4>
    80004ca4:	1cd76463          	bltu	a4,a3,80004e6c <__memset+0x1f4>
    80004ca8:	1a078e63          	beqz	a5,80004e64 <__memset+0x1ec>
    80004cac:	00b50023          	sb	a1,0(a0)
    80004cb0:	00100713          	li	a4,1
    80004cb4:	1ae78463          	beq	a5,a4,80004e5c <__memset+0x1e4>
    80004cb8:	00b500a3          	sb	a1,1(a0)
    80004cbc:	00200713          	li	a4,2
    80004cc0:	1ae78a63          	beq	a5,a4,80004e74 <__memset+0x1fc>
    80004cc4:	00b50123          	sb	a1,2(a0)
    80004cc8:	00300713          	li	a4,3
    80004ccc:	18e78463          	beq	a5,a4,80004e54 <__memset+0x1dc>
    80004cd0:	00b501a3          	sb	a1,3(a0)
    80004cd4:	00400713          	li	a4,4
    80004cd8:	1ae78263          	beq	a5,a4,80004e7c <__memset+0x204>
    80004cdc:	00b50223          	sb	a1,4(a0)
    80004ce0:	00500713          	li	a4,5
    80004ce4:	1ae78063          	beq	a5,a4,80004e84 <__memset+0x20c>
    80004ce8:	00b502a3          	sb	a1,5(a0)
    80004cec:	00700713          	li	a4,7
    80004cf0:	18e79e63          	bne	a5,a4,80004e8c <__memset+0x214>
    80004cf4:	00b50323          	sb	a1,6(a0)
    80004cf8:	00700e93          	li	t4,7
    80004cfc:	00859713          	slli	a4,a1,0x8
    80004d00:	00e5e733          	or	a4,a1,a4
    80004d04:	01059e13          	slli	t3,a1,0x10
    80004d08:	01c76e33          	or	t3,a4,t3
    80004d0c:	01859313          	slli	t1,a1,0x18
    80004d10:	006e6333          	or	t1,t3,t1
    80004d14:	02059893          	slli	a7,a1,0x20
    80004d18:	40f60e3b          	subw	t3,a2,a5
    80004d1c:	011368b3          	or	a7,t1,a7
    80004d20:	02859813          	slli	a6,a1,0x28
    80004d24:	0108e833          	or	a6,a7,a6
    80004d28:	03059693          	slli	a3,a1,0x30
    80004d2c:	003e589b          	srliw	a7,t3,0x3
    80004d30:	00d866b3          	or	a3,a6,a3
    80004d34:	03859713          	slli	a4,a1,0x38
    80004d38:	00389813          	slli	a6,a7,0x3
    80004d3c:	00f507b3          	add	a5,a0,a5
    80004d40:	00e6e733          	or	a4,a3,a4
    80004d44:	000e089b          	sext.w	a7,t3
    80004d48:	00f806b3          	add	a3,a6,a5
    80004d4c:	00e7b023          	sd	a4,0(a5)
    80004d50:	00878793          	addi	a5,a5,8
    80004d54:	fed79ce3          	bne	a5,a3,80004d4c <__memset+0xd4>
    80004d58:	ff8e7793          	andi	a5,t3,-8
    80004d5c:	0007871b          	sext.w	a4,a5
    80004d60:	01d787bb          	addw	a5,a5,t4
    80004d64:	0ce88e63          	beq	a7,a4,80004e40 <__memset+0x1c8>
    80004d68:	00f50733          	add	a4,a0,a5
    80004d6c:	00b70023          	sb	a1,0(a4)
    80004d70:	0017871b          	addiw	a4,a5,1
    80004d74:	0cc77663          	bgeu	a4,a2,80004e40 <__memset+0x1c8>
    80004d78:	00e50733          	add	a4,a0,a4
    80004d7c:	00b70023          	sb	a1,0(a4)
    80004d80:	0027871b          	addiw	a4,a5,2
    80004d84:	0ac77e63          	bgeu	a4,a2,80004e40 <__memset+0x1c8>
    80004d88:	00e50733          	add	a4,a0,a4
    80004d8c:	00b70023          	sb	a1,0(a4)
    80004d90:	0037871b          	addiw	a4,a5,3
    80004d94:	0ac77663          	bgeu	a4,a2,80004e40 <__memset+0x1c8>
    80004d98:	00e50733          	add	a4,a0,a4
    80004d9c:	00b70023          	sb	a1,0(a4)
    80004da0:	0047871b          	addiw	a4,a5,4
    80004da4:	08c77e63          	bgeu	a4,a2,80004e40 <__memset+0x1c8>
    80004da8:	00e50733          	add	a4,a0,a4
    80004dac:	00b70023          	sb	a1,0(a4)
    80004db0:	0057871b          	addiw	a4,a5,5
    80004db4:	08c77663          	bgeu	a4,a2,80004e40 <__memset+0x1c8>
    80004db8:	00e50733          	add	a4,a0,a4
    80004dbc:	00b70023          	sb	a1,0(a4)
    80004dc0:	0067871b          	addiw	a4,a5,6
    80004dc4:	06c77e63          	bgeu	a4,a2,80004e40 <__memset+0x1c8>
    80004dc8:	00e50733          	add	a4,a0,a4
    80004dcc:	00b70023          	sb	a1,0(a4)
    80004dd0:	0077871b          	addiw	a4,a5,7
    80004dd4:	06c77663          	bgeu	a4,a2,80004e40 <__memset+0x1c8>
    80004dd8:	00e50733          	add	a4,a0,a4
    80004ddc:	00b70023          	sb	a1,0(a4)
    80004de0:	0087871b          	addiw	a4,a5,8
    80004de4:	04c77e63          	bgeu	a4,a2,80004e40 <__memset+0x1c8>
    80004de8:	00e50733          	add	a4,a0,a4
    80004dec:	00b70023          	sb	a1,0(a4)
    80004df0:	0097871b          	addiw	a4,a5,9
    80004df4:	04c77663          	bgeu	a4,a2,80004e40 <__memset+0x1c8>
    80004df8:	00e50733          	add	a4,a0,a4
    80004dfc:	00b70023          	sb	a1,0(a4)
    80004e00:	00a7871b          	addiw	a4,a5,10
    80004e04:	02c77e63          	bgeu	a4,a2,80004e40 <__memset+0x1c8>
    80004e08:	00e50733          	add	a4,a0,a4
    80004e0c:	00b70023          	sb	a1,0(a4)
    80004e10:	00b7871b          	addiw	a4,a5,11
    80004e14:	02c77663          	bgeu	a4,a2,80004e40 <__memset+0x1c8>
    80004e18:	00e50733          	add	a4,a0,a4
    80004e1c:	00b70023          	sb	a1,0(a4)
    80004e20:	00c7871b          	addiw	a4,a5,12
    80004e24:	00c77e63          	bgeu	a4,a2,80004e40 <__memset+0x1c8>
    80004e28:	00e50733          	add	a4,a0,a4
    80004e2c:	00b70023          	sb	a1,0(a4)
    80004e30:	00d7879b          	addiw	a5,a5,13
    80004e34:	00c7f663          	bgeu	a5,a2,80004e40 <__memset+0x1c8>
    80004e38:	00f507b3          	add	a5,a0,a5
    80004e3c:	00b78023          	sb	a1,0(a5)
    80004e40:	00813403          	ld	s0,8(sp)
    80004e44:	01010113          	addi	sp,sp,16
    80004e48:	00008067          	ret
    80004e4c:	00b00693          	li	a3,11
    80004e50:	e55ff06f          	j	80004ca4 <__memset+0x2c>
    80004e54:	00300e93          	li	t4,3
    80004e58:	ea5ff06f          	j	80004cfc <__memset+0x84>
    80004e5c:	00100e93          	li	t4,1
    80004e60:	e9dff06f          	j	80004cfc <__memset+0x84>
    80004e64:	00000e93          	li	t4,0
    80004e68:	e95ff06f          	j	80004cfc <__memset+0x84>
    80004e6c:	00000793          	li	a5,0
    80004e70:	ef9ff06f          	j	80004d68 <__memset+0xf0>
    80004e74:	00200e93          	li	t4,2
    80004e78:	e85ff06f          	j	80004cfc <__memset+0x84>
    80004e7c:	00400e93          	li	t4,4
    80004e80:	e7dff06f          	j	80004cfc <__memset+0x84>
    80004e84:	00500e93          	li	t4,5
    80004e88:	e75ff06f          	j	80004cfc <__memset+0x84>
    80004e8c:	00600e93          	li	t4,6
    80004e90:	e6dff06f          	j	80004cfc <__memset+0x84>

0000000080004e94 <__memmove>:
    80004e94:	ff010113          	addi	sp,sp,-16
    80004e98:	00813423          	sd	s0,8(sp)
    80004e9c:	01010413          	addi	s0,sp,16
    80004ea0:	0e060863          	beqz	a2,80004f90 <__memmove+0xfc>
    80004ea4:	fff6069b          	addiw	a3,a2,-1
    80004ea8:	0006881b          	sext.w	a6,a3
    80004eac:	0ea5e863          	bltu	a1,a0,80004f9c <__memmove+0x108>
    80004eb0:	00758713          	addi	a4,a1,7
    80004eb4:	00a5e7b3          	or	a5,a1,a0
    80004eb8:	40a70733          	sub	a4,a4,a0
    80004ebc:	0077f793          	andi	a5,a5,7
    80004ec0:	00f73713          	sltiu	a4,a4,15
    80004ec4:	00174713          	xori	a4,a4,1
    80004ec8:	0017b793          	seqz	a5,a5
    80004ecc:	00e7f7b3          	and	a5,a5,a4
    80004ed0:	10078863          	beqz	a5,80004fe0 <__memmove+0x14c>
    80004ed4:	00900793          	li	a5,9
    80004ed8:	1107f463          	bgeu	a5,a6,80004fe0 <__memmove+0x14c>
    80004edc:	0036581b          	srliw	a6,a2,0x3
    80004ee0:	fff8081b          	addiw	a6,a6,-1
    80004ee4:	02081813          	slli	a6,a6,0x20
    80004ee8:	01d85893          	srli	a7,a6,0x1d
    80004eec:	00858813          	addi	a6,a1,8
    80004ef0:	00058793          	mv	a5,a1
    80004ef4:	00050713          	mv	a4,a0
    80004ef8:	01088833          	add	a6,a7,a6
    80004efc:	0007b883          	ld	a7,0(a5)
    80004f00:	00878793          	addi	a5,a5,8
    80004f04:	00870713          	addi	a4,a4,8
    80004f08:	ff173c23          	sd	a7,-8(a4)
    80004f0c:	ff0798e3          	bne	a5,a6,80004efc <__memmove+0x68>
    80004f10:	ff867713          	andi	a4,a2,-8
    80004f14:	02071793          	slli	a5,a4,0x20
    80004f18:	0207d793          	srli	a5,a5,0x20
    80004f1c:	00f585b3          	add	a1,a1,a5
    80004f20:	40e686bb          	subw	a3,a3,a4
    80004f24:	00f507b3          	add	a5,a0,a5
    80004f28:	06e60463          	beq	a2,a4,80004f90 <__memmove+0xfc>
    80004f2c:	0005c703          	lbu	a4,0(a1)
    80004f30:	00e78023          	sb	a4,0(a5)
    80004f34:	04068e63          	beqz	a3,80004f90 <__memmove+0xfc>
    80004f38:	0015c603          	lbu	a2,1(a1)
    80004f3c:	00100713          	li	a4,1
    80004f40:	00c780a3          	sb	a2,1(a5)
    80004f44:	04e68663          	beq	a3,a4,80004f90 <__memmove+0xfc>
    80004f48:	0025c603          	lbu	a2,2(a1)
    80004f4c:	00200713          	li	a4,2
    80004f50:	00c78123          	sb	a2,2(a5)
    80004f54:	02e68e63          	beq	a3,a4,80004f90 <__memmove+0xfc>
    80004f58:	0035c603          	lbu	a2,3(a1)
    80004f5c:	00300713          	li	a4,3
    80004f60:	00c781a3          	sb	a2,3(a5)
    80004f64:	02e68663          	beq	a3,a4,80004f90 <__memmove+0xfc>
    80004f68:	0045c603          	lbu	a2,4(a1)
    80004f6c:	00400713          	li	a4,4
    80004f70:	00c78223          	sb	a2,4(a5)
    80004f74:	00e68e63          	beq	a3,a4,80004f90 <__memmove+0xfc>
    80004f78:	0055c603          	lbu	a2,5(a1)
    80004f7c:	00500713          	li	a4,5
    80004f80:	00c782a3          	sb	a2,5(a5)
    80004f84:	00e68663          	beq	a3,a4,80004f90 <__memmove+0xfc>
    80004f88:	0065c703          	lbu	a4,6(a1)
    80004f8c:	00e78323          	sb	a4,6(a5)
    80004f90:	00813403          	ld	s0,8(sp)
    80004f94:	01010113          	addi	sp,sp,16
    80004f98:	00008067          	ret
    80004f9c:	02061713          	slli	a4,a2,0x20
    80004fa0:	02075713          	srli	a4,a4,0x20
    80004fa4:	00e587b3          	add	a5,a1,a4
    80004fa8:	f0f574e3          	bgeu	a0,a5,80004eb0 <__memmove+0x1c>
    80004fac:	02069613          	slli	a2,a3,0x20
    80004fb0:	02065613          	srli	a2,a2,0x20
    80004fb4:	fff64613          	not	a2,a2
    80004fb8:	00e50733          	add	a4,a0,a4
    80004fbc:	00c78633          	add	a2,a5,a2
    80004fc0:	fff7c683          	lbu	a3,-1(a5)
    80004fc4:	fff78793          	addi	a5,a5,-1
    80004fc8:	fff70713          	addi	a4,a4,-1
    80004fcc:	00d70023          	sb	a3,0(a4)
    80004fd0:	fec798e3          	bne	a5,a2,80004fc0 <__memmove+0x12c>
    80004fd4:	00813403          	ld	s0,8(sp)
    80004fd8:	01010113          	addi	sp,sp,16
    80004fdc:	00008067          	ret
    80004fe0:	02069713          	slli	a4,a3,0x20
    80004fe4:	02075713          	srli	a4,a4,0x20
    80004fe8:	00170713          	addi	a4,a4,1
    80004fec:	00e50733          	add	a4,a0,a4
    80004ff0:	00050793          	mv	a5,a0
    80004ff4:	0005c683          	lbu	a3,0(a1)
    80004ff8:	00178793          	addi	a5,a5,1
    80004ffc:	00158593          	addi	a1,a1,1
    80005000:	fed78fa3          	sb	a3,-1(a5)
    80005004:	fee798e3          	bne	a5,a4,80004ff4 <__memmove+0x160>
    80005008:	f89ff06f          	j	80004f90 <__memmove+0xfc>

000000008000500c <__putc>:
    8000500c:	fe010113          	addi	sp,sp,-32
    80005010:	00813823          	sd	s0,16(sp)
    80005014:	00113c23          	sd	ra,24(sp)
    80005018:	02010413          	addi	s0,sp,32
    8000501c:	00050793          	mv	a5,a0
    80005020:	fef40593          	addi	a1,s0,-17
    80005024:	00100613          	li	a2,1
    80005028:	00000513          	li	a0,0
    8000502c:	fef407a3          	sb	a5,-17(s0)
    80005030:	fffff097          	auipc	ra,0xfffff
    80005034:	b3c080e7          	jalr	-1220(ra) # 80003b6c <console_write>
    80005038:	01813083          	ld	ra,24(sp)
    8000503c:	01013403          	ld	s0,16(sp)
    80005040:	02010113          	addi	sp,sp,32
    80005044:	00008067          	ret

0000000080005048 <__getc>:
    80005048:	fe010113          	addi	sp,sp,-32
    8000504c:	00813823          	sd	s0,16(sp)
    80005050:	00113c23          	sd	ra,24(sp)
    80005054:	02010413          	addi	s0,sp,32
    80005058:	fe840593          	addi	a1,s0,-24
    8000505c:	00100613          	li	a2,1
    80005060:	00000513          	li	a0,0
    80005064:	fffff097          	auipc	ra,0xfffff
    80005068:	ae8080e7          	jalr	-1304(ra) # 80003b4c <console_read>
    8000506c:	fe844503          	lbu	a0,-24(s0)
    80005070:	01813083          	ld	ra,24(sp)
    80005074:	01013403          	ld	s0,16(sp)
    80005078:	02010113          	addi	sp,sp,32
    8000507c:	00008067          	ret

0000000080005080 <console_handler>:
    80005080:	fe010113          	addi	sp,sp,-32
    80005084:	00813823          	sd	s0,16(sp)
    80005088:	00113c23          	sd	ra,24(sp)
    8000508c:	00913423          	sd	s1,8(sp)
    80005090:	02010413          	addi	s0,sp,32
    80005094:	14202773          	csrr	a4,scause
    80005098:	100027f3          	csrr	a5,sstatus
    8000509c:	0027f793          	andi	a5,a5,2
    800050a0:	06079e63          	bnez	a5,8000511c <console_handler+0x9c>
    800050a4:	00074c63          	bltz	a4,800050bc <console_handler+0x3c>
    800050a8:	01813083          	ld	ra,24(sp)
    800050ac:	01013403          	ld	s0,16(sp)
    800050b0:	00813483          	ld	s1,8(sp)
    800050b4:	02010113          	addi	sp,sp,32
    800050b8:	00008067          	ret
    800050bc:	0ff77713          	andi	a4,a4,255
    800050c0:	00900793          	li	a5,9
    800050c4:	fef712e3          	bne	a4,a5,800050a8 <console_handler+0x28>
    800050c8:	ffffe097          	auipc	ra,0xffffe
    800050cc:	6dc080e7          	jalr	1756(ra) # 800037a4 <plic_claim>
    800050d0:	00a00793          	li	a5,10
    800050d4:	00050493          	mv	s1,a0
    800050d8:	02f50c63          	beq	a0,a5,80005110 <console_handler+0x90>
    800050dc:	fc0506e3          	beqz	a0,800050a8 <console_handler+0x28>
    800050e0:	00050593          	mv	a1,a0
    800050e4:	00001517          	auipc	a0,0x1
    800050e8:	17c50513          	addi	a0,a0,380 # 80006260 <CONSOLE_STATUS+0x250>
    800050ec:	fffff097          	auipc	ra,0xfffff
    800050f0:	afc080e7          	jalr	-1284(ra) # 80003be8 <__printf>
    800050f4:	01013403          	ld	s0,16(sp)
    800050f8:	01813083          	ld	ra,24(sp)
    800050fc:	00048513          	mv	a0,s1
    80005100:	00813483          	ld	s1,8(sp)
    80005104:	02010113          	addi	sp,sp,32
    80005108:	ffffe317          	auipc	t1,0xffffe
    8000510c:	6d430067          	jr	1748(t1) # 800037dc <plic_complete>
    80005110:	fffff097          	auipc	ra,0xfffff
    80005114:	3e0080e7          	jalr	992(ra) # 800044f0 <uartintr>
    80005118:	fddff06f          	j	800050f4 <console_handler+0x74>
    8000511c:	00001517          	auipc	a0,0x1
    80005120:	24450513          	addi	a0,a0,580 # 80006360 <digits+0x78>
    80005124:	fffff097          	auipc	ra,0xfffff
    80005128:	a68080e7          	jalr	-1432(ra) # 80003b8c <panic>
	...
