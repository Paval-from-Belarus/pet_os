pub use kernel_types::fs::*;

pub fn register(_fs: FileSystem) -> Result<usize, ()> {
    Ok(0)
}
