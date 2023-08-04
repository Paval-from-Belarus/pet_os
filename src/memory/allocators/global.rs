use spin::Mutex;
use crate::memory::KernelAllocator;
pub struct GlobalAllocator {
    allocator: Mutex<Option<KernelAllocator>>
}