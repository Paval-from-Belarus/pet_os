use core::{ptr::NonNull, sync::atomic::AtomicUsize};

use kernel_macro::ListNode;
use kernel_types::{
    collections::{HashData, HashTable, ListNode},
    string::QuickString,
};

use super::{IndexNode, MountPoint};

pub const HASHTABLE_CAPACITY: usize = 500;

pub type PathNodeHashTable = HashTable<'static, PathNode, HASHTABLE_CAPACITY>;

struct SearchResult {
    path: NonNull<PathNode>,
    name: QuickString<'static>,
}

#[derive(ListNode)]
#[repr(C)]
///alternative struct to linux `dentry`
pub struct PathNode {
    #[list_pivots]
    node: ListNode<PathNode>,
    file_system: NonNull<MountPoint>,
    //linux also support ptr::null for invalid file names
    inode: NonNull<IndexNode>,
    name: QuickString<'static>,
    #[doc = "The parent of corresponding inode"]
    parent: NonNull<IndexNode>,
    use_count: AtomicUsize,
}

impl PathNode {
    pub fn is_parent(&self, other_parent: &IndexNode) -> bool {
        core::ptr::eq(self.parent.as_ptr(), other_parent)
    }

    pub fn is_root(&self) -> bool {
        core::ptr::eq(self.parent.as_ptr(), self.inode.as_ptr())
    }
}

impl PartialEq<IndexNode> for PathNode {
    fn eq(&self, other: &IndexNode) -> bool {
        core::ptr::eq(self.inode.as_ptr(), other)
    }
}

impl HashData for PathNode {
    type Item<'a> = QuickString<'a>;

    fn key<'a>(&self) -> &QuickString<'a> {
        &self.name
    }
}
