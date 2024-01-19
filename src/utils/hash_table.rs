use alloc::borrow::ToOwned;
use core::marker::PhantomData;
use core::mem::MaybeUninit;
use core::ops::Deref;
use core::ptr;

use crate::utils::{BorrowingLinkedList, TinyLinkedList, TinyListNode, TinyListNodeData};
use crate::utils::string::{HashData, HashKey};

pub struct HashTable<'a, K: HashKey, V: TinyListNodeData<Item=V> + HashData<K>, const N: usize> {
    table: [TinyLinkedList<'a, V>; N],
    _marker: PhantomData<[(K, V); N]>,
}


impl<'a, const N: usize, K: HashKey, V: TinyListNodeData<Item=V> + HashData<K>> HashTable<'a, K, V, N> {
    pub const fn empty() -> Self {
        let raw_table: [MaybeUninit<TinyLinkedList<'a, V>>; N] = MaybeUninit::uninit_array();
        let table = unsafe { MaybeUninit::array_assume_init(raw_table) };
        Self { table, _marker: PhantomData }
    }
    pub fn size(&self) -> usize {
        N
    }
    pub fn put(&mut self, node: &'a mut TinyListNode<V>) {
        let key = node.key();
        assert!(self.find(key, |found| ptr::eq(found, node as &V)).is_none(),
                "Failed to put already present entry");
        let bucket = self.find_bucket(key);
        bucket.push_front(node);
    }
    pub fn remove(&mut self, node: &'a mut TinyListNode<V>) {
        let bucket = self.find_bucket(node.key());
        bucket.remove(node)
    }
    pub fn find<P>(&mut self, key: &K, mut predicate: P) -> Option<&'a mut V>
                   where P: FnMut(&V) -> bool {
        let bucket = self.find_bucket(key);
        bucket.iter_mut()
              .find(|entry| entry.equals_by_key(key) && predicate(entry))
              .map(|entry| entry as &mut V)
    }
    fn find_bucket(&mut self, key: &K) -> &mut TinyLinkedList<'a, V> {
        let index = self.calc_bucket_index(key);
        &mut self.table[index]
    }
    fn calc_bucket_index(&self, key: &K) -> usize {
        (key.hash_code() as usize) / self.size()
    }
}

#[cfg(test)]
mod tests {
    extern crate std;
    extern crate alloc;

    use crate::list_node;
    use crate::utils::{ListNode, ListNodeData};
    use crate::utils::string::{HashCode, HashKey};

    list_node!(
        pub DataType(node)
    );
    struct DataType {
        node: ListNode<DataType>,
    }

    impl Eq for DataType {}

    impl PartialEq for DataType {
        fn eq(&self, other: &Self) -> bool {
            true
        }
    }

    impl HashKey for DataType {
        fn hash_code(&self) -> HashCode {
            todo!()
        }
    }


    #[test]
    fn integrity_test() {
        let node = unsafe { DataType { node: ListNode::empty() } };
    }
}
