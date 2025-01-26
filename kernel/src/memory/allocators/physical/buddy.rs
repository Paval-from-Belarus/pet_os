use core::cell::UnsafeCell;

use kernel_types::collections::ListNode;

use crate::memory::{allocators::physical::MAX_BUDDY_BATCH_SIZE, Page};

pub struct BuddyBatch {
    ///the power of two request
    size: usize,
    power: usize,
    //
    first_page_cell: UnsafeCell<&'static mut ListNode<Page>>,
}

impl BuddyBatch {
    pub fn new_request(
        pages_count: usize,
        buffer: &'static mut ListNode<Page>,
    ) -> Self {
        assert!(pages_count <= MAX_BUDDY_BATCH_SIZE);

        let power = super::buddy_index(pages_count);

        Self {
            power,
            size: 2usize.pow(power as u32),
            first_page_cell: UnsafeCell::new(buffer),
        }
    }

    ///the count of pages for given piece
    pub const fn len(&self) -> usize {
        self.size
    }

    pub const fn power(&self) -> usize {
        self.power
    }

    //if this struct was constructed then all requirements are already passed. It's save to create slice of Page struct
    pub fn pages(&self) -> &'static mut [Page] {
        unsafe {
            let first_page = &mut (*self.first_page_cell.get());
            first_page.as_slice_mut(self.size)
        }
    }
}
