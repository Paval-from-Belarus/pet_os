MAX_KERNEL_SIZE = 500 * 1024 ; the size of kernel in kilobytes 
MIN_DOS_STACK_SIZE = 1024;
DOS_STACK_OFFSET = 0xFFFF
;Paging data structures
;@Declare{struct=MemRangeRec}
struct MemRangeRec ;for usable memory ranges only
{
	.dOffset dd ? ;physical offset
	.dSize dd ? ;size of memory layout
	;!consider to add memory type
}
ends
;@Declare{struct=CaptureRangeRec}
struct CaptureRangeRec 
{
	.dMemoryKind dd ? ;memory kind
	.dNextPage dd ? ;index of next page
	.dPageCnt dd ? ;count of pages in current memory range
	.dMemOffset dd ? ;physical memory offset
}
ends
RangeRecList.MAX_CAPACITY = 10
;@Declare{struct=RangeRecList}
struct RangeRecList
{
	.bRecCnt db ?
	.records db RangeRecList.MAX_CAPACITY * sizeof.MemRangeRec DUP (0)
}
ends
CaptureRecList.MAX_CAPACITY = 10

;@Declare{struct=CaptureRecList}
struct CaptureRecList 
{
	.dRecCnt dd CaptureRecList.MAX_CAPACITY
	.records db CaptureRecList.MAX_CAPACITY * sizeof.CaptureRangeRec DUP (0)
}
ends

;@Declare{struct=PagingProperties}
struct PagingProperties 
{
	.lpPageDirectory dd ?
	.lpGDTHandle dd ?
	.lpHeap dd ? ;the offset in memory available to be marked as heap for kernel
	.lpCaptureRec dd ? ;the conventional offset
	.captureRecList CaptureRecList ;upper level uses only dRecCnt
}
ends

;@Declare{struct=KernelProperties}
struct KernelProperties
{
	.pages PagingProperties
}
ends

;@Declare{struct=LoaderProperties}
struct LoaderProperties
{
	.bBootDevice db ?
	.rangeList RangeRecList ;exactly in data segment => by another way, it's easy to forget about stack
}
ends

;@Declare{struct=TaskContext}
struct TaskContext 
{
.baseRegisters:
	.edi dd ?
	.esi dd ?
	.ebp dd ?
	.esp dd ?
	.ebx dd ?
	.edx dd ?
	.ecx dd ?
	.eax dd ?


.dataSegments:
    .gs dw ?
	.reserved_1 dw ?
    .fs dw ?
    .reserved_2 dw ?
    .es dw ?
    .reserved_3 dw ?

    .ds dw ?
    .reserved_4 dw ?


    .eip dd ?

    .cs dw ?
    .reserved_5 dw ?
    .eflags dd ?
}
ends
