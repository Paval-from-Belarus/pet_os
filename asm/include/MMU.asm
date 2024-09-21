DEFAULT_PAGE_REGION_FLAGS = PageDirEntry.Present

todo 'the mmu should only map higher addresse because kernel acquire such space'
;@Declare{module=MMU}
;@Description{Stateless module to interract with hardware `Memory Management Unit`}
;Input:
;ds:eax -> `PageDirectoryTable`'s offset
;ds:edx -> `PageTable`'s offset
;Output:
;ds:eax, ds:ebx, ds:edi -> saved
;Notes:
;This routine doesn't make any check:
;it's obligatory of upper level to allocate enought memory for PageDir and PageTable
;By default, region is marked as Present; but Page is marked is Empty
;
proc MMU.init uses esi eax ebx edi
.init:
     mov ebx, eax ;save directory 
     mov esi, edx ;the sequence of page table
     mov eax, ebx
     mov ecx, PageDirectory.ENTRIES_CNT
.markDirectoryLoop:
push ecx
.setDirEntry:
     mov edx, PageDirEntry.Present
     or edx, esi ;store offset of PageTable
     mov dword [ebx], edx ;store page table entry in page directory
     add ebx, PageDirEntry.bytes
.markPageTable:
     mov edi, esi ;set to page table offset
     mov eax, PageTableEntry.Empty
     mov ecx, PageTable.ENTRIES_CNT
     cld
     rep stosd
     add esi, PageSize.bytes
pop ecx
loop .markDirectoryLoop
ret
endp
;Input:
;eax -> PageDirectoryFlag
;edx -> PageTableFlag
;ecx -> pages count
;ebx -> PageDirectory (already configured)
;esi -> physical offset (aligned to Page.bytes)
;edi -> corresponding virtual offset (aligned to Page.bytes)
;Output:
;ebx, esi, edi -> are saved
;
proc MMU.markRegion uses esi edi
     local dNextPhysicalOffset: DWORD
     local dNextVirtualOffset: DWORD
     jcxz .exit
     mov dword [dNextPhysicalOffset], esi
     mov dword [dNextVirtualOffset], edi
     mov esi, eax ;PageDirectoryFlag
     mov edi, edx ;PageTableFlag
     ;in ecx -> page count
.markLoop:
     mov eax, dword [dNextVirtualOffset]
     mov edx, eax
     shr eax, 22
     and eax, 0x3FF ;in eax -> table index
     lea eax, dword [ebx + eax * PageDirEntry.bytes] ;in eax -> table entry offset
     or dword [eax], esi ;mark with PageDirectoryFlag
     mov eax, dword [eax] ;load entry
     and eax, (not 0xFFF) ;get pure page table offset
     shr edx, 12
     and edx, 0x3FF ;holds page entry index
     lea eax, dword [eax + edx * PageTableEntry.bytes] ;page table entry offset
     mov edx, edi ;copy table flag
     or edx, dword [dNextPhysicalOffset]
     mov dword [eax], edx ;store page table entry
     add dword [dNextPhysicalOffset], PageSize.bytes
     add dword [dNextVirtualOffset], PageSize.bytes
     loop .markLoop
.exit:
ret
endp
;Input:
;eax -> physical directory offset
;edx -> virtual stack offset
;ecx -> main function parameter
;Output:
;None
;Notes: the conventionally, the kernel invoke `Kernel.run` function and pass single parameter to it
;
Kernel.switchPaging:
     mov esp, edx
     mov cr3, eax
     mov eax, cr0
     or eax, 0x80_00_00_00
     mov cr0, eax
     mov eax, ecx
     mov edx, Kernel.run
     call edx