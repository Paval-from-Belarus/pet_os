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

        size = sizeAfter + sizeOf.HeaderTag
        store word type at label + HeaderTag.wType
        store word flags at label + HeaderTag.wFlags
        store word size at label + HeaderTag.dSize
    \}

    match =0, isMatched 
    \{
        'Syntax error in HeaderTag.valueOf'
    \}
}
macro HeaderTag.lastTag {
    HeaderTag.valueOf
}