use crate::memory::Page;

pub trait BuddyPage<'a>: Sized {
    fn as_buddy_batch_head(&mut self, max_count: usize) -> &'a mut [Self];
}

impl BuddyPage<'static> for Page {
    fn as_buddy_batch_head(&mut self, max_count: usize) -> &'static mut [Page] {
        let mut expected_slice_size = max_count;

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
