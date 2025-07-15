macro _ElfFileExctractor fileName*
{
   file fileName
}
macro _PlainFileExctractor fileName*
{
    file fileName
}
;@Declare {enum=FileType}
FileType.Plain equ 0
FileType.Elf equ 1
macro FileFormat.import Params&
{
    local wasAdded
    local formatChosen
    local formatHandler
    local fileName
    local filePadding
    local label
    fileName equ
    filePadding equ
    formatHandler equ
    wasAdded equ 0
    formatChosen equ 0
    match =0 =(path: relPath =, =padding: padding =, =format: formatKeyword), wasAdded Params
    \{
        match =0 , formatKeyword
        \\{
            handler equ _PlainFileExctractor
            formatChosen equ 1
        \\}
        match =1 , formatKeyword
        \\{
            handler equ _ElfFileExctractor
            formatChosen equ 1
        \\}
        match =0 , formatChosen
        \\{
            'Illegal FileFormat index'
        \\}
        wasAdded equ 1
        formatHandler equ handler
        Linker.toTargetName fileName, relPath
        filePadding equ padding
    \}
    match =0, wasAdded
    \{
        'Syntax error'
    \}
    local fileSize
    local emptyRest
    label:
    match handler name, formatHandler fileName
    \{
        handler name
    \}
    fileSize = $ - label
    emptyRest = fileSize mod filePadding
    if emptyRest <> 0
        db (padding - emptyRest) DUP (0)
    end if
}
