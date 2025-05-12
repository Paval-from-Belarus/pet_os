pub use kernel_types::fs::*;

pub fn register(fs: FileSystem) -> Result<usize, ()> {
    Ok(0)
}
