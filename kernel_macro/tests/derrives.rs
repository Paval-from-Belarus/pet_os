#![feature(offset_of)]
#[macro_use]
extern crate kernel_macro;

#[cfg(test)]
mod tests {
    extern crate kernel_macro;
    extern crate kernel_types;
    extern crate std;
    extern crate alloc;

    use kernel_types::collections::{BorrowingLinkedList, LinkedList, ListNode, TinyLinkedList, TinyListNode};

    pub struct AnotherStruct;

    #[derive(ListNode)]
    #[repr(C)]
    pub struct TestStruct {
        #[list_pivots(dangling)]
        node: ListNode<AnotherStruct>,
        #[list_pivot]
        tiny_node: TinyListNode<TestStruct>,
        payload: usize,
    }

    #[test]
    fn list_node_test() {
        let mut list = LinkedList::<AnotherStruct>::empty();
        let mut tiny_list = TinyLinkedList::<TestStruct>::empty();
        let mut node = TestStruct {
            node: unsafe { ListNode::empty() },
            tiny_node: TinyListNode::empty(),
            payload: 332,
        };
        list.push_back(node.as_node());
        {
            let mut test = TestStruct {
                node: unsafe { ListNode::empty() },
                tiny_node: TinyListNode::empty(),
                payload: 42,
            };
            list.push_back(test.as_node());
            tiny_list.push_back(test.as_tiny_node());
            // array.push(&test);
        }
    }
}
