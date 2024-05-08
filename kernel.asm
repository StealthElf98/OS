
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00004117          	auipc	sp,0x4
    80000004:	32013103          	ld	sp,800(sp) # 80004320 <_GLOBAL_OFFSET_TABLE_+0x10>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	210010ef          	jal	ra,8000122c <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <main>:
// Created by os on 5/8/24.
//

#include "../h/MemoryAllocator.h"

int main() {
    80001000:	ff010113          	addi	sp,sp,-16
    80001004:	00113423          	sd	ra,8(sp)
    80001008:	00813023          	sd	s0,0(sp)
    8000100c:	01010413          	addi	s0,sp,16
    MemoryAllocator& allocator = MemoryAllocator::getInstance();
    80001010:	00000097          	auipc	ra,0x0
    80001014:	068080e7          	jalr	104(ra) # 80001078 <_ZN15MemoryAllocator11getInstanceEv>
    allocator.mem_alloc(100);
    80001018:	06400593          	li	a1,100
    8000101c:	00000097          	auipc	ra,0x0
    80001020:	0dc080e7          	jalr	220(ra) # 800010f8 <_ZN15MemoryAllocator9mem_allocEm>

    return 0;
    80001024:	00000513          	li	a0,0
    80001028:	00813083          	ld	ra,8(sp)
    8000102c:	00013403          	ld	s0,0(sp)
    80001030:	01010113          	addi	sp,sp,16
    80001034:	00008067          	ret

0000000080001038 <_ZN8MemBlockC1Em>:
// Created by os on 5/7/24.
//

#include "../h/MemBlock.h"

    80001038:	ff010113          	addi	sp,sp,-16
    8000103c:	00813423          	sd	s0,8(sp)
    80001040:	01010413          	addi	s0,sp,16
    80001044:	00b53023          	sd	a1,0(a0) # 1000 <_entry-0x7ffff000>
    80001048:	00053423          	sd	zero,8(a0)
    8000104c:	00813403          	ld	s0,8(sp)
    80001050:	01010113          	addi	sp,sp,16
    80001054:	00008067          	ret

0000000080001058 <_ZN15MemoryAllocatorC1Ev>:
// Created by os on 4/3/24.
//

#include "../h/MemoryAllocator.h"

MemoryAllocator::MemoryAllocator() : usedBlocks(nullptr), freeBlocks(nullptr) {}
    80001058:	ff010113          	addi	sp,sp,-16
    8000105c:	00813423          	sd	s0,8(sp)
    80001060:	01010413          	addi	s0,sp,16
    80001064:	00053023          	sd	zero,0(a0)
    80001068:	00053423          	sd	zero,8(a0)
    8000106c:	00813403          	ld	s0,8(sp)
    80001070:	01010113          	addi	sp,sp,16
    80001074:	00008067          	ret

0000000080001078 <_ZN15MemoryAllocator11getInstanceEv>:

MemoryAllocator& MemoryAllocator::getInstance() {
    80001078:	ff010113          	addi	sp,sp,-16
    8000107c:	00113423          	sd	ra,8(sp)
    80001080:	00813023          	sd	s0,0(sp)
    80001084:	01010413          	addi	s0,sp,16
    static MemoryAllocator instance;
    80001088:	00003797          	auipc	a5,0x3
    8000108c:	2e87c783          	lbu	a5,744(a5) # 80004370 <_ZGVZN15MemoryAllocator11getInstanceEvE8instance>
    80001090:	04078463          	beqz	a5,800010d8 <_ZN15MemoryAllocator11getInstanceEv+0x60>
    instance.freeBlocks = (MemBlock*)((char*)HEAP_START_ADDR);
    80001094:	00003797          	auipc	a5,0x3
    80001098:	2847b783          	ld	a5,644(a5) # 80004318 <_GLOBAL_OFFSET_TABLE_+0x8>
    8000109c:	0007b703          	ld	a4,0(a5)
    800010a0:	00003797          	auipc	a5,0x3
    800010a4:	2ee7b023          	sd	a4,736(a5) # 80004380 <_ZZN15MemoryAllocator11getInstanceEvE8instance+0x8>
    instance.freeBlocks->size = ((char*)HEAP_START_ADDR - (char*)HEAP_END_ADDR - sizeof(MemBlock));
    800010a8:	00003797          	auipc	a5,0x3
    800010ac:	2807b783          	ld	a5,640(a5) # 80004328 <_GLOBAL_OFFSET_TABLE_+0x18>
    800010b0:	0007b783          	ld	a5,0(a5)
    800010b4:	40f707b3          	sub	a5,a4,a5
    800010b8:	ff078793          	addi	a5,a5,-16
    800010bc:	00f73023          	sd	a5,0(a4)
    return instance;
}
    800010c0:	00003517          	auipc	a0,0x3
    800010c4:	2b850513          	addi	a0,a0,696 # 80004378 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    800010c8:	00813083          	ld	ra,8(sp)
    800010cc:	00013403          	ld	s0,0(sp)
    800010d0:	01010113          	addi	sp,sp,16
    800010d4:	00008067          	ret
    static MemoryAllocator instance;
    800010d8:	00003517          	auipc	a0,0x3
    800010dc:	2a050513          	addi	a0,a0,672 # 80004378 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    800010e0:	00000097          	auipc	ra,0x0
    800010e4:	f78080e7          	jalr	-136(ra) # 80001058 <_ZN15MemoryAllocatorC1Ev>
    800010e8:	00100793          	li	a5,1
    800010ec:	00003717          	auipc	a4,0x3
    800010f0:	28f70223          	sb	a5,644(a4) # 80004370 <_ZGVZN15MemoryAllocator11getInstanceEvE8instance>
    800010f4:	fa1ff06f          	j	80001094 <_ZN15MemoryAllocator11getInstanceEv+0x1c>

00000000800010f8 <_ZN15MemoryAllocator9mem_allocEm>:

void* MemoryAllocator::mem_alloc(size_t size) {
    800010f8:	ff010113          	addi	sp,sp,-16
    800010fc:	00813423          	sd	s0,8(sp)
    80001100:	01010413          	addi	s0,sp,16
    80001104:	00050693          	mv	a3,a0
    MemBlock* currentBlock = freeBlocks;
    80001108:	00853503          	ld	a0,8(a0)
    MemBlock* prevBlock = nullptr;
    8000110c:	00000713          	li	a4,0

    // Find a free block with enough size
    while (currentBlock && currentBlock->size < size) {
    80001110:	00050c63          	beqz	a0,80001128 <_ZN15MemoryAllocator9mem_allocEm+0x30>
    80001114:	00053783          	ld	a5,0(a0)
    80001118:	00b7f863          	bgeu	a5,a1,80001128 <_ZN15MemoryAllocator9mem_allocEm+0x30>
        prevBlock = currentBlock;
    8000111c:	00050713          	mv	a4,a0
        currentBlock = currentBlock->next;
    80001120:	00853503          	ld	a0,8(a0)
    while (currentBlock && currentBlock->size < size) {
    80001124:	fedff06f          	j	80001110 <_ZN15MemoryAllocator9mem_allocEm+0x18>
    }

    if (currentBlock) {
    80001128:	00050e63          	beqz	a0,80001144 <_ZN15MemoryAllocator9mem_allocEm+0x4c>
        // Move the block from free list to used list
        if (prevBlock)
    8000112c:	02070263          	beqz	a4,80001150 <_ZN15MemoryAllocator9mem_allocEm+0x58>
            prevBlock->next = currentBlock->next;
    80001130:	00853783          	ld	a5,8(a0)
    80001134:	00f73423          	sd	a5,8(a4)
        else
            freeBlocks = currentBlock->next;

        currentBlock->next = usedBlocks;
    80001138:	0006b783          	ld	a5,0(a3)
    8000113c:	00f53423          	sd	a5,8(a0)
        usedBlocks = currentBlock;
    80001140:	00a6b023          	sd	a0,0(a3)

        return static_cast<void*>(currentBlock);
    }

    return nullptr; // No suitable block found
}
    80001144:	00813403          	ld	s0,8(sp)
    80001148:	01010113          	addi	sp,sp,16
    8000114c:	00008067          	ret
            freeBlocks = currentBlock->next;
    80001150:	00853783          	ld	a5,8(a0)
    80001154:	00f6b423          	sd	a5,8(a3)
    80001158:	fe1ff06f          	j	80001138 <_ZN15MemoryAllocator9mem_allocEm+0x40>

000000008000115c <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free(void* ptr) {
    8000115c:	ff010113          	addi	sp,sp,-16
    80001160:	00813423          	sd	s0,8(sp)
    80001164:	01010413          	addi	s0,sp,16
    if(ptr == nullptr) return -1;
    80001168:	0a058263          	beqz	a1,8000120c <_ZN15MemoryAllocator8mem_freeEPv+0xb0>
    if(ptr > HEAP_END_ADDR || ptr < HEAP_START_ADDR) return -2;
    8000116c:	00003797          	auipc	a5,0x3
    80001170:	1bc7b783          	ld	a5,444(a5) # 80004328 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001174:	0007b783          	ld	a5,0(a5)
    80001178:	08b7ee63          	bltu	a5,a1,80001214 <_ZN15MemoryAllocator8mem_freeEPv+0xb8>
    8000117c:	00003797          	auipc	a5,0x3
    80001180:	19c7b783          	ld	a5,412(a5) # 80004318 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001184:	0007b783          	ld	a5,0(a5)
    80001188:	08f5ea63          	bltu	a1,a5,8000121c <_ZN15MemoryAllocator8mem_freeEPv+0xc0>

    MemBlock* currentBlock = usedBlocks;
    8000118c:	00053783          	ld	a5,0(a0)
    MemBlock* prevBlock = nullptr;
    80001190:	00000713          	li	a4,0

    // Find the block in the used list
    while (currentBlock && static_cast<void*>(currentBlock) != ptr) {
    80001194:	00078a63          	beqz	a5,800011a8 <_ZN15MemoryAllocator8mem_freeEPv+0x4c>
    80001198:	00b78863          	beq	a5,a1,800011a8 <_ZN15MemoryAllocator8mem_freeEPv+0x4c>
        prevBlock = currentBlock;
    8000119c:	00078713          	mv	a4,a5
        currentBlock = currentBlock->next;
    800011a0:	0087b783          	ld	a5,8(a5)
    while (currentBlock && static_cast<void*>(currentBlock) != ptr) {
    800011a4:	ff1ff06f          	j	80001194 <_ZN15MemoryAllocator8mem_freeEPv+0x38>
    }

    if (currentBlock) {
    800011a8:	06078e63          	beqz	a5,80001224 <_ZN15MemoryAllocator8mem_freeEPv+0xc8>
        //Removing block from used blocks list
        if (prevBlock)
    800011ac:	02070863          	beqz	a4,800011dc <_ZN15MemoryAllocator8mem_freeEPv+0x80>
            prevBlock->next = currentBlock->next;
    800011b0:	0087b683          	ld	a3,8(a5)
    800011b4:	00d73423          	sd	a3,8(a4)
        else
            usedBlocks = currentBlock->next;

        currentBlock->next = nullptr;
    800011b8:	0007b423          	sd	zero,8(a5)

        //Adding block to free blocks list
        if(freeBlocks == nullptr) {
    800011bc:	00853703          	ld	a4,8(a0)
    800011c0:	02070463          	beqz	a4,800011e8 <_ZN15MemoryAllocator8mem_freeEPv+0x8c>
            freeBlocks = currentBlock;
        } else if((char*)currentBlock < (char*)freeBlocks) {
    800011c4:	02e7f663          	bgeu	a5,a4,800011f0 <_ZN15MemoryAllocator8mem_freeEPv+0x94>
            currentBlock->next = freeBlocks;
    800011c8:	00e7b423          	sd	a4,8(a5)

            currentBlock->next = currFree->next;
            currFree->next = currentBlock;
        }

        return 0; // Great Success
    800011cc:	00000513          	li	a0,0
    }

    return -3; // Block not found or already free
    800011d0:	00813403          	ld	s0,8(sp)
    800011d4:	01010113          	addi	sp,sp,16
    800011d8:	00008067          	ret
            usedBlocks = currentBlock->next;
    800011dc:	0087b703          	ld	a4,8(a5)
    800011e0:	00e53023          	sd	a4,0(a0)
    800011e4:	fd5ff06f          	j	800011b8 <_ZN15MemoryAllocator8mem_freeEPv+0x5c>
            freeBlocks = currentBlock;
    800011e8:	00f53423          	sd	a5,8(a0)
    800011ec:	fe1ff06f          	j	800011cc <_ZN15MemoryAllocator8mem_freeEPv+0x70>
            for(currFree = freeBlocks; currFree->next && (char*)(currFree->next) < (char*) currentBlock; currFree = currFree->next);
    800011f0:	00070693          	mv	a3,a4
    800011f4:	00873703          	ld	a4,8(a4)
    800011f8:	00070463          	beqz	a4,80001200 <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
    800011fc:	fef76ae3          	bltu	a4,a5,800011f0 <_ZN15MemoryAllocator8mem_freeEPv+0x94>
            currentBlock->next = currFree->next;
    80001200:	00e7b423          	sd	a4,8(a5)
            currFree->next = currentBlock;
    80001204:	00f6b423          	sd	a5,8(a3)
    80001208:	fc5ff06f          	j	800011cc <_ZN15MemoryAllocator8mem_freeEPv+0x70>
    if(ptr == nullptr) return -1;
    8000120c:	fff00513          	li	a0,-1
    80001210:	fc1ff06f          	j	800011d0 <_ZN15MemoryAllocator8mem_freeEPv+0x74>
    if(ptr > HEAP_END_ADDR || ptr < HEAP_START_ADDR) return -2;
    80001214:	ffe00513          	li	a0,-2
    80001218:	fb9ff06f          	j	800011d0 <_ZN15MemoryAllocator8mem_freeEPv+0x74>
    8000121c:	ffe00513          	li	a0,-2
    80001220:	fb1ff06f          	j	800011d0 <_ZN15MemoryAllocator8mem_freeEPv+0x74>
    return -3; // Block not found or already free
    80001224:	ffd00513          	li	a0,-3
    80001228:	fa9ff06f          	j	800011d0 <_ZN15MemoryAllocator8mem_freeEPv+0x74>

000000008000122c <start>:
    8000122c:	ff010113          	addi	sp,sp,-16
    80001230:	00813423          	sd	s0,8(sp)
    80001234:	01010413          	addi	s0,sp,16
    80001238:	300027f3          	csrr	a5,mstatus
    8000123c:	ffffe737          	lui	a4,0xffffe
    80001240:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff921f>
    80001244:	00e7f7b3          	and	a5,a5,a4
    80001248:	00001737          	lui	a4,0x1
    8000124c:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80001250:	00e7e7b3          	or	a5,a5,a4
    80001254:	30079073          	csrw	mstatus,a5
    80001258:	00000797          	auipc	a5,0x0
    8000125c:	16078793          	addi	a5,a5,352 # 800013b8 <system_main>
    80001260:	34179073          	csrw	mepc,a5
    80001264:	00000793          	li	a5,0
    80001268:	18079073          	csrw	satp,a5
    8000126c:	000107b7          	lui	a5,0x10
    80001270:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001274:	30279073          	csrw	medeleg,a5
    80001278:	30379073          	csrw	mideleg,a5
    8000127c:	104027f3          	csrr	a5,sie
    80001280:	2227e793          	ori	a5,a5,546
    80001284:	10479073          	csrw	sie,a5
    80001288:	fff00793          	li	a5,-1
    8000128c:	00a7d793          	srli	a5,a5,0xa
    80001290:	3b079073          	csrw	pmpaddr0,a5
    80001294:	00f00793          	li	a5,15
    80001298:	3a079073          	csrw	pmpcfg0,a5
    8000129c:	f14027f3          	csrr	a5,mhartid
    800012a0:	0200c737          	lui	a4,0x200c
    800012a4:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800012a8:	0007869b          	sext.w	a3,a5
    800012ac:	00269713          	slli	a4,a3,0x2
    800012b0:	000f4637          	lui	a2,0xf4
    800012b4:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800012b8:	00d70733          	add	a4,a4,a3
    800012bc:	0037979b          	slliw	a5,a5,0x3
    800012c0:	020046b7          	lui	a3,0x2004
    800012c4:	00d787b3          	add	a5,a5,a3
    800012c8:	00c585b3          	add	a1,a1,a2
    800012cc:	00371693          	slli	a3,a4,0x3
    800012d0:	00003717          	auipc	a4,0x3
    800012d4:	0c070713          	addi	a4,a4,192 # 80004390 <timer_scratch>
    800012d8:	00b7b023          	sd	a1,0(a5)
    800012dc:	00d70733          	add	a4,a4,a3
    800012e0:	00f73c23          	sd	a5,24(a4)
    800012e4:	02c73023          	sd	a2,32(a4)
    800012e8:	34071073          	csrw	mscratch,a4
    800012ec:	00000797          	auipc	a5,0x0
    800012f0:	6e478793          	addi	a5,a5,1764 # 800019d0 <timervec>
    800012f4:	30579073          	csrw	mtvec,a5
    800012f8:	300027f3          	csrr	a5,mstatus
    800012fc:	0087e793          	ori	a5,a5,8
    80001300:	30079073          	csrw	mstatus,a5
    80001304:	304027f3          	csrr	a5,mie
    80001308:	0807e793          	ori	a5,a5,128
    8000130c:	30479073          	csrw	mie,a5
    80001310:	f14027f3          	csrr	a5,mhartid
    80001314:	0007879b          	sext.w	a5,a5
    80001318:	00078213          	mv	tp,a5
    8000131c:	30200073          	mret
    80001320:	00813403          	ld	s0,8(sp)
    80001324:	01010113          	addi	sp,sp,16
    80001328:	00008067          	ret

000000008000132c <timerinit>:
    8000132c:	ff010113          	addi	sp,sp,-16
    80001330:	00813423          	sd	s0,8(sp)
    80001334:	01010413          	addi	s0,sp,16
    80001338:	f14027f3          	csrr	a5,mhartid
    8000133c:	0200c737          	lui	a4,0x200c
    80001340:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80001344:	0007869b          	sext.w	a3,a5
    80001348:	00269713          	slli	a4,a3,0x2
    8000134c:	000f4637          	lui	a2,0xf4
    80001350:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80001354:	00d70733          	add	a4,a4,a3
    80001358:	0037979b          	slliw	a5,a5,0x3
    8000135c:	020046b7          	lui	a3,0x2004
    80001360:	00d787b3          	add	a5,a5,a3
    80001364:	00c585b3          	add	a1,a1,a2
    80001368:	00371693          	slli	a3,a4,0x3
    8000136c:	00003717          	auipc	a4,0x3
    80001370:	02470713          	addi	a4,a4,36 # 80004390 <timer_scratch>
    80001374:	00b7b023          	sd	a1,0(a5)
    80001378:	00d70733          	add	a4,a4,a3
    8000137c:	00f73c23          	sd	a5,24(a4)
    80001380:	02c73023          	sd	a2,32(a4)
    80001384:	34071073          	csrw	mscratch,a4
    80001388:	00000797          	auipc	a5,0x0
    8000138c:	64878793          	addi	a5,a5,1608 # 800019d0 <timervec>
    80001390:	30579073          	csrw	mtvec,a5
    80001394:	300027f3          	csrr	a5,mstatus
    80001398:	0087e793          	ori	a5,a5,8
    8000139c:	30079073          	csrw	mstatus,a5
    800013a0:	304027f3          	csrr	a5,mie
    800013a4:	0807e793          	ori	a5,a5,128
    800013a8:	30479073          	csrw	mie,a5
    800013ac:	00813403          	ld	s0,8(sp)
    800013b0:	01010113          	addi	sp,sp,16
    800013b4:	00008067          	ret

00000000800013b8 <system_main>:
    800013b8:	fe010113          	addi	sp,sp,-32
    800013bc:	00813823          	sd	s0,16(sp)
    800013c0:	00913423          	sd	s1,8(sp)
    800013c4:	00113c23          	sd	ra,24(sp)
    800013c8:	02010413          	addi	s0,sp,32
    800013cc:	00000097          	auipc	ra,0x0
    800013d0:	0c4080e7          	jalr	196(ra) # 80001490 <cpuid>
    800013d4:	00003497          	auipc	s1,0x3
    800013d8:	f6c48493          	addi	s1,s1,-148 # 80004340 <started>
    800013dc:	02050263          	beqz	a0,80001400 <system_main+0x48>
    800013e0:	0004a783          	lw	a5,0(s1)
    800013e4:	0007879b          	sext.w	a5,a5
    800013e8:	fe078ce3          	beqz	a5,800013e0 <system_main+0x28>
    800013ec:	0ff0000f          	fence
    800013f0:	00003517          	auipc	a0,0x3
    800013f4:	c6050513          	addi	a0,a0,-928 # 80004050 <CONSOLE_STATUS+0x40>
    800013f8:	00001097          	auipc	ra,0x1
    800013fc:	a74080e7          	jalr	-1420(ra) # 80001e6c <panic>
    80001400:	00001097          	auipc	ra,0x1
    80001404:	9c8080e7          	jalr	-1592(ra) # 80001dc8 <consoleinit>
    80001408:	00001097          	auipc	ra,0x1
    8000140c:	154080e7          	jalr	340(ra) # 8000255c <printfinit>
    80001410:	00003517          	auipc	a0,0x3
    80001414:	d2050513          	addi	a0,a0,-736 # 80004130 <CONSOLE_STATUS+0x120>
    80001418:	00001097          	auipc	ra,0x1
    8000141c:	ab0080e7          	jalr	-1360(ra) # 80001ec8 <__printf>
    80001420:	00003517          	auipc	a0,0x3
    80001424:	c0050513          	addi	a0,a0,-1024 # 80004020 <CONSOLE_STATUS+0x10>
    80001428:	00001097          	auipc	ra,0x1
    8000142c:	aa0080e7          	jalr	-1376(ra) # 80001ec8 <__printf>
    80001430:	00003517          	auipc	a0,0x3
    80001434:	d0050513          	addi	a0,a0,-768 # 80004130 <CONSOLE_STATUS+0x120>
    80001438:	00001097          	auipc	ra,0x1
    8000143c:	a90080e7          	jalr	-1392(ra) # 80001ec8 <__printf>
    80001440:	00001097          	auipc	ra,0x1
    80001444:	4a8080e7          	jalr	1192(ra) # 800028e8 <kinit>
    80001448:	00000097          	auipc	ra,0x0
    8000144c:	148080e7          	jalr	328(ra) # 80001590 <trapinit>
    80001450:	00000097          	auipc	ra,0x0
    80001454:	16c080e7          	jalr	364(ra) # 800015bc <trapinithart>
    80001458:	00000097          	auipc	ra,0x0
    8000145c:	5b8080e7          	jalr	1464(ra) # 80001a10 <plicinit>
    80001460:	00000097          	auipc	ra,0x0
    80001464:	5d8080e7          	jalr	1496(ra) # 80001a38 <plicinithart>
    80001468:	00000097          	auipc	ra,0x0
    8000146c:	078080e7          	jalr	120(ra) # 800014e0 <userinit>
    80001470:	0ff0000f          	fence
    80001474:	00100793          	li	a5,1
    80001478:	00003517          	auipc	a0,0x3
    8000147c:	bc050513          	addi	a0,a0,-1088 # 80004038 <CONSOLE_STATUS+0x28>
    80001480:	00f4a023          	sw	a5,0(s1)
    80001484:	00001097          	auipc	ra,0x1
    80001488:	a44080e7          	jalr	-1468(ra) # 80001ec8 <__printf>
    8000148c:	0000006f          	j	8000148c <system_main+0xd4>

0000000080001490 <cpuid>:
    80001490:	ff010113          	addi	sp,sp,-16
    80001494:	00813423          	sd	s0,8(sp)
    80001498:	01010413          	addi	s0,sp,16
    8000149c:	00020513          	mv	a0,tp
    800014a0:	00813403          	ld	s0,8(sp)
    800014a4:	0005051b          	sext.w	a0,a0
    800014a8:	01010113          	addi	sp,sp,16
    800014ac:	00008067          	ret

00000000800014b0 <mycpu>:
    800014b0:	ff010113          	addi	sp,sp,-16
    800014b4:	00813423          	sd	s0,8(sp)
    800014b8:	01010413          	addi	s0,sp,16
    800014bc:	00020793          	mv	a5,tp
    800014c0:	00813403          	ld	s0,8(sp)
    800014c4:	0007879b          	sext.w	a5,a5
    800014c8:	00779793          	slli	a5,a5,0x7
    800014cc:	00004517          	auipc	a0,0x4
    800014d0:	ef450513          	addi	a0,a0,-268 # 800053c0 <cpus>
    800014d4:	00f50533          	add	a0,a0,a5
    800014d8:	01010113          	addi	sp,sp,16
    800014dc:	00008067          	ret

00000000800014e0 <userinit>:
    800014e0:	ff010113          	addi	sp,sp,-16
    800014e4:	00813423          	sd	s0,8(sp)
    800014e8:	01010413          	addi	s0,sp,16
    800014ec:	00813403          	ld	s0,8(sp)
    800014f0:	01010113          	addi	sp,sp,16
    800014f4:	00000317          	auipc	t1,0x0
    800014f8:	b0c30067          	jr	-1268(t1) # 80001000 <main>

00000000800014fc <either_copyout>:
    800014fc:	ff010113          	addi	sp,sp,-16
    80001500:	00813023          	sd	s0,0(sp)
    80001504:	00113423          	sd	ra,8(sp)
    80001508:	01010413          	addi	s0,sp,16
    8000150c:	02051663          	bnez	a0,80001538 <either_copyout+0x3c>
    80001510:	00058513          	mv	a0,a1
    80001514:	00060593          	mv	a1,a2
    80001518:	0006861b          	sext.w	a2,a3
    8000151c:	00002097          	auipc	ra,0x2
    80001520:	c58080e7          	jalr	-936(ra) # 80003174 <__memmove>
    80001524:	00813083          	ld	ra,8(sp)
    80001528:	00013403          	ld	s0,0(sp)
    8000152c:	00000513          	li	a0,0
    80001530:	01010113          	addi	sp,sp,16
    80001534:	00008067          	ret
    80001538:	00003517          	auipc	a0,0x3
    8000153c:	b4050513          	addi	a0,a0,-1216 # 80004078 <CONSOLE_STATUS+0x68>
    80001540:	00001097          	auipc	ra,0x1
    80001544:	92c080e7          	jalr	-1748(ra) # 80001e6c <panic>

0000000080001548 <either_copyin>:
    80001548:	ff010113          	addi	sp,sp,-16
    8000154c:	00813023          	sd	s0,0(sp)
    80001550:	00113423          	sd	ra,8(sp)
    80001554:	01010413          	addi	s0,sp,16
    80001558:	02059463          	bnez	a1,80001580 <either_copyin+0x38>
    8000155c:	00060593          	mv	a1,a2
    80001560:	0006861b          	sext.w	a2,a3
    80001564:	00002097          	auipc	ra,0x2
    80001568:	c10080e7          	jalr	-1008(ra) # 80003174 <__memmove>
    8000156c:	00813083          	ld	ra,8(sp)
    80001570:	00013403          	ld	s0,0(sp)
    80001574:	00000513          	li	a0,0
    80001578:	01010113          	addi	sp,sp,16
    8000157c:	00008067          	ret
    80001580:	00003517          	auipc	a0,0x3
    80001584:	b2050513          	addi	a0,a0,-1248 # 800040a0 <CONSOLE_STATUS+0x90>
    80001588:	00001097          	auipc	ra,0x1
    8000158c:	8e4080e7          	jalr	-1820(ra) # 80001e6c <panic>

0000000080001590 <trapinit>:
    80001590:	ff010113          	addi	sp,sp,-16
    80001594:	00813423          	sd	s0,8(sp)
    80001598:	01010413          	addi	s0,sp,16
    8000159c:	00813403          	ld	s0,8(sp)
    800015a0:	00003597          	auipc	a1,0x3
    800015a4:	b2858593          	addi	a1,a1,-1240 # 800040c8 <CONSOLE_STATUS+0xb8>
    800015a8:	00004517          	auipc	a0,0x4
    800015ac:	e9850513          	addi	a0,a0,-360 # 80005440 <tickslock>
    800015b0:	01010113          	addi	sp,sp,16
    800015b4:	00001317          	auipc	t1,0x1
    800015b8:	5c430067          	jr	1476(t1) # 80002b78 <initlock>

00000000800015bc <trapinithart>:
    800015bc:	ff010113          	addi	sp,sp,-16
    800015c0:	00813423          	sd	s0,8(sp)
    800015c4:	01010413          	addi	s0,sp,16
    800015c8:	00000797          	auipc	a5,0x0
    800015cc:	2f878793          	addi	a5,a5,760 # 800018c0 <kernelvec>
    800015d0:	10579073          	csrw	stvec,a5
    800015d4:	00813403          	ld	s0,8(sp)
    800015d8:	01010113          	addi	sp,sp,16
    800015dc:	00008067          	ret

00000000800015e0 <usertrap>:
    800015e0:	ff010113          	addi	sp,sp,-16
    800015e4:	00813423          	sd	s0,8(sp)
    800015e8:	01010413          	addi	s0,sp,16
    800015ec:	00813403          	ld	s0,8(sp)
    800015f0:	01010113          	addi	sp,sp,16
    800015f4:	00008067          	ret

00000000800015f8 <usertrapret>:
    800015f8:	ff010113          	addi	sp,sp,-16
    800015fc:	00813423          	sd	s0,8(sp)
    80001600:	01010413          	addi	s0,sp,16
    80001604:	00813403          	ld	s0,8(sp)
    80001608:	01010113          	addi	sp,sp,16
    8000160c:	00008067          	ret

0000000080001610 <kerneltrap>:
    80001610:	fe010113          	addi	sp,sp,-32
    80001614:	00813823          	sd	s0,16(sp)
    80001618:	00113c23          	sd	ra,24(sp)
    8000161c:	00913423          	sd	s1,8(sp)
    80001620:	02010413          	addi	s0,sp,32
    80001624:	142025f3          	csrr	a1,scause
    80001628:	100027f3          	csrr	a5,sstatus
    8000162c:	0027f793          	andi	a5,a5,2
    80001630:	10079c63          	bnez	a5,80001748 <kerneltrap+0x138>
    80001634:	142027f3          	csrr	a5,scause
    80001638:	0207ce63          	bltz	a5,80001674 <kerneltrap+0x64>
    8000163c:	00003517          	auipc	a0,0x3
    80001640:	ad450513          	addi	a0,a0,-1324 # 80004110 <CONSOLE_STATUS+0x100>
    80001644:	00001097          	auipc	ra,0x1
    80001648:	884080e7          	jalr	-1916(ra) # 80001ec8 <__printf>
    8000164c:	141025f3          	csrr	a1,sepc
    80001650:	14302673          	csrr	a2,stval
    80001654:	00003517          	auipc	a0,0x3
    80001658:	acc50513          	addi	a0,a0,-1332 # 80004120 <CONSOLE_STATUS+0x110>
    8000165c:	00001097          	auipc	ra,0x1
    80001660:	86c080e7          	jalr	-1940(ra) # 80001ec8 <__printf>
    80001664:	00003517          	auipc	a0,0x3
    80001668:	ad450513          	addi	a0,a0,-1324 # 80004138 <CONSOLE_STATUS+0x128>
    8000166c:	00001097          	auipc	ra,0x1
    80001670:	800080e7          	jalr	-2048(ra) # 80001e6c <panic>
    80001674:	0ff7f713          	andi	a4,a5,255
    80001678:	00900693          	li	a3,9
    8000167c:	04d70063          	beq	a4,a3,800016bc <kerneltrap+0xac>
    80001680:	fff00713          	li	a4,-1
    80001684:	03f71713          	slli	a4,a4,0x3f
    80001688:	00170713          	addi	a4,a4,1
    8000168c:	fae798e3          	bne	a5,a4,8000163c <kerneltrap+0x2c>
    80001690:	00000097          	auipc	ra,0x0
    80001694:	e00080e7          	jalr	-512(ra) # 80001490 <cpuid>
    80001698:	06050663          	beqz	a0,80001704 <kerneltrap+0xf4>
    8000169c:	144027f3          	csrr	a5,sip
    800016a0:	ffd7f793          	andi	a5,a5,-3
    800016a4:	14479073          	csrw	sip,a5
    800016a8:	01813083          	ld	ra,24(sp)
    800016ac:	01013403          	ld	s0,16(sp)
    800016b0:	00813483          	ld	s1,8(sp)
    800016b4:	02010113          	addi	sp,sp,32
    800016b8:	00008067          	ret
    800016bc:	00000097          	auipc	ra,0x0
    800016c0:	3c8080e7          	jalr	968(ra) # 80001a84 <plic_claim>
    800016c4:	00a00793          	li	a5,10
    800016c8:	00050493          	mv	s1,a0
    800016cc:	06f50863          	beq	a0,a5,8000173c <kerneltrap+0x12c>
    800016d0:	fc050ce3          	beqz	a0,800016a8 <kerneltrap+0x98>
    800016d4:	00050593          	mv	a1,a0
    800016d8:	00003517          	auipc	a0,0x3
    800016dc:	a1850513          	addi	a0,a0,-1512 # 800040f0 <CONSOLE_STATUS+0xe0>
    800016e0:	00000097          	auipc	ra,0x0
    800016e4:	7e8080e7          	jalr	2024(ra) # 80001ec8 <__printf>
    800016e8:	01013403          	ld	s0,16(sp)
    800016ec:	01813083          	ld	ra,24(sp)
    800016f0:	00048513          	mv	a0,s1
    800016f4:	00813483          	ld	s1,8(sp)
    800016f8:	02010113          	addi	sp,sp,32
    800016fc:	00000317          	auipc	t1,0x0
    80001700:	3c030067          	jr	960(t1) # 80001abc <plic_complete>
    80001704:	00004517          	auipc	a0,0x4
    80001708:	d3c50513          	addi	a0,a0,-708 # 80005440 <tickslock>
    8000170c:	00001097          	auipc	ra,0x1
    80001710:	490080e7          	jalr	1168(ra) # 80002b9c <acquire>
    80001714:	00003717          	auipc	a4,0x3
    80001718:	c3070713          	addi	a4,a4,-976 # 80004344 <ticks>
    8000171c:	00072783          	lw	a5,0(a4)
    80001720:	00004517          	auipc	a0,0x4
    80001724:	d2050513          	addi	a0,a0,-736 # 80005440 <tickslock>
    80001728:	0017879b          	addiw	a5,a5,1
    8000172c:	00f72023          	sw	a5,0(a4)
    80001730:	00001097          	auipc	ra,0x1
    80001734:	538080e7          	jalr	1336(ra) # 80002c68 <release>
    80001738:	f65ff06f          	j	8000169c <kerneltrap+0x8c>
    8000173c:	00001097          	auipc	ra,0x1
    80001740:	094080e7          	jalr	148(ra) # 800027d0 <uartintr>
    80001744:	fa5ff06f          	j	800016e8 <kerneltrap+0xd8>
    80001748:	00003517          	auipc	a0,0x3
    8000174c:	98850513          	addi	a0,a0,-1656 # 800040d0 <CONSOLE_STATUS+0xc0>
    80001750:	00000097          	auipc	ra,0x0
    80001754:	71c080e7          	jalr	1820(ra) # 80001e6c <panic>

0000000080001758 <clockintr>:
    80001758:	fe010113          	addi	sp,sp,-32
    8000175c:	00813823          	sd	s0,16(sp)
    80001760:	00913423          	sd	s1,8(sp)
    80001764:	00113c23          	sd	ra,24(sp)
    80001768:	02010413          	addi	s0,sp,32
    8000176c:	00004497          	auipc	s1,0x4
    80001770:	cd448493          	addi	s1,s1,-812 # 80005440 <tickslock>
    80001774:	00048513          	mv	a0,s1
    80001778:	00001097          	auipc	ra,0x1
    8000177c:	424080e7          	jalr	1060(ra) # 80002b9c <acquire>
    80001780:	00003717          	auipc	a4,0x3
    80001784:	bc470713          	addi	a4,a4,-1084 # 80004344 <ticks>
    80001788:	00072783          	lw	a5,0(a4)
    8000178c:	01013403          	ld	s0,16(sp)
    80001790:	01813083          	ld	ra,24(sp)
    80001794:	00048513          	mv	a0,s1
    80001798:	0017879b          	addiw	a5,a5,1
    8000179c:	00813483          	ld	s1,8(sp)
    800017a0:	00f72023          	sw	a5,0(a4)
    800017a4:	02010113          	addi	sp,sp,32
    800017a8:	00001317          	auipc	t1,0x1
    800017ac:	4c030067          	jr	1216(t1) # 80002c68 <release>

00000000800017b0 <devintr>:
    800017b0:	142027f3          	csrr	a5,scause
    800017b4:	00000513          	li	a0,0
    800017b8:	0007c463          	bltz	a5,800017c0 <devintr+0x10>
    800017bc:	00008067          	ret
    800017c0:	fe010113          	addi	sp,sp,-32
    800017c4:	00813823          	sd	s0,16(sp)
    800017c8:	00113c23          	sd	ra,24(sp)
    800017cc:	00913423          	sd	s1,8(sp)
    800017d0:	02010413          	addi	s0,sp,32
    800017d4:	0ff7f713          	andi	a4,a5,255
    800017d8:	00900693          	li	a3,9
    800017dc:	04d70c63          	beq	a4,a3,80001834 <devintr+0x84>
    800017e0:	fff00713          	li	a4,-1
    800017e4:	03f71713          	slli	a4,a4,0x3f
    800017e8:	00170713          	addi	a4,a4,1
    800017ec:	00e78c63          	beq	a5,a4,80001804 <devintr+0x54>
    800017f0:	01813083          	ld	ra,24(sp)
    800017f4:	01013403          	ld	s0,16(sp)
    800017f8:	00813483          	ld	s1,8(sp)
    800017fc:	02010113          	addi	sp,sp,32
    80001800:	00008067          	ret
    80001804:	00000097          	auipc	ra,0x0
    80001808:	c8c080e7          	jalr	-884(ra) # 80001490 <cpuid>
    8000180c:	06050663          	beqz	a0,80001878 <devintr+0xc8>
    80001810:	144027f3          	csrr	a5,sip
    80001814:	ffd7f793          	andi	a5,a5,-3
    80001818:	14479073          	csrw	sip,a5
    8000181c:	01813083          	ld	ra,24(sp)
    80001820:	01013403          	ld	s0,16(sp)
    80001824:	00813483          	ld	s1,8(sp)
    80001828:	00200513          	li	a0,2
    8000182c:	02010113          	addi	sp,sp,32
    80001830:	00008067          	ret
    80001834:	00000097          	auipc	ra,0x0
    80001838:	250080e7          	jalr	592(ra) # 80001a84 <plic_claim>
    8000183c:	00a00793          	li	a5,10
    80001840:	00050493          	mv	s1,a0
    80001844:	06f50663          	beq	a0,a5,800018b0 <devintr+0x100>
    80001848:	00100513          	li	a0,1
    8000184c:	fa0482e3          	beqz	s1,800017f0 <devintr+0x40>
    80001850:	00048593          	mv	a1,s1
    80001854:	00003517          	auipc	a0,0x3
    80001858:	89c50513          	addi	a0,a0,-1892 # 800040f0 <CONSOLE_STATUS+0xe0>
    8000185c:	00000097          	auipc	ra,0x0
    80001860:	66c080e7          	jalr	1644(ra) # 80001ec8 <__printf>
    80001864:	00048513          	mv	a0,s1
    80001868:	00000097          	auipc	ra,0x0
    8000186c:	254080e7          	jalr	596(ra) # 80001abc <plic_complete>
    80001870:	00100513          	li	a0,1
    80001874:	f7dff06f          	j	800017f0 <devintr+0x40>
    80001878:	00004517          	auipc	a0,0x4
    8000187c:	bc850513          	addi	a0,a0,-1080 # 80005440 <tickslock>
    80001880:	00001097          	auipc	ra,0x1
    80001884:	31c080e7          	jalr	796(ra) # 80002b9c <acquire>
    80001888:	00003717          	auipc	a4,0x3
    8000188c:	abc70713          	addi	a4,a4,-1348 # 80004344 <ticks>
    80001890:	00072783          	lw	a5,0(a4)
    80001894:	00004517          	auipc	a0,0x4
    80001898:	bac50513          	addi	a0,a0,-1108 # 80005440 <tickslock>
    8000189c:	0017879b          	addiw	a5,a5,1
    800018a0:	00f72023          	sw	a5,0(a4)
    800018a4:	00001097          	auipc	ra,0x1
    800018a8:	3c4080e7          	jalr	964(ra) # 80002c68 <release>
    800018ac:	f65ff06f          	j	80001810 <devintr+0x60>
    800018b0:	00001097          	auipc	ra,0x1
    800018b4:	f20080e7          	jalr	-224(ra) # 800027d0 <uartintr>
    800018b8:	fadff06f          	j	80001864 <devintr+0xb4>
    800018bc:	0000                	unimp
	...

00000000800018c0 <kernelvec>:
    800018c0:	f0010113          	addi	sp,sp,-256
    800018c4:	00113023          	sd	ra,0(sp)
    800018c8:	00213423          	sd	sp,8(sp)
    800018cc:	00313823          	sd	gp,16(sp)
    800018d0:	00413c23          	sd	tp,24(sp)
    800018d4:	02513023          	sd	t0,32(sp)
    800018d8:	02613423          	sd	t1,40(sp)
    800018dc:	02713823          	sd	t2,48(sp)
    800018e0:	02813c23          	sd	s0,56(sp)
    800018e4:	04913023          	sd	s1,64(sp)
    800018e8:	04a13423          	sd	a0,72(sp)
    800018ec:	04b13823          	sd	a1,80(sp)
    800018f0:	04c13c23          	sd	a2,88(sp)
    800018f4:	06d13023          	sd	a3,96(sp)
    800018f8:	06e13423          	sd	a4,104(sp)
    800018fc:	06f13823          	sd	a5,112(sp)
    80001900:	07013c23          	sd	a6,120(sp)
    80001904:	09113023          	sd	a7,128(sp)
    80001908:	09213423          	sd	s2,136(sp)
    8000190c:	09313823          	sd	s3,144(sp)
    80001910:	09413c23          	sd	s4,152(sp)
    80001914:	0b513023          	sd	s5,160(sp)
    80001918:	0b613423          	sd	s6,168(sp)
    8000191c:	0b713823          	sd	s7,176(sp)
    80001920:	0b813c23          	sd	s8,184(sp)
    80001924:	0d913023          	sd	s9,192(sp)
    80001928:	0da13423          	sd	s10,200(sp)
    8000192c:	0db13823          	sd	s11,208(sp)
    80001930:	0dc13c23          	sd	t3,216(sp)
    80001934:	0fd13023          	sd	t4,224(sp)
    80001938:	0fe13423          	sd	t5,232(sp)
    8000193c:	0ff13823          	sd	t6,240(sp)
    80001940:	cd1ff0ef          	jal	ra,80001610 <kerneltrap>
    80001944:	00013083          	ld	ra,0(sp)
    80001948:	00813103          	ld	sp,8(sp)
    8000194c:	01013183          	ld	gp,16(sp)
    80001950:	02013283          	ld	t0,32(sp)
    80001954:	02813303          	ld	t1,40(sp)
    80001958:	03013383          	ld	t2,48(sp)
    8000195c:	03813403          	ld	s0,56(sp)
    80001960:	04013483          	ld	s1,64(sp)
    80001964:	04813503          	ld	a0,72(sp)
    80001968:	05013583          	ld	a1,80(sp)
    8000196c:	05813603          	ld	a2,88(sp)
    80001970:	06013683          	ld	a3,96(sp)
    80001974:	06813703          	ld	a4,104(sp)
    80001978:	07013783          	ld	a5,112(sp)
    8000197c:	07813803          	ld	a6,120(sp)
    80001980:	08013883          	ld	a7,128(sp)
    80001984:	08813903          	ld	s2,136(sp)
    80001988:	09013983          	ld	s3,144(sp)
    8000198c:	09813a03          	ld	s4,152(sp)
    80001990:	0a013a83          	ld	s5,160(sp)
    80001994:	0a813b03          	ld	s6,168(sp)
    80001998:	0b013b83          	ld	s7,176(sp)
    8000199c:	0b813c03          	ld	s8,184(sp)
    800019a0:	0c013c83          	ld	s9,192(sp)
    800019a4:	0c813d03          	ld	s10,200(sp)
    800019a8:	0d013d83          	ld	s11,208(sp)
    800019ac:	0d813e03          	ld	t3,216(sp)
    800019b0:	0e013e83          	ld	t4,224(sp)
    800019b4:	0e813f03          	ld	t5,232(sp)
    800019b8:	0f013f83          	ld	t6,240(sp)
    800019bc:	10010113          	addi	sp,sp,256
    800019c0:	10200073          	sret
    800019c4:	00000013          	nop
    800019c8:	00000013          	nop
    800019cc:	00000013          	nop

00000000800019d0 <timervec>:
    800019d0:	34051573          	csrrw	a0,mscratch,a0
    800019d4:	00b53023          	sd	a1,0(a0)
    800019d8:	00c53423          	sd	a2,8(a0)
    800019dc:	00d53823          	sd	a3,16(a0)
    800019e0:	01853583          	ld	a1,24(a0)
    800019e4:	02053603          	ld	a2,32(a0)
    800019e8:	0005b683          	ld	a3,0(a1)
    800019ec:	00c686b3          	add	a3,a3,a2
    800019f0:	00d5b023          	sd	a3,0(a1)
    800019f4:	00200593          	li	a1,2
    800019f8:	14459073          	csrw	sip,a1
    800019fc:	01053683          	ld	a3,16(a0)
    80001a00:	00853603          	ld	a2,8(a0)
    80001a04:	00053583          	ld	a1,0(a0)
    80001a08:	34051573          	csrrw	a0,mscratch,a0
    80001a0c:	30200073          	mret

0000000080001a10 <plicinit>:
    80001a10:	ff010113          	addi	sp,sp,-16
    80001a14:	00813423          	sd	s0,8(sp)
    80001a18:	01010413          	addi	s0,sp,16
    80001a1c:	00813403          	ld	s0,8(sp)
    80001a20:	0c0007b7          	lui	a5,0xc000
    80001a24:	00100713          	li	a4,1
    80001a28:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80001a2c:	00e7a223          	sw	a4,4(a5)
    80001a30:	01010113          	addi	sp,sp,16
    80001a34:	00008067          	ret

0000000080001a38 <plicinithart>:
    80001a38:	ff010113          	addi	sp,sp,-16
    80001a3c:	00813023          	sd	s0,0(sp)
    80001a40:	00113423          	sd	ra,8(sp)
    80001a44:	01010413          	addi	s0,sp,16
    80001a48:	00000097          	auipc	ra,0x0
    80001a4c:	a48080e7          	jalr	-1464(ra) # 80001490 <cpuid>
    80001a50:	0085171b          	slliw	a4,a0,0x8
    80001a54:	0c0027b7          	lui	a5,0xc002
    80001a58:	00e787b3          	add	a5,a5,a4
    80001a5c:	40200713          	li	a4,1026
    80001a60:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80001a64:	00813083          	ld	ra,8(sp)
    80001a68:	00013403          	ld	s0,0(sp)
    80001a6c:	00d5151b          	slliw	a0,a0,0xd
    80001a70:	0c2017b7          	lui	a5,0xc201
    80001a74:	00a78533          	add	a0,a5,a0
    80001a78:	00052023          	sw	zero,0(a0)
    80001a7c:	01010113          	addi	sp,sp,16
    80001a80:	00008067          	ret

0000000080001a84 <plic_claim>:
    80001a84:	ff010113          	addi	sp,sp,-16
    80001a88:	00813023          	sd	s0,0(sp)
    80001a8c:	00113423          	sd	ra,8(sp)
    80001a90:	01010413          	addi	s0,sp,16
    80001a94:	00000097          	auipc	ra,0x0
    80001a98:	9fc080e7          	jalr	-1540(ra) # 80001490 <cpuid>
    80001a9c:	00813083          	ld	ra,8(sp)
    80001aa0:	00013403          	ld	s0,0(sp)
    80001aa4:	00d5151b          	slliw	a0,a0,0xd
    80001aa8:	0c2017b7          	lui	a5,0xc201
    80001aac:	00a78533          	add	a0,a5,a0
    80001ab0:	00452503          	lw	a0,4(a0)
    80001ab4:	01010113          	addi	sp,sp,16
    80001ab8:	00008067          	ret

0000000080001abc <plic_complete>:
    80001abc:	fe010113          	addi	sp,sp,-32
    80001ac0:	00813823          	sd	s0,16(sp)
    80001ac4:	00913423          	sd	s1,8(sp)
    80001ac8:	00113c23          	sd	ra,24(sp)
    80001acc:	02010413          	addi	s0,sp,32
    80001ad0:	00050493          	mv	s1,a0
    80001ad4:	00000097          	auipc	ra,0x0
    80001ad8:	9bc080e7          	jalr	-1604(ra) # 80001490 <cpuid>
    80001adc:	01813083          	ld	ra,24(sp)
    80001ae0:	01013403          	ld	s0,16(sp)
    80001ae4:	00d5179b          	slliw	a5,a0,0xd
    80001ae8:	0c201737          	lui	a4,0xc201
    80001aec:	00f707b3          	add	a5,a4,a5
    80001af0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80001af4:	00813483          	ld	s1,8(sp)
    80001af8:	02010113          	addi	sp,sp,32
    80001afc:	00008067          	ret

0000000080001b00 <consolewrite>:
    80001b00:	fb010113          	addi	sp,sp,-80
    80001b04:	04813023          	sd	s0,64(sp)
    80001b08:	04113423          	sd	ra,72(sp)
    80001b0c:	02913c23          	sd	s1,56(sp)
    80001b10:	03213823          	sd	s2,48(sp)
    80001b14:	03313423          	sd	s3,40(sp)
    80001b18:	03413023          	sd	s4,32(sp)
    80001b1c:	01513c23          	sd	s5,24(sp)
    80001b20:	05010413          	addi	s0,sp,80
    80001b24:	06c05c63          	blez	a2,80001b9c <consolewrite+0x9c>
    80001b28:	00060993          	mv	s3,a2
    80001b2c:	00050a13          	mv	s4,a0
    80001b30:	00058493          	mv	s1,a1
    80001b34:	00000913          	li	s2,0
    80001b38:	fff00a93          	li	s5,-1
    80001b3c:	01c0006f          	j	80001b58 <consolewrite+0x58>
    80001b40:	fbf44503          	lbu	a0,-65(s0)
    80001b44:	0019091b          	addiw	s2,s2,1
    80001b48:	00148493          	addi	s1,s1,1
    80001b4c:	00001097          	auipc	ra,0x1
    80001b50:	a9c080e7          	jalr	-1380(ra) # 800025e8 <uartputc>
    80001b54:	03298063          	beq	s3,s2,80001b74 <consolewrite+0x74>
    80001b58:	00048613          	mv	a2,s1
    80001b5c:	00100693          	li	a3,1
    80001b60:	000a0593          	mv	a1,s4
    80001b64:	fbf40513          	addi	a0,s0,-65
    80001b68:	00000097          	auipc	ra,0x0
    80001b6c:	9e0080e7          	jalr	-1568(ra) # 80001548 <either_copyin>
    80001b70:	fd5518e3          	bne	a0,s5,80001b40 <consolewrite+0x40>
    80001b74:	04813083          	ld	ra,72(sp)
    80001b78:	04013403          	ld	s0,64(sp)
    80001b7c:	03813483          	ld	s1,56(sp)
    80001b80:	02813983          	ld	s3,40(sp)
    80001b84:	02013a03          	ld	s4,32(sp)
    80001b88:	01813a83          	ld	s5,24(sp)
    80001b8c:	00090513          	mv	a0,s2
    80001b90:	03013903          	ld	s2,48(sp)
    80001b94:	05010113          	addi	sp,sp,80
    80001b98:	00008067          	ret
    80001b9c:	00000913          	li	s2,0
    80001ba0:	fd5ff06f          	j	80001b74 <consolewrite+0x74>

0000000080001ba4 <consoleread>:
    80001ba4:	f9010113          	addi	sp,sp,-112
    80001ba8:	06813023          	sd	s0,96(sp)
    80001bac:	04913c23          	sd	s1,88(sp)
    80001bb0:	05213823          	sd	s2,80(sp)
    80001bb4:	05313423          	sd	s3,72(sp)
    80001bb8:	05413023          	sd	s4,64(sp)
    80001bbc:	03513c23          	sd	s5,56(sp)
    80001bc0:	03613823          	sd	s6,48(sp)
    80001bc4:	03713423          	sd	s7,40(sp)
    80001bc8:	03813023          	sd	s8,32(sp)
    80001bcc:	06113423          	sd	ra,104(sp)
    80001bd0:	01913c23          	sd	s9,24(sp)
    80001bd4:	07010413          	addi	s0,sp,112
    80001bd8:	00060b93          	mv	s7,a2
    80001bdc:	00050913          	mv	s2,a0
    80001be0:	00058c13          	mv	s8,a1
    80001be4:	00060b1b          	sext.w	s6,a2
    80001be8:	00004497          	auipc	s1,0x4
    80001bec:	87048493          	addi	s1,s1,-1936 # 80005458 <cons>
    80001bf0:	00400993          	li	s3,4
    80001bf4:	fff00a13          	li	s4,-1
    80001bf8:	00a00a93          	li	s5,10
    80001bfc:	05705e63          	blez	s7,80001c58 <consoleread+0xb4>
    80001c00:	09c4a703          	lw	a4,156(s1)
    80001c04:	0984a783          	lw	a5,152(s1)
    80001c08:	0007071b          	sext.w	a4,a4
    80001c0c:	08e78463          	beq	a5,a4,80001c94 <consoleread+0xf0>
    80001c10:	07f7f713          	andi	a4,a5,127
    80001c14:	00e48733          	add	a4,s1,a4
    80001c18:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80001c1c:	0017869b          	addiw	a3,a5,1
    80001c20:	08d4ac23          	sw	a3,152(s1)
    80001c24:	00070c9b          	sext.w	s9,a4
    80001c28:	0b370663          	beq	a4,s3,80001cd4 <consoleread+0x130>
    80001c2c:	00100693          	li	a3,1
    80001c30:	f9f40613          	addi	a2,s0,-97
    80001c34:	000c0593          	mv	a1,s8
    80001c38:	00090513          	mv	a0,s2
    80001c3c:	f8e40fa3          	sb	a4,-97(s0)
    80001c40:	00000097          	auipc	ra,0x0
    80001c44:	8bc080e7          	jalr	-1860(ra) # 800014fc <either_copyout>
    80001c48:	01450863          	beq	a0,s4,80001c58 <consoleread+0xb4>
    80001c4c:	001c0c13          	addi	s8,s8,1
    80001c50:	fffb8b9b          	addiw	s7,s7,-1
    80001c54:	fb5c94e3          	bne	s9,s5,80001bfc <consoleread+0x58>
    80001c58:	000b851b          	sext.w	a0,s7
    80001c5c:	06813083          	ld	ra,104(sp)
    80001c60:	06013403          	ld	s0,96(sp)
    80001c64:	05813483          	ld	s1,88(sp)
    80001c68:	05013903          	ld	s2,80(sp)
    80001c6c:	04813983          	ld	s3,72(sp)
    80001c70:	04013a03          	ld	s4,64(sp)
    80001c74:	03813a83          	ld	s5,56(sp)
    80001c78:	02813b83          	ld	s7,40(sp)
    80001c7c:	02013c03          	ld	s8,32(sp)
    80001c80:	01813c83          	ld	s9,24(sp)
    80001c84:	40ab053b          	subw	a0,s6,a0
    80001c88:	03013b03          	ld	s6,48(sp)
    80001c8c:	07010113          	addi	sp,sp,112
    80001c90:	00008067          	ret
    80001c94:	00001097          	auipc	ra,0x1
    80001c98:	1d8080e7          	jalr	472(ra) # 80002e6c <push_on>
    80001c9c:	0984a703          	lw	a4,152(s1)
    80001ca0:	09c4a783          	lw	a5,156(s1)
    80001ca4:	0007879b          	sext.w	a5,a5
    80001ca8:	fef70ce3          	beq	a4,a5,80001ca0 <consoleread+0xfc>
    80001cac:	00001097          	auipc	ra,0x1
    80001cb0:	234080e7          	jalr	564(ra) # 80002ee0 <pop_on>
    80001cb4:	0984a783          	lw	a5,152(s1)
    80001cb8:	07f7f713          	andi	a4,a5,127
    80001cbc:	00e48733          	add	a4,s1,a4
    80001cc0:	01874703          	lbu	a4,24(a4)
    80001cc4:	0017869b          	addiw	a3,a5,1
    80001cc8:	08d4ac23          	sw	a3,152(s1)
    80001ccc:	00070c9b          	sext.w	s9,a4
    80001cd0:	f5371ee3          	bne	a4,s3,80001c2c <consoleread+0x88>
    80001cd4:	000b851b          	sext.w	a0,s7
    80001cd8:	f96bf2e3          	bgeu	s7,s6,80001c5c <consoleread+0xb8>
    80001cdc:	08f4ac23          	sw	a5,152(s1)
    80001ce0:	f7dff06f          	j	80001c5c <consoleread+0xb8>

0000000080001ce4 <consputc>:
    80001ce4:	10000793          	li	a5,256
    80001ce8:	00f50663          	beq	a0,a5,80001cf4 <consputc+0x10>
    80001cec:	00001317          	auipc	t1,0x1
    80001cf0:	9f430067          	jr	-1548(t1) # 800026e0 <uartputc_sync>
    80001cf4:	ff010113          	addi	sp,sp,-16
    80001cf8:	00113423          	sd	ra,8(sp)
    80001cfc:	00813023          	sd	s0,0(sp)
    80001d00:	01010413          	addi	s0,sp,16
    80001d04:	00800513          	li	a0,8
    80001d08:	00001097          	auipc	ra,0x1
    80001d0c:	9d8080e7          	jalr	-1576(ra) # 800026e0 <uartputc_sync>
    80001d10:	02000513          	li	a0,32
    80001d14:	00001097          	auipc	ra,0x1
    80001d18:	9cc080e7          	jalr	-1588(ra) # 800026e0 <uartputc_sync>
    80001d1c:	00013403          	ld	s0,0(sp)
    80001d20:	00813083          	ld	ra,8(sp)
    80001d24:	00800513          	li	a0,8
    80001d28:	01010113          	addi	sp,sp,16
    80001d2c:	00001317          	auipc	t1,0x1
    80001d30:	9b430067          	jr	-1612(t1) # 800026e0 <uartputc_sync>

0000000080001d34 <consoleintr>:
    80001d34:	fe010113          	addi	sp,sp,-32
    80001d38:	00813823          	sd	s0,16(sp)
    80001d3c:	00913423          	sd	s1,8(sp)
    80001d40:	01213023          	sd	s2,0(sp)
    80001d44:	00113c23          	sd	ra,24(sp)
    80001d48:	02010413          	addi	s0,sp,32
    80001d4c:	00003917          	auipc	s2,0x3
    80001d50:	70c90913          	addi	s2,s2,1804 # 80005458 <cons>
    80001d54:	00050493          	mv	s1,a0
    80001d58:	00090513          	mv	a0,s2
    80001d5c:	00001097          	auipc	ra,0x1
    80001d60:	e40080e7          	jalr	-448(ra) # 80002b9c <acquire>
    80001d64:	02048c63          	beqz	s1,80001d9c <consoleintr+0x68>
    80001d68:	0a092783          	lw	a5,160(s2)
    80001d6c:	09892703          	lw	a4,152(s2)
    80001d70:	07f00693          	li	a3,127
    80001d74:	40e7873b          	subw	a4,a5,a4
    80001d78:	02e6e263          	bltu	a3,a4,80001d9c <consoleintr+0x68>
    80001d7c:	00d00713          	li	a4,13
    80001d80:	04e48063          	beq	s1,a4,80001dc0 <consoleintr+0x8c>
    80001d84:	07f7f713          	andi	a4,a5,127
    80001d88:	00e90733          	add	a4,s2,a4
    80001d8c:	0017879b          	addiw	a5,a5,1
    80001d90:	0af92023          	sw	a5,160(s2)
    80001d94:	00970c23          	sb	s1,24(a4)
    80001d98:	08f92e23          	sw	a5,156(s2)
    80001d9c:	01013403          	ld	s0,16(sp)
    80001da0:	01813083          	ld	ra,24(sp)
    80001da4:	00813483          	ld	s1,8(sp)
    80001da8:	00013903          	ld	s2,0(sp)
    80001dac:	00003517          	auipc	a0,0x3
    80001db0:	6ac50513          	addi	a0,a0,1708 # 80005458 <cons>
    80001db4:	02010113          	addi	sp,sp,32
    80001db8:	00001317          	auipc	t1,0x1
    80001dbc:	eb030067          	jr	-336(t1) # 80002c68 <release>
    80001dc0:	00a00493          	li	s1,10
    80001dc4:	fc1ff06f          	j	80001d84 <consoleintr+0x50>

0000000080001dc8 <consoleinit>:
    80001dc8:	fe010113          	addi	sp,sp,-32
    80001dcc:	00113c23          	sd	ra,24(sp)
    80001dd0:	00813823          	sd	s0,16(sp)
    80001dd4:	00913423          	sd	s1,8(sp)
    80001dd8:	02010413          	addi	s0,sp,32
    80001ddc:	00003497          	auipc	s1,0x3
    80001de0:	67c48493          	addi	s1,s1,1660 # 80005458 <cons>
    80001de4:	00048513          	mv	a0,s1
    80001de8:	00002597          	auipc	a1,0x2
    80001dec:	36058593          	addi	a1,a1,864 # 80004148 <CONSOLE_STATUS+0x138>
    80001df0:	00001097          	auipc	ra,0x1
    80001df4:	d88080e7          	jalr	-632(ra) # 80002b78 <initlock>
    80001df8:	00000097          	auipc	ra,0x0
    80001dfc:	7ac080e7          	jalr	1964(ra) # 800025a4 <uartinit>
    80001e00:	01813083          	ld	ra,24(sp)
    80001e04:	01013403          	ld	s0,16(sp)
    80001e08:	00000797          	auipc	a5,0x0
    80001e0c:	d9c78793          	addi	a5,a5,-612 # 80001ba4 <consoleread>
    80001e10:	0af4bc23          	sd	a5,184(s1)
    80001e14:	00000797          	auipc	a5,0x0
    80001e18:	cec78793          	addi	a5,a5,-788 # 80001b00 <consolewrite>
    80001e1c:	0cf4b023          	sd	a5,192(s1)
    80001e20:	00813483          	ld	s1,8(sp)
    80001e24:	02010113          	addi	sp,sp,32
    80001e28:	00008067          	ret

0000000080001e2c <console_read>:
    80001e2c:	ff010113          	addi	sp,sp,-16
    80001e30:	00813423          	sd	s0,8(sp)
    80001e34:	01010413          	addi	s0,sp,16
    80001e38:	00813403          	ld	s0,8(sp)
    80001e3c:	00003317          	auipc	t1,0x3
    80001e40:	6d433303          	ld	t1,1748(t1) # 80005510 <devsw+0x10>
    80001e44:	01010113          	addi	sp,sp,16
    80001e48:	00030067          	jr	t1

0000000080001e4c <console_write>:
    80001e4c:	ff010113          	addi	sp,sp,-16
    80001e50:	00813423          	sd	s0,8(sp)
    80001e54:	01010413          	addi	s0,sp,16
    80001e58:	00813403          	ld	s0,8(sp)
    80001e5c:	00003317          	auipc	t1,0x3
    80001e60:	6bc33303          	ld	t1,1724(t1) # 80005518 <devsw+0x18>
    80001e64:	01010113          	addi	sp,sp,16
    80001e68:	00030067          	jr	t1

0000000080001e6c <panic>:
    80001e6c:	fe010113          	addi	sp,sp,-32
    80001e70:	00113c23          	sd	ra,24(sp)
    80001e74:	00813823          	sd	s0,16(sp)
    80001e78:	00913423          	sd	s1,8(sp)
    80001e7c:	02010413          	addi	s0,sp,32
    80001e80:	00050493          	mv	s1,a0
    80001e84:	00002517          	auipc	a0,0x2
    80001e88:	2cc50513          	addi	a0,a0,716 # 80004150 <CONSOLE_STATUS+0x140>
    80001e8c:	00003797          	auipc	a5,0x3
    80001e90:	7207a623          	sw	zero,1836(a5) # 800055b8 <pr+0x18>
    80001e94:	00000097          	auipc	ra,0x0
    80001e98:	034080e7          	jalr	52(ra) # 80001ec8 <__printf>
    80001e9c:	00048513          	mv	a0,s1
    80001ea0:	00000097          	auipc	ra,0x0
    80001ea4:	028080e7          	jalr	40(ra) # 80001ec8 <__printf>
    80001ea8:	00002517          	auipc	a0,0x2
    80001eac:	28850513          	addi	a0,a0,648 # 80004130 <CONSOLE_STATUS+0x120>
    80001eb0:	00000097          	auipc	ra,0x0
    80001eb4:	018080e7          	jalr	24(ra) # 80001ec8 <__printf>
    80001eb8:	00100793          	li	a5,1
    80001ebc:	00002717          	auipc	a4,0x2
    80001ec0:	48f72623          	sw	a5,1164(a4) # 80004348 <panicked>
    80001ec4:	0000006f          	j	80001ec4 <panic+0x58>

0000000080001ec8 <__printf>:
    80001ec8:	f3010113          	addi	sp,sp,-208
    80001ecc:	08813023          	sd	s0,128(sp)
    80001ed0:	07313423          	sd	s3,104(sp)
    80001ed4:	09010413          	addi	s0,sp,144
    80001ed8:	05813023          	sd	s8,64(sp)
    80001edc:	08113423          	sd	ra,136(sp)
    80001ee0:	06913c23          	sd	s1,120(sp)
    80001ee4:	07213823          	sd	s2,112(sp)
    80001ee8:	07413023          	sd	s4,96(sp)
    80001eec:	05513c23          	sd	s5,88(sp)
    80001ef0:	05613823          	sd	s6,80(sp)
    80001ef4:	05713423          	sd	s7,72(sp)
    80001ef8:	03913c23          	sd	s9,56(sp)
    80001efc:	03a13823          	sd	s10,48(sp)
    80001f00:	03b13423          	sd	s11,40(sp)
    80001f04:	00003317          	auipc	t1,0x3
    80001f08:	69c30313          	addi	t1,t1,1692 # 800055a0 <pr>
    80001f0c:	01832c03          	lw	s8,24(t1)
    80001f10:	00b43423          	sd	a1,8(s0)
    80001f14:	00c43823          	sd	a2,16(s0)
    80001f18:	00d43c23          	sd	a3,24(s0)
    80001f1c:	02e43023          	sd	a4,32(s0)
    80001f20:	02f43423          	sd	a5,40(s0)
    80001f24:	03043823          	sd	a6,48(s0)
    80001f28:	03143c23          	sd	a7,56(s0)
    80001f2c:	00050993          	mv	s3,a0
    80001f30:	4a0c1663          	bnez	s8,800023dc <__printf+0x514>
    80001f34:	60098c63          	beqz	s3,8000254c <__printf+0x684>
    80001f38:	0009c503          	lbu	a0,0(s3)
    80001f3c:	00840793          	addi	a5,s0,8
    80001f40:	f6f43c23          	sd	a5,-136(s0)
    80001f44:	00000493          	li	s1,0
    80001f48:	22050063          	beqz	a0,80002168 <__printf+0x2a0>
    80001f4c:	00002a37          	lui	s4,0x2
    80001f50:	00018ab7          	lui	s5,0x18
    80001f54:	000f4b37          	lui	s6,0xf4
    80001f58:	00989bb7          	lui	s7,0x989
    80001f5c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80001f60:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80001f64:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80001f68:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80001f6c:	00148c9b          	addiw	s9,s1,1
    80001f70:	02500793          	li	a5,37
    80001f74:	01998933          	add	s2,s3,s9
    80001f78:	38f51263          	bne	a0,a5,800022fc <__printf+0x434>
    80001f7c:	00094783          	lbu	a5,0(s2)
    80001f80:	00078c9b          	sext.w	s9,a5
    80001f84:	1e078263          	beqz	a5,80002168 <__printf+0x2a0>
    80001f88:	0024849b          	addiw	s1,s1,2
    80001f8c:	07000713          	li	a4,112
    80001f90:	00998933          	add	s2,s3,s1
    80001f94:	38e78a63          	beq	a5,a4,80002328 <__printf+0x460>
    80001f98:	20f76863          	bltu	a4,a5,800021a8 <__printf+0x2e0>
    80001f9c:	42a78863          	beq	a5,a0,800023cc <__printf+0x504>
    80001fa0:	06400713          	li	a4,100
    80001fa4:	40e79663          	bne	a5,a4,800023b0 <__printf+0x4e8>
    80001fa8:	f7843783          	ld	a5,-136(s0)
    80001fac:	0007a603          	lw	a2,0(a5)
    80001fb0:	00878793          	addi	a5,a5,8
    80001fb4:	f6f43c23          	sd	a5,-136(s0)
    80001fb8:	42064a63          	bltz	a2,800023ec <__printf+0x524>
    80001fbc:	00a00713          	li	a4,10
    80001fc0:	02e677bb          	remuw	a5,a2,a4
    80001fc4:	00002d97          	auipc	s11,0x2
    80001fc8:	1b4d8d93          	addi	s11,s11,436 # 80004178 <digits>
    80001fcc:	00900593          	li	a1,9
    80001fd0:	0006051b          	sext.w	a0,a2
    80001fd4:	00000c93          	li	s9,0
    80001fd8:	02079793          	slli	a5,a5,0x20
    80001fdc:	0207d793          	srli	a5,a5,0x20
    80001fe0:	00fd87b3          	add	a5,s11,a5
    80001fe4:	0007c783          	lbu	a5,0(a5)
    80001fe8:	02e656bb          	divuw	a3,a2,a4
    80001fec:	f8f40023          	sb	a5,-128(s0)
    80001ff0:	14c5d863          	bge	a1,a2,80002140 <__printf+0x278>
    80001ff4:	06300593          	li	a1,99
    80001ff8:	00100c93          	li	s9,1
    80001ffc:	02e6f7bb          	remuw	a5,a3,a4
    80002000:	02079793          	slli	a5,a5,0x20
    80002004:	0207d793          	srli	a5,a5,0x20
    80002008:	00fd87b3          	add	a5,s11,a5
    8000200c:	0007c783          	lbu	a5,0(a5)
    80002010:	02e6d73b          	divuw	a4,a3,a4
    80002014:	f8f400a3          	sb	a5,-127(s0)
    80002018:	12a5f463          	bgeu	a1,a0,80002140 <__printf+0x278>
    8000201c:	00a00693          	li	a3,10
    80002020:	00900593          	li	a1,9
    80002024:	02d777bb          	remuw	a5,a4,a3
    80002028:	02079793          	slli	a5,a5,0x20
    8000202c:	0207d793          	srli	a5,a5,0x20
    80002030:	00fd87b3          	add	a5,s11,a5
    80002034:	0007c503          	lbu	a0,0(a5)
    80002038:	02d757bb          	divuw	a5,a4,a3
    8000203c:	f8a40123          	sb	a0,-126(s0)
    80002040:	48e5f263          	bgeu	a1,a4,800024c4 <__printf+0x5fc>
    80002044:	06300513          	li	a0,99
    80002048:	02d7f5bb          	remuw	a1,a5,a3
    8000204c:	02059593          	slli	a1,a1,0x20
    80002050:	0205d593          	srli	a1,a1,0x20
    80002054:	00bd85b3          	add	a1,s11,a1
    80002058:	0005c583          	lbu	a1,0(a1)
    8000205c:	02d7d7bb          	divuw	a5,a5,a3
    80002060:	f8b401a3          	sb	a1,-125(s0)
    80002064:	48e57263          	bgeu	a0,a4,800024e8 <__printf+0x620>
    80002068:	3e700513          	li	a0,999
    8000206c:	02d7f5bb          	remuw	a1,a5,a3
    80002070:	02059593          	slli	a1,a1,0x20
    80002074:	0205d593          	srli	a1,a1,0x20
    80002078:	00bd85b3          	add	a1,s11,a1
    8000207c:	0005c583          	lbu	a1,0(a1)
    80002080:	02d7d7bb          	divuw	a5,a5,a3
    80002084:	f8b40223          	sb	a1,-124(s0)
    80002088:	46e57663          	bgeu	a0,a4,800024f4 <__printf+0x62c>
    8000208c:	02d7f5bb          	remuw	a1,a5,a3
    80002090:	02059593          	slli	a1,a1,0x20
    80002094:	0205d593          	srli	a1,a1,0x20
    80002098:	00bd85b3          	add	a1,s11,a1
    8000209c:	0005c583          	lbu	a1,0(a1)
    800020a0:	02d7d7bb          	divuw	a5,a5,a3
    800020a4:	f8b402a3          	sb	a1,-123(s0)
    800020a8:	46ea7863          	bgeu	s4,a4,80002518 <__printf+0x650>
    800020ac:	02d7f5bb          	remuw	a1,a5,a3
    800020b0:	02059593          	slli	a1,a1,0x20
    800020b4:	0205d593          	srli	a1,a1,0x20
    800020b8:	00bd85b3          	add	a1,s11,a1
    800020bc:	0005c583          	lbu	a1,0(a1)
    800020c0:	02d7d7bb          	divuw	a5,a5,a3
    800020c4:	f8b40323          	sb	a1,-122(s0)
    800020c8:	3eeaf863          	bgeu	s5,a4,800024b8 <__printf+0x5f0>
    800020cc:	02d7f5bb          	remuw	a1,a5,a3
    800020d0:	02059593          	slli	a1,a1,0x20
    800020d4:	0205d593          	srli	a1,a1,0x20
    800020d8:	00bd85b3          	add	a1,s11,a1
    800020dc:	0005c583          	lbu	a1,0(a1)
    800020e0:	02d7d7bb          	divuw	a5,a5,a3
    800020e4:	f8b403a3          	sb	a1,-121(s0)
    800020e8:	42eb7e63          	bgeu	s6,a4,80002524 <__printf+0x65c>
    800020ec:	02d7f5bb          	remuw	a1,a5,a3
    800020f0:	02059593          	slli	a1,a1,0x20
    800020f4:	0205d593          	srli	a1,a1,0x20
    800020f8:	00bd85b3          	add	a1,s11,a1
    800020fc:	0005c583          	lbu	a1,0(a1)
    80002100:	02d7d7bb          	divuw	a5,a5,a3
    80002104:	f8b40423          	sb	a1,-120(s0)
    80002108:	42ebfc63          	bgeu	s7,a4,80002540 <__printf+0x678>
    8000210c:	02079793          	slli	a5,a5,0x20
    80002110:	0207d793          	srli	a5,a5,0x20
    80002114:	00fd8db3          	add	s11,s11,a5
    80002118:	000dc703          	lbu	a4,0(s11)
    8000211c:	00a00793          	li	a5,10
    80002120:	00900c93          	li	s9,9
    80002124:	f8e404a3          	sb	a4,-119(s0)
    80002128:	00065c63          	bgez	a2,80002140 <__printf+0x278>
    8000212c:	f9040713          	addi	a4,s0,-112
    80002130:	00f70733          	add	a4,a4,a5
    80002134:	02d00693          	li	a3,45
    80002138:	fed70823          	sb	a3,-16(a4)
    8000213c:	00078c93          	mv	s9,a5
    80002140:	f8040793          	addi	a5,s0,-128
    80002144:	01978cb3          	add	s9,a5,s9
    80002148:	f7f40d13          	addi	s10,s0,-129
    8000214c:	000cc503          	lbu	a0,0(s9)
    80002150:	fffc8c93          	addi	s9,s9,-1
    80002154:	00000097          	auipc	ra,0x0
    80002158:	b90080e7          	jalr	-1136(ra) # 80001ce4 <consputc>
    8000215c:	ffac98e3          	bne	s9,s10,8000214c <__printf+0x284>
    80002160:	00094503          	lbu	a0,0(s2)
    80002164:	e00514e3          	bnez	a0,80001f6c <__printf+0xa4>
    80002168:	1a0c1663          	bnez	s8,80002314 <__printf+0x44c>
    8000216c:	08813083          	ld	ra,136(sp)
    80002170:	08013403          	ld	s0,128(sp)
    80002174:	07813483          	ld	s1,120(sp)
    80002178:	07013903          	ld	s2,112(sp)
    8000217c:	06813983          	ld	s3,104(sp)
    80002180:	06013a03          	ld	s4,96(sp)
    80002184:	05813a83          	ld	s5,88(sp)
    80002188:	05013b03          	ld	s6,80(sp)
    8000218c:	04813b83          	ld	s7,72(sp)
    80002190:	04013c03          	ld	s8,64(sp)
    80002194:	03813c83          	ld	s9,56(sp)
    80002198:	03013d03          	ld	s10,48(sp)
    8000219c:	02813d83          	ld	s11,40(sp)
    800021a0:	0d010113          	addi	sp,sp,208
    800021a4:	00008067          	ret
    800021a8:	07300713          	li	a4,115
    800021ac:	1ce78a63          	beq	a5,a4,80002380 <__printf+0x4b8>
    800021b0:	07800713          	li	a4,120
    800021b4:	1ee79e63          	bne	a5,a4,800023b0 <__printf+0x4e8>
    800021b8:	f7843783          	ld	a5,-136(s0)
    800021bc:	0007a703          	lw	a4,0(a5)
    800021c0:	00878793          	addi	a5,a5,8
    800021c4:	f6f43c23          	sd	a5,-136(s0)
    800021c8:	28074263          	bltz	a4,8000244c <__printf+0x584>
    800021cc:	00002d97          	auipc	s11,0x2
    800021d0:	facd8d93          	addi	s11,s11,-84 # 80004178 <digits>
    800021d4:	00f77793          	andi	a5,a4,15
    800021d8:	00fd87b3          	add	a5,s11,a5
    800021dc:	0007c683          	lbu	a3,0(a5)
    800021e0:	00f00613          	li	a2,15
    800021e4:	0007079b          	sext.w	a5,a4
    800021e8:	f8d40023          	sb	a3,-128(s0)
    800021ec:	0047559b          	srliw	a1,a4,0x4
    800021f0:	0047569b          	srliw	a3,a4,0x4
    800021f4:	00000c93          	li	s9,0
    800021f8:	0ee65063          	bge	a2,a4,800022d8 <__printf+0x410>
    800021fc:	00f6f693          	andi	a3,a3,15
    80002200:	00dd86b3          	add	a3,s11,a3
    80002204:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80002208:	0087d79b          	srliw	a5,a5,0x8
    8000220c:	00100c93          	li	s9,1
    80002210:	f8d400a3          	sb	a3,-127(s0)
    80002214:	0cb67263          	bgeu	a2,a1,800022d8 <__printf+0x410>
    80002218:	00f7f693          	andi	a3,a5,15
    8000221c:	00dd86b3          	add	a3,s11,a3
    80002220:	0006c583          	lbu	a1,0(a3)
    80002224:	00f00613          	li	a2,15
    80002228:	0047d69b          	srliw	a3,a5,0x4
    8000222c:	f8b40123          	sb	a1,-126(s0)
    80002230:	0047d593          	srli	a1,a5,0x4
    80002234:	28f67e63          	bgeu	a2,a5,800024d0 <__printf+0x608>
    80002238:	00f6f693          	andi	a3,a3,15
    8000223c:	00dd86b3          	add	a3,s11,a3
    80002240:	0006c503          	lbu	a0,0(a3)
    80002244:	0087d813          	srli	a6,a5,0x8
    80002248:	0087d69b          	srliw	a3,a5,0x8
    8000224c:	f8a401a3          	sb	a0,-125(s0)
    80002250:	28b67663          	bgeu	a2,a1,800024dc <__printf+0x614>
    80002254:	00f6f693          	andi	a3,a3,15
    80002258:	00dd86b3          	add	a3,s11,a3
    8000225c:	0006c583          	lbu	a1,0(a3)
    80002260:	00c7d513          	srli	a0,a5,0xc
    80002264:	00c7d69b          	srliw	a3,a5,0xc
    80002268:	f8b40223          	sb	a1,-124(s0)
    8000226c:	29067a63          	bgeu	a2,a6,80002500 <__printf+0x638>
    80002270:	00f6f693          	andi	a3,a3,15
    80002274:	00dd86b3          	add	a3,s11,a3
    80002278:	0006c583          	lbu	a1,0(a3)
    8000227c:	0107d813          	srli	a6,a5,0x10
    80002280:	0107d69b          	srliw	a3,a5,0x10
    80002284:	f8b402a3          	sb	a1,-123(s0)
    80002288:	28a67263          	bgeu	a2,a0,8000250c <__printf+0x644>
    8000228c:	00f6f693          	andi	a3,a3,15
    80002290:	00dd86b3          	add	a3,s11,a3
    80002294:	0006c683          	lbu	a3,0(a3)
    80002298:	0147d79b          	srliw	a5,a5,0x14
    8000229c:	f8d40323          	sb	a3,-122(s0)
    800022a0:	21067663          	bgeu	a2,a6,800024ac <__printf+0x5e4>
    800022a4:	02079793          	slli	a5,a5,0x20
    800022a8:	0207d793          	srli	a5,a5,0x20
    800022ac:	00fd8db3          	add	s11,s11,a5
    800022b0:	000dc683          	lbu	a3,0(s11)
    800022b4:	00800793          	li	a5,8
    800022b8:	00700c93          	li	s9,7
    800022bc:	f8d403a3          	sb	a3,-121(s0)
    800022c0:	00075c63          	bgez	a4,800022d8 <__printf+0x410>
    800022c4:	f9040713          	addi	a4,s0,-112
    800022c8:	00f70733          	add	a4,a4,a5
    800022cc:	02d00693          	li	a3,45
    800022d0:	fed70823          	sb	a3,-16(a4)
    800022d4:	00078c93          	mv	s9,a5
    800022d8:	f8040793          	addi	a5,s0,-128
    800022dc:	01978cb3          	add	s9,a5,s9
    800022e0:	f7f40d13          	addi	s10,s0,-129
    800022e4:	000cc503          	lbu	a0,0(s9)
    800022e8:	fffc8c93          	addi	s9,s9,-1
    800022ec:	00000097          	auipc	ra,0x0
    800022f0:	9f8080e7          	jalr	-1544(ra) # 80001ce4 <consputc>
    800022f4:	ff9d18e3          	bne	s10,s9,800022e4 <__printf+0x41c>
    800022f8:	0100006f          	j	80002308 <__printf+0x440>
    800022fc:	00000097          	auipc	ra,0x0
    80002300:	9e8080e7          	jalr	-1560(ra) # 80001ce4 <consputc>
    80002304:	000c8493          	mv	s1,s9
    80002308:	00094503          	lbu	a0,0(s2)
    8000230c:	c60510e3          	bnez	a0,80001f6c <__printf+0xa4>
    80002310:	e40c0ee3          	beqz	s8,8000216c <__printf+0x2a4>
    80002314:	00003517          	auipc	a0,0x3
    80002318:	28c50513          	addi	a0,a0,652 # 800055a0 <pr>
    8000231c:	00001097          	auipc	ra,0x1
    80002320:	94c080e7          	jalr	-1716(ra) # 80002c68 <release>
    80002324:	e49ff06f          	j	8000216c <__printf+0x2a4>
    80002328:	f7843783          	ld	a5,-136(s0)
    8000232c:	03000513          	li	a0,48
    80002330:	01000d13          	li	s10,16
    80002334:	00878713          	addi	a4,a5,8
    80002338:	0007bc83          	ld	s9,0(a5)
    8000233c:	f6e43c23          	sd	a4,-136(s0)
    80002340:	00000097          	auipc	ra,0x0
    80002344:	9a4080e7          	jalr	-1628(ra) # 80001ce4 <consputc>
    80002348:	07800513          	li	a0,120
    8000234c:	00000097          	auipc	ra,0x0
    80002350:	998080e7          	jalr	-1640(ra) # 80001ce4 <consputc>
    80002354:	00002d97          	auipc	s11,0x2
    80002358:	e24d8d93          	addi	s11,s11,-476 # 80004178 <digits>
    8000235c:	03ccd793          	srli	a5,s9,0x3c
    80002360:	00fd87b3          	add	a5,s11,a5
    80002364:	0007c503          	lbu	a0,0(a5)
    80002368:	fffd0d1b          	addiw	s10,s10,-1
    8000236c:	004c9c93          	slli	s9,s9,0x4
    80002370:	00000097          	auipc	ra,0x0
    80002374:	974080e7          	jalr	-1676(ra) # 80001ce4 <consputc>
    80002378:	fe0d12e3          	bnez	s10,8000235c <__printf+0x494>
    8000237c:	f8dff06f          	j	80002308 <__printf+0x440>
    80002380:	f7843783          	ld	a5,-136(s0)
    80002384:	0007bc83          	ld	s9,0(a5)
    80002388:	00878793          	addi	a5,a5,8
    8000238c:	f6f43c23          	sd	a5,-136(s0)
    80002390:	000c9a63          	bnez	s9,800023a4 <__printf+0x4dc>
    80002394:	1080006f          	j	8000249c <__printf+0x5d4>
    80002398:	001c8c93          	addi	s9,s9,1
    8000239c:	00000097          	auipc	ra,0x0
    800023a0:	948080e7          	jalr	-1720(ra) # 80001ce4 <consputc>
    800023a4:	000cc503          	lbu	a0,0(s9)
    800023a8:	fe0518e3          	bnez	a0,80002398 <__printf+0x4d0>
    800023ac:	f5dff06f          	j	80002308 <__printf+0x440>
    800023b0:	02500513          	li	a0,37
    800023b4:	00000097          	auipc	ra,0x0
    800023b8:	930080e7          	jalr	-1744(ra) # 80001ce4 <consputc>
    800023bc:	000c8513          	mv	a0,s9
    800023c0:	00000097          	auipc	ra,0x0
    800023c4:	924080e7          	jalr	-1756(ra) # 80001ce4 <consputc>
    800023c8:	f41ff06f          	j	80002308 <__printf+0x440>
    800023cc:	02500513          	li	a0,37
    800023d0:	00000097          	auipc	ra,0x0
    800023d4:	914080e7          	jalr	-1772(ra) # 80001ce4 <consputc>
    800023d8:	f31ff06f          	j	80002308 <__printf+0x440>
    800023dc:	00030513          	mv	a0,t1
    800023e0:	00000097          	auipc	ra,0x0
    800023e4:	7bc080e7          	jalr	1980(ra) # 80002b9c <acquire>
    800023e8:	b4dff06f          	j	80001f34 <__printf+0x6c>
    800023ec:	40c0053b          	negw	a0,a2
    800023f0:	00a00713          	li	a4,10
    800023f4:	02e576bb          	remuw	a3,a0,a4
    800023f8:	00002d97          	auipc	s11,0x2
    800023fc:	d80d8d93          	addi	s11,s11,-640 # 80004178 <digits>
    80002400:	ff700593          	li	a1,-9
    80002404:	02069693          	slli	a3,a3,0x20
    80002408:	0206d693          	srli	a3,a3,0x20
    8000240c:	00dd86b3          	add	a3,s11,a3
    80002410:	0006c683          	lbu	a3,0(a3)
    80002414:	02e557bb          	divuw	a5,a0,a4
    80002418:	f8d40023          	sb	a3,-128(s0)
    8000241c:	10b65e63          	bge	a2,a1,80002538 <__printf+0x670>
    80002420:	06300593          	li	a1,99
    80002424:	02e7f6bb          	remuw	a3,a5,a4
    80002428:	02069693          	slli	a3,a3,0x20
    8000242c:	0206d693          	srli	a3,a3,0x20
    80002430:	00dd86b3          	add	a3,s11,a3
    80002434:	0006c683          	lbu	a3,0(a3)
    80002438:	02e7d73b          	divuw	a4,a5,a4
    8000243c:	00200793          	li	a5,2
    80002440:	f8d400a3          	sb	a3,-127(s0)
    80002444:	bca5ece3          	bltu	a1,a0,8000201c <__printf+0x154>
    80002448:	ce5ff06f          	j	8000212c <__printf+0x264>
    8000244c:	40e007bb          	negw	a5,a4
    80002450:	00002d97          	auipc	s11,0x2
    80002454:	d28d8d93          	addi	s11,s11,-728 # 80004178 <digits>
    80002458:	00f7f693          	andi	a3,a5,15
    8000245c:	00dd86b3          	add	a3,s11,a3
    80002460:	0006c583          	lbu	a1,0(a3)
    80002464:	ff100613          	li	a2,-15
    80002468:	0047d69b          	srliw	a3,a5,0x4
    8000246c:	f8b40023          	sb	a1,-128(s0)
    80002470:	0047d59b          	srliw	a1,a5,0x4
    80002474:	0ac75e63          	bge	a4,a2,80002530 <__printf+0x668>
    80002478:	00f6f693          	andi	a3,a3,15
    8000247c:	00dd86b3          	add	a3,s11,a3
    80002480:	0006c603          	lbu	a2,0(a3)
    80002484:	00f00693          	li	a3,15
    80002488:	0087d79b          	srliw	a5,a5,0x8
    8000248c:	f8c400a3          	sb	a2,-127(s0)
    80002490:	d8b6e4e3          	bltu	a3,a1,80002218 <__printf+0x350>
    80002494:	00200793          	li	a5,2
    80002498:	e2dff06f          	j	800022c4 <__printf+0x3fc>
    8000249c:	00002c97          	auipc	s9,0x2
    800024a0:	cbcc8c93          	addi	s9,s9,-836 # 80004158 <CONSOLE_STATUS+0x148>
    800024a4:	02800513          	li	a0,40
    800024a8:	ef1ff06f          	j	80002398 <__printf+0x4d0>
    800024ac:	00700793          	li	a5,7
    800024b0:	00600c93          	li	s9,6
    800024b4:	e0dff06f          	j	800022c0 <__printf+0x3f8>
    800024b8:	00700793          	li	a5,7
    800024bc:	00600c93          	li	s9,6
    800024c0:	c69ff06f          	j	80002128 <__printf+0x260>
    800024c4:	00300793          	li	a5,3
    800024c8:	00200c93          	li	s9,2
    800024cc:	c5dff06f          	j	80002128 <__printf+0x260>
    800024d0:	00300793          	li	a5,3
    800024d4:	00200c93          	li	s9,2
    800024d8:	de9ff06f          	j	800022c0 <__printf+0x3f8>
    800024dc:	00400793          	li	a5,4
    800024e0:	00300c93          	li	s9,3
    800024e4:	dddff06f          	j	800022c0 <__printf+0x3f8>
    800024e8:	00400793          	li	a5,4
    800024ec:	00300c93          	li	s9,3
    800024f0:	c39ff06f          	j	80002128 <__printf+0x260>
    800024f4:	00500793          	li	a5,5
    800024f8:	00400c93          	li	s9,4
    800024fc:	c2dff06f          	j	80002128 <__printf+0x260>
    80002500:	00500793          	li	a5,5
    80002504:	00400c93          	li	s9,4
    80002508:	db9ff06f          	j	800022c0 <__printf+0x3f8>
    8000250c:	00600793          	li	a5,6
    80002510:	00500c93          	li	s9,5
    80002514:	dadff06f          	j	800022c0 <__printf+0x3f8>
    80002518:	00600793          	li	a5,6
    8000251c:	00500c93          	li	s9,5
    80002520:	c09ff06f          	j	80002128 <__printf+0x260>
    80002524:	00800793          	li	a5,8
    80002528:	00700c93          	li	s9,7
    8000252c:	bfdff06f          	j	80002128 <__printf+0x260>
    80002530:	00100793          	li	a5,1
    80002534:	d91ff06f          	j	800022c4 <__printf+0x3fc>
    80002538:	00100793          	li	a5,1
    8000253c:	bf1ff06f          	j	8000212c <__printf+0x264>
    80002540:	00900793          	li	a5,9
    80002544:	00800c93          	li	s9,8
    80002548:	be1ff06f          	j	80002128 <__printf+0x260>
    8000254c:	00002517          	auipc	a0,0x2
    80002550:	c1450513          	addi	a0,a0,-1004 # 80004160 <CONSOLE_STATUS+0x150>
    80002554:	00000097          	auipc	ra,0x0
    80002558:	918080e7          	jalr	-1768(ra) # 80001e6c <panic>

000000008000255c <printfinit>:
    8000255c:	fe010113          	addi	sp,sp,-32
    80002560:	00813823          	sd	s0,16(sp)
    80002564:	00913423          	sd	s1,8(sp)
    80002568:	00113c23          	sd	ra,24(sp)
    8000256c:	02010413          	addi	s0,sp,32
    80002570:	00003497          	auipc	s1,0x3
    80002574:	03048493          	addi	s1,s1,48 # 800055a0 <pr>
    80002578:	00048513          	mv	a0,s1
    8000257c:	00002597          	auipc	a1,0x2
    80002580:	bf458593          	addi	a1,a1,-1036 # 80004170 <CONSOLE_STATUS+0x160>
    80002584:	00000097          	auipc	ra,0x0
    80002588:	5f4080e7          	jalr	1524(ra) # 80002b78 <initlock>
    8000258c:	01813083          	ld	ra,24(sp)
    80002590:	01013403          	ld	s0,16(sp)
    80002594:	0004ac23          	sw	zero,24(s1)
    80002598:	00813483          	ld	s1,8(sp)
    8000259c:	02010113          	addi	sp,sp,32
    800025a0:	00008067          	ret

00000000800025a4 <uartinit>:
    800025a4:	ff010113          	addi	sp,sp,-16
    800025a8:	00813423          	sd	s0,8(sp)
    800025ac:	01010413          	addi	s0,sp,16
    800025b0:	100007b7          	lui	a5,0x10000
    800025b4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800025b8:	f8000713          	li	a4,-128
    800025bc:	00e781a3          	sb	a4,3(a5)
    800025c0:	00300713          	li	a4,3
    800025c4:	00e78023          	sb	a4,0(a5)
    800025c8:	000780a3          	sb	zero,1(a5)
    800025cc:	00e781a3          	sb	a4,3(a5)
    800025d0:	00700693          	li	a3,7
    800025d4:	00d78123          	sb	a3,2(a5)
    800025d8:	00e780a3          	sb	a4,1(a5)
    800025dc:	00813403          	ld	s0,8(sp)
    800025e0:	01010113          	addi	sp,sp,16
    800025e4:	00008067          	ret

00000000800025e8 <uartputc>:
    800025e8:	00002797          	auipc	a5,0x2
    800025ec:	d607a783          	lw	a5,-672(a5) # 80004348 <panicked>
    800025f0:	00078463          	beqz	a5,800025f8 <uartputc+0x10>
    800025f4:	0000006f          	j	800025f4 <uartputc+0xc>
    800025f8:	fd010113          	addi	sp,sp,-48
    800025fc:	02813023          	sd	s0,32(sp)
    80002600:	00913c23          	sd	s1,24(sp)
    80002604:	01213823          	sd	s2,16(sp)
    80002608:	01313423          	sd	s3,8(sp)
    8000260c:	02113423          	sd	ra,40(sp)
    80002610:	03010413          	addi	s0,sp,48
    80002614:	00002917          	auipc	s2,0x2
    80002618:	d3c90913          	addi	s2,s2,-708 # 80004350 <uart_tx_r>
    8000261c:	00093783          	ld	a5,0(s2)
    80002620:	00002497          	auipc	s1,0x2
    80002624:	d3848493          	addi	s1,s1,-712 # 80004358 <uart_tx_w>
    80002628:	0004b703          	ld	a4,0(s1)
    8000262c:	02078693          	addi	a3,a5,32
    80002630:	00050993          	mv	s3,a0
    80002634:	02e69c63          	bne	a3,a4,8000266c <uartputc+0x84>
    80002638:	00001097          	auipc	ra,0x1
    8000263c:	834080e7          	jalr	-1996(ra) # 80002e6c <push_on>
    80002640:	00093783          	ld	a5,0(s2)
    80002644:	0004b703          	ld	a4,0(s1)
    80002648:	02078793          	addi	a5,a5,32
    8000264c:	00e79463          	bne	a5,a4,80002654 <uartputc+0x6c>
    80002650:	0000006f          	j	80002650 <uartputc+0x68>
    80002654:	00001097          	auipc	ra,0x1
    80002658:	88c080e7          	jalr	-1908(ra) # 80002ee0 <pop_on>
    8000265c:	00093783          	ld	a5,0(s2)
    80002660:	0004b703          	ld	a4,0(s1)
    80002664:	02078693          	addi	a3,a5,32
    80002668:	fce688e3          	beq	a3,a4,80002638 <uartputc+0x50>
    8000266c:	01f77693          	andi	a3,a4,31
    80002670:	00003597          	auipc	a1,0x3
    80002674:	f5058593          	addi	a1,a1,-176 # 800055c0 <uart_tx_buf>
    80002678:	00d586b3          	add	a3,a1,a3
    8000267c:	00170713          	addi	a4,a4,1
    80002680:	01368023          	sb	s3,0(a3)
    80002684:	00e4b023          	sd	a4,0(s1)
    80002688:	10000637          	lui	a2,0x10000
    8000268c:	02f71063          	bne	a4,a5,800026ac <uartputc+0xc4>
    80002690:	0340006f          	j	800026c4 <uartputc+0xdc>
    80002694:	00074703          	lbu	a4,0(a4)
    80002698:	00f93023          	sd	a5,0(s2)
    8000269c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800026a0:	00093783          	ld	a5,0(s2)
    800026a4:	0004b703          	ld	a4,0(s1)
    800026a8:	00f70e63          	beq	a4,a5,800026c4 <uartputc+0xdc>
    800026ac:	00564683          	lbu	a3,5(a2)
    800026b0:	01f7f713          	andi	a4,a5,31
    800026b4:	00e58733          	add	a4,a1,a4
    800026b8:	0206f693          	andi	a3,a3,32
    800026bc:	00178793          	addi	a5,a5,1
    800026c0:	fc069ae3          	bnez	a3,80002694 <uartputc+0xac>
    800026c4:	02813083          	ld	ra,40(sp)
    800026c8:	02013403          	ld	s0,32(sp)
    800026cc:	01813483          	ld	s1,24(sp)
    800026d0:	01013903          	ld	s2,16(sp)
    800026d4:	00813983          	ld	s3,8(sp)
    800026d8:	03010113          	addi	sp,sp,48
    800026dc:	00008067          	ret

00000000800026e0 <uartputc_sync>:
    800026e0:	ff010113          	addi	sp,sp,-16
    800026e4:	00813423          	sd	s0,8(sp)
    800026e8:	01010413          	addi	s0,sp,16
    800026ec:	00002717          	auipc	a4,0x2
    800026f0:	c5c72703          	lw	a4,-932(a4) # 80004348 <panicked>
    800026f4:	02071663          	bnez	a4,80002720 <uartputc_sync+0x40>
    800026f8:	00050793          	mv	a5,a0
    800026fc:	100006b7          	lui	a3,0x10000
    80002700:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80002704:	02077713          	andi	a4,a4,32
    80002708:	fe070ce3          	beqz	a4,80002700 <uartputc_sync+0x20>
    8000270c:	0ff7f793          	andi	a5,a5,255
    80002710:	00f68023          	sb	a5,0(a3)
    80002714:	00813403          	ld	s0,8(sp)
    80002718:	01010113          	addi	sp,sp,16
    8000271c:	00008067          	ret
    80002720:	0000006f          	j	80002720 <uartputc_sync+0x40>

0000000080002724 <uartstart>:
    80002724:	ff010113          	addi	sp,sp,-16
    80002728:	00813423          	sd	s0,8(sp)
    8000272c:	01010413          	addi	s0,sp,16
    80002730:	00002617          	auipc	a2,0x2
    80002734:	c2060613          	addi	a2,a2,-992 # 80004350 <uart_tx_r>
    80002738:	00002517          	auipc	a0,0x2
    8000273c:	c2050513          	addi	a0,a0,-992 # 80004358 <uart_tx_w>
    80002740:	00063783          	ld	a5,0(a2)
    80002744:	00053703          	ld	a4,0(a0)
    80002748:	04f70263          	beq	a4,a5,8000278c <uartstart+0x68>
    8000274c:	100005b7          	lui	a1,0x10000
    80002750:	00003817          	auipc	a6,0x3
    80002754:	e7080813          	addi	a6,a6,-400 # 800055c0 <uart_tx_buf>
    80002758:	01c0006f          	j	80002774 <uartstart+0x50>
    8000275c:	0006c703          	lbu	a4,0(a3)
    80002760:	00f63023          	sd	a5,0(a2)
    80002764:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80002768:	00063783          	ld	a5,0(a2)
    8000276c:	00053703          	ld	a4,0(a0)
    80002770:	00f70e63          	beq	a4,a5,8000278c <uartstart+0x68>
    80002774:	01f7f713          	andi	a4,a5,31
    80002778:	00e806b3          	add	a3,a6,a4
    8000277c:	0055c703          	lbu	a4,5(a1)
    80002780:	00178793          	addi	a5,a5,1
    80002784:	02077713          	andi	a4,a4,32
    80002788:	fc071ae3          	bnez	a4,8000275c <uartstart+0x38>
    8000278c:	00813403          	ld	s0,8(sp)
    80002790:	01010113          	addi	sp,sp,16
    80002794:	00008067          	ret

0000000080002798 <uartgetc>:
    80002798:	ff010113          	addi	sp,sp,-16
    8000279c:	00813423          	sd	s0,8(sp)
    800027a0:	01010413          	addi	s0,sp,16
    800027a4:	10000737          	lui	a4,0x10000
    800027a8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800027ac:	0017f793          	andi	a5,a5,1
    800027b0:	00078c63          	beqz	a5,800027c8 <uartgetc+0x30>
    800027b4:	00074503          	lbu	a0,0(a4)
    800027b8:	0ff57513          	andi	a0,a0,255
    800027bc:	00813403          	ld	s0,8(sp)
    800027c0:	01010113          	addi	sp,sp,16
    800027c4:	00008067          	ret
    800027c8:	fff00513          	li	a0,-1
    800027cc:	ff1ff06f          	j	800027bc <uartgetc+0x24>

00000000800027d0 <uartintr>:
    800027d0:	100007b7          	lui	a5,0x10000
    800027d4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800027d8:	0017f793          	andi	a5,a5,1
    800027dc:	0a078463          	beqz	a5,80002884 <uartintr+0xb4>
    800027e0:	fe010113          	addi	sp,sp,-32
    800027e4:	00813823          	sd	s0,16(sp)
    800027e8:	00913423          	sd	s1,8(sp)
    800027ec:	00113c23          	sd	ra,24(sp)
    800027f0:	02010413          	addi	s0,sp,32
    800027f4:	100004b7          	lui	s1,0x10000
    800027f8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800027fc:	0ff57513          	andi	a0,a0,255
    80002800:	fffff097          	auipc	ra,0xfffff
    80002804:	534080e7          	jalr	1332(ra) # 80001d34 <consoleintr>
    80002808:	0054c783          	lbu	a5,5(s1)
    8000280c:	0017f793          	andi	a5,a5,1
    80002810:	fe0794e3          	bnez	a5,800027f8 <uartintr+0x28>
    80002814:	00002617          	auipc	a2,0x2
    80002818:	b3c60613          	addi	a2,a2,-1220 # 80004350 <uart_tx_r>
    8000281c:	00002517          	auipc	a0,0x2
    80002820:	b3c50513          	addi	a0,a0,-1220 # 80004358 <uart_tx_w>
    80002824:	00063783          	ld	a5,0(a2)
    80002828:	00053703          	ld	a4,0(a0)
    8000282c:	04f70263          	beq	a4,a5,80002870 <uartintr+0xa0>
    80002830:	100005b7          	lui	a1,0x10000
    80002834:	00003817          	auipc	a6,0x3
    80002838:	d8c80813          	addi	a6,a6,-628 # 800055c0 <uart_tx_buf>
    8000283c:	01c0006f          	j	80002858 <uartintr+0x88>
    80002840:	0006c703          	lbu	a4,0(a3)
    80002844:	00f63023          	sd	a5,0(a2)
    80002848:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000284c:	00063783          	ld	a5,0(a2)
    80002850:	00053703          	ld	a4,0(a0)
    80002854:	00f70e63          	beq	a4,a5,80002870 <uartintr+0xa0>
    80002858:	01f7f713          	andi	a4,a5,31
    8000285c:	00e806b3          	add	a3,a6,a4
    80002860:	0055c703          	lbu	a4,5(a1)
    80002864:	00178793          	addi	a5,a5,1
    80002868:	02077713          	andi	a4,a4,32
    8000286c:	fc071ae3          	bnez	a4,80002840 <uartintr+0x70>
    80002870:	01813083          	ld	ra,24(sp)
    80002874:	01013403          	ld	s0,16(sp)
    80002878:	00813483          	ld	s1,8(sp)
    8000287c:	02010113          	addi	sp,sp,32
    80002880:	00008067          	ret
    80002884:	00002617          	auipc	a2,0x2
    80002888:	acc60613          	addi	a2,a2,-1332 # 80004350 <uart_tx_r>
    8000288c:	00002517          	auipc	a0,0x2
    80002890:	acc50513          	addi	a0,a0,-1332 # 80004358 <uart_tx_w>
    80002894:	00063783          	ld	a5,0(a2)
    80002898:	00053703          	ld	a4,0(a0)
    8000289c:	04f70263          	beq	a4,a5,800028e0 <uartintr+0x110>
    800028a0:	100005b7          	lui	a1,0x10000
    800028a4:	00003817          	auipc	a6,0x3
    800028a8:	d1c80813          	addi	a6,a6,-740 # 800055c0 <uart_tx_buf>
    800028ac:	01c0006f          	j	800028c8 <uartintr+0xf8>
    800028b0:	0006c703          	lbu	a4,0(a3)
    800028b4:	00f63023          	sd	a5,0(a2)
    800028b8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800028bc:	00063783          	ld	a5,0(a2)
    800028c0:	00053703          	ld	a4,0(a0)
    800028c4:	02f70063          	beq	a4,a5,800028e4 <uartintr+0x114>
    800028c8:	01f7f713          	andi	a4,a5,31
    800028cc:	00e806b3          	add	a3,a6,a4
    800028d0:	0055c703          	lbu	a4,5(a1)
    800028d4:	00178793          	addi	a5,a5,1
    800028d8:	02077713          	andi	a4,a4,32
    800028dc:	fc071ae3          	bnez	a4,800028b0 <uartintr+0xe0>
    800028e0:	00008067          	ret
    800028e4:	00008067          	ret

00000000800028e8 <kinit>:
    800028e8:	fc010113          	addi	sp,sp,-64
    800028ec:	02913423          	sd	s1,40(sp)
    800028f0:	fffff7b7          	lui	a5,0xfffff
    800028f4:	00004497          	auipc	s1,0x4
    800028f8:	ceb48493          	addi	s1,s1,-789 # 800065df <end+0xfff>
    800028fc:	02813823          	sd	s0,48(sp)
    80002900:	01313c23          	sd	s3,24(sp)
    80002904:	00f4f4b3          	and	s1,s1,a5
    80002908:	02113c23          	sd	ra,56(sp)
    8000290c:	03213023          	sd	s2,32(sp)
    80002910:	01413823          	sd	s4,16(sp)
    80002914:	01513423          	sd	s5,8(sp)
    80002918:	04010413          	addi	s0,sp,64
    8000291c:	000017b7          	lui	a5,0x1
    80002920:	01100993          	li	s3,17
    80002924:	00f487b3          	add	a5,s1,a5
    80002928:	01b99993          	slli	s3,s3,0x1b
    8000292c:	06f9e063          	bltu	s3,a5,8000298c <kinit+0xa4>
    80002930:	00003a97          	auipc	s5,0x3
    80002934:	cb0a8a93          	addi	s5,s5,-848 # 800055e0 <end>
    80002938:	0754ec63          	bltu	s1,s5,800029b0 <kinit+0xc8>
    8000293c:	0734fa63          	bgeu	s1,s3,800029b0 <kinit+0xc8>
    80002940:	00088a37          	lui	s4,0x88
    80002944:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80002948:	00002917          	auipc	s2,0x2
    8000294c:	a1890913          	addi	s2,s2,-1512 # 80004360 <kmem>
    80002950:	00ca1a13          	slli	s4,s4,0xc
    80002954:	0140006f          	j	80002968 <kinit+0x80>
    80002958:	000017b7          	lui	a5,0x1
    8000295c:	00f484b3          	add	s1,s1,a5
    80002960:	0554e863          	bltu	s1,s5,800029b0 <kinit+0xc8>
    80002964:	0534f663          	bgeu	s1,s3,800029b0 <kinit+0xc8>
    80002968:	00001637          	lui	a2,0x1
    8000296c:	00100593          	li	a1,1
    80002970:	00048513          	mv	a0,s1
    80002974:	00000097          	auipc	ra,0x0
    80002978:	5e4080e7          	jalr	1508(ra) # 80002f58 <__memset>
    8000297c:	00093783          	ld	a5,0(s2)
    80002980:	00f4b023          	sd	a5,0(s1)
    80002984:	00993023          	sd	s1,0(s2)
    80002988:	fd4498e3          	bne	s1,s4,80002958 <kinit+0x70>
    8000298c:	03813083          	ld	ra,56(sp)
    80002990:	03013403          	ld	s0,48(sp)
    80002994:	02813483          	ld	s1,40(sp)
    80002998:	02013903          	ld	s2,32(sp)
    8000299c:	01813983          	ld	s3,24(sp)
    800029a0:	01013a03          	ld	s4,16(sp)
    800029a4:	00813a83          	ld	s5,8(sp)
    800029a8:	04010113          	addi	sp,sp,64
    800029ac:	00008067          	ret
    800029b0:	00001517          	auipc	a0,0x1
    800029b4:	7e050513          	addi	a0,a0,2016 # 80004190 <digits+0x18>
    800029b8:	fffff097          	auipc	ra,0xfffff
    800029bc:	4b4080e7          	jalr	1204(ra) # 80001e6c <panic>

00000000800029c0 <freerange>:
    800029c0:	fc010113          	addi	sp,sp,-64
    800029c4:	000017b7          	lui	a5,0x1
    800029c8:	02913423          	sd	s1,40(sp)
    800029cc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800029d0:	009504b3          	add	s1,a0,s1
    800029d4:	fffff537          	lui	a0,0xfffff
    800029d8:	02813823          	sd	s0,48(sp)
    800029dc:	02113c23          	sd	ra,56(sp)
    800029e0:	03213023          	sd	s2,32(sp)
    800029e4:	01313c23          	sd	s3,24(sp)
    800029e8:	01413823          	sd	s4,16(sp)
    800029ec:	01513423          	sd	s5,8(sp)
    800029f0:	01613023          	sd	s6,0(sp)
    800029f4:	04010413          	addi	s0,sp,64
    800029f8:	00a4f4b3          	and	s1,s1,a0
    800029fc:	00f487b3          	add	a5,s1,a5
    80002a00:	06f5e463          	bltu	a1,a5,80002a68 <freerange+0xa8>
    80002a04:	00003a97          	auipc	s5,0x3
    80002a08:	bdca8a93          	addi	s5,s5,-1060 # 800055e0 <end>
    80002a0c:	0954e263          	bltu	s1,s5,80002a90 <freerange+0xd0>
    80002a10:	01100993          	li	s3,17
    80002a14:	01b99993          	slli	s3,s3,0x1b
    80002a18:	0734fc63          	bgeu	s1,s3,80002a90 <freerange+0xd0>
    80002a1c:	00058a13          	mv	s4,a1
    80002a20:	00002917          	auipc	s2,0x2
    80002a24:	94090913          	addi	s2,s2,-1728 # 80004360 <kmem>
    80002a28:	00002b37          	lui	s6,0x2
    80002a2c:	0140006f          	j	80002a40 <freerange+0x80>
    80002a30:	000017b7          	lui	a5,0x1
    80002a34:	00f484b3          	add	s1,s1,a5
    80002a38:	0554ec63          	bltu	s1,s5,80002a90 <freerange+0xd0>
    80002a3c:	0534fa63          	bgeu	s1,s3,80002a90 <freerange+0xd0>
    80002a40:	00001637          	lui	a2,0x1
    80002a44:	00100593          	li	a1,1
    80002a48:	00048513          	mv	a0,s1
    80002a4c:	00000097          	auipc	ra,0x0
    80002a50:	50c080e7          	jalr	1292(ra) # 80002f58 <__memset>
    80002a54:	00093703          	ld	a4,0(s2)
    80002a58:	016487b3          	add	a5,s1,s6
    80002a5c:	00e4b023          	sd	a4,0(s1)
    80002a60:	00993023          	sd	s1,0(s2)
    80002a64:	fcfa76e3          	bgeu	s4,a5,80002a30 <freerange+0x70>
    80002a68:	03813083          	ld	ra,56(sp)
    80002a6c:	03013403          	ld	s0,48(sp)
    80002a70:	02813483          	ld	s1,40(sp)
    80002a74:	02013903          	ld	s2,32(sp)
    80002a78:	01813983          	ld	s3,24(sp)
    80002a7c:	01013a03          	ld	s4,16(sp)
    80002a80:	00813a83          	ld	s5,8(sp)
    80002a84:	00013b03          	ld	s6,0(sp)
    80002a88:	04010113          	addi	sp,sp,64
    80002a8c:	00008067          	ret
    80002a90:	00001517          	auipc	a0,0x1
    80002a94:	70050513          	addi	a0,a0,1792 # 80004190 <digits+0x18>
    80002a98:	fffff097          	auipc	ra,0xfffff
    80002a9c:	3d4080e7          	jalr	980(ra) # 80001e6c <panic>

0000000080002aa0 <kfree>:
    80002aa0:	fe010113          	addi	sp,sp,-32
    80002aa4:	00813823          	sd	s0,16(sp)
    80002aa8:	00113c23          	sd	ra,24(sp)
    80002aac:	00913423          	sd	s1,8(sp)
    80002ab0:	02010413          	addi	s0,sp,32
    80002ab4:	03451793          	slli	a5,a0,0x34
    80002ab8:	04079c63          	bnez	a5,80002b10 <kfree+0x70>
    80002abc:	00003797          	auipc	a5,0x3
    80002ac0:	b2478793          	addi	a5,a5,-1244 # 800055e0 <end>
    80002ac4:	00050493          	mv	s1,a0
    80002ac8:	04f56463          	bltu	a0,a5,80002b10 <kfree+0x70>
    80002acc:	01100793          	li	a5,17
    80002ad0:	01b79793          	slli	a5,a5,0x1b
    80002ad4:	02f57e63          	bgeu	a0,a5,80002b10 <kfree+0x70>
    80002ad8:	00001637          	lui	a2,0x1
    80002adc:	00100593          	li	a1,1
    80002ae0:	00000097          	auipc	ra,0x0
    80002ae4:	478080e7          	jalr	1144(ra) # 80002f58 <__memset>
    80002ae8:	00002797          	auipc	a5,0x2
    80002aec:	87878793          	addi	a5,a5,-1928 # 80004360 <kmem>
    80002af0:	0007b703          	ld	a4,0(a5)
    80002af4:	01813083          	ld	ra,24(sp)
    80002af8:	01013403          	ld	s0,16(sp)
    80002afc:	00e4b023          	sd	a4,0(s1)
    80002b00:	0097b023          	sd	s1,0(a5)
    80002b04:	00813483          	ld	s1,8(sp)
    80002b08:	02010113          	addi	sp,sp,32
    80002b0c:	00008067          	ret
    80002b10:	00001517          	auipc	a0,0x1
    80002b14:	68050513          	addi	a0,a0,1664 # 80004190 <digits+0x18>
    80002b18:	fffff097          	auipc	ra,0xfffff
    80002b1c:	354080e7          	jalr	852(ra) # 80001e6c <panic>

0000000080002b20 <kalloc>:
    80002b20:	fe010113          	addi	sp,sp,-32
    80002b24:	00813823          	sd	s0,16(sp)
    80002b28:	00913423          	sd	s1,8(sp)
    80002b2c:	00113c23          	sd	ra,24(sp)
    80002b30:	02010413          	addi	s0,sp,32
    80002b34:	00002797          	auipc	a5,0x2
    80002b38:	82c78793          	addi	a5,a5,-2004 # 80004360 <kmem>
    80002b3c:	0007b483          	ld	s1,0(a5)
    80002b40:	02048063          	beqz	s1,80002b60 <kalloc+0x40>
    80002b44:	0004b703          	ld	a4,0(s1)
    80002b48:	00001637          	lui	a2,0x1
    80002b4c:	00500593          	li	a1,5
    80002b50:	00048513          	mv	a0,s1
    80002b54:	00e7b023          	sd	a4,0(a5)
    80002b58:	00000097          	auipc	ra,0x0
    80002b5c:	400080e7          	jalr	1024(ra) # 80002f58 <__memset>
    80002b60:	01813083          	ld	ra,24(sp)
    80002b64:	01013403          	ld	s0,16(sp)
    80002b68:	00048513          	mv	a0,s1
    80002b6c:	00813483          	ld	s1,8(sp)
    80002b70:	02010113          	addi	sp,sp,32
    80002b74:	00008067          	ret

0000000080002b78 <initlock>:
    80002b78:	ff010113          	addi	sp,sp,-16
    80002b7c:	00813423          	sd	s0,8(sp)
    80002b80:	01010413          	addi	s0,sp,16
    80002b84:	00813403          	ld	s0,8(sp)
    80002b88:	00b53423          	sd	a1,8(a0)
    80002b8c:	00052023          	sw	zero,0(a0)
    80002b90:	00053823          	sd	zero,16(a0)
    80002b94:	01010113          	addi	sp,sp,16
    80002b98:	00008067          	ret

0000000080002b9c <acquire>:
    80002b9c:	fe010113          	addi	sp,sp,-32
    80002ba0:	00813823          	sd	s0,16(sp)
    80002ba4:	00913423          	sd	s1,8(sp)
    80002ba8:	00113c23          	sd	ra,24(sp)
    80002bac:	01213023          	sd	s2,0(sp)
    80002bb0:	02010413          	addi	s0,sp,32
    80002bb4:	00050493          	mv	s1,a0
    80002bb8:	10002973          	csrr	s2,sstatus
    80002bbc:	100027f3          	csrr	a5,sstatus
    80002bc0:	ffd7f793          	andi	a5,a5,-3
    80002bc4:	10079073          	csrw	sstatus,a5
    80002bc8:	fffff097          	auipc	ra,0xfffff
    80002bcc:	8e8080e7          	jalr	-1816(ra) # 800014b0 <mycpu>
    80002bd0:	07852783          	lw	a5,120(a0)
    80002bd4:	06078e63          	beqz	a5,80002c50 <acquire+0xb4>
    80002bd8:	fffff097          	auipc	ra,0xfffff
    80002bdc:	8d8080e7          	jalr	-1832(ra) # 800014b0 <mycpu>
    80002be0:	07852783          	lw	a5,120(a0)
    80002be4:	0004a703          	lw	a4,0(s1)
    80002be8:	0017879b          	addiw	a5,a5,1
    80002bec:	06f52c23          	sw	a5,120(a0)
    80002bf0:	04071063          	bnez	a4,80002c30 <acquire+0x94>
    80002bf4:	00100713          	li	a4,1
    80002bf8:	00070793          	mv	a5,a4
    80002bfc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80002c00:	0007879b          	sext.w	a5,a5
    80002c04:	fe079ae3          	bnez	a5,80002bf8 <acquire+0x5c>
    80002c08:	0ff0000f          	fence
    80002c0c:	fffff097          	auipc	ra,0xfffff
    80002c10:	8a4080e7          	jalr	-1884(ra) # 800014b0 <mycpu>
    80002c14:	01813083          	ld	ra,24(sp)
    80002c18:	01013403          	ld	s0,16(sp)
    80002c1c:	00a4b823          	sd	a0,16(s1)
    80002c20:	00013903          	ld	s2,0(sp)
    80002c24:	00813483          	ld	s1,8(sp)
    80002c28:	02010113          	addi	sp,sp,32
    80002c2c:	00008067          	ret
    80002c30:	0104b903          	ld	s2,16(s1)
    80002c34:	fffff097          	auipc	ra,0xfffff
    80002c38:	87c080e7          	jalr	-1924(ra) # 800014b0 <mycpu>
    80002c3c:	faa91ce3          	bne	s2,a0,80002bf4 <acquire+0x58>
    80002c40:	00001517          	auipc	a0,0x1
    80002c44:	55850513          	addi	a0,a0,1368 # 80004198 <digits+0x20>
    80002c48:	fffff097          	auipc	ra,0xfffff
    80002c4c:	224080e7          	jalr	548(ra) # 80001e6c <panic>
    80002c50:	00195913          	srli	s2,s2,0x1
    80002c54:	fffff097          	auipc	ra,0xfffff
    80002c58:	85c080e7          	jalr	-1956(ra) # 800014b0 <mycpu>
    80002c5c:	00197913          	andi	s2,s2,1
    80002c60:	07252e23          	sw	s2,124(a0)
    80002c64:	f75ff06f          	j	80002bd8 <acquire+0x3c>

0000000080002c68 <release>:
    80002c68:	fe010113          	addi	sp,sp,-32
    80002c6c:	00813823          	sd	s0,16(sp)
    80002c70:	00113c23          	sd	ra,24(sp)
    80002c74:	00913423          	sd	s1,8(sp)
    80002c78:	01213023          	sd	s2,0(sp)
    80002c7c:	02010413          	addi	s0,sp,32
    80002c80:	00052783          	lw	a5,0(a0)
    80002c84:	00079a63          	bnez	a5,80002c98 <release+0x30>
    80002c88:	00001517          	auipc	a0,0x1
    80002c8c:	51850513          	addi	a0,a0,1304 # 800041a0 <digits+0x28>
    80002c90:	fffff097          	auipc	ra,0xfffff
    80002c94:	1dc080e7          	jalr	476(ra) # 80001e6c <panic>
    80002c98:	01053903          	ld	s2,16(a0)
    80002c9c:	00050493          	mv	s1,a0
    80002ca0:	fffff097          	auipc	ra,0xfffff
    80002ca4:	810080e7          	jalr	-2032(ra) # 800014b0 <mycpu>
    80002ca8:	fea910e3          	bne	s2,a0,80002c88 <release+0x20>
    80002cac:	0004b823          	sd	zero,16(s1)
    80002cb0:	0ff0000f          	fence
    80002cb4:	0f50000f          	fence	iorw,ow
    80002cb8:	0804a02f          	amoswap.w	zero,zero,(s1)
    80002cbc:	ffffe097          	auipc	ra,0xffffe
    80002cc0:	7f4080e7          	jalr	2036(ra) # 800014b0 <mycpu>
    80002cc4:	100027f3          	csrr	a5,sstatus
    80002cc8:	0027f793          	andi	a5,a5,2
    80002ccc:	04079a63          	bnez	a5,80002d20 <release+0xb8>
    80002cd0:	07852783          	lw	a5,120(a0)
    80002cd4:	02f05e63          	blez	a5,80002d10 <release+0xa8>
    80002cd8:	fff7871b          	addiw	a4,a5,-1
    80002cdc:	06e52c23          	sw	a4,120(a0)
    80002ce0:	00071c63          	bnez	a4,80002cf8 <release+0x90>
    80002ce4:	07c52783          	lw	a5,124(a0)
    80002ce8:	00078863          	beqz	a5,80002cf8 <release+0x90>
    80002cec:	100027f3          	csrr	a5,sstatus
    80002cf0:	0027e793          	ori	a5,a5,2
    80002cf4:	10079073          	csrw	sstatus,a5
    80002cf8:	01813083          	ld	ra,24(sp)
    80002cfc:	01013403          	ld	s0,16(sp)
    80002d00:	00813483          	ld	s1,8(sp)
    80002d04:	00013903          	ld	s2,0(sp)
    80002d08:	02010113          	addi	sp,sp,32
    80002d0c:	00008067          	ret
    80002d10:	00001517          	auipc	a0,0x1
    80002d14:	4b050513          	addi	a0,a0,1200 # 800041c0 <digits+0x48>
    80002d18:	fffff097          	auipc	ra,0xfffff
    80002d1c:	154080e7          	jalr	340(ra) # 80001e6c <panic>
    80002d20:	00001517          	auipc	a0,0x1
    80002d24:	48850513          	addi	a0,a0,1160 # 800041a8 <digits+0x30>
    80002d28:	fffff097          	auipc	ra,0xfffff
    80002d2c:	144080e7          	jalr	324(ra) # 80001e6c <panic>

0000000080002d30 <holding>:
    80002d30:	00052783          	lw	a5,0(a0)
    80002d34:	00079663          	bnez	a5,80002d40 <holding+0x10>
    80002d38:	00000513          	li	a0,0
    80002d3c:	00008067          	ret
    80002d40:	fe010113          	addi	sp,sp,-32
    80002d44:	00813823          	sd	s0,16(sp)
    80002d48:	00913423          	sd	s1,8(sp)
    80002d4c:	00113c23          	sd	ra,24(sp)
    80002d50:	02010413          	addi	s0,sp,32
    80002d54:	01053483          	ld	s1,16(a0)
    80002d58:	ffffe097          	auipc	ra,0xffffe
    80002d5c:	758080e7          	jalr	1880(ra) # 800014b0 <mycpu>
    80002d60:	01813083          	ld	ra,24(sp)
    80002d64:	01013403          	ld	s0,16(sp)
    80002d68:	40a48533          	sub	a0,s1,a0
    80002d6c:	00153513          	seqz	a0,a0
    80002d70:	00813483          	ld	s1,8(sp)
    80002d74:	02010113          	addi	sp,sp,32
    80002d78:	00008067          	ret

0000000080002d7c <push_off>:
    80002d7c:	fe010113          	addi	sp,sp,-32
    80002d80:	00813823          	sd	s0,16(sp)
    80002d84:	00113c23          	sd	ra,24(sp)
    80002d88:	00913423          	sd	s1,8(sp)
    80002d8c:	02010413          	addi	s0,sp,32
    80002d90:	100024f3          	csrr	s1,sstatus
    80002d94:	100027f3          	csrr	a5,sstatus
    80002d98:	ffd7f793          	andi	a5,a5,-3
    80002d9c:	10079073          	csrw	sstatus,a5
    80002da0:	ffffe097          	auipc	ra,0xffffe
    80002da4:	710080e7          	jalr	1808(ra) # 800014b0 <mycpu>
    80002da8:	07852783          	lw	a5,120(a0)
    80002dac:	02078663          	beqz	a5,80002dd8 <push_off+0x5c>
    80002db0:	ffffe097          	auipc	ra,0xffffe
    80002db4:	700080e7          	jalr	1792(ra) # 800014b0 <mycpu>
    80002db8:	07852783          	lw	a5,120(a0)
    80002dbc:	01813083          	ld	ra,24(sp)
    80002dc0:	01013403          	ld	s0,16(sp)
    80002dc4:	0017879b          	addiw	a5,a5,1
    80002dc8:	06f52c23          	sw	a5,120(a0)
    80002dcc:	00813483          	ld	s1,8(sp)
    80002dd0:	02010113          	addi	sp,sp,32
    80002dd4:	00008067          	ret
    80002dd8:	0014d493          	srli	s1,s1,0x1
    80002ddc:	ffffe097          	auipc	ra,0xffffe
    80002de0:	6d4080e7          	jalr	1748(ra) # 800014b0 <mycpu>
    80002de4:	0014f493          	andi	s1,s1,1
    80002de8:	06952e23          	sw	s1,124(a0)
    80002dec:	fc5ff06f          	j	80002db0 <push_off+0x34>

0000000080002df0 <pop_off>:
    80002df0:	ff010113          	addi	sp,sp,-16
    80002df4:	00813023          	sd	s0,0(sp)
    80002df8:	00113423          	sd	ra,8(sp)
    80002dfc:	01010413          	addi	s0,sp,16
    80002e00:	ffffe097          	auipc	ra,0xffffe
    80002e04:	6b0080e7          	jalr	1712(ra) # 800014b0 <mycpu>
    80002e08:	100027f3          	csrr	a5,sstatus
    80002e0c:	0027f793          	andi	a5,a5,2
    80002e10:	04079663          	bnez	a5,80002e5c <pop_off+0x6c>
    80002e14:	07852783          	lw	a5,120(a0)
    80002e18:	02f05a63          	blez	a5,80002e4c <pop_off+0x5c>
    80002e1c:	fff7871b          	addiw	a4,a5,-1
    80002e20:	06e52c23          	sw	a4,120(a0)
    80002e24:	00071c63          	bnez	a4,80002e3c <pop_off+0x4c>
    80002e28:	07c52783          	lw	a5,124(a0)
    80002e2c:	00078863          	beqz	a5,80002e3c <pop_off+0x4c>
    80002e30:	100027f3          	csrr	a5,sstatus
    80002e34:	0027e793          	ori	a5,a5,2
    80002e38:	10079073          	csrw	sstatus,a5
    80002e3c:	00813083          	ld	ra,8(sp)
    80002e40:	00013403          	ld	s0,0(sp)
    80002e44:	01010113          	addi	sp,sp,16
    80002e48:	00008067          	ret
    80002e4c:	00001517          	auipc	a0,0x1
    80002e50:	37450513          	addi	a0,a0,884 # 800041c0 <digits+0x48>
    80002e54:	fffff097          	auipc	ra,0xfffff
    80002e58:	018080e7          	jalr	24(ra) # 80001e6c <panic>
    80002e5c:	00001517          	auipc	a0,0x1
    80002e60:	34c50513          	addi	a0,a0,844 # 800041a8 <digits+0x30>
    80002e64:	fffff097          	auipc	ra,0xfffff
    80002e68:	008080e7          	jalr	8(ra) # 80001e6c <panic>

0000000080002e6c <push_on>:
    80002e6c:	fe010113          	addi	sp,sp,-32
    80002e70:	00813823          	sd	s0,16(sp)
    80002e74:	00113c23          	sd	ra,24(sp)
    80002e78:	00913423          	sd	s1,8(sp)
    80002e7c:	02010413          	addi	s0,sp,32
    80002e80:	100024f3          	csrr	s1,sstatus
    80002e84:	100027f3          	csrr	a5,sstatus
    80002e88:	0027e793          	ori	a5,a5,2
    80002e8c:	10079073          	csrw	sstatus,a5
    80002e90:	ffffe097          	auipc	ra,0xffffe
    80002e94:	620080e7          	jalr	1568(ra) # 800014b0 <mycpu>
    80002e98:	07852783          	lw	a5,120(a0)
    80002e9c:	02078663          	beqz	a5,80002ec8 <push_on+0x5c>
    80002ea0:	ffffe097          	auipc	ra,0xffffe
    80002ea4:	610080e7          	jalr	1552(ra) # 800014b0 <mycpu>
    80002ea8:	07852783          	lw	a5,120(a0)
    80002eac:	01813083          	ld	ra,24(sp)
    80002eb0:	01013403          	ld	s0,16(sp)
    80002eb4:	0017879b          	addiw	a5,a5,1
    80002eb8:	06f52c23          	sw	a5,120(a0)
    80002ebc:	00813483          	ld	s1,8(sp)
    80002ec0:	02010113          	addi	sp,sp,32
    80002ec4:	00008067          	ret
    80002ec8:	0014d493          	srli	s1,s1,0x1
    80002ecc:	ffffe097          	auipc	ra,0xffffe
    80002ed0:	5e4080e7          	jalr	1508(ra) # 800014b0 <mycpu>
    80002ed4:	0014f493          	andi	s1,s1,1
    80002ed8:	06952e23          	sw	s1,124(a0)
    80002edc:	fc5ff06f          	j	80002ea0 <push_on+0x34>

0000000080002ee0 <pop_on>:
    80002ee0:	ff010113          	addi	sp,sp,-16
    80002ee4:	00813023          	sd	s0,0(sp)
    80002ee8:	00113423          	sd	ra,8(sp)
    80002eec:	01010413          	addi	s0,sp,16
    80002ef0:	ffffe097          	auipc	ra,0xffffe
    80002ef4:	5c0080e7          	jalr	1472(ra) # 800014b0 <mycpu>
    80002ef8:	100027f3          	csrr	a5,sstatus
    80002efc:	0027f793          	andi	a5,a5,2
    80002f00:	04078463          	beqz	a5,80002f48 <pop_on+0x68>
    80002f04:	07852783          	lw	a5,120(a0)
    80002f08:	02f05863          	blez	a5,80002f38 <pop_on+0x58>
    80002f0c:	fff7879b          	addiw	a5,a5,-1
    80002f10:	06f52c23          	sw	a5,120(a0)
    80002f14:	07853783          	ld	a5,120(a0)
    80002f18:	00079863          	bnez	a5,80002f28 <pop_on+0x48>
    80002f1c:	100027f3          	csrr	a5,sstatus
    80002f20:	ffd7f793          	andi	a5,a5,-3
    80002f24:	10079073          	csrw	sstatus,a5
    80002f28:	00813083          	ld	ra,8(sp)
    80002f2c:	00013403          	ld	s0,0(sp)
    80002f30:	01010113          	addi	sp,sp,16
    80002f34:	00008067          	ret
    80002f38:	00001517          	auipc	a0,0x1
    80002f3c:	2b050513          	addi	a0,a0,688 # 800041e8 <digits+0x70>
    80002f40:	fffff097          	auipc	ra,0xfffff
    80002f44:	f2c080e7          	jalr	-212(ra) # 80001e6c <panic>
    80002f48:	00001517          	auipc	a0,0x1
    80002f4c:	28050513          	addi	a0,a0,640 # 800041c8 <digits+0x50>
    80002f50:	fffff097          	auipc	ra,0xfffff
    80002f54:	f1c080e7          	jalr	-228(ra) # 80001e6c <panic>

0000000080002f58 <__memset>:
    80002f58:	ff010113          	addi	sp,sp,-16
    80002f5c:	00813423          	sd	s0,8(sp)
    80002f60:	01010413          	addi	s0,sp,16
    80002f64:	1a060e63          	beqz	a2,80003120 <__memset+0x1c8>
    80002f68:	40a007b3          	neg	a5,a0
    80002f6c:	0077f793          	andi	a5,a5,7
    80002f70:	00778693          	addi	a3,a5,7
    80002f74:	00b00813          	li	a6,11
    80002f78:	0ff5f593          	andi	a1,a1,255
    80002f7c:	fff6071b          	addiw	a4,a2,-1
    80002f80:	1b06e663          	bltu	a3,a6,8000312c <__memset+0x1d4>
    80002f84:	1cd76463          	bltu	a4,a3,8000314c <__memset+0x1f4>
    80002f88:	1a078e63          	beqz	a5,80003144 <__memset+0x1ec>
    80002f8c:	00b50023          	sb	a1,0(a0)
    80002f90:	00100713          	li	a4,1
    80002f94:	1ae78463          	beq	a5,a4,8000313c <__memset+0x1e4>
    80002f98:	00b500a3          	sb	a1,1(a0)
    80002f9c:	00200713          	li	a4,2
    80002fa0:	1ae78a63          	beq	a5,a4,80003154 <__memset+0x1fc>
    80002fa4:	00b50123          	sb	a1,2(a0)
    80002fa8:	00300713          	li	a4,3
    80002fac:	18e78463          	beq	a5,a4,80003134 <__memset+0x1dc>
    80002fb0:	00b501a3          	sb	a1,3(a0)
    80002fb4:	00400713          	li	a4,4
    80002fb8:	1ae78263          	beq	a5,a4,8000315c <__memset+0x204>
    80002fbc:	00b50223          	sb	a1,4(a0)
    80002fc0:	00500713          	li	a4,5
    80002fc4:	1ae78063          	beq	a5,a4,80003164 <__memset+0x20c>
    80002fc8:	00b502a3          	sb	a1,5(a0)
    80002fcc:	00700713          	li	a4,7
    80002fd0:	18e79e63          	bne	a5,a4,8000316c <__memset+0x214>
    80002fd4:	00b50323          	sb	a1,6(a0)
    80002fd8:	00700e93          	li	t4,7
    80002fdc:	00859713          	slli	a4,a1,0x8
    80002fe0:	00e5e733          	or	a4,a1,a4
    80002fe4:	01059e13          	slli	t3,a1,0x10
    80002fe8:	01c76e33          	or	t3,a4,t3
    80002fec:	01859313          	slli	t1,a1,0x18
    80002ff0:	006e6333          	or	t1,t3,t1
    80002ff4:	02059893          	slli	a7,a1,0x20
    80002ff8:	40f60e3b          	subw	t3,a2,a5
    80002ffc:	011368b3          	or	a7,t1,a7
    80003000:	02859813          	slli	a6,a1,0x28
    80003004:	0108e833          	or	a6,a7,a6
    80003008:	03059693          	slli	a3,a1,0x30
    8000300c:	003e589b          	srliw	a7,t3,0x3
    80003010:	00d866b3          	or	a3,a6,a3
    80003014:	03859713          	slli	a4,a1,0x38
    80003018:	00389813          	slli	a6,a7,0x3
    8000301c:	00f507b3          	add	a5,a0,a5
    80003020:	00e6e733          	or	a4,a3,a4
    80003024:	000e089b          	sext.w	a7,t3
    80003028:	00f806b3          	add	a3,a6,a5
    8000302c:	00e7b023          	sd	a4,0(a5)
    80003030:	00878793          	addi	a5,a5,8
    80003034:	fed79ce3          	bne	a5,a3,8000302c <__memset+0xd4>
    80003038:	ff8e7793          	andi	a5,t3,-8
    8000303c:	0007871b          	sext.w	a4,a5
    80003040:	01d787bb          	addw	a5,a5,t4
    80003044:	0ce88e63          	beq	a7,a4,80003120 <__memset+0x1c8>
    80003048:	00f50733          	add	a4,a0,a5
    8000304c:	00b70023          	sb	a1,0(a4)
    80003050:	0017871b          	addiw	a4,a5,1
    80003054:	0cc77663          	bgeu	a4,a2,80003120 <__memset+0x1c8>
    80003058:	00e50733          	add	a4,a0,a4
    8000305c:	00b70023          	sb	a1,0(a4)
    80003060:	0027871b          	addiw	a4,a5,2
    80003064:	0ac77e63          	bgeu	a4,a2,80003120 <__memset+0x1c8>
    80003068:	00e50733          	add	a4,a0,a4
    8000306c:	00b70023          	sb	a1,0(a4)
    80003070:	0037871b          	addiw	a4,a5,3
    80003074:	0ac77663          	bgeu	a4,a2,80003120 <__memset+0x1c8>
    80003078:	00e50733          	add	a4,a0,a4
    8000307c:	00b70023          	sb	a1,0(a4)
    80003080:	0047871b          	addiw	a4,a5,4
    80003084:	08c77e63          	bgeu	a4,a2,80003120 <__memset+0x1c8>
    80003088:	00e50733          	add	a4,a0,a4
    8000308c:	00b70023          	sb	a1,0(a4)
    80003090:	0057871b          	addiw	a4,a5,5
    80003094:	08c77663          	bgeu	a4,a2,80003120 <__memset+0x1c8>
    80003098:	00e50733          	add	a4,a0,a4
    8000309c:	00b70023          	sb	a1,0(a4)
    800030a0:	0067871b          	addiw	a4,a5,6
    800030a4:	06c77e63          	bgeu	a4,a2,80003120 <__memset+0x1c8>
    800030a8:	00e50733          	add	a4,a0,a4
    800030ac:	00b70023          	sb	a1,0(a4)
    800030b0:	0077871b          	addiw	a4,a5,7
    800030b4:	06c77663          	bgeu	a4,a2,80003120 <__memset+0x1c8>
    800030b8:	00e50733          	add	a4,a0,a4
    800030bc:	00b70023          	sb	a1,0(a4)
    800030c0:	0087871b          	addiw	a4,a5,8
    800030c4:	04c77e63          	bgeu	a4,a2,80003120 <__memset+0x1c8>
    800030c8:	00e50733          	add	a4,a0,a4
    800030cc:	00b70023          	sb	a1,0(a4)
    800030d0:	0097871b          	addiw	a4,a5,9
    800030d4:	04c77663          	bgeu	a4,a2,80003120 <__memset+0x1c8>
    800030d8:	00e50733          	add	a4,a0,a4
    800030dc:	00b70023          	sb	a1,0(a4)
    800030e0:	00a7871b          	addiw	a4,a5,10
    800030e4:	02c77e63          	bgeu	a4,a2,80003120 <__memset+0x1c8>
    800030e8:	00e50733          	add	a4,a0,a4
    800030ec:	00b70023          	sb	a1,0(a4)
    800030f0:	00b7871b          	addiw	a4,a5,11
    800030f4:	02c77663          	bgeu	a4,a2,80003120 <__memset+0x1c8>
    800030f8:	00e50733          	add	a4,a0,a4
    800030fc:	00b70023          	sb	a1,0(a4)
    80003100:	00c7871b          	addiw	a4,a5,12
    80003104:	00c77e63          	bgeu	a4,a2,80003120 <__memset+0x1c8>
    80003108:	00e50733          	add	a4,a0,a4
    8000310c:	00b70023          	sb	a1,0(a4)
    80003110:	00d7879b          	addiw	a5,a5,13
    80003114:	00c7f663          	bgeu	a5,a2,80003120 <__memset+0x1c8>
    80003118:	00f507b3          	add	a5,a0,a5
    8000311c:	00b78023          	sb	a1,0(a5)
    80003120:	00813403          	ld	s0,8(sp)
    80003124:	01010113          	addi	sp,sp,16
    80003128:	00008067          	ret
    8000312c:	00b00693          	li	a3,11
    80003130:	e55ff06f          	j	80002f84 <__memset+0x2c>
    80003134:	00300e93          	li	t4,3
    80003138:	ea5ff06f          	j	80002fdc <__memset+0x84>
    8000313c:	00100e93          	li	t4,1
    80003140:	e9dff06f          	j	80002fdc <__memset+0x84>
    80003144:	00000e93          	li	t4,0
    80003148:	e95ff06f          	j	80002fdc <__memset+0x84>
    8000314c:	00000793          	li	a5,0
    80003150:	ef9ff06f          	j	80003048 <__memset+0xf0>
    80003154:	00200e93          	li	t4,2
    80003158:	e85ff06f          	j	80002fdc <__memset+0x84>
    8000315c:	00400e93          	li	t4,4
    80003160:	e7dff06f          	j	80002fdc <__memset+0x84>
    80003164:	00500e93          	li	t4,5
    80003168:	e75ff06f          	j	80002fdc <__memset+0x84>
    8000316c:	00600e93          	li	t4,6
    80003170:	e6dff06f          	j	80002fdc <__memset+0x84>

0000000080003174 <__memmove>:
    80003174:	ff010113          	addi	sp,sp,-16
    80003178:	00813423          	sd	s0,8(sp)
    8000317c:	01010413          	addi	s0,sp,16
    80003180:	0e060863          	beqz	a2,80003270 <__memmove+0xfc>
    80003184:	fff6069b          	addiw	a3,a2,-1
    80003188:	0006881b          	sext.w	a6,a3
    8000318c:	0ea5e863          	bltu	a1,a0,8000327c <__memmove+0x108>
    80003190:	00758713          	addi	a4,a1,7
    80003194:	00a5e7b3          	or	a5,a1,a0
    80003198:	40a70733          	sub	a4,a4,a0
    8000319c:	0077f793          	andi	a5,a5,7
    800031a0:	00f73713          	sltiu	a4,a4,15
    800031a4:	00174713          	xori	a4,a4,1
    800031a8:	0017b793          	seqz	a5,a5
    800031ac:	00e7f7b3          	and	a5,a5,a4
    800031b0:	10078863          	beqz	a5,800032c0 <__memmove+0x14c>
    800031b4:	00900793          	li	a5,9
    800031b8:	1107f463          	bgeu	a5,a6,800032c0 <__memmove+0x14c>
    800031bc:	0036581b          	srliw	a6,a2,0x3
    800031c0:	fff8081b          	addiw	a6,a6,-1
    800031c4:	02081813          	slli	a6,a6,0x20
    800031c8:	01d85893          	srli	a7,a6,0x1d
    800031cc:	00858813          	addi	a6,a1,8
    800031d0:	00058793          	mv	a5,a1
    800031d4:	00050713          	mv	a4,a0
    800031d8:	01088833          	add	a6,a7,a6
    800031dc:	0007b883          	ld	a7,0(a5)
    800031e0:	00878793          	addi	a5,a5,8
    800031e4:	00870713          	addi	a4,a4,8
    800031e8:	ff173c23          	sd	a7,-8(a4)
    800031ec:	ff0798e3          	bne	a5,a6,800031dc <__memmove+0x68>
    800031f0:	ff867713          	andi	a4,a2,-8
    800031f4:	02071793          	slli	a5,a4,0x20
    800031f8:	0207d793          	srli	a5,a5,0x20
    800031fc:	00f585b3          	add	a1,a1,a5
    80003200:	40e686bb          	subw	a3,a3,a4
    80003204:	00f507b3          	add	a5,a0,a5
    80003208:	06e60463          	beq	a2,a4,80003270 <__memmove+0xfc>
    8000320c:	0005c703          	lbu	a4,0(a1)
    80003210:	00e78023          	sb	a4,0(a5)
    80003214:	04068e63          	beqz	a3,80003270 <__memmove+0xfc>
    80003218:	0015c603          	lbu	a2,1(a1)
    8000321c:	00100713          	li	a4,1
    80003220:	00c780a3          	sb	a2,1(a5)
    80003224:	04e68663          	beq	a3,a4,80003270 <__memmove+0xfc>
    80003228:	0025c603          	lbu	a2,2(a1)
    8000322c:	00200713          	li	a4,2
    80003230:	00c78123          	sb	a2,2(a5)
    80003234:	02e68e63          	beq	a3,a4,80003270 <__memmove+0xfc>
    80003238:	0035c603          	lbu	a2,3(a1)
    8000323c:	00300713          	li	a4,3
    80003240:	00c781a3          	sb	a2,3(a5)
    80003244:	02e68663          	beq	a3,a4,80003270 <__memmove+0xfc>
    80003248:	0045c603          	lbu	a2,4(a1)
    8000324c:	00400713          	li	a4,4
    80003250:	00c78223          	sb	a2,4(a5)
    80003254:	00e68e63          	beq	a3,a4,80003270 <__memmove+0xfc>
    80003258:	0055c603          	lbu	a2,5(a1)
    8000325c:	00500713          	li	a4,5
    80003260:	00c782a3          	sb	a2,5(a5)
    80003264:	00e68663          	beq	a3,a4,80003270 <__memmove+0xfc>
    80003268:	0065c703          	lbu	a4,6(a1)
    8000326c:	00e78323          	sb	a4,6(a5)
    80003270:	00813403          	ld	s0,8(sp)
    80003274:	01010113          	addi	sp,sp,16
    80003278:	00008067          	ret
    8000327c:	02061713          	slli	a4,a2,0x20
    80003280:	02075713          	srli	a4,a4,0x20
    80003284:	00e587b3          	add	a5,a1,a4
    80003288:	f0f574e3          	bgeu	a0,a5,80003190 <__memmove+0x1c>
    8000328c:	02069613          	slli	a2,a3,0x20
    80003290:	02065613          	srli	a2,a2,0x20
    80003294:	fff64613          	not	a2,a2
    80003298:	00e50733          	add	a4,a0,a4
    8000329c:	00c78633          	add	a2,a5,a2
    800032a0:	fff7c683          	lbu	a3,-1(a5)
    800032a4:	fff78793          	addi	a5,a5,-1
    800032a8:	fff70713          	addi	a4,a4,-1
    800032ac:	00d70023          	sb	a3,0(a4)
    800032b0:	fec798e3          	bne	a5,a2,800032a0 <__memmove+0x12c>
    800032b4:	00813403          	ld	s0,8(sp)
    800032b8:	01010113          	addi	sp,sp,16
    800032bc:	00008067          	ret
    800032c0:	02069713          	slli	a4,a3,0x20
    800032c4:	02075713          	srli	a4,a4,0x20
    800032c8:	00170713          	addi	a4,a4,1
    800032cc:	00e50733          	add	a4,a0,a4
    800032d0:	00050793          	mv	a5,a0
    800032d4:	0005c683          	lbu	a3,0(a1)
    800032d8:	00178793          	addi	a5,a5,1
    800032dc:	00158593          	addi	a1,a1,1
    800032e0:	fed78fa3          	sb	a3,-1(a5)
    800032e4:	fee798e3          	bne	a5,a4,800032d4 <__memmove+0x160>
    800032e8:	f89ff06f          	j	80003270 <__memmove+0xfc>
	...
