DEBUG_MODE equ FALSE
NativeWord.bit equ 16
NativeWord.byte equ 2
_32_regs equ eax, ebx, ecx, edx, esp, ebp, edi, esi
_16_regs equ ax, bx, cx, dx, sp, bp, di, si
_8_regs equ al, ah, dl, dh, cl, ch, bl, bh
;macro _nativeWord.init
match =2, NativeWord.byte { native equ word }
match =4, NativeWord.byte { native equ dword }

restore NativeWord.bit
restore NativeWord.byte


;preparation for 32-bit mode
nil = 0
TRUE  = 1
FALSE = 0
macro todo msg
{
 display  'to do:', 13, 10, msg, 13, 10
}

BREAKPOINT_START_OFFSET equ 0
macro breakPoint
{
  local currOffset
 ; currOffset equ $
  define currOffset ($ + BREAKPOINT_START_OFFSET)
;  rept 1 value : (BREAKPOINT_START_OFFSET + currOffset) \{   define currOffset value \}
  display 'BreakPoint at: '
  display_ currOffset, 13, 10

}
macro bt Mem*, bitOffset*
{
 setBitInstr bt, Mem, bitOffset
}

macro bts Mem*, bitOffset*
{
 setBitInstr bts, Mem, bitOffset
}
macro setBitInstr bitInstr*, Mem*, bitOffset*
{
 local state
 state equ 0
if (Mem eqType [label])
   match =[ byteBase =], Mem
    \{
    state equ 1
    if bitOffset eqType 11
        if byteBase \#.bitLength < bitOffset  ;/ 8 + 1 ;bitToByte
            Length exceeded!
        end if
        if bitOffset < NativeWord.bit
            bitInstr native [byteBase], bitOffset
        else
           \local bitNewOffset
           \local byteNewBase
            bitNewOffset = bitOffset mod NativeWord.bit
            byteNewBase = byteBase + bitOffset / NativeWord.bit * NativeWord.byte
            bitInstr native [byteNewBase], bitNewOffset
        end if
   else
        match TRUE, DEBUG_MODE
        \\{
        \\local testJMP
           if bitOffset eqType ax
             cmp bitOffset, byteBase \# .bitLength
             jbe .. \\# \\testJMP
             int 0h ;error
           .. \\# \\testJMP:

             else
             'Syntax error'
           end if

        \\}

        bitInstr native [byteBase], bitOffset ;user know precisely place
   end if
    \}
else
   match reg, Mem
   \{
    state equ 1
    if (bitOffset eqType 11) | (bitOffset eqType savedValue)
        if ( (reg in <_16_regs>) & (bitOffset > 16) ) |\
           ( (reg in <_32_regs>) & (bitOffset > 32) );||\
          ; (reg in <_64_regs>) && (bitOffset > 16)
              'Length exceeded'
        end if
        else
            'Syntax error'
        end if
    bitInstr reg, bitOffset
   \}
end if
match =0, state
    \{
      display 'Syntax error'
    \}
}
;Pascal String
struc PString Params&
{
  . db .length
  .self String Params
 .length = .self.length
}
struc DString Params&
{
 .self String Params
 .end db '$'
}
struc ZString Params&
{
 .self String Params
 .end db 0
}
struc WarnString Params&
{

 .self PString Params, Text.newLine, Text.Beep
}
struc String Params&
{
  local isCorrect
  isCorrect equ 0
 .length = 0
  ;length restricted string
 match =0 =[ Len =] == data, isCorrect Params
 \{

      . db data
      .length = $ - .
      if .length < Len
         db (Len - .length) DUP (0)
      else if .length > Len
         Length exceeded
      end if

      isCorrect equ 1
 \}


 match =0 =[ Len =], isCorrect Params
 \{
     . db (Len) DUP (0)
     isCorrect equ 1
 \}

  ;without length limits
 match =0 == data, isCorrect Params
 \{
  . db data
  .length = $ - .
   isCorrect equ 1
 \}
 match =0, isCorrect
 \{
   'Syntax error'
 \}

}

struc Bitmap Params&
{
        match =[ Len =] , Params
        \{
            .bitLength = Len
            .byteLength = Len / 8

             if (Len mod 8) <> 0
            .byteLength = .byteLength + 1
            end if

            db .byteLength DUP (0)
        \}
        match =[ Len =] == values, Params
        \{

            \local list
            \local status
            \local byteLen
            \local tempValue

            rept 1 result: (Len and (0111b) ) \\{  define tempValue result \\}

            byteLen equ Len
            match =0, tempValue \\{ byteLen equ (Len - 1) \\}
            restore tempValue

            byteLen equ byteLen / 8 + 1

            .bitLength = Len
            .byteLength = byteLen
            irp symbol, values
            \\{
                status equ 0
                match lowV =- highV, symbol
                \\\{
                   status equ 1
                   rept (highV - lowV + 1) char: lowV  \\\\{ list equ char \\\\}
                \\\}

                match =0 , status  \\\{ list equ symbol \\\}
            \\}

            rept (byteLen) counter: 0  \\{ byteValue \\# counter = 0 \\}

             match ,
             \\{
              irpv nBit, list
               \\\{
                tempValue = 1 shl (nBit mod 8)
                rept 1 byteNum: (nBit / 8) \\\\{ byteValue \\\\#byteNum = byteValue \\\\#byteNum or tempValue \\\\}
               \\\}
            \\}

            rept (byteLen) counter: 0 \\{ db byteValue \\#counter
                                          restore byteValue
                                      \\}

        \}
}
macro movsn
{
 if NativeWord.byte = 2
 movsw
 else if NativeWord.byte = 4
 movsd
 else
 movsq
 end if
}
macro setFont foreColor*, bgdColor*, place
{
  local result
  match dest, place
  \{
  if foreColor eqType 11 and bgdColor eqType 11
     result =   (foreColor and $0F) or (bgdColor shl 4 and $F0)
     if dest eqType lbl
        store byte result at dest
     else if dest eqType ax
        mov dest, result
     else
        'Syntax error'
     end if
  else
     'Syntax error'
  end if
  \}
}
macro unmountCyl reg*
{
  if ~(reg in <ax>)
     'Syntax error: ax required'
  else
     shr al, 6
     ror ax, 2
     shr ax, 6 ;unmount cylinder||
  end if
}
macro mountCyl reg*
{
 if reg eqType ax
 shr reg, 6
 ror reg, 8
 else
 'Syntax error'
 end if
}

macro setSectorNum cylinder*, sector*
{
  if (sector in <cl>) | (sector in <ch>)
     'Syntax error'
  end if

 if ~(cylinder in <cx>)
    mov cx, cylinder;10-bit
 end if
 rol cx, 8
 shl cl, 6
 or cl, sector   ;6-bit

}

macro storeStr byteOffset*, data&
{
 local counter
 counter = 0
 irp sample, data
 \{
 \local name
  name db sample
 store native name at byteOffset + counter
 counter = counter + NativeWord.byte
 \}
}
macro linkPStr byteOffset*, data&
{
 local counter, lblStr
 counter = 0
 lblStr PString = data
 store native lblStr at byteOffset
}
macro print outputStr&
{
 mov ah, 09h
 mov dx, outputStr
 int 21h
}

match ,
{
 local lblCode, Code, Code.size, Code.length
macro CodeStart Params&
\{
 \local state
  state equ 0
   match =0 =at name =of maxSize, state Params
   \\{
   lblCode equ name
   Code.size = maxSize
   virtual at 0
   Code::

   state equ 1
  \\}
 match =0 =at name, state Params
 \\{
   lblCode equ name
   virtual at 0
   Code::

   state equ 1
 \\}

 match =0, state
 \\{
 'Syntax error'
 \\}
\}
macro CodeEnd Params&
\{
  Code.length = $ - $$
  if Code.length > Code.size
  'Length exceeded'
  end if
  end virtual
   repeat Code.length
     load a byte from Code:  (% - 1)
     store byte a at lblCode + (% - 1)
   end repeat
   \local newCode
   Code equ \newCode
   match =TRUE, DEBUG_MODE
   \\{
        display 'TotalSize: '
        display_  Code.length, ' bytes', 13, 10
   \\}
\}

}
macro display_ Params&
{

   local logic
    macro logic int
  \{
    \local value
    \local temp
    \local counter
       if int eqType 11
        value = int
        counter = 0
           if value <> 0
           while value <> 0
             value = value / 10
             counter = counter + 1
           end while
           else
            counter = 1
           end if

        value = 1
        temp = int
        repeat counter - 1
        value = value * 10
        end repeat
        repeat counter
           display (temp / value + '0')
           temp = temp mod value
           value = value / 10
        end repeat

   else
   'Syntax error'
   end if
  \}

   local state
   state equ 0
   match int =, str =0, Params state
   \{
    state equ 1
    logic int
    display str
   \}
   match int =0, Params state
   \{
    state equ 1
    logic int
   \}

   match =0, state
   \{
    'Syntax error'
   \}

}
match ,
{
        local structType
        local data
macro struct sctLabel*, info&
\{

        data equ info
        structType equ sctLabel
        match dummy,structType \\{ struc dummy \\}
\}
    macro ends
    \{

     virtual at 0
     match lbl, structType
     \\{
     lbl lbl
     sizeof. \\# lbl = $ - lbl
     \\}
     end virtual

    \}
}
macro getLocal Params&
{
     local state
     state equ 0
     match lblList =0, Params state
     \{
       state equ 1
       match list, lblList
       \\{
          \local \\lbl

       \\}
     \}

      match =0, state
      \{
       'Syntax error'
      \}
}
macro ShortName Params&
{
    local source
    local length
    local fileName
    local cPos
    virtual at 0
    source::
        db Params
        length = $ - $$
    if length > (sizeof.ShortFileName + 1)
       'Length exceeded'
    end if
    end virtual

    fileName String[sizeof.ShortFileName] = sizeof.ShortFileName DUP (' ')
    cPos = 0

    repeat length
    load c byte from source: % - 1
    if c = '*'
            repeat sizeof.ShortFileName - cPos
               store byte '?' at fileName + cPos + % - 1
            end repeat
    else
     if c = '.'
       cPos = 7
       store word '  ' at fileName + 8
       store byte ' ' at fileName + 10
      else if (cPos < sizeof.ShortFileName)
        store byte c at fileName + cPos
      end if
      cPos = cPos + 1
    end if

    end repeat
}
sizeof.ShortName = 11

match ,
{
local params@@
macro prolog
\{
  push bp
  mov bp, sp
\}
macro epilog
\{
 mov sp, bp
 pop bp
 match list, params@@
 \\{
 irp item, list
 \\\{
    restore item
 \\\}
 \\}
\}
macro setLocals Params&
\{
  match list, Params
  \\{
   \\local nIt
   \\local sum
    sum equ 2
    nIt equ 0
    params@@ equ list
    irp item, list
    \\\{
        rept 1 result: nIt + 1 \\\\{ define nIt result \\\\}
        item equ bp - nIt * 2
    \\\}
       rept 1 result: nIt * 2 \\\{ define sum result \\\}
     sub sp, sum

  \\}

\}
}
;Input:
;al
;Output:
;al
;ax, dx, cx are affected
;
macro castToRealYear ;years since 1980
{
  add ax, CrtDate.StartYear
  mov cx, 100
  cwd
  div cx
  mov ax, dx
}
;Input:
;reg or imm value
;Output:
;ax - segment
;
macro castToSeg offset*
{
   mov ax, offset
   shr ax, 4
}
macro s_xchg reg_1*, reg_2*
{
   if (reg_1 eqType cs & reg_2 eqType cs)
       push reg_1
       push reg_2
       pop reg_1
       pop reg_2
   else
       display 'Syntax error'
   end if
}
macro convertDate Params&
{
       local state
       state equ 0
       match day =- month =- year, Params
       \{
            \local wResult
            state equ 1
            rept 1 value : ( $FFFF and (((year - 1980) shl 9) or (month shl 5) or (day)) ) \\{define wResult value \\}
            dw wResult
       \}

        match =0, state
       \{
        'Incorrect params'
       \}
}

macro convertTime Params&
{
       local state
       state equ 0
       match hours =: minutes =: seconds, Params
       \{
            \local wResult
            state equ 1
            rept 1 value : ( $FFFF and (( hours shl 11 ) or (minutes shl 5) or (seconds shr 1)) ) \\{define wResult value \\}
            dw wResult
       \}

        match =0, state
       \{
        'Incorrect params'
       \}
}
macro assert Params& 
{
   local wasAdded
   wasAdded equ 0
   match =0 condition =: msg, wasAdded Params
   \{
      wasAdded equ 1
      if condition
      else 
         'Assertation error caused by ' \# msg
      end if
   \}
   match =0 condition, wasAdded Params 
   \{
      wasAdded equ 1
      if condition
      else 
         'Assertation error'
      end if
   \}
   match =0, wasAdded 
   \{
      'Syntax error'
   \} 
}