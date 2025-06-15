#[derive(Debug, Clone, Copy)]
pub enum OpStatus {
    Failed,
    NotFound,
    NotSupported,
    InvalidResponse,
}
