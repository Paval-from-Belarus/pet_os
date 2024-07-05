#![feature(offset_of)]
#[macro_use]
extern crate kernel_macro;

#[cfg(test)]
mod tests {
    extern crate alloc;
    extern crate kernel_macro;
    extern crate kernel_types;
    extern crate std;

    use kernel_types::collections::{
        BorrowingLinkedList, LinkedList, ListNode, ListNodeData, TinyLinkedList, TinyListNode,
        TinyListNodeData,
    };

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
            let node = test.as_node();
            let first_struct = TestStruct::from_node(node);
            let tiny_node = first_struct.as_tiny_node();
            let second_struct = TestStruct::from_tiny_node(tiny_node);
            // list.push_back(test.as_node());
            // tiny_list.push_back(test.as_tiny_node());
            // array.push(&test);
        }
    }
}
