use crate::declare_constants;
use crate::utils::io;
declare_constants!(
    pub u16,
    PIC1 = 0x20;
    PIC2 = 0xA0;
    PIC1_COMMAND = PIC1;
    PIC1_DATA = PIC1 + 1;
    PIC2_COMMAND = PIC2;
    PIC2_DATA = PIC2 + 1;
);
declare_constants!(
    pub u8,
    PIC_FINALIZE = 0x20, "End of Interrupt command for PIC";
    ICW1_ICW4 = 0x01, "Indicates that ICW4 will be present";
    ICW1_SINGLE = 0x02, "Single (cascade) mode";
    ICW1_INTERVAL4 = 0x04, "Call address interval";
    ICW1_LEVEL = 0x08, "Level triggered (edge) mode";
    ICW1_INIT = 0x10, "Initialization";
    ICW4_8086 = 0x01, "8086/88 mode";
    ICW4_AUTO = 0x02, "Auto (normal) EOI";
    ICW4_BUF_SLAVE = 0x08, "Buffered mode for slave";
    ICW4_BUF_MASTER = 0x0C, "Buffered mode for master";
    ICW4_SFNM = 0x10, "Special fully nested";
);
declare_constants!(
    pub u8,
    LAST_MASTER_IRQ_LINE = 7, "The last irq line that should be dispatched by master";
    CHIP_LINE_COUNT = 8;
);
pub unsafe fn set_mask(mut line: u8) {
    let port: u16;
    if line <= LAST_MASTER_IRQ_LINE {
        port = PIC1_DATA;
    } else {
        line -= CHIP_LINE_COUNT;
        port = PIC2_DATA;
    }
    let value = io::inb(port) | (1 << line);
    io::outb(port, value);
}
pub unsafe fn clear_mask(mut line: u8) {
    let port: u16;
    let value: u8;
    if line <= LAST_MASTER_IRQ_LINE {
        port = PIC1_DATA;
    } else {
        line -= CHIP_LINE_COUNT;
        port = PIC2_DATA;
    }
    value = io::inb(port) & !(1 << line);
    io::outb(port, value);
}
///Remap pic master and slave interrupts to given ranges
pub unsafe fn remap(master_offset: u8, slave_offset: u8) {
    use io::*;
    let old_pic1 = inb(PIC1_DATA);
    let old_pic2 = inb(PIC2_DATA);
    outb(PIC1_COMMAND, ICW1_INIT | ICW1_ICW4); //starts initialization
    wait();
    outb(PIC2_COMMAND, ICW1_INIT | ICW1_ICW4);
    wait();
    outb(PIC1_DATA, master_offset);
    wait();
    outb(PIC2_DATA, slave_offset);
    wait();
    outb(PIC1_DATA, 4);//What is ?
    wait();
    outb(PIC2_DATA, 2);
    wait();

    outb(PIC1_DATA, ICW4_8086);
    wait();
    outb(PIC2_DATA, ICW4_8086);
    wait();
    //restore saved data
    outb(PIC1_DATA, old_pic1);
    outb(PIC2_DATA, old_pic2);
}
///Send signal by irq line that interrupt is processed
pub fn complete(irq: u8) {
    if irq >= 8 {
        unsafe { io::outb(PIC2_COMMAND, PIC_FINALIZE) };
    }
    unsafe { io::outb(PIC2_COMMAND, PIC_FINALIZE) }
}
