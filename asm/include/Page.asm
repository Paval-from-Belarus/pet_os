
;@Declare{enum=ScopeHandle}
ScopeHandle.Null equ 0
;@Declare{struct=PageInfoRec}
;@Description{Kernel representation of page memory region. Each PageInfoRec specify the 4KiB Memory region}
struct PageInfoRec 
{
    .pNext dd ?
    .pPrev dd ?
    .dFlags dd ? 
    .dMemOffset dd ? ;specify the 
}
ends
assert sizeof.PageInfoRec <= 32
struct MemZoneRec 
{
    .dFreePageCnt dd ? ;what is a purpose of using 
    .dUsedPageCnt dd ? ;this fields???
    .pAreaLists dd ? ;pointer to array of pointers 
    .pFreePages dd ?
    .pUsedPages dd ?
}
ends
struct ListAreaHeader
{
    .pNextRec dd ? ;pointer to page area rec
    .dRecCnt dd ?
}
ends
struct ListAreaRec
{
    .pNextRec dd ?
    .pSlabRec dd ? ;the info that holds all info about current area
    .hFirst   dd ? ;the index of first page in area
    .dPageCnt dd ?
}
ends
struct SlabAreaRec
{
    .pNextSlab dd ?
    .hFirst    dd ? ;the index of first page in common area
    .dUsedCnt  dd ? ;to restore 
    .dPageCnt  dd ? ;the common cnt
    .dSlabId   dd ?
}
ends
;@Declare{enum=PageSize}
PageSize.Huge equ 1 ;4MiB
PageSize.Small equ 0 ;4KiB
PageSize.mode equ PageSize.Small
PageSize.bytes equ 4096
PageSize.shift equ 12

struct PageDirEntry 
{
    .bFlag db 0
    .offsetAndStatus:
    db 0
    dw 0
}
ends
assert sizeof.PageDirEntry = 4

;@Declare{enum=PageTable}
PageTable.ENTRIES_CNT equ 1024
;@Declare{enum=PageDirectory}
PageDirectory.ENTRIES_CNT equ 1024

;@Declare{enum=PageDirEntry}
PageDirEntry.HugeSize equ 10_000_000b ;for 4MiB pages
PageDirEntry.Accessed equ 100_000b
PageDirEntry.CacheDisabled equ 100_00b
PageDirEntry.WriteThrough equ 1000b
PageDirEntry.NoPrivilege equ 100b
PageDirEntry.Writable equ 10b
PageDirEntry.Present equ 1b
PageDirEntry.Empty equ 0b
PageDirEntry.ADDR_BIT_OFFSET equ 12
PageDirEntry.bytes equ 4
;@Declare{enum=PageTableEntry}
PageTableEntry.Global equ 10_000_000b
PageTableEntry.Dirty equ 1_000_000b
PageTableEntry.Accessed equ 100_000b
PageTableEntry.CacheDisabled equ 100_00b
PageTableEntry.WriteThrough equ 1000b
PageTableEntry.NoPrivilege equ 100b
PageTableEntry.Writable equ 10b
PageTableEntry.Present equ 1b
PageTableEntry.Empty equ 0b
PageTableEntry.ADDR_BIT_OFFSET equ 12
PageTableEntry.bytes equ 4
macro PageDirEntry.valueOf Params&
{
    local label
    label PageDirEntry
    match =(cache: cacheBit =, =through: throughBit =, =user: userBit =, =write: writeMode =,\
            =present: presentBit =, 
}
struct GDTEntry  
{
    .wLowSegLimit dw 0
    .wLowBaseAddr dw 0
    .bMiddleBaseAddr db 0
    .bFirstFlag db 0 ;type, privilege level, present flag
    .bSecondFlag db 0 ;limit (16-19), attributes, granularity
    .bHighBaseAddr db 0
}
ends
assert sizeof.GDTEntry = 8
struct GDTHandle ;handle for lgdt
{
    .wTableSize  dw 0 ;size of GDT
    .dMemoryAddress dd 0 ;memory address of GDT
}
ends

assert sizeof.GDTHandle * 8 = 48

macro GDTHandle.valueOf size*, address*
{
    dw size
    dd address
}
MAX_BASE_VALUE equ 0FF_FF_FF_FFh
MAX_LIMIT_VALUE equ 0F_FF_FFh
PRIORITY_LEVEL_MASK equ 10011111b ;erase only priority level
TYPE_VALUE_MASK equ 11100000b ;erase only type value
;all codes below are used for data-code segments (not for system)
;@Declare{enum=SelectorType}
;@Description{Following constants are used as part of following selector types}
SelectorType.System equ 00000b
SelectorType.Data equ 10000b
SelectorType.Code equ 11000b
;@Declare{enum=DataSelector}
;@Description{By default, data selector is readable only}
DataSelector.Accessed equ SelectorType.Data or 1b ;not used
DataSelector.Writable equ SelectorType.Data or 10b
DataSelector.Downable equ SelectorType.Data or 100b
;@Declare{enum=CodeSelector}
;@Description{By default, code selector is executable only}
CodeSelector.Accessed equ SelectorType.Code or 1b
CodeSelector.Readable equ SelectorType.Code or 10b
CodeSelector.Conforming equ SelectorType.Code or 100b
;@Declare{enum=SystemSelector}
SystemSelector.FreeTSS_16bit equ SelectorType.System or 1b
SystemSelector.LDT equ SelectorType.System or 10b
SystemSelector.BusyTSS_16bit equ SelectorType.System or 11b
SystemSelector.FreeTSS_32bit equ SelectorType.System or 1001b
SystemSelector.BusyTSS_32bit equ SelectorType.System or 1011b
;@Declare{enum=GateSelector}
GateSelector.Task equ SelectorType.System or 101b
GateSelector.Call_16bit equ SelectorType.System or 100b
GateSelector.Interrupt_16bit equ SelectorType.System or 110b
GateSelector.Trap_16bit equ SelectorType.System or 111b
GateSelector.Call_32bit equ SelectorType.System or 1100b
GateSelector.Interrupt_32bit equ SelectorType.System or 1110b
GateSelector.Trap_32bit equ SelectorType.System or 1111b

  ;is possible to access executable code by different level
  ;should be used by interrupts' and exceptions' handlers
; ; DATA_SEG_READABLE equ 10000b
; ; DATA_SEG_READ_WRITABLE equ 10010b
; ; DATA_SEG_READ_DOWNABLE equ 10100b
; DATA_SEG_READ_WRITE_DOWNABLE equ 10110b
; CODE_SEG_EXECUTABLE equ 11000b
; CODE_SEG_EXECUTABLE_CONFIRMABLE equ 11100b 
CODE_SEG_EXECUTABLE_READABLE equ 11010b
CODE_SEG_EXECUTABLE_READABLE_CONFIRMABLE equ 11110b
SEGMENT_ACCESSED equ 0001b

SEG_ATTR_16_BIT equ 000b
SEG_ATTR_32_BIT equ 100b
ATTRIBUTES_VALUE_MASK equ 10001111b
SEGMENT_TYPE_DATA_CODE equ 10000b
SEGMENT_TYPE_READABLE equ 10b
SEGMENT_TYPE_CONFIRMED equ 100b

SEGMENT_TYPE_CODE equ 1000b ;data is default
ATTRIBUTE_SIZE_BIT equ 100b ;if set -> only 32-bit mode, else 16-bit
ATTRIBUTE_SYSTEM_PROGRAMMER equ 001b

;@Declare{macro=GDTEntry.storePriorityLevel}
;Input:
;dest -> GDTEntry offset (not memory, but offset)
;level -> 2-bit value (or 8-bit register or imm8)
;Output: GDTEntry holds value
;
macro GDTEntry.storePriorityLevel dest*, level* 
{
    local wasAdded 
    wasAdded = 0
    if (level eqType 111) & ((level and 011b) <>  level)
        'Illegal value for priority level'
    end if
    if (level eqType al) ;run-time settings
        wasAdded = 1
        and byte [dest + GDTEntry.bFirstFlag], PRIORITY_LEVEL_MASK
        and level, 011b
        shl level, 5
        or byte [dest + GDTEntry.bFirstFlag], level
    end if
    if (level eqType 111)
        wasAdded = 1
        local flag_value
        load flag_value byte from dest + GDTEntry.bFirstFlag
        flag_value = flag_value and PRIORITY_LEVEL_MASK
        flag_value = flag_value or ((level and 011b) shl 5)
        store byte flag_value at dest + GDTEntry.bFirstFlag
    end if
    if (wasAdded <> 1) 
        'Illegal input type'
    end if
}
;Input:
;dest -> GDTEntry offset (not memory, but exactly offset)
;base -> 32-bit value (in register or as imm32)
;Output:
;on dest base addr is storing correctly
;
macro GDTEntry.storeBaseAddr dest*, base*
{
    local wasAdded
    wasAdded = 0
    if (base eqType 111) & (base > MAX_BASE_VALUE)
        'Base value is too much!'
    end if
    if (base eqType eax)
        wasAdded = 1
        and dword [dest], 0x00_FFFF_00_0000_FFFF ;erase only certain bytes
        push base base
        and base, 0FF_FFh
        or dword [dest + GDTEntry.wLowBaseAddr], base
        pop base
        shr base, 16
        and base, 0xFF
        or dword [dest + GDTEntry.bMiddleBaseAddr], base
        pop base
        shr base, 24
        ; and base, 0xFF
        or dword [desg + GDTEntry.bHighBaseAddr], base
    end if
    if (base eqType 111)
        local low_word
        local middle_byte
        local high_byte
        low_word = base and 0FF_FFh
        middle_byte = (base shr 16) and 0FFh
        high_byte = (base shr 24) and 0FFh
        wasAdded = 1
        store word low_word at dest + GDTEntry.wLowBaseAddr
        store byte middle_byte at dest + GDTEntry.bMiddleBaseAddr
        store byte high_byte at dest + GDTEntry.bHighBaseAddr
    end if
    if (wasAdded <> 1) 
        'Illegal input type'
    end if
}
;Input:
;dest -> GDTEntry offset (not memory, but exactly offset)
;base -> 32-bit value (in register or as imm32)
;Output:
;on dest seg limit is storing correctly
;
macro GDTEntry.storeLimit dest*, limit* 
{
    local wasAdded
    wasAdded = 0
    if (limit eqType 111) & (limit > MAX_LIMIT_VALUE)
            'Limit value is too much!'
    end if
    if (limit eqType 111) 
        wasAdded = 1
        local low_word 
        local flag_value
        local high_byte
        high_byte = (limit shr 16) and 01111b ;only 4 bits
        low_word = limit and 0xFFFF
        load flag_value byte from dest + GDTEntry.bSecondFlag
        flag_value = flag_value and (not 01111b) or high_byte
        store word low_word at dest + GDTEntry.wLowSegLimit
        store byte flag_value at dest + GDTEntry.bSecondFlag
    end if
    if (limit eqType eax)
        wasAdded = 1
        and limit, MAX_LIMIT_VALUE
        and dword [dest], 0xFFF0_FFFF_FFFF_0000 ;erase only 
        push limit
        and limit, 0xFFFF
        or dword [dest + GDTEntry.wLowSegLimit], limit
        pop limit
        shr, 16
        and limit, 01111b
        or dword [dest + GDTEntry.bSecondFlag], limit
    end if
    if (wasAdded <> 1) 
        'Illegal input type'
    end if
}
;Input:
;dest -> GDTEntry offset (not memory, but exactly offset)
;base -> 8-bit value (in register or as imm32)
;Output:
;on dest gdt type is storing correctly
;
macro GDTEntry.storeType dest*, type* 
{
    local wasAdded 
    wasAdded = 0
    if (type eqType 111) & ((type and 011111b) <> type) 
        'Illegal type value'
    end if 
    if (type eqType 111) 
        wasAdded = 1
        local flag_value
        load flag_value byte from dest + GDTEntry.bFirstFlag
        flag_value = (flag_value and (TYPE_VALUE_MASK) or (type and (not TYPE_VALUE_MASK)))
        store byte flag_value at dest + GDTEntry.bFirstFlag
    end if
    if (type eqType al) 
        wasAdded = 1
        and type, (not TYPE_VALUE_MASK)
        and byte [dest + GDTEntry.bFirstFlag], TYPE_VALUE_MASK
        or byte [dest + GDTEntry.bFirstFlag], type
    end if 
    if (wasAdded <> 1) 
        'Illegal input type'
    end if
}
macro GDTEntry.storeAttributes dest*, attributes*
{
    local wasAdded
    wasAdded = 0
    if (attributes eqType 111) & ((attributes and 0111b) <> attributes) 
            'Illegal value for attributes'
    end if
    if (attributes eqType 111)
        wasAdded = 1
        local flag_value
        load flag_value byte from dest + GDTEntry.bSecondFlag
        flag_value = (flag_value and ATTRIBUTES_VALUE_MASK or (((attributes shl 4) and (not ATTRIBUTES_VALUE_MASK))))
        store byte flag_value at dest + GDTEntry.bSecondFlag
    end if
    if (attributes eqType al)
        wasAdded = 1
        and byte [dest + GDTEntry.bSecondFlag], ATTRIBUTES_VALUE_MASK
        shl attributes, 4
        and attributes, ATTRIBUTES_VALUE_MASK
        or byte [dest + GDTEntry.bSecondFlag], attributes
    end if
    if (wasAdded <> 1) 
        'Illegal input type'
    end if
}
macro GDTEntry.storeGranularityBit dest*, bit*
{
    local wasAdded 
    wasAdded = 0
    if (bit eqType 1) & ((bit and 01h) <> bit)
        'Granularity bit is not correct'
    end if 
    if (bit eqType 11) 
        wasAdded = 1
        local flag_value
        load flag_value byte from dest + GDTEntry.bSecondFlag
        flag_value = (flag_value and 0x7F) or (bit shl 7)
        store byte flag_value at dest + GDTEntry.bSecondFlag
    end if
    if (wasAdded <> 1) 
        'Illegal input type'
    end if
}
macro GDTEntry.storePresentFlagBit dest*, bit* 
{
    local wasAdded 
    wasAdded = 0
    if ((bit and 01b) <> bit)
            'Illegal value for granularity'
    end if
    if  (bit eqType 11) 
        wasAdded = 1
        local flag_value
        load flag_value byte from dest + GDTEntry.bFirstFlag
        flag_value = (flag_value and 0x7F) or (bit shl 7)
        store byte flag_value at dest + GDTEntry.bFirstFlag
    end if
    if (wasAdded <> 1) 
        'Illegal input type'
    end if
}
macro GDTEntry.nullEntry
{
    . GDTEntry
}
macro GDTEntry.valueOf Params&
{
    local is_matched
    is_matched equ 0
    match =( =base =: base_addr =, =limit =: limit_value =, =type =: type_value =, =level =: level_value =,\
      =present =: present_flag =, =attr =: attributes =, =granularity =: granularity =), Params 
    \{
        is_matched equ 1
        \local label
        label GDTEntry
        GDTEntry.storeLimit label, limit_value
        GDTEntry.storeBaseAddr label, base_addr
        GDTEntry.storePriorityLevel label, level_value
        GDTEntry.storeType label, type_value
        GDTEntry.storeAttributes label, attributes
        GDTEntry.storePresentFlagBit label, present_flag
        GDTEntry.storeGranularityBit label, granularity

    \}
    match =0, is_matched 
    \{
        'Syntax error'
    \}
}