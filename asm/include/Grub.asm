;@Declare{enum=Architecture}
Architecture.i386 = 0
Architecture.MIPS = 4


GRUB_MAGIC_NUMBER equ 0xe85250d6


;Multiboot2 header
;@Declare{struct=HeaderTag}
struct HeaderTag
{
    .wType dw ? 
    .wFlags dw ?
    .dSize dd ?
}
ends

;@Declare{struct=HeaderTag}
;Input:
;type --> u16 as HeaderTagType
;Notes:
;Very useful
;
macro HeaderTag.valueOf Params&
{
    local isMatched
    isMatched equ 0
    match =( =type =: type =, =flags =: flags =,\
             =size =: sizeAfter =), Params
    \{
        isMatched equ 1
        \local label
        label HeaderTag
        size = sizeAfter + sizeof.HeaderTag
        store word type at label + HeaderTag.wType
        store word flags at label + HeaderTag.wFlags
        store word size at label + HeaderTag.dSize
    \}

    match =0, isMatched 
    \{
        'Syntax error in HeaderTag.valueOf'
    \}
}

;@Declare{enum=HeaderTag}
macro HeaderTag.tail
{
    HeaderTag.valueOf ( type: HeaderTagType.TAIL, flags: 0, size: 0 ) 
}

;@Declare{enum=HeaderTag}
macro HeaderTag.infoRequest
{

}

;@Declare{enum=HeaderTag}
;@Description{Physical offset to which loader should jump must be provided. Suitable for EFI-compatible OS on i386}
;Example: HeaderTag.i386Loader (0x222)
macro HeaderTag.i386Loader Params&
{
    HeaderTag.loader ( type : HeaderTagType.EFI_I386 , Params)
}


;@Declare{enum=HeaderTag}
;@Description{Physical offset to which loader should jump must be provided. Suitable for EFI-compatible OS on i386}
macro HeaderTag.amd64Loader Params&
{
    HeaderTag.loader ( type : HeaderTagType.EFI_AMD64 , Params)
}



;@Declare{enum=HeaderTag}
;@Description{Physical offset to jump}
;Example: HeaderTag.loader ( type : 12, (0x122) )
macro HeaderTag.loader Params& 
{
    local isMatched
    isMatched equ 0
    match =( =type =: osType =, =( offset =)   =) , Params
    \{
        isMatched equ 1
        @@:
            HeaderTag.valueOf ( type: osType, flags: 0, size: 4  ) ;size of ptr on x86
            dd offset
    \}

    match =0 , isMatched
    \{
        'Offset should be provided'
    \}
}

;@Declare{enum=HeaderTag}
;@Description{Specify that grub modules should page aligned}
macro HeaderTag.alignment
{
    HeaderTag.valueOf ( type: HeaderTagType.MODULE_ALIGN, flags: 0, size: 0 )
}

macro HeaderTag.frameBuffer width*, height*
{
    HeaderTag.valueOf ( type: HeaderTagType.FRAME_BUFFER, flags: 0, size: 3 * 4 )
    dd width
    dd height
    dd 8
}

; bssEnd -> the end of heap which should be filled with zeroes
macro HeaderTag.address headerAddr*, textStart*, textEnd*
{
    HeaderTag.valueOf ( type: HeaderTagType.ADDRESS, flags: 0, size: 4 * 4)
    @@:
        dd headerAddr
        dd textStart
        dd textEnd
        dd textEnd
    ; assert @B - $ == 16
}


;@Declare{enum=HeaderTagType}
HeaderTagType.TAIL equ 0
HeaderTagType.INFO equ 1
HeaderTagType.ADDRESS equ 2
HeaderTagType.CONSOLE_FLAGS equ 4
HeaderTagType.FRAME_BUFFER equ 5
HeaderTagType.MODULE_ALIGN equ 6
HeaderTagType.EFI_I386 equ 8
HeaderTagType.EFI_AMD64 equ 9
HeaderTagType.RELOCATION equ 10


;@Declare{struct=MultiBootInfo}
struct MultiBootInfo
{
    .dTotalSize dd ?
    .dReserved  dd ?
    .tags:
}
ends

struct BootMemoryInfo 
{
    .dType dd ?
    .dSize dd ?
    .dMemLower dd ?
    .dMemUpper dd ?
}
ends

BootMemoryInfo.size = 16
BootMemoryInfo.type = 4

struct BootCommandLine
{
    .dType dd ?
    .dSize dd ? ;the size of zero string
    .szArgs db ? ;zero terminated string
}
ends

BootCommandLine.type = 1