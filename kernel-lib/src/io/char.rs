pub use kernel_types::io::char::*;
use kernel_types::{
    io::{UserBuf, Error},
    object::{Handle},
    fs::File,
};

pub fn register_device(_device: Device) -> Result<(), ()> {
    todo!()
}

pub fn noop_write(_file: Handle<File>, _buf: UserBuf) -> Result<(), Error> {
    Ok(())
}

pub fn not_supported_write(
    _file: Handle<File>,
    _buf: UserBuf,
) -> Result<(), Error> {
    Err(Error::NotSupported)
}

// Нерешённые задачи:
//  1. Как вернуть ответ пользователю
//  2. Как предотвратить исполнение?
// Приходит какой-то request...
// Какой порядок обработки?
// Приходит запрос от пользователя. Этот запрос идёт в очередь для таски fs
// Как-то попадает в очередь для символьного устройства
//
//
// task: loop {
//      let Some(work) = queue.blocking_pop() else {
//          break;
//      };
//
//      match work {
//          FsWork::Open {..} => {
//              module_invoke!(pid, device.ops.open, node.into(), buf.into());
//          }
//
//          FsWork::Read {..} => {
//              module_invoke!(pid, device.ops.read, file.into(), buf.into());
//          }
//      }
// }
