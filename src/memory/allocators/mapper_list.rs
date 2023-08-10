use core::ops::RangeBounds;
use core::ptr;
use core::slice::Iter;
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

    header: Option<PageRec>,
    tail: Option<PageRec>,
    items_cnt: usize,
}

pub struct PageIterator {
    front_pivot: Option<&'static PageRec>,
    back_pivot: Option<&'static PageRec>,
}

impl IntoIterator for PageList {
    type Item = &'static PageRec;
    type IntoIter = PageIterator;
    fn into_iter(self) -> Self::IntoIter {
        self.mut_iter()
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

impl Iterator for PageIterator {
    type Item = &'static PageRec;
    fn next(&mut self) -> Option<Self::Item> {
        let next = self.front_pivot;
        let option = next.and_then(|rec| rec.next_entry());
        self.front_pivot = option.map(|rec| rec as &PageRec);
        return next;
    }
}

impl DoubleEndedIterator for PageIterator {
    fn next_back(&mut self) -> Option<Self::Item> {
        let prev = self.back_pivot;
        let option = prev.and_then(|rec| rec.prev_entry());
        self.back_pivot = option.map(|rec| rec as &PageRec);
        return prev;
    }
}

impl PageList {
    pub fn empty() -> PageList {
        PageList { header: None, tail: None, items_cnt: 0 }
    }
    pub fn new(header: PageRec, tail: Option<PageRec>) -> PageList {
        let mut items_cnt: usize = 1;
        if tail.is_some() {
            items_cnt += 1;
        }
        let tail = tail.unwrap_or(header);
        PageList { header: Some(header), tail: Some(tail), items_cnt }
    }
    pub fn push_back(&mut self, page: PageRec) {
        PageList::clear_pushed(&mut page);
        if !self.is_empty() {
            let tail: PageRec = self.tail.unwrap();
            tail.set_next(Some(&mut page));
            page.set_prev(Some(&mut tail));
            self.tail = Some(page);
        } else {
            self.init_empty_list(page);
        }
        self.items_cnt += 1;
    }
    pub fn push_front(&mut self, page: PageRec) {
        PageList::clear_pushed(&mut page);
        if !self.is_empty() {
            let header: PageRec = self.header.unwrap();
            header.set_prev(Some(&mut page));
            page.set_next(Some(&mut header));
            self.header = Some(page);
        } else {
            self.init_empty_list(page);
        }
        self.items_cnt += 1;
    }
    pub fn size(&self) -> usize {
        self.items_cnt
    }
    pub fn is_empty(&self) -> bool {
        self.size() == 0
    }
    pub fn add_all(&mut self, other: PageList) {}
    //to_index -> exclusive
    pub fn sub_list(&mut self, from_index: usize, to_index: usize) -> PageList {
        if from_index >= self.size() || self.is_empty() {
            return PageList::empty();
        }
        let to_index= core::cmp::min(to_index, self.size());
        let mut list = PageList::empty();
        let rest_tail = self.mut_iter().skip(from_index).take(1);
        for page_rec in rest_tail.next().into_iter() {
            page_rec.
        }
        for page_rec in rest_tail.next().into_iter()
        return PageList::empty();
    }
    pub fn mut_iter(&self) -> PageIterator {
        let front_pivot = self.header.map(|header| &header);
        let back_pivot = self.tail.map(|tail| &tail);
        PageIterator { front_pivot, back_pivot }
    }
    fn pull(&mut self, page: &PageRec)  { //-> PageRec {
        //self.lock();
        let prev = page.prev_entry();
        let next = page.next_entry();
        // if prev.is_some() {
        //     prev.unwrap().set_next(next);
        // } else {
        //     self.header = next.and_then()
        // }
        //
    }
    fn clear_pushed(page: &mut PageRec) {
        page.set_prev(None);
        page.set_next(None);
    }
    fn init_empty_list(&mut self, page: PageRec) {
        self.header = Some(page.copy());
        self.tail = Some(page);
    }
}

impl MemoryMapper {
    pub fn get_zone(zone: ZoneType) {}
}