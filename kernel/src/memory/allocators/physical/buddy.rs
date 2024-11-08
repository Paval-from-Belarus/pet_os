use core::cell::UnsafeCell;

use kernel_types::collections::ListNode;

use crate::memory::{
    allocators::physical::{MAX_UNIT_POWER, MAX_UNIT_SIZE},
    Page,
};

pub struct BuddyPiece {
    ///the power of two request
    size: usize,
    power: usize,
    first_page_cell: UnsafeCell<&'static mut ListNode<Page>>,
    // _marker: PhantomData<>,
}

impl BuddyPiece {
    pub fn with_pages(
        pages_count: usize,
        first_page: &'static mut ListNode<Page>,
    ) -> Self {
        assert!(pages_count <= MAX_UNIT_SIZE);
        let power = Self::power_of(pages_count);
        Self::with_power(power, first_page)
    }
    pub fn with_power(
        power: usize,
        first_page: &'static mut ListNode<Page>,
    ) -> Self {
        assert!(power <= MAX_UNIT_POWER);
        let size = Self::size_of(power);
        // let raw_first_page = NonNull::from(first_page);
        Self {
            size,
            power,
            first_page_cell: UnsafeCell::new(first_page),
        }
    }
    pub fn power(&self) -> usize {
        self.power
    }
    ///the count of pages for given piece
    pub fn size(&self) -> usize {
        self.size
    }
    //if this struct was constructed then all requirements are already passed. It's save to create slice of Page struct
    pub fn pages(&self) -> &'static mut [Page] {
        unsafe {
            let first_page = &mut (*self.first_page_cell.get());
            first_page.as_slice_mut(self.size)
        }
    }
    pub const fn power_of(mut number: usize) -> usize {
        let mut power = 0;
        while number > 0 {
            number /= 2;
            power += 1;
        }
        power
    }
    pub fn size_of(power: usize) -> usize {
        let mut size = 1;
        for _ in 0..power {
            size *= 2;
        }
        size
    }
}
