#![allow(unused)]
use super::queue::Queue;

pub struct Exchange<TX, RX>
where
    TX: 'static,
    RX: 'static,
{
    tx: Queue<TX>,
    rx: Queue<RX>,
}
