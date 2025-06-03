use core::panic;

use kernel_types::declare_constants;

use crate::{common::io, drivers};

pub const ATA_PRIMARY: u8 = 0x0;
pub const ATA_SECONDARY: u8 = 0x01;

pub const ATA_MASTER: u8 = 0x00;
pub const ATA_SLAVE: u8 = 0x01;

pub const ATA_PRIMARY_IO: u16 = 0x1F0;
pub const ATA_SECONDARY_IO: u16 = 0x170;

pub const ATA_PRIMARY_DCR_AS: u16 = 0x3F6;
pub const ATA_SECONDARY_DCR_AS: u16 = 0x376;

pub const ATA_PRIMARY_IRQ: u8 = 14;
pub const ATA_SECONDARY_IRQ: u8 = 15;

pub const ATA_SR_BSY: u8 = 0x80;
pub const ATA_SR_DRDY: u16 = 0x40;
pub const ATA_SR_DF: u16 = 0x20;
pub const ATA_SR_DSC: u16 = 0x10;
pub const ATA_SR_DRQ: u8 = 0x08;
pub const ATA_SR_CORR: u16 = 0x04;
pub const ATA_SR_IDX: u16 = 0x02;
pub const ATA_SR_ERR: u8 = 0x01;
pub const ATA_ER_BBK: u16 = 0x80;
pub const ATA_ER_UNC: u16 = 0x40;
pub const ATA_ER_MC: u16 = 0x20;
pub const ATA_ER_IDNF: u16 = 0x10;
pub const ATA_ER_MCR: u16 = 0x08;
pub const ATA_ER_ABRT: u16 = 0x04;
pub const ATA_ER_TK0NF: u16 = 0x02;
pub const ATA_ER_AMNF: u16 = 0x01;
pub const ATA_CMD_READ_PIO: u8 = 0x20;
pub const ATA_CMD_READ_PIO_EXT: u16 = 0x24;
pub const ATA_CMD_READ_DMA: u16 = 0xC8;
pub const ATA_CMD_READ_DMA_EXT: u16 = 0x25;
pub const ATA_CMD_WRITE_PIO: u16 = 0x30;
pub const ATA_CMD_WRITE_PIO_EXT: u16 = 0x34;
pub const ATA_CMD_WRITE_DMA: u16 = 0xCA;
pub const ATA_CMD_WRITE_DMA_EXT: u16 = 0x35;
pub const ATA_CMD_CACHE_FLUSH: u16 = 0xE7;
pub const ATA_CMD_CACHE_FLUSH_EXT: u16 = 0xEA;
pub const ATA_CMD_PACKET: u16 = 0xA0;
pub const ATA_CMD_IDENTIFY_PACKET: u16 = 0xA1;
pub const ATA_CMD_IDENTIFY: u8 = 0xEC;
pub const ATAPI_CMD_READ: u16 = 0xA8;
pub const ATAPI_CMD_EJECT: u16 = 0x1B;
pub const ATA_IDENT_DEVICETYPE: u16 = 0;
pub const ATA_IDENT_CYLINDERS: u16 = 2;
pub const ATA_IDENT_HEADS: u16 = 6;
pub const ATA_IDENT_SECTORS: u16 = 12;
pub const ATA_IDENT_SERIAL: u16 = 20;
pub const ATA_IDENT_MODEL: u16 = 54;
pub const ATA_IDENT_CAPABILITIES: u16 = 98;
pub const ATA_IDENT_FIELDVALID: u16 = 106;
pub const ATA_IDENT_MAX_LBA: u16 = 120;
pub const ATA_IDENT_COMMANDSETS: u16 = 164;
pub const ATA_IDENT_MAX_LBA_EXT: u16 = 200;
pub const IDE_ATA: u16 = 0x00;
pub const IDE_ATAPI: u16 = 0x01;
pub const ATA_REG_DATA: u16 = 0x00;
pub const ATA_REG_ERROR: u16 = 0x01;
pub const ATA_REG_FEATURES: u16 = 0x01;
pub const ATA_REG_SECCOUNT0: u16 = 0x02;
pub const ATA_REG_LBA0: u16 = 0x03;
pub const ATA_REG_LBA1: u16 = 0x04;
pub const ATA_REG_LBA2: u16 = 0x05;
pub const ATA_REG_HDDEVSEL: u16 = 0x06;
pub const ATA_REG_COMMAND: u16 = 0x07;
pub const ATA_REG_STATUS: u16 = 0x07;
pub const ATA_REG_SECCOUNT1: u16 = 0x08;
pub const ATA_REG_LBA3: u16 = 0x09;
pub const ATA_REG_LBA4: u16 = 0x0A;
pub const ATA_REG_LBA5: u16 = 0x0B;
pub const ATA_REG_CONTROL: u16 = 0x0C;
pub const ATA_REG_ALTSTATUS: u16 = 0x0C;
pub const ATA_REG_DEVADDRESS: u16 = 0x0D;

pub const ATA_READ: u16 = 0x00;
pub const ATA_WRITE: u16 = 0x013;

pub unsafe fn select_drive(bus: u8, drive: u8) {
    if bus == ATA_PRIMARY {
        if drive == ATA_MASTER {
            io::outb(ATA_PRIMARY_IO + ATA_REG_HDDEVSEL, 0xA0);
        } else {
            io::outb(ATA_PRIMARY_IO + ATA_REG_HDDEVSEL, 0xB0);
        }
    } else if drive == ATA_MASTER {
        io::outb(ATA_SECONDARY_IO + ATA_REG_HDDEVSEL, 0xA0);
    } else {
        io::outb(ATA_SECONDARY_IO + ATA_REG_HDDEVSEL, 0xB0);
    }
}

pub unsafe fn read_sector(bus: u8, drive: u8, buffer: &mut [u8], lba: u32) {
    let io_base = if bus == ATA_PRIMARY {
        ATA_PRIMARY_IO
    } else {
        ATA_SECONDARY_IO
    };

    let command = if drive == ATA_MASTER { 0xE0 } else { 0xF0 };

    let slave_bit = if drive == ATA_MASTER { 0x00 } else { 0x01 };

    io::outb(
        io_base + ATA_REG_HDDEVSEL,
        (command | (lba >> 24 & 0x0F) as u8),
    );
    //mprint("issued 0x%x to 0x%x\n", (cmd | (lba >> 24)&0x0f), io + ATA_REG_HDDEVSEL);
    //for(int k = 0; k < 10000; k++) ;
    io::outb(io_base + 1, 0x00);
    //mprint("issued 0x%x to 0x%x\n", 0x00, io + 1);
    //for(int k = 0; k < 10000; k++) ;
    io::outb(io_base + ATA_REG_SECCOUNT0, 1);
    //mprint("issued 0x%x to 0x%x\n", (uint8_t) numsects, io + ATA_REG_SECCOUNT0);
    //for(int k = 0; k < 10000; k++) ;
    io::outb(io_base + ATA_REG_LBA0, lba as u8);
    //mprint("issued 0x%x to 0x%x\n", (uint8_t)((lba)), io + ATA_REG_LBA0);
    //for(int k = 0; k < 10000; k++) ;
    io::outb(io_base + ATA_REG_LBA1, (lba >> 8) as u8);
    //mprint("issued 0x%x to 0x%x\n", (uint8_t)((lba) >> 8), io + ATA_REG_LBA1);
    //for(int k = 0; k < 10000; k++) ;
    io::outb(io_base + ATA_REG_LBA2, (lba >> 16) as u8);
    //mprint("issued 0x%x to 0x%x\n", (uint8_t)((lba) >> 16), io + ATA_REG_LBA2);
    //for(int k = 0; k < 10000; k++) ;
    io::outb(io_base + ATA_REG_COMMAND, ATA_CMD_READ_PIO);
    //mprint("issued 0x%x to 0x%x\n", ATA_CMD_READ_PIO, io + ATA_REG_COMMAND);

    poll(io_base);

    assert_eq!(buffer.len(), 512);
    for byte in buffer.iter_mut() {
        *byte = io::inb(io_base + ATA_REG_DATA);
    }

    delay(io_base);
}

unsafe fn poll(io_base: u16) {
    delay(io_base);

    loop {
        let status = io::inb(io_base + ATA_REG_STATUS);
        if (status & ATA_SR_BSY) == 0 {
            break;
        }
    }

    loop {
        let status = io::inb(io_base + ATA_REG_STATUS);

        if (status & ATA_SR_ERR) != 0 {
            panic!("ata-device err is set. device failure");
        }

        if (status & ATA_SR_DRQ) != 0 {
            break;
        }
    }
}

unsafe fn delay(io_base: u16) {
    for i in 0..4 {
        io::inb(io_base + ATA_REG_ALTSTATUS);
    }
}

pub unsafe fn identify(bus: u8, drive: u8) {
    select_drive(bus, drive);
    let io_base = if bus == ATA_PRIMARY {
        ATA_PRIMARY_IO
    } else {
        ATA_SECONDARY_IO
    };
    /* ATA specs say these values must be zero before sending IDENTIFY */
    io::outb(io_base + ATA_REG_SECCOUNT0, 0);
    io::outb(io_base + ATA_REG_LBA0, 0);
    io::outb(io_base + ATA_REG_LBA1, 0);
    io::outb(io_base + ATA_REG_LBA2, 0);
    /* Now, send IDENTIFY */
    io::outb(io_base + ATA_REG_COMMAND, ATA_CMD_IDENTIFY);
    /* Now, read status port */
    if io::inb(io_base + ATA_REG_STATUS) == 0 {
        log::info!("ata-disk {bus}.{drive} doesn't exist");
        return;
    }

    /* Now, poll untill BSY is clear. */
    loop {
        let status = io::inb(io_base + ATA_REG_STATUS) & ATA_SR_BSY;
        if status == 0 {
            break;
        }
    }

    loop {
        let status = io::inb(io_base + ATA_REG_STATUS);

        if (status & ATA_SR_ERR) != 0 {
            log::warn!("ata-disk {bus}.{drive} has ERR set. Disabled");
            return;
        }

        if (status & ATA_SR_DRQ) != 0 {
            break;
        }
    }

    log::info!("ata-disk {bus}.{drive} is online");
}

pub fn probe() {
    unsafe { identify(ATA_PRIMARY, ATA_MASTER) };
    unsafe { identify(ATA_PRIMARY, ATA_SLAVE) };

    let mut bytes = [0; 512];

    unsafe {
        read_sector(ATA_PRIMARY, ATA_MASTER, &mut bytes, 0);
    }

    log::debug!("sector 0: {bytes:?}");
}
