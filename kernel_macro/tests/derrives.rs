#![feature(offset_of)]
#[macro_use]
extern crate kernel_macro;

#[cfg(test)]
mod tests {
    extern crate kernel_macro;
    extern crate std;
    extern crate alloc;

    use kernel_types::collections::{BorrowingLinkedList, LinkedList, ListNode};

    #[derive(ListNode)]
    struct TestStruct {
        #[list_pivots((dangling,))]
        node: ListNode<TestStruct>,
        payload: usize,
    }

    #[test]
    fn list_node_test() {
        let mut list = LinkedList::<'_, TestStruct>::empty();
        {
            let mut test = TestStruct {
                node: unsafe { ListNode::empty() },
                payload: 42,
            };
            list.push_back(test.as_node());
        }
    }
}
