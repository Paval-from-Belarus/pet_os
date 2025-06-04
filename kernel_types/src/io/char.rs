use crate::{
    fs::{File, IndexNode},
    object::Handle,
};

use super::op::{UserBuf, UserBufMut};

use crate::io::Error;

//same as file operations
#[derive(Debug, Clone)]
pub struct Operations {
    pub open: fn(Handle<IndexNode>, Handle<File>),
    //performs read operation for file
    //blocks until not complete reading whole buffer
    pub read: fn(Handle<File>, UserBufMut) -> Result<(), Error>,
    //performs read operation for file
    pub write: fn(Handle<File>, UserBuf) -> Result<(), Error>,
}

#[derive(Debug, Clone)]
pub struct CharDeviceInfo {
    pub name: heapless::String<12>,
    pub ops: Operations,
}

//Когда реально необходимо вызывать
