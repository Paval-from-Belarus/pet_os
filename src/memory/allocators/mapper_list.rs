use core::ops::Deref;
use core::{ptr, slice};
use core::slice::IterMut;
use crate::memory::{Page, PageRec};

pub enum ZoneType {
    Usable,
    Device,
}

///The main purpose of this struct is to map available memory space to InfoRec
///Generaly is used to collect <code>PageRec</code> ― caller pass entries to this collection
pub struct MemoryMapper {
    //array of PageRec
}

///The sequence of free pages
///Simply, it's a header of pages
pub struct PageList {
    head: *mut PageRec,
    tail: *mut PageRec,
    items_cnt: usize,
}

pub struct Iter {
    front_pivot: Option<&'static PageRec>,
    back_pivot: Option<&'static PageRec>,
}

impl IntoIterator for PageList {
    type Item = &'static PageRec;
    type IntoIter = Iter;
    fn into_iter(self) -> Self::IntoIter {
        self.iter()
    }
}

// impl FromIterator<&'static mut PageRec> for PageList {
//     fn from_iter<T: IntoIterator<Item=&'static mut PageRec>>(iter: T) -> Self {
//         let mut list = PageList::empty();
//         let old = iter.into_iter().cloned();
//             // .for_each(|rec| list.push_back(rec));
//         return list;
//     }
// }

impl Iterator for Iter {
    type Item = &'static PageRec;
    fn next(&mut self) -> Option<Self::Item> {
        let next = self.front_pivot;
        let option = next.and_then(|rec| rec.next_ref());
        self.front_pivot = option.map(|rec| rec as &PageRec);
        return next;
    }
}
impl DoubleEndedIterator for Iter {
    fn next_back(&mut self) -> Option<Self::Item> {
        let prev = self.back_pivot;
        let option = prev.and_then(|rec| rec.prev_ref());
        self.back_pivot = option.map(PageRec::read_only);
        return prev;
    }
}

impl PageList {
    pub fn empty() -> PageList {
        PageList { head: ptr::null_mut(), tail: ptr::null_mut(), items_cnt: 0 }
    }
    pub fn new(header: &'static mut PageRec, option_tail: Option<&'static mut PageRec>) -> PageList {
        let mut items_cnt: usize = 1;
        let header_ptr: *mut PageRec = header;
        let tail_ptr: *mut PageRec;
        if let Some(tail) = option_tail {
            tail_ptr = tail;
        } else {
            tail_ptr = header_ptr;
        }
        PageList { head: header_ptr, tail: tail_ptr, items_cnt }
    }
    pub fn first(&self) -> Option<&'static PageRec> {
        return self.first_mut().map(PageRec::read_only);
    }
    pub fn last(&self) -> Option<&'static PageRec> {
        return self.last_mut().map(PageRec::read_only);
    }

    pub fn push_back(&mut self, page: &'static mut PageRec) {
        PageList::clear_links(page);
        if let Some(tail) = self.last_mut() {
            tail.set_next(page);
            page.set_prev(tail);
            self.tail = page;
            self.items_cnt += 1;
        } else {
            self.init_empty_list(page);
        }
    }
    pub fn push_front(&mut self, page: &'static mut PageRec) {
        PageList::clear_links(page);
        if let Some(head) = self.first_mut() {
            head.set_prev(page);
            page.set_next(head);
            self.head = page;
            self.items_cnt += 1;
        } else {
            self.init_empty_list(page);
        }
    }
    pub fn size(&self) -> usize {
        self.items_cnt
    }
    pub fn is_empty(&self) -> bool {
        self.size() == 0
    }
    pub fn add_all(&mut self, other: PageList) {}
    ///The method excludes elements specified by [from_index; to_index) range
    pub fn split_list(&mut self, from_index: usize, to_index: usize) -> PageList {
        if from_index >= self.size() || self.is_empty() {
            return PageList::empty();
        }
        let to_index = core::cmp::min(to_index, self.size());
        let mut list = PageList::empty();
        for page_rec in self.iter_mut().skip(from_index).take(to_index) {
            list.push_back(self.pull(page_rec));
        }
        // for page_rec in rest_tail.next().into_iter()
        return PageList::empty();
    }
    pub fn iter(&self) -> Iter {
        let front_pivot = self.first();
        let back_pivot = self.last();
        Iter { front_pivot, back_pivot }
    }
    pub fn iter_mut(&mut self) -> IterMut<'static, PageRec> {
        todo!()
    }
    fn pull(&mut self, page: &'static mut PageRec) -> &'static mut PageRec {
        //self.lock();
        if let Some(prev) = page.prev_ref() {
            prev.set_next(page.next_ptr());
            if let Some(next) = page.next_ref() {
                next.set_prev(page.prev_ptr());
            }
        } else {
            self.head = page.next_ptr(); //we have already removed header
        }
        if let Some(next) = page.next_ref() {
            next.set_prev(page.prev_ptr());
            if let Some(prev) = page.prev_ref() {
                prev.set_next(page.next_ptr());
            }
        } else {
            self.tail = page.prev_ptr();
        }
        self.items_cnt = core::cmp::max(0, self.items_cnt - 1);
        page
    }
    fn init_empty_list(&mut self, page: &'static mut PageRec) {
        let pointer: *mut PageRec = page;
        self.head = pointer;
        self.tail = pointer;
        self.items_cnt = 1;
    }
    fn first_mut(&self) -> Option<&'static mut PageRec> {
        let result: Option<&mut PageRec>;
        if !self.is_empty() {
            unsafe {
                result = Some(&mut *self.head);
            }
        } else {
            result = None;
        }
        return result;
    }
    fn last_mut(&self) -> Option<&'static mut PageRec> {
        let result: Option<&mut PageRec>;
        if !self.is_empty() {
            unsafe {
                result = Some(&mut *self.tail);
            }
        } else {
            result = None;
        }
        return result;
    }
    fn clear_links(page: &mut PageRec) {
        page.set_prev(ptr::null_mut());
        page.set_next(ptr::null_mut());
    }
}

impl MemoryMapper {
    pub fn get_zone(zone: ZoneType) {}
}