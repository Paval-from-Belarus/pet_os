OUTPUT_FORMAT(binary)
ENTRY(_start);
KERNEL_PHYSICAL_OFFSET = 0x100000;
KERNEL_VIRTUAL_OFFSET = 0xC0000000;
KERNEL_STACK_SIZE = 4096;
PAGE_SIZE = 0x1000;
MAX_PHYSICAL_MEMORY_SIZE = 32 * 1024 * 1024;
PAGE_REC_SIZE = 16;
MEMORY_MAP_SIZE = MAX_PHYSICAL_MEMORY_SIZE / PAGE_SIZE * PAGE_REC_SIZE;
SECTIONS
{
	/* Link the kernel at this address: "." means the current address */
        /* Must be equal to KERNLINK */
	. = (KERNEL_PHYSICAL_OFFSET + KERNEL_VIRTUAL_OFFSET);
	PROVIDE(START_OFFSET = .);
	.text : AT(KERNEL_PHYSICAL_OFFSET) {
	    *(.init_text)
		*(.text .stub .text.* .gnu.linkonce.t.*)
	}

    . = ALIGN(PAGE_SIZE);
	.rodata : {
	    PROVIDE(etext = .);	/* Define the 'etext' symbol to this value */
		*(.rodata .rodata.* .gnu.linkonce.r.*)
	}

	/* Adjust the address for the data segment to the next page */

	/* Conventionally, Unix linkers provide pseudo-symbols
	 * etext, edata, and end, at the end of the text, data, and bss.
	 * For the kernel mapping, we need the address at the beginning
	 * of the data section, but that's not one of the conventional
	 * symbols, because the convention started before there was a
	 * read-only rodata section between text and data. */

	/* The data segment */
	. = ALIGN(PAGE_SIZE);
	.data : {
	    PROVIDE(data = .);
		*(.data)
	}
    . = ALIGN(PAGE_SIZE);
	.bss : {
	    PROVIDE(edata = .);
		*(.bss)
		MEMORY_MAP = .;
		. += MEMORY_MAP_SIZE;
	}
	. = ALIGN(PAGE_SIZE);
	.heap : { . = . + SIZEOF(.bss); }
	PROVIDE(END_OFFSET = .);
	/DISCARD/ : {
    		*(.eh_frame .note.GNU-stack)
    }
    BINARY_SIZE = edata - START_OFFSET;
	KERNEL_SIZE = END_OFFSET - START_OFFSET;

}