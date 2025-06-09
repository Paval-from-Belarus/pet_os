use kernel_types::collections::LinkedList;

use crate::memory::AllocError;

use super::{slab_head::SlabHead, SlabName};

#[derive(Default)]
pub struct SlabTree {
    heads: LinkedList<'static, SlabHead>,
}

impl SlabTree {
    pub fn new() -> Self {
        Self::default()
    }

    pub fn find_head_or_alloc<F>(
        &mut self,
        slab_name: SlabName,
        allocator: F,
    ) -> Result<&mut SlabHead, AllocError>
    where
        F: FnOnce() -> Result<&'static mut SlabHead, AllocError>,
    {
        let existing_head =
            self.heads.iter_mut().find(|head| head.name.eq(slab_name));

        let head = if let Some(head) = existing_head {
            head
        } else {
            let head = allocator()?;

            self.heads.push_front(head.as_node());

            self.heads
                .iter_mut()
                .find(|head| head.name.eq(slab_name))
                .unwrap()
        };

        Ok(head)
    }

    pub fn find_head(&mut self, slab_name: SlabName) -> Option<&mut SlabHead> {
        let head =
            self.heads.iter_mut().find(|head| head.name.eq(slab_name))?;

        Some(head)
    }
}
