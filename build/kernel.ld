OUTPUT_FORMAT(binary)
KERNEL_PHYSICAL_OFFSET = 0x100000;
KERNEL_START_OFFSET = 0xC0000000;
ENTRY(_start);
SECTIONS
{
	/* Link the kernel at this address: "." means the current address */
        /* Must be equal to KERNLINK */
	. = (KERNEL_START_OFFSET + KERNEL_PHYSICAL_OFFSET);
    LD_KERNEL_START = .;
	.text : AT(KERNEL_PHYSICAL_OFFSET) {
		*(.text .stub .text.* .gnu.linkonce.t.*)
	}

	PROVIDE(etext = .);	/* Define the 'etext' symbol to this value */

	.rodata : {
		*(.rodata .rodata.* .gnu.linkonce.r.*)
	}

	/* Adjust the address for the data segment to the next page */
	. = ALIGN(0x1000);

	/* Conventionally, Unix linkers provide pseudo-symbols
	 * etext, edata, and end, at the end of the text, data, and bss.
	 * For the kernel mapping, we need the address at the beginning
	 * of the data section, but that's not one of the conventional
	 * symbols, because the convention started before there was a
	 * read-only rodata section between text and data. */
	PROVIDE(data = .);

	/* The data segment */
	.data : {
		*(.data)
	}

	PROVIDE(edata = .);

	.bss : {
		*(.bss)
	}

	PROVIDE(end = .);

	/DISCARD/ : {
		*(.eh_frame .note.GNU-stack)
	}
	LD_KERNEL_END = .;
	KERNEL_SIZE = LD_KERNEL_END - LD_KERNEL_START;
}