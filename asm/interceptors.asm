format Elf
include 'PetOS/linker.inc'
include 'PetOS/format.inc'
IRQ_LINES_COUNT equ 16
;Input:
;eax -> the index of Interceptor to service
;
;Interceptors.service
section '.text' executable 
use32
public INTERCEPTOR_STUB_ARRAY
extrn 'interceptor_stub' as Interceptors.service
INTERCEPTOR_STUB_ARRAY:
rept IRQ_LINES_COUNT index: 0 
{
    dd stub#index
}
rept IRQ_LINES_COUNT index: 0
{
    stub#index:
        mov eax, index
        call Interceptors.service
        iret
}
