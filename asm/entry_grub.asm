format Elf
use32
; The entry point to kernel
include 'linker.inc'
include 'format.inc'

include 'include/Types.asm'
include 'include/Page.asm'
include 'include/Kernel.asm'
include 'include/Grub.asm'


extrn 'KERNEL_STACK_SIZE' as KernelStack.size
extrn 'KERNEL_SIZE' as Kernel.size
extrn 'main' as Kernel.run
extrn KERNEL_VIRTUAL_OFFSET
extrn KERNEL_PHYSICAL_OFFSET
extrn CONSOLE_WIDTH
extrn CONSOLE_HEIGHT

public EntryPoint as '_start'


section '.header' align 8

;org KERNEL_PHYSICAL_OFFSET

HEADER_SIZE = Header.end - Header.start

Header.start:

dd GRUB_MAGIC_NUMBER
dd Architecture.i386
dd HEADER_SIZE
dd  -(GRUB_MAGIC_NUMBER + Architecture.i386 + HEADER_SIZE)

HeaderTag.alignment
HeaderTag.i386Loader (EntryPoint)
HeaderTag.frameBuffer CONSOLE_WIDTH, CONSOLE_HEIGHT
HeaderTag.address ()
HeaderTag.tail
Header.end:


section '.loader' executable
EntryPoint:
    ;perform configuration of 
    mov eax, Kernel.properties
    jmp Panic

Panic:
    hlt

section '.data' writeable 

Kernel.properties PagingProperties

Table.start:

.null: GDTEntry.nullEntry
; DOS entries?
.kernelCode: GDTEntry.valueOf (base: 0, limit: 0xFFFFF, type: CodeSelector.Readable, level: 00b, present: 1, attr: SEG_ATTR_32_BIT, granularity: 1b)
.kernelData: GDTEntry.valueOf (base: 0, limit: 0xFFFFF, type: DataSelector.Writable, level: 00b, present: 1, attr: SEG_ATTR_32_BIT, granularity: 1b)

Table.end:

Table.size = Table.end - Table.start

GlobalDescriptorTable.handle:
GDTHandle.valueOf Table.size, Table.start