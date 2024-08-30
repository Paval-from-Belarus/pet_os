format Elf
;The entry point to kernel
DOS_SEG = 0x0
DOS_OFFSET = 0x600
include 'PetOS/linker.inc'
include 'PetOS/format.inc'
insert  'Services/Services.h'
insert  'FileSystem/FileSystem.h'
insert  'System/Executer/Executer.h'
insert  'System/Memory/PagingGL.asm'
insert  'System/BIOS/BiosUtilsGL.asm'
insert  'System/Kernel/KernelGL.asm'
insert  'Text/Text.h'
insert  'Drivers/Types.h'
insert  'macro/proc32.inc'
insert  'Boot/Boot.h'
BREAKPOINT_START_OFFSET equ 0x600 ;DOS_OFFSET but for preproc
ENTRY_OFFSET = IO_ADDR ;OS loader will load kernel on this address
;The kernel physically is stored at LOAD_KERNEL_ADDRESS (or LOAD_KERNEL_SEG:0h)
;last program was invoked was looader
;it had saved in dl disk driver index to interruct with DISK via BIOS
section '.init_text' executable
;@Declare{enum=KernelStack}
extrn 'KERNEL_STACK_SIZE' as KernelStack.size
;@Declare{enum=Kernel}
extrn 'KERNEL_SIZE' as Kernel.size
extrn 'main' as Kernel.run
extrn KERNEL_VIRTUAL_OFFSET
extrn KERNEL_PHYSICAL_OFFSET
;the offset in memory where the end of kernel is supposed to be
;probably use only KERNEL_SIZE... IT's enought to align memory
;copy kernel to highert (0x10_000) -> add KERNEL_SIZE and init some essential structures (such as PageDirectory and other)
;Pass new heap offset (the limit in memory ) -> this's without any sense. Because 
public MAX_KERNEL_SIZE
public AccessPoint as '_start'
AccessPoint: ;point where execution is passes after loading
use16
org DOS_OFFSET
jmp EntryPoint
Kernel.loaderProperties LoaderProperties
Kernel.pagingProperties PagingProperties
insert 'System/Kernel/LegacyBoot.asm' ;some routines for legacy boot
EntryPoint:
     mov ax, DOS_SEG
     push ax ax ax
     pop es ds ss
     mov sp, DOS_STACK_OFFSET
     call Kernel.checkHardware
     jc .stopExecution
     mov bx, Kernel.loaderProperties
     mov byte [ds: bx + LoaderProperties.bBootDevice], dl ;from BIOS-native loader
     mov ax, Kernel.loaderProperties + LoaderProperties.rangeList
     call Kernel.collectPhysicalMemory
     ;mov ax, ax
     call Kernel.checkMemory ;all debug info was already printed
     jc .stopExecution
     mov eax, GlobalDescriptorTable.handle
     call Kernel.setProtectedMode
.stopExecution:
     hlt ;kernel cannot loaded
use32
LoadingPoint:
     call Kernel.setPaging
;Input:
;None
;Output:
;None
;Notes:
;Loader should be already in protected mode
;This method should be replaced by disk interraction
;
proc Kernel.copy uses esi edi
     mov esi, ENTRY_OFFSET
     mov edi, KERNEL_PHYSICAL_OFFSET
     mov ecx, Kernel.size
     cld
     rep movsb ;but kernel should be paged aligned  
ret
endp

;Input:
;None
;Output:
;if cf clear -> all is done
;if cf set -> paging error (system crash)
;
Kernel.setPaging:
     mov eax, Kernel.loaderProperties + LoaderProperties.rangeList
     mov edx, Kernel.pagingProperties + PagingProperties.captureRecList
     call extractPivots
.acquireKernelSize:
     mov ebx, edx ;save captureRecList
     mov eax, Kernel.size
     add eax, PageSize.bytes - 1
     cdq
     mov ecx, PageSize.bytes
     div ecx
     push eax ;save the whole number of pages for kernel
     mov edx, eax 
     mov eax, ebx
     call captureMemory ;only acquire memory for kernel code
     jc .exit
     cmp edx, KERNEL_PHYSICAL_OFFSET
     jne .exit
.initPaging:
     ;mov eax, eax
     mov edx, 1 ;single page for directory
     call captureMemory
     jc .exit
     mov ebx, edx ;save directory offset
     ;mov eax, eax -> holds CaptureRangeRec
     mov edx, PageDirectory.ENTRIES_CNT
     call captureMemory
     jc .exit ;failed to allocated enought memory for PageTables -> it's impossible, but let make check
     mov ebp, edx ;save page tables in ebp
     mov eax, ebx ;restore directore offset
     ;mov edx, edx
     call MMU.init
.configureKernel:
     pop ecx ;restore the count of pages for kernel
     add ecx, (KERNEL_LOW_ADDRESSES_SIZE + PageSize.bytes - 1) / PageSize.bytes ;the main idea to use lower addresses in kernel is to use V8086
     mov eax, PageDirEntry.Present or PageDirEntry.Writable
     mov edx, PageTableEntry.Present or PageTableEntry.Writable
     ;mov ebx, ebx
     xor esi, esi
     mov edi, esi ;identity mapping
     pusha ;save all register because they will be used to map the kernel in higher addresses
     call MMU.markRegion
     popa
     mov edi, KERNEL_VIRTUAL_OFFSET ;map to higher addresses
     call MMU.markRegion
     ;map PageDirectory
     add edi, ebx ;no needs to substract KERNEL_PHYSICAL_OFFSET from edi because virtual mapping accept low addresses as a part of kernel
     ;add edi, ebx - KERNEL_PHYSICAL_OFFSET + KERNEL_LOW_ADDRESSES_SIZE
     mov esi, ebx
     mov eax, PageDirEntry.Present or PageDirEntry.Writable
     mov edx, PageTableEntry.Present or PageTableEntry.Writable
     mov ecx, 1 ;PageDirectory occure only 1 page
     ;mov ebx, ebx
     call MMU.markRegion
     add edi, PageSize.bytes
     mov esi, ebp ;tricky way to acquire existing value
     todo 'replace addresing kernel only to read'
     mov eax, PageDirEntry.Present or PageDirEntry.Writable
     mov edx, PageTableEntry.Present or PageTableEntry.Writable
     mov ecx, PageDirectory.ENTRIES_CNT
     ;mov ebx, ebx
     call MMU.markRegion
     add edi, PageDirectory.ENTRIES_CNT * PageSize.bytes ;next virtual address
.createInterruptStack:
     mov eax, KernelStack.size
     add eax, PageSize.bytes - 1
     mov ecx, PageSize.bytes
     cdq
     div ecx
     mov edx, eax ;count of pages for stack
     push eax ;save count of pages
     mov eax, Kernel.pagingProperties + PagingProperties.captureRecList
     call captureMemory
     pop ecx ;quickly restore page count
     jc .exit ;impossible to capture stack memory; year stack is not clear, but hlt never return...
     ;mov edi, edi
     mov esi, edx
     mov eax, PageDirEntry.Present or PageDirEntry.Writable
     mov edx, PageTableEntry.Present or PageTableEntry.Writable
     ;mov ebx, ebx
     push ecx
     call MMU.markRegion
     pop ecx ;restore page count
     ;now all prepositions for paging are done; let's copy kernel to hight addresse
.configureProperties:
     imul ecx, PageSize.bytes
     add edi, ecx ;heap offset
     ;consider to check each stask access
     mov edx, Kernel.pagingProperties
     mov dword [edx + PagingProperties.lpHeap], edi
     mov dword [edx + PagingProperties.lpPageDirectory], ebx
     add dword [edx + PagingProperties.lpPageDirectory], KERNEL_VIRTUAL_OFFSET
     mov eax, Kernel.pagingProperties + PagingProperties.captureRecList + CaptureRecList.records - ENTRY_OFFSET
     call Kernel.toKernelVirtualAddress
     mov dword [edx + PagingProperties.lpCaptureRec], eax
     mov eax, GlobalDescriptorTable.handle - ENTRY_OFFSET
     call Kernel.toKernelVirtualAddress
     mov dword [edx + PagingProperties.lpGDTHandle], eax
     call Kernel.copy
     mov eax, Kernel.pagingProperties - ENTRY_OFFSET
     call Kernel.toKernelVirtualAddress
     mov ecx, eax
     mov eax, ebx
     mov edx, edi ;stack offset is the same as heap, but grows in forward direction
     call Kernel.switchPaging
.exit:
hlt ;never return
;Input:
;eax -> physical offset
;Output:
;eax -> virtual offset
;all registers are saved
;Notes:
;add to value KERNEL_VIRTUAL_OFFSET and KERNEL_PHYSICAL_OFFSET 
;
Kernel.toKernelVirtualAddress:
push edx
     mov edx, KERNEL_VIRTUAL_OFFSET
     add edx, KERNEL_PHYSICAL_OFFSET
     add eax, edx
pop edx
ret

;Input:
;al -> value
;ecx -> count of value to be filled
;es:edx -> offset where values should be copied
;Output:
;None
;
Memory.fillBytes:
push edi
     mov edi, edx
     cld
     rep stosb    
pop edi
ret
;Input:
;eax -> value
;ecx -> count of values to be filled
;es:edx -> offset where values should be copied
;Output:
;None
;
Memory.fillDwords:
push edi
     mov edi, edx
     cld
     rep stosd
pop edi
ret
;Input:
;ax -> value
;ecx -> count of values to be filled
;es:edx -> offset where values should be copied
;Output:
;None
;
Memory.fillWords:
push edi
     mov edi, edx
     cld
     rep stosw
pop edi
ret
insert 'System/Kernel/MMU.asm'
;Input:
;ds:eax -> addresss of source `RangeRecList` used to build pivot's list
;es:edx -> address of buffer to store CaptureRecList
;Output:
;ds:eax -> saved
;es:edx -> saved
;
proc extractPivots uses esi edi
     local dPivotCnt : DWORD
     mov esi, eax
     mov edi, edx
     movzx ecx, byte [eax + RangeRecList.bRecCnt]
     mov dword [dPivotCnt], ecx
     mov byte [es: edx + CaptureRecList.dRecCnt], 0
     add eax, RangeRecList.records
     add edx, CaptureRecList.records
.mapLoop:
     cmp dword [dPivotCnt], 0
     jz .exit
     cmp dword [eax + MemRangeRec.dOffset], 0
     jz .nextRec 
.mapRec:
     inc dword [es: edi + CaptureRecList.dRecCnt]
     push eax edx
     mov ecx, dword [eax + MemRangeRec.dSize]
     ; sub ecx, dword [eax + MemRangeRec.dOffset]
     ; inc ecx
     mov eax, PageSize.bytes
     xchg ecx, eax
     cdq ;eax => edx:eax
     div ecx
     xchg ecx, eax ;ecx holds integer count of page in MemZone
     pop edx eax
     mov dword [es: edx + CaptureRangeRec.dNextPage], 0
     mov dword [es: edx + CaptureRangeRec.dPageCnt], ecx
     push dword [eax + MemRangeRec.dOffset]
     pop dword [es: edx + CaptureRangeRec.dMemOffset]
     add edx, sizeof.CaptureRangeRec
.nextRec:
     add eax, sizeof.MemRangeRec
     dec dword [dPivotCnt]
     jmp .mapLoop 
.exit:
     mov eax, esi
     mov edx, edi
ret
endp

;Input:
;es:eax -> CaptureRecList
;edx -> page count to be captured
;Output:
;es:eax -> `CaptureRecList` (saved in any case)
;if cf clear -> `edx` holds physical memory offset free to write
;if cf set -> requested page cnt is not available
;
proc captureMemory uses ebx eax 
     movzx ecx, byte [es: eax + CaptureRecList.dRecCnt]
     add eax, CaptureRecList.records
     mov ebx, eax
.searchLoop:
     mov eax, dword [es: ebx + CaptureRangeRec.dPageCnt]
     sub eax, dword [es: ebx + CaptureRangeRec.dNextPage]
     jle .nextRec
     cmp eax, edx ;edx holds capture cnt
     jae .foundRec
.nextRec:
     add ebx, sizeof.CaptureRangeRec
     loop .searchLoop
.notFound:
     stc
     jmp .exit
.foundRec: ;ebx holds Rec
     mov eax, dword [es: ebx + CaptureRangeRec.dNextPage]
     imul eax, PageSize.bytes ;relative offset
     add dword [es: ebx + CaptureRangeRec.dNextPage], edx ;add capture cnt
     add eax, dword [es: ebx + CaptureRangeRec.dMemOffset]
     mov edx, eax
     clc
.exit:
ret
endp

;@Declare{struct=PageManager}
;@Description {By this, to init PageManager is obligator only pass pointer to PageDirectory (or offset) Notes about OS: from the beginning, Operation system works without paging!}
struct PageManager 
{
        pPageDirectory dd ? ;page_directory holds pointers to PageTable -> so it's excessive to holds additional pointers
}
ends
;Input:
;eax -> physical offset
;edx -> virtual_offset
;Output:
;eax -> pointer in PageTable where entry is storing
;Notes:
;PageDirectory holds entry that marked as present (page directory is present)
;PageManager allocate memory only for PageTable
;Because pages should be addressed to, new allocated PageTable automatically marked
;Notes:
;To prevent excessive using of memory, it's highly recommended to pass only page-aligned physical offset
;
PageManager.markPage:


ret
;Input:
;eax -> virtual_address
;Output:
;if cf is clear - all is done
;if cf is set -> something goes wrong
;
PageManager.freePage:

ret
@@IDT String[$ mod 8]
;@Declare{struct=IDTEntry}
struct IDTEntry 
{
     .wLowOffset  dw ?
     .wSegment    dw ?
     .wFlags      dw ?
     .wHighOffset dw ?
}
ends

align 4
GlobalDescriptorTable:   
.null: GDTEntry.nullEntry
;dos entries
.kernelCode: GDTEntry.valueOf (base: 0, limit: 0xFFFFF, type: CodeSelector.Readable, level: 00b, present: 1, attr: SEG_ATTR_32_BIT, granularity: 1b)
.kernelData: GDTEntry.valueOf (base: 0, limit: 0xFFFFF, type: DataSelector.Writable, level: 00b, present: 1, attr: SEG_ATTR_32_BIT, granularity: 1b)
@@:
GlobalDescriptorTable.handle:
GDTHandle.valueOf @B - GlobalDescriptorTable, GlobalDescriptorTable
