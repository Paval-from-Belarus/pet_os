use crate::{
    fs::{File, IndexNode},
    object::Handle,
};

use super::op::{UserBuf, UserBufMut};

use crate::io::Error;

//same as file operations
pub struct Operations {
    pub open: fn(Handle<IndexNode>, Handle<File>),
    //performs read operation for file
    //blocks until not complete reading whole buffer
    pub read: fn(Handle<File>, UserBufMut) -> Result<(), Error>,
    //performs read operation for file
    pub write: fn(Handle<File>, UserBuf) -> Result<(), Error>,
}

pub struct Device {
    pub name: heapless::String<12>,
    pub ops: Operations,
}

//Когда реально необходимо вызывать
