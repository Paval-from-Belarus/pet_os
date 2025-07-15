#[derive(Debug)]
pub struct FileInfo {
    pub offset: usize,
    pub ctx: *const (),
}
