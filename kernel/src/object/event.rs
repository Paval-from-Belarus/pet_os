use crate::impl_container;

use super::Object;

pub struct Event {
    object: Object,
}

impl_container! {
    Event,
    obj_kind: Event,
    slab: "event"
}

//Each kernel object supports blocking functionality
//Queue:
//block_on -> waiting for the first element in queue
//notify -> data element was pushed
//
//Mutex:
//block_on -> block on locked mutex
//notify -> mutex will be released
//
//Exchange:
//block_on -> push task and waiting another task response
//notify -> another task has pushed response
//
//IoWork, FsWork or other work item:
//block_on -> waiting while work will be performed
//notify -> work is completed
//

// РНадо решить ещё один вопрос. Все ли реализации объектов должны
// быть ObjectContainer-ом... Что таким образом можно гарантировать?
// В чём проблема? Все Object-ы находятся находятся в массиве RUNTIME.
// Тогда используется &mut Object.
// Handle == *mut Object == *const Object
// Надо гарантировать, что только один объект
// Все объекты где-то хранятся...
// В чём вопрос. Я хочу заблокироваться
