format Elf
use32
; The entry point to kernel
include 'linker.inc'
include 'format.inc'

include 'include/Types.asm'
include 'include/Page.asm'
include 'include/Kernel.asm'
include 'include/Grub.asm'

extrn 'KERNEL_SIZE' as Kernel.size
extrn 'main' as Kernel.run
extrn KERNEL_VIRTUAL_OFFSET
extrn KERNEL_PHYSICAL_OFFSET

public EntryPoint as '_start'
; public Kernel.GDT as KERNEL_GDT

section '.header' align 4

Header:

HEADER_SIZE = Header.end - Header.start

.start:

dd GRUB_MAGIC_NUMBER
dd Architecture.i386
dd HEADER_SIZE
dd 0x100_000_000 - (GRUB_MAGIC_NUMBER + Architecture.i386 + HEADER_SIZE)

.end:


section '.loader' executable align 4
EntryPoint:

section '.data'
Kernel.properties PagingProperties
Kernel.GDT:

Table:
.start:

.null: GDTEntry.nullEntry
; DOS entries?
.kernelCode: GDTEntry.valueOf (base: 0, limit: 0xFFFFF, type: CodeSelector.Readable, level: 00b, present: 1, attr: SEG_ATTR_32_BIT, granularity: 1b)
.kernelData: GDTEntry.valueOf (base: 0, limit: 0xFFFFF, type: DataSelector.Writable, level: 00b, present: 1, attr: SEG_ATTR_32_BIT, granularity: 1b)

Table.end:

Table.size =  Table.end - Table.start

GlobalDescriptorTable.handle:
todo 'Fix relocation problem'
; GDTHandle.valueOf Table.size, Table.offset