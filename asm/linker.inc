rootDirectory  equ '/home/Paval/Triggers/Rust/Embedded/pet_os/asm'
targetDirectory equ 'target/'
_OS_TYPE equ 
;insert data of file exactly in fasm file
macro insert relPath*
{
    local path
    match hPart lPart, rootDirectory relPath
    \{
        path equ hPart \# lPart
    \}
    match fullPath, path 
    \{
        include fullPath
    \}

}
;this macro only exceeds possibilities to import file in project scope
macro File.import Params& 
{
    local wasAdded
    local fileName
    local filePadding
    fileName equ
    filePadding equ 1
    wasAdded equ 0
    match =0 projectPath =(from: relPath =, =padding: padding =), wasAdded rootDirectory Params
    \{
        wasAdded equ 1
        fileName equ projectPath \# relPath
        filePadding equ padding
    \}
    match =0, wasAdded
    \{
        'Syntax error'
    \}
    match name padding, fileName filePadding
    \{
        local fileLabel
        local fileSize
        local emptyRest
        fileLabel:
            file name
        fileSize = $ - fileLabel
        emptyRest = fileSize mod padding
        if emptyRest <> 0
            ; display 'File padded with', 13, 10
            ; display_ (padding)
            db (padding - emptyRest) DUP (0)
        end if
    \}
}
macro Linker.toTargetName variable*, relPath*
{
    local targetFileName
    targetFileName equ
    irps pathElement, relPath 
        \{
            \local wasMatched
            \local element
            wasMatched equ 0
            element equ pathElement
            match =/, pathElement
            \\{
                element equ $
            \\}
            match =0 rest appendix, wasMatched targetFileName element
            \\{
                wasMatched equ 1
                targetFileName equ \\`rest \\# \\`appendix
            \\}
            match =0 appendix, wasMatched element ;the empty
            \\{
                wasMatched equ 1
                targetFileName equ appendix
            \\}
        \}
        
        match root hPart lPart, rootDirectory targetDirectory targetFileName
        \{
           variable equ root \# hPart \# lPart \# '.bin'
        \}
}
;the purpose of macro is to wrap file that should be taken from target folder
;path specified by @param relPath is place where asm file (or other compilable file) is stored
;if imported file is FAT structure, the size is aligned to effective size (old issue, in future will be solved)
;all will be alligned to cluster size
;default cluster size (if cluster size is absent) is 512
macro Module.import relPath*, gapSize&
{
        local path
        local targetFileName
        local importMode
        targetFileName equ
        irps pathElement, relPath 
        \{
            \local wasMatched
            \local element
            wasMatched equ 0
            element equ pathElement
            match =/, pathElement
            \\{
                element equ $
            \\}
            match =0 rest appendix, wasMatched targetFileName element
            \\{
                wasMatched equ 1
                targetFileName equ \\`rest \\# \\`appendix
            \\}
            match =0 appendix, wasMatched element ;the empty
            \\{
                wasMatched equ 1
                targetFileName equ appendix
            \\}
        \}
        
        match hPart lPart, targetDirectory targetFileName;targetDirectory targetFileName
        \{
           path equ hPart \# lPart \# '.bin'
        \}
        match  filePath filePadding, path gapSize
        \{
           File.import (from: filePath, padding: filePadding)
        \}
}
;thanks for 
macro stdcall proc,[arg]		; directly call STDCALL procedure
 { common
    if ~ arg eq
   reverse
    pushd arg
   common
    end if
    call proc }
