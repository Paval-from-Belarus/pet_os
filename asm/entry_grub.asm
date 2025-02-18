format Elf
use32
; The entry point to kernel
include 'linker.inc'
include 'format.inc'
include 'proc32.inc'

include 'include/Types.asm'
include 'include/Page.asm'
include 'include/Kernel.asm'
include 'include/Grub.asm'
include 'include/MMU.asm'

KERNEL_LOW_ADDRESSES_SIZE equ 0x100_000;

extrn 'KERNEL_STACK_TOP' as KernelStack.top
extrn 'KERNEL_STACK_SIZE' as KernelStack.size

extrn 'KERNEL_SIZE' as Kernel.staticSize

extrn 'main' as Kernel.run

extrn 'KERNEL_PHYSICAL_START' as Kernel.start
extrn 'KERNEL_PHYSICAL_END' as Kernel.end

extrn 'parse_grub_args' as Kernel.parseBootInfo

extrn KERNEL_VIRTUAL_OFFSET


extrn CONSOLE_WIDTH
extrn CONSOLE_HEIGHT

public EntryPoint as '_start'

section '.multiboot2_header' align 8


Header.size = Header.end - Header.start

Header.start:

dd GRUB_MAGIC_NUMBER
dd Architecture.i386
dd Header.size
dd  -(GRUB_MAGIC_NUMBER + Architecture.i386 + Header.size)

HeaderTag.tail

Header.end:


section '.loader' executable

EntryPoint:
    cmp eax, 0x36d76289
    jne Panic
    ; MultiBoot info is storing in at ebx
    test ebx, ebx
    jz Panic

    mov eax, Kernel.properties
    call Kernel.toPhysicalAddress
    push eax

    call Kernel.initBootAllocator

    mov eax, Kernel.parseBootInfo
    call Kernel.toPhysicalAddress

    mov edx, eax
    pop eax

    call edx
    cmp eax, 42 ;Okay code
    jne Panic

    todo 'Consider to use boot modules'
.init_kernel:

    call Kernel.setProtectedMode

ConfigureKernel:

    call Kernel.setPaging

Panic:
    hlt

;Input:
;None
;Output:
;ds -> data segment selector
;ss -> stack selector
;Notes:
;As conventional:
;GDT[1] entry is a code entry
;GDT[2] entry is a data entry
;All ― for kernel uses only
;
Kernel.setProtectedMode:
     cli

     mov eax, GlobalDescriptorTable.handle
     call Kernel.toPhysicalAddress

     mov edx, eax

     mov eax, GlobalDescriptorTable.start
     call Kernel.toPhysicalAddress
     mov dword [ds: edx + GDTHandle.dMemoryAddress], eax
     mov word  [ds: edx + GDTHandle.wTableSize], GlobalDescriptorTable.size

     lgdt [ds: edx]
     mov eax, cr0
     or eax, 1
     mov cr0, eax

    ; init data segments
     mov ax, 2 shl 3
     push ax ax ax
     pop ss ds es
     push ds 
     pop es
     mov ax, 0
    ;  push ax ax
    ;  pop fs gs ;fs ds are not used; so it' forbidden to use them

     mov eax, KernelStack.top
     call Kernel.toPhysicalAddress
     mov esp, eax

     mov eax, ConfigureKernel
     call Kernel.toPhysicalAddress
     
     push 1 shl 3
     push eax

     retf 

;Input:
;eax -> KernelProperties
;Output:
;eax -> saved
;Notes:
;Properties are configured in raw manner
;
Kernel.initBootAllocator:
push edx
    mov edx, eax
    add eax, PagingProperties.captureRecList + CaptureRecList.records
    mov dword [edx + PagingProperties.lpCaptureRec], eax
pop edx
ret

;Input:
;any register
;Output:
;eax holds pages count
;Notes:
; Only eax is affected
;
macro bytes_to_pages size*
{
    mov eax, size
    add eax, PageSize.bytes - 1
    shr eax, PageSize.shift 
}
;Input:
;eax -> KernelProperties
;Output:
;if cf clear -> all is done
;if cf set -> paging error (system crash)
;
Kernel.setPaging:
    mov eax, Kernel.properties
    call Kernel.toPhysicalAddress

    mov ebx, eax
    add ebx, KernelProperties.pages + PagingProperties.captureRecList
.acquireKernelSize:

     bytes_to_pages Kernel.staticSize

     push eax ;save the whole number of pages for kernel
     mov edx, eax 
     mov eax, ebx
     call captureMemory ;only acquire memory for kernel code

     jc .exit
     cmp edx, Kernel.start
     jne .exit

.initPaging:
     mov edx, 1 ;single page for directory
     call captureMemory

     jc .exit
     mov ebx, edx ;save directory offset

     mov edx, PageDirectory.ENTRIES_CNT
     call captureMemory

     jc .exit ;failed to allocated enought memory for PageTables -> it's impossible, but let make check
     mov ebp, edx ;save page tables in ebp
     mov eax, ebx ;restore directory offset
     call MMU.init
.configureKernel:
     mov eax, PageDirEntry.Present or PageDirEntry.Writable
     mov edx, PageTableEntry.Present or PageTableEntry.Writable
     ;mov ebx, ebx
.identityMapping:
    pop edi
    push edi
    pusha
    mov ecx, edi

    mov esi, Kernel.start
    mov edi, Kernel.start
    call MMU.markRegion

    popa
.highMapping:
     pop ecx ;restore the count of pages for kernel
     add ecx, (KERNEL_LOW_ADDRESSES_SIZE + PageSize.bytes - 1) / PageSize.bytes ;the main idea to use lower addresses in kernel is to use V8086
     xor esi, esi
     mov edi, KERNEL_VIRTUAL_OFFSET ;map to higher addresses
     call MMU.markRegion
.markPageDirectory:
     add edi, ebx ;no needs to substract KERNEL_PHYSICAL_OFFSET from edi because virtual mapping accept low addresses as a part of kernel
     ;add edi, ebx - KERNEL_PHYSICAL_OFFSET + KERNEL_LOW_ADDRESSES_SIZE
     mov esi, ebx
     mov eax, PageDirEntry.Present or PageDirEntry.Writable
     mov edx, PageTableEntry.Present or PageTableEntry.Writable
     mov ecx, 1 ;PageDirectory occure only 1 page
     ;mov ebx, ebx
     call MMU.markRegion

.markPageTables:
     add edi, PageSize.bytes
     mov esi, ebp

     mov eax, PageDirEntry.Present or PageDirEntry.Writable
     mov edx, PageTableEntry.Present or PageTableEntry.Writable
     mov ecx, PageDirectory.ENTRIES_CNT
     ;mov ebx, ebx
     call MMU.markRegion
     add edi, PageDirectory.ENTRIES_CNT * PageSize.bytes ;next virtual address

    ; edi holds pointer to heap offset
.createInterruptStack:
    ; Stack is assigned in Kernel.staticSize
    ;  mov eax, KernelStack.size
    ;  add eax, PageSize.bytes - 1
    ;  mov ecx, PageSize.bytes
    ;  cdq
    ;  div ecx
    ;  mov edx, eax ;count of pages for stack
    ;  push eax ;save count of pages
    ;  mov eax, Kernel.pagingProperties + PagingProperties.captureRecList
    ;  call captureMemory
    ;  pop ecx ;quickly restore page count
    ;  jc .exit ;impossible to capture stack memory; year stack is not clear, but hlt never return...
    ;  ;mov edi, edi
    ;  mov esi, edx
    ;  mov eax, PageDirEntry.Present or PageDirEntry.Writable
    ;  mov edx, PageTableEntry.Present or PageTableEntry.Writable
    ;  ;mov ebx, ebx
    ;  push ecx
    ;  call MMU.markRegion
    ;  pop ecx ;restore page count
     ;now all prepositions for paging are done; let's copy kernel to hight addresse
.configureProperties:
    mov eax, Kernel.properties
    call Kernel.toPhysicalAddress
    mov edx, eax

    add edx, KernelProperties.pages

     ;consider to check each stask access
     mov dword [edx + PagingProperties.lpHeap], edi ;already as virtual address

     mov eax, ebx
     call Kernel.toVirtualAddress
     mov dword [edx + PagingProperties.lpPageDirectory], eax

     mov dword [edx + PagingProperties.lpGDTHandle], GlobalDescriptorTable.handle
     mov dword [edx + PagingProperties.lpCaptureRec], Kernel.properties + PagingProperties.captureRecList + CaptureRecList.records

     mov ecx, Kernel.properties
     mov eax, ebx
     mov edx, KernelStack.top
     call Kernel.switchPaging
.exit:
hlt ;never return

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
     cmp dword [es: ebx + CaptureRangeRec.dMemOffset], Kernel.start
     jl .nextRec

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

;Input:
;eax -> physical offset
;Output:
;eax -> virtual offset
;all registers are saved
;Notes:
;add to value KERNEL_VIRTUAL_OFFSET and KERNEL_PHYSICAL_OFFSET 
;
Kernel.toVirtualAddress:
    add eax, KERNEL_VIRTUAL_OFFSET
ret

;Input:
;eax -> physical offset
;Output:
;eax -> virtual offset
;all registers are saved
;Notes:
;add to value KERNEL_VIRTUAL_OFFSET and KERNEL_PHYSICAL_OFFSET 
;
Kernel.toPhysicalAddress:
    sub eax, KERNEL_VIRTUAL_OFFSET
ret

section '.data' writeable 

Kernel.properties KernelProperties

GlobalDescriptorTable.start:

.null: GDTEntry.nullEntry
.kernelCode: GDTEntry.valueOf (base: 0, limit: 0xFFFFF, type: CodeSelector.Readable, level: 00b, present: 1, attr: SEG_ATTR_32_BIT, granularity: 1b)
.kernelData: GDTEntry.valueOf (base: 0, limit: 0xFFFFF, type: DataSelector.Writable, level: 00b, present: 1, attr: SEG_ATTR_32_BIT, granularity: 1b)

.userCode: GDTEntry.valueOf (base: 0, limit: 0xFFFFF, type: CodeSelector.Readable, level: 11b, present: 1, attr: SEG_ATTR_32_BIT, granularity: 1b)
.userData: GDTEntry.valueOf (base: 0, limit: 0xFFFFF, type: DataSelector.Writable, level: 11b, present: 1, attr: SEG_ATTR_32_BIT, granularity: 1b)

GlobalDescriptorTable.end:

GlobalDescriptorTable.size = GlobalDescriptorTable.end - GlobalDescriptorTable.start

GlobalDescriptorTable.handle:
GDTHandle.valueOf GlobalDescriptorTable.size, GlobalDescriptorTable.start