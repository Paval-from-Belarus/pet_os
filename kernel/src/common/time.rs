use kernel_types::declare_constants;

#[derive(Default)]
pub struct Timestamp {
    secs: u64,
}
declare_constants!(
    pub u64,
    MILLIS_PER_SEC = 1_000;
    MICROS_PER_SEC = 1_000_000;
);
impl Timestamp {
    pub fn from_secs(secs: u64) -> Self {
        Self { secs }
    }
    pub fn from_millis(millis: u64) -> Self {
        let secs = millis / MILLIS_PER_SEC;
        Self::from_secs(secs)
    }
    pub fn from_micros(micros: u64) -> Self {
        let secs = micros / MICROS_PER_SEC;
        Self::from_secs(secs)
    }
}
