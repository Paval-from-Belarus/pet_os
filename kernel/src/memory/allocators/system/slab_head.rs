use kernel_macro::ListNode;
use kernel_types::collections::{
    BorrowingLinkedList, ListNode, TinyLinkedList,
};

use crate::memory::VirtualAddress;

use super::{slab_entry::SlabEntry, SlabName};

// use slab entries as child for slab head
#[derive(ListNode)]
pub struct SlabHead {
    pub name: SlabName,
    //the list of slab which are full
    pub full: TinyLinkedList<'static, SlabEntry>,
    //the list of slabs which are partially filled (even if all entries are free)
    pub partial: TinyLinkedList<'static, SlabEntry>,

    #[list_pivots]
    node: ListNode<SlabHead>,
}

impl SlabHead {
    pub fn dealloc(&mut self, offset: VirtualAddress) {
        log::debug!("Dealloc {} entry at {offset:X}", self.name);

        let mut full_iter = self.full.iter_mut();

        loop {
            let Some(entry) = full_iter.next() else {
                break;
            };

            if entry.holds(offset) {
                entry.release(offset);

                let partial = full_iter.unlink_watched().unwrap();
                self.partial.push_front(partial);
                return;
            }
        }

        let entry = self
            .partial
            .iter_mut()
            .find(|entry| entry.holds(offset))
            .expect("Failed to find slab entry by ");

        entry.release(offset);
    }

    pub fn try_alloc(&mut self) -> Option<VirtualAddress> {
        let mut partial_iter = self.partial.iter_mut();

        let entry = partial_iter.next()?;

        let offset = entry.take_object();

        if entry.is_full() {
            let entry = partial_iter.unlink_watched().unwrap();
            self.full.push_front(entry);
        }

        Some(offset)
    }

    pub fn extend_with_free_entries(
        &mut self,
        entries: TinyLinkedList<'static, SlabEntry>,
    ) {
        self.partial.splice(entries);
    }
}
