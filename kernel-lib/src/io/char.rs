pub use kernel_types::io::char::*;
use kernel_types::syscall;

pub fn register_module(device: CharModuleInfo) -> syscall::Result<()> {
    unsafe {
        syscall! {
            syscall::Request::RegCharDevice,
            edx: &device
        }
    }
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
