use crate::string::QuickString;

pub struct PathNode<'a> {
    name: QuickString<'a>,
}

pub struct SuperBlockInfo {
    pub context: *const (),
    pub block_size: usize,
    pub queue_size: usize,
}
