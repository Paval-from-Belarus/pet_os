#[cfg(feature = "driver")]
mod driver;

pub struct UserSpaceAllocator;

unsafe impl core::alloc::GlobalAlloc for UserSpaceAllocator {
    unsafe fn alloc(&self, _layout: core::alloc::Layout) -> *mut u8 {
        todo!()
    }

    unsafe fn dealloc(&self, _ptr: *mut u8, _layout: core::alloc::Layout) {
        todo!()
    }
}

#[global_allocator]
static USER_SPACE_ALLOCATOR: UserSpaceAllocator = UserSpaceAllocator;
