;Mostly for one segment use only -> bug ???
;Input:
;ax - address of origin (super) string
;dx - address of subString
;Output:
;ax = 0: doesn't have substring
;ax - start pos of substring
;
proc String.hasSubString uses si di
   local bSubLen: BYTE
   local pSuperStr: WORD

   cld
   mov di, ax
   mov si, dx ;substring
   mov word [pSuperStr], di
   lodsb
   mov byte [bSubLen], al
   mov ah, byte [di] ;superString
   cmp ah, al
   jl .notFound
   inc di
   movzx cx, ah
   mov dl, al
.superLoop:
        lodsb
        cmp al, byte [di]
        jne .skip
        dec dl
        test dl, dl
        je .Found
        jmp .endLoop
.skip:
        dec si
        mov dl, word [bSubLen]
.endLoop:
        inc di
        loop .superLoop
.notFound:
        xor ax, ax
        jmp .finish
.found:
        mov di, word [pSuperStr]
        movzx ax, byte [di]
        sub ax, cx ;position subString in superString
        add di, ax
        xchg ax, di
.finish:
ret
endp

;Input:
;al - address of searching char
;ah - start pos (if ah = 0 -> from start as ah = 1)
;ds:dx - address of PString
;Output:
;if ax = 0 -> char was not found
;ax = char position (as Pascal), offset of begining including length: 1..n
;
String.getPos:
    push di
    cld
    test ah, ah
    jnz .realMode
.legacyChange:
    inc ah
.realMode:
    dec ah ;alignment to real array
    mov di, dx

    movzx cx, byte [di]
    mov dx, cx ;save effective length
    cmp cl, ah
    jb .notFound

    push ax ;save search char
    sub cl, ah
    movzx ax, ah
    add di, ax
    pop ax
    inc di
    repne scasb
    cmp al, byte [di - 1]
    jne .notFound
    sub dx, cx ;in dx was effective length
    mov ax, dx
    jmp .finish
.notFound:
    xor ax, ax
.finish:
pop di
ret
;Input:
;in es:ax - destination address -> PString
;in ds:dx - source address -> PString
;Output:
;on ax concatenated PString
;
String.concate:
    push si di
    cld
    mov di, ax
    mov si, dx
    movzx ax, byte [es:di]
    movzx cx, byte [ds:si]
    push ax
    add ax, cx
    mov dx, $00_FF
    cmp ax, dx
    jbe @F
    mov ax, dx
@@:
    stosb
    pop ax
    add di, ax ;start pos to copy

    inc si
    rep movsb
    pop di si
ret
;Input:
;es:ax - address first PString
;ds:dx - address second PString
;Output:
;equal -> ax = 0
;
String.equals:
push si di
     mov si, ax
     mov di, dx
     cld
     s_xchg es, ds
     lodsb
     mov dl, byte [es:di]
     cmp dl, al
     jne .not

     inc di
     movzx cx, al
     rep cmpsb
.not:
     setne al
     cbw
     s_xchg es, ds
pop di si
ret
;Input:
;in es:ax -> dest address PString
;in ds:dx -> source addres PString
;
String.copy:
   push si di
   mov di, ax

   cld
   mov si, dx
   lodsb
   movzx cx, al
   mov byte [es:di], al
   inc di
   rep movsb

   pop di si
ret
;Input:
;al - char to fill
;es:dx - address of PString
;
String.fillChar:
  push di
  cld

  mov di, dx
  movzx cx, byte [es:di]
  inc di
  rep stosb
  pop di
ret
;Input:
;al - appendix char
;es:dx - address of PString
;Output:
;None
;
String.append:
  push bx
  mov bx, dx
  inc byte [es:bx] ;update length
  movzx dx, byte [es:bx]
  add bx, dx
  mov byte [es:bx], al
  pop bx
ret

;Input:
;es:ax - address of PString to trim
;
String.trim:
    push di
    mov di, ax
    movzx cx, byte [es:di]
    jcxz .exit
    push di
    add di, cx ;points to last char
    std
    mov al, ' '
.trimLoop:
    scasb
    jne .stop
    loop .trimLoop
.stop:
    pop di
    mov byte [es:di], cl
.exit:
    pop di
ret

;Input:
;ds:ax -> PString
;Output:
;None
;
String.toZString:
push si di es
     cld
     push ds
     pop es
     mov si, ax
     mov di, ax
     lodsb
     movzx cx, al
     rep movsb
     xor al, al
     stosb
pop es di si
ret
;Input:
;in es:ax -> dest address ZString
;in ds:dx -> source addres ZString
;cx -> length (cx = 0): no limitation otherwise -> the follow char is 0
;
ZString.copy:
   push si di
   cld
   mov di, ax
   mov si, dx

   jcxz .noLimits
   jmp .startLoop
.noLimits:
   mov cx, $FF_FF
.startLoop:
@@:
   lodsb
   stosb
   jcxz .noZeroFinish
   test al, al
   jnz @B
   jmp .zeroFinish
.noZeroFinish:
    mov al, 0
    stosb
.zeroFinish:
   pop di si
ret

;Input:
;es:ax - address of dest (PString)
;ds:dx - address of ShortName as ZString
;Output:
;None (ZString at place)
;
ShortName.copy:
push si di
     mov si, dx
     mov di, ax

     mov byte [es:di], sizeof.ShortName
     mov al, ' '
     mov dx, di
     call String.fillChar

     cld
     mov cx, sizeof.ShortName
     push si
.nameCopy:
     lodsb
     cmp al, ' '
     je .skipCopy
     stosb
     loop .nameCopy
.skipCopy:
     mov cx, 3
     pop si
     add si, 8 ;ext copy
     mov al, '.'
     stosb
.extCopy:
     lodsb
     cmp al, ' '
     je .finish
     stosb
     loop .extCopy
     inc di
.finish:
    mov byte [es:di - 1], 0
pop di si
ret

;Input:
;al - char to fill
;es:dx -> address of dest ShortName
;Output:
;es:dx (save)
;
ShortName.fillChar:
push di
     mov di, dx
     ;mov al, a;
     mov cx, sizeof.ShortName
     cld
     rep stosb
pop di
ret

;Input:
;in al - end symbol(or other with some ending)
;in ds:dx - address of String
;Output:
;ax - length
;
AString.length:
 push di es
 cld
 push ds
 pop es
 mov di, dx
 xor dx, dx
 dec dx ;starts with -1
@@:
 inc dx
 scasb
 jnz @B
 mov ax, dx
 pop es di
ret

;Input:
;ds:ax - address of ZString
;Output:
;ax - length of ZString
;
ZString.length:
 mov dx, ax
 xor al, al
 call AString.length
 ret



;Notes:
;this routine don't check length
;Not tested
;Input:
;ds:ax - ZString
;dx - offset
;Output:
;ds:(ax + dx) -> the origin string
;
ZString.offsetCopy:
push si di es
    push ds
    pop es

    mov si, ax
    mov di, si
    add di, dx
    call ZString.length
    mov cx, ax
    inc cx ;with zero
    add di, ax
    add si, ax
    std
    rep movsb

pop es di si
ret

;Input:
;es:ax -> buffer
;dx -> value
;Output:
;es:ax -> is filled by value
;Notes:
;Buffer will construct in the form of PString
;At least, 7 bytes
;
String.valueOf:
push bx si
    mov si, ax
    mov ax, dx
    xor bx, bx ;the counter of stack values
    mov cx, 10
    cmp ax, 0
    setl dl
    mov byte [es: si], dl
    jge @F
    mov byte [es: si + 1], '-'
    neg ax ;only positive)
@@:
    cwd
    div cx
    push dx
    inc bx
    test ax, ax ;the rest exists
    jnz @B
    mov cx, bx ;the count to pop
    mov bx, si
    movzx ax, byte [es: bx]
    add byte [es: bx], cl ;the length of string
    add bx, ax ;allign the beginnig
    inc bx
@@:
    pop ax
    add al, '0'
    mov byte [es: bx], al
    inc bx
    loop @B
    mov ax, si
pop si bx
ret                       


;Input:
;ds:ax - address of ZString
;Output:
;ds:ax - PString (probably trancated)
;
ZString.toPString:
push si di es
     push ds
     pop es
     mov si, ax
     call ZString.length
     ;mov ax, ax
     mov dx, $FF
     call getMinMax
     ;in ax -> String.length
     mov cx, ax
     push cx
     add si, ax
     mov di, si ;zero
     dec si ; data self
     std
.copyLoop:
     lodsb
     stosb
     loop .copyLoop
     pop ax ;in al -> string.length
     push di
     stosb
     pop ax
pop es di si
ret

;Input:
;ds:ax - address of DString
;Output:
;ax - length of DString
;
DString.length:
 mov dx, ax
 mov al, '$'
 call AString.length
 ret

ZString.concate:

ret