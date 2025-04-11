; ata_driver.asm
; ATA disk driver for primary master (PIO, LBA28) in FASM
; Compatible with custom kernel, testable in Bochs

format ELF
; Constants
ATA_PRIMARY_BASE equ 0x1F0
ATA_REG_DATA     equ 0x0   ; Data port
ATA_REG_ERROR    equ 0x1   ; Error register
ATA_REG_SECCOUNT equ 0x2   ; Sector count
ATA_REG_LBA_LOW  equ 0x3   ; LBA bits 0-7
ATA_REG_LBA_MID  equ 0x4   ; LBA bits 8-15
ATA_REG_LBA_HIGH equ 0x5   ; LBA bits 16-23
ATA_REG_DRIVE    equ 0x6   ; Drive select
ATA_REG_STATUS   equ 0x7   ; Status/command
ATA_CONTROL      equ 0x3F6 ; Control port

;@Declare{enum=Register}
Register.BASE equ 1F0h

;@Declare{enum=Command}
Command.READ equ 20h
Command.WRITE equ 30h
Command.IDENTIFY equ 0ECh
Command.FLUSH equ 0E7h

;@Declare{enum=DiskStatus}
DiskStatus.BUSY equ 80h
DiskStatus.DATA equ 08h
DiskStatus.ERROR equ 01h

ATA_CMD_READ     equ 0x20  ; Read sectors
ATA_CMD_WRITE    equ 0x30  ; Write sectors
ATA_CMD_IDENTIFY equ 0xEC  ; Identify device
ATA_CMD_FLUSH    equ 0xE7  ; Flush cache


; Delay loop count for polling
DELAY_COUNT      equ 1000

section '.text' executable
use32
; Exported functions
public ata_init
public ata_read
public ata_write

;Input:
;Output:
;eax holds status code:
; 0: found and configure
; 1: not found
; 2: timeout
; 3: disk error
;
ata_init:
    mov dx, ATA_PRIMARY_BASE + ATA_REG_DRIVE
    mov al, 0xA0  ; Master drive, LBA
    out dx, al

    mov dx, ATA_CONTROL
    mov al, 0x04  ; Set SRST
    out dx, al
    call delay
    mov al, 0x00  ; Clear SRST
    out dx, al
    call delay

    ; Check if drive exists
    mov dx, ATA_PRIMARY_BASE + ATA_REG_STATUS
    in al, dx
    cmp al, 0x00
    je .no_drive
    cmp al, 0xFF
    je .no_drive

    ; Wait for drive to be ready
    mov ecx, DELAY_COUNT
.wait_ready:
    mov dx, ATA_REG_STATUS
    in al, dx
    test al, DiskStatus.BUSY
    jz .check_drq
    call delay

    loop .wait_ready
    jmp .timeout

.check_drq:
    test al, DiskStatus.DATA
    jnz .send_identify
    call delay

    loop .wait_ready
    jmp .timeout

.send_identify:
    ; Send IDENTIFY command
    mov dx, ATA_PRIMARY_BASE + ATA_REG_STATUS
    mov al, ATA_CMD_IDENTIFY
    out dx, al

    ; Check status
    in al, dx
    cmp al, 0
    je .no_drive

    ; Wait for data
    mov ecx, DELAY_COUNT
.wait_data:
    in al, dx
    test al, DiskStatus.DATA
    jnz .read_identify
    test al, DiskStatus.ERROR
    jnz .error
    call delay
    loop .wait_data
    jmp .timeout

.read_identify:
    ; Read 512 bytes of IDENTIFY data
    mov dx, ATA_PRIMARY_BASE + ATA_REG_DATA
    mov edi, identify_buffer
    mov ecx, 256  ; 256 words = 512 bytes
    rep insw      ; Read words into [edi]
    jmp .success

.no_drive:
    mov eax, 1
    ret

.timeout:
    mov eax, 2
    ret

.error: 
    mov eax, 3
    ret

.success:
    mov eax, 0    ; Return success
    ret

;Input:
; eax -> LBA address
; edx ->  Buffer to store data (512 bytes)
;Output:
; eax = 0 -> success
; eax = 1 -> failure
;Notes:
;Read one sector (LBA28)
;
ata_read:
    push ebx edi
    mov edi, edx

    ; Select drive and LBA
    mov dx, ATA_PRIMARY_BASE + ATA_REG_DRIVE
    mov ebx, eax
    shr eax, 24
    and al, 0x0F
    or al, 0xE0   ; Master, LBA mode
    out dx, al

    mov dx, ATA_PRIMARY_BASE + ATA_REG_SECCOUNT
    mov al, 1     ; Read 1 sector
    out dx, al

    mov dx, ATA_PRIMARY_BASE + ATA_REG_LBA_LOW
    mov al, bl
    out dx, al

    mov dx, ATA_PRIMARY_BASE + ATA_REG_LBA_MID
    mov al, bh
    out dx, al

    mov dx, ATA_PRIMARY_BASE + ATA_REG_LBA_HIGH
    shr ebx, 16
    mov al, bl
    out dx, al

    mov dx, ATA_PRIMARY_BASE + ATA_REG_STATUS
    mov al, ATA_CMD_READ
    out dx, al

    ; Wait for drive to be ready
    mov ecx, DELAY_COUNT
.wait_read:
    in al, dx
    test al, DiskStatus.BUSY
    jz .check_read_status
    call delay
    loop .wait_read
    jmp .error

.check_read_status:
    test al, DiskStatus.ERROR
    jnz .error

    ; Read 512 bytes
    mov dx, ATA_PRIMARY_BASE + ATA_REG_DATA
    mov ecx, 256  ; 256 words
    rep insw      ; Read into [edi]

    mov eax, 0    ; Success
    jmp .done

.error:
    mov eax, -1   ; Failure

.done:
    pop edi ebx
ret

; Write one sector (LBA28)
; Parameters:
;   eax: LBA address
;   esi: Buffer with data (512 bytes)
ata_write:
    push ebx
    push ecx
    push edx
    push esi

    ; Select drive and LBA
    mov dx, ATA_PRIMARY_BASE + ATA_REG_DRIVE
    mov ebx, eax
    shr eax, 24
    and al, 0x0F
    or al, 0xE0
    out dx, al

    mov dx, ATA_PRIMARY_BASE + ATA_REG_SECCOUNT
    mov al, 1
    out dx, al

    mov dx, ATA_PRIMARY_BASE + ATA_REG_LBA_LOW
    mov al, bl
    out dx, al

    mov dx, ATA_PRIMARY_BASE + ATA_REG_LBA_MID
    mov al, bh
    out dx, al

    mov dx, ATA_PRIMARY_BASE + ATA_REG_LBA_HIGH
    shr ebx, 16
    mov al, bl
    out dx, al

    mov dx, ATA_PRIMARY_BASE + ATA_REG_STATUS
    mov al, ATA_CMD_WRITE
    out dx, al

    ; Wait for drive to be ready
    mov ecx, DELAY_COUNT
.wait_write:
    in al, dx
    test al, DiskStatus.BUSY
    jz .write_data
    call delay
    loop .wait_write
    jmp .error

.write_data:
    ; Write 512 bytes
    mov dx, ATA_PRIMARY_BASE + ATA_REG_DATA
    mov ecx, 256  ; 256 words
    rep outsw     ; Write from [esi]

    ; Flush cache
    mov dx, ATA_PRIMARY_BASE + ATA_REG_STATUS
    mov al, ATA_CMD_FLUSH
    out dx, al

    mov ecx, DELAY_COUNT
.wait_flush:
    in al, dx
    test al, DiskStatus.BUSY
    jz .success
    call delay
    loop .wait_flush
    jmp .error

.success:
    mov eax, 0
    jmp .done

.error:
    mov eax, -1

.done:
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret

; Delay function (short wait)
delay:
    push ecx
    mov ecx, 4
.delay_loop:
    mov dx, ATA_PRIMARY_BASE + ATA_REG_STATUS
    in al, dx
    loop .delay_loop
    pop ecx
    ret

identify_buffer rb 512