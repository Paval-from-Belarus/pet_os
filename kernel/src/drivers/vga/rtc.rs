use crate::common::io;

// RTC/CMOS ports
const CMOS_ADDRESS: u16 = 0x70;
const CMOS_DATA: u16 = 0x71;

// RTC registers
const RTC_SECONDS: u8 = 0x00;
const RTC_MINUTES: u8 = 0x02;
const RTC_HOURS: u8 = 0x04;
const RTC_DAY: u8 = 0x07;
const RTC_MONTH: u8 = 0x08;
const RTC_YEAR: u8 = 0x09;
const RTC_STATUS_A: u8 = 0x0A;
const RTC_STATUS_B: u8 = 0x0B;

// Read CMOS register
unsafe fn read_cmos(reg: u8) -> u8 {
    // Select register with NMI disabled (bit 7 = 1)
    io::outb(CMOS_ADDRESS, reg | 0x80);
    io::inb(CMOS_DATA)
}

// Wait for RTC update to complete
unsafe fn wait_for_rtc() {
    while read_cmos(RTC_STATUS_A) & 0x80 != 0 {
        // Spin until Update-In-Progress (UIP) flag is clear
    }
}

// Read RTC time
pub struct RtcTime {
    pub seconds: u8,
    pub minutes: u8,
    pub hours: u8,
    pub day: u8,
    pub month: u8,
    pub year: u16, // Full year (e.g., 2025)
}

pub unsafe fn read_rtc_time() -> RtcTime {
    wait_for_rtc();

    // Read Status Register B to determine format
    let status_b = read_cmos(RTC_STATUS_B);
    let is_binary = (status_b & 0x04) != 0; // Bit 2: 1 = binary, 0 = BCD
    let is_24hour = (status_b & 0x02) != 0; // Bit 1: 1 = 24-hour, 0 = 12-hour

    // Read raw time values
    let mut seconds = read_cmos(RTC_SECONDS);
    let mut minutes = read_cmos(RTC_MINUTES);
    let mut hours = read_cmos(RTC_HOURS);
    let mut day = read_cmos(RTC_DAY);
    let mut month = read_cmos(RTC_MONTH);
    let mut year = read_cmos(RTC_YEAR) as u16;

    // Convert BCD to binary if needed
    if !is_binary {
        seconds = (seconds & 0x0F) + ((seconds >> 4) * 10);
        minutes = (minutes & 0x0F) + ((minutes >> 4) * 10);
        hours = (hours & 0x0F) + ((hours >> 4) * 10);
        day = (day & 0x0F) + ((day >> 4) * 10);
        month = (month & 0x0F) + ((month >> 4) * 10);
        year = (year & 0x0F) + ((year >> 4) * 10);
    }

    // Convert 12-hour to 24-hour if needed
    if !is_24hour {
        let pm = (hours & 0x80) != 0; // PM flag
        hours &= 0x7F; // Clear PM bit
        if pm && hours != 12 {
            hours += 12;
        } else if !pm && hours == 12 {
            hours = 0;
        }
    }

    // Assume year is two digits; add century (e.g., 2000)
    year += 2000;

    RtcTime {
        seconds,
        minutes,
        hours,
        day,
        month,
        year,
    }
}
