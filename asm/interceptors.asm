format Elf
include 'linker.inc'
include 'format.inc'
include 'include/Types.asm'
include 'include/Kernel.asm'
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
        push ds es fs gs ;fasm produce valid 32 bit code

        pusha

        mov eax, index
        mov edx, esp ;TaskContext

        call Interceptors.service

        mov esp, eax

        popa
        mov esp, dword [esp - 4 * 5] ; use value in stack frame to restore esp

        pop gs fs es ds

        iret
}



public switch_context

;Input:
;ds:eax -> address of TaskContext::data to save
;ds:edx -> address of the next TaskContext
;Notes: as this function is invoked in kernel,
;ds, es, fs, gs, ss are known
;This function will assume that eflags, cs and eip 
;are storing on stack frame (to built TaskContext from stack frame) 
;
switch_context:
    ;pushing esp, ss is redundant
    ;as this method is already called from kernel space

    push ds es fs gs

    pusha

    ;we have built TaskContext on stack
    ;need a copy this one to real TaskContext

    cld
    mov edi, eax
    mov esi, esp
    mov ecx, sizeof.TaskContext
    rep movsb

    ;adjust esp to stack after popa
    add esp, TaskContext.dataSegments
    mov dword [ds:eax + TaskContext.esp], esp

    mov esp, edx ;switch to another task context

    popa

    mov esp, dword [esp - 4 * 5] ; use value in stack frame to restore esp

    pop gs fs es ds

    iret

public run_process_routine

;Input:
;eax -> entry point
;low 16 bits of edx (dx) -> data segment (as ss)
;high 16 bits of edx -> code segment
;ecx -> esp to switch
;ebx -> argument
;
run_process_routine:
    mov es, dx
    mov ds, dx
    mov fs, dx
    mov gs, dx

    push (4 shl 3) or 3 ;ss
    ; shr edx, 16 ;dx holds cs

    push ecx
    push 200h; eflags with enabled interrupts
    
    push (3 shl 3) or 3
    ; push edx ;cs, but iret 
    push eax

    iret


public breakpoint

breakpoint:
    push eax
    mov eax, 42
    pop eax
    ret


public _syscall
extrn handle_syscall

_syscall:
    call handle_syscall
    iret
