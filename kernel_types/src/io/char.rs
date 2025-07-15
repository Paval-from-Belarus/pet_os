#[derive(Debug, Clone)]
pub struct CharModuleInfo {
    pub name: heapless::String<12>,
    pub ctx: *mut (),
}
