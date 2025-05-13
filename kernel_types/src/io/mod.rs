pub mod block;
pub mod char;
mod handle;
pub mod op;

pub use handle::*;
pub use op::*;

pub type Result<T> = core::result::Result<T, Error>;
