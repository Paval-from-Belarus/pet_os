use core::hash::Hasher;
use core::marker::PhantomData;
use core::mem::MaybeUninit;

use core::ptr;

use crate::collections::{
    BorrowingLinkedList, FastHasher, HashCode, HashData, HashKey,
    TinyLinkedList, TinyListNode, TinyListNodeData,
};
use crate::lambda_const_assert;

#[allow(unused)]
struct HashBucket<'a, V: TinyListNodeData<Item = V> + HashData> {
    list: TinyLinkedList<'a, V>,
    _marker: PhantomData<V>,
}

pub struct HashTable<
    'data,
    V: TinyListNodeData<Item = V> + HashData,
    const N: usize,
> {
    table: [TinyLinkedList<'data, V>; N],
    _marker: PhantomData<[V; N]>,
}

impl<'a, const N: usize, V: TinyListNodeData<Item = V> + HashData>
    HashTable<'a, V, N>
{
    pub fn new() -> Self {
        let raw_table: [MaybeUninit<TinyLinkedList<'a, V>>; N] =
            MaybeUninit::uninit().transpose();

        let table = raw_table.map(|mut raw_bucket| {
            raw_bucket.write(TinyLinkedList::empty());
            unsafe { raw_bucket.assume_init() }
        });
        Self {
            table,
            _marker: PhantomData,
        }
    }

    pub fn size(&self) -> usize {
        N
    }

    pub fn insert<T: Into<&'a mut TinyListNode<V>>>(&mut self, node: T) {
        let node = node.into();

        let key = (*node).key();
        assert!(
            self.find(key, |found| ptr::eq(found, node as &V)).is_none(),
            "Failed to put already present entry"
        );
        let bucket = self.find_bucket(key);
        bucket.push_front(node);
    }

    pub fn remove<'b, K>(&mut self, key: &K) -> Option<&'a mut V>
    where
        K: HashKey,
        V: HashData<Item<'b> = K>,
    {
        let _bucket = self.find_bucket(key);
        todo!()
    }

    pub fn get<'b, K>(&self, _key: &K) -> Option<&'a V>
    where
        K: HashKey,
        V: HashData<Item<'b> = K>,
    {
        todo!()
    }

    pub fn get_mut<'b, K>(&mut self, key: &K) -> Option<&'a mut V>
    where
        K: HashKey,
        V: HashData<Item<'b> = K>,
    {
        self.find(key, |_| true)
    }

    pub fn find<'b, P, K>(
        &mut self,
        key: &K,
        mut predicate: P,
    ) -> Option<&'a mut V>
    where
        P: FnMut(&V) -> bool,
        K: HashKey,
        V: HashData<Item<'b> = K>,
    {
        let bucket = self.find_bucket(key);
        bucket
            .iter_mut()
            .find(|entry| entry.equals_by_key(key) && predicate(entry))
            .map(|entry| entry as &mut V)
    }

    fn find_bucket<'b, K>(&mut self, key: &K) -> &mut TinyLinkedList<'a, V>
    where
        K: HashKey,
        V: HashData<Item<'b> = K>,
    {
        let index = self.calc_bucket_index(key);
        &mut self.table[index]
    }

    fn calc_bucket_index<K>(&self, key: &K) -> usize
    where
        K: HashKey,
    {
        (key.hash_code() as usize) / self.size()
    }
}

pub struct PolynomialHasher<const N: usize>(HashCode);

impl<const N: usize> PolynomialHasher<N> {
    pub fn new() -> Self {
        lambda_const_assert!(N: usize => N < HashCode::MAX as usize);
        Self(0)
    }
}

impl<const N: usize> Default for PolynomialHasher<N> {
    fn default() -> Self {
        Self::new()
    }
}

impl<const N: usize> Hasher for PolynomialHasher<N> {
    fn finish(&self) -> u64 {
        self.0 as _
    }
    fn write(&mut self, bytes: &[u8]) {
        self.0 = bytes.iter().fold(self.0, |sum, byte| {
            sum + (N as HashCode) * (*byte as HashCode)
        });
    }
}

impl<const N: usize> FastHasher for PolynomialHasher<N> {
    fn fast_hash(&self) -> HashCode {
        self.0
    }
}

impl<V: TinyListNodeData<Item = V> + HashData, const N: usize> Default
    for HashTable<'_, V, N>
{
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    extern crate alloc;
    extern crate std;

    use crate::{
        collections::{HashCode, HashKey, ListNode},
        list_node,
    };

    list_node!(DataType, node);

    struct DataType {
        node: ListNode<DataType>,
    }

    impl Eq for DataType {}

    impl PartialEq for DataType {
        fn eq(&self, _other: &Self) -> bool {
            true
        }
    }

    impl HashKey for DataType {
        fn hash_code(&self) -> HashCode {
            todo!()
        }
    }

    #[test]
    fn integrity_test() {}

    #[test]
    fn insert_test() {}

    #[test]
    fn remove_est() {}

    #[test]
    fn insert_overwrite_test() {}

    #[test]
    fn nonexistent_key_test() {}

    #[test]
    fn collision_handling_test() {}
}
