use crate::memory::Page;

use super::MAX_UNIT_SIZE;

pub trait BuddyPage<'a>: Sized {
    fn as_buddies(&mut self) -> &'a mut [Self];
}

impl BuddyPage<'static> for Page {
    fn as_buddies(&mut self) -> &'static mut [Page] {
        let mut expected_slice_size = MAX_UNIT_SIZE;

        loop {
            let page_slice = unsafe { self.as_slice_mut(expected_slice_size) };

            let effective_slice_size = page_slice
                .iter()
                .filter(|page| !page.is_used())
                .take(expected_slice_size)
                .count();

            if effective_slice_size == expected_slice_size {
                return page_slice;
            }

            expected_slice_size /= 2;

            assert!(
                expected_slice_size >= 1,
                "At least one page in free_pages should be free"
            );
        }
    }
}
