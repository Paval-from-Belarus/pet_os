//consider to merge status and priority into single field
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
#[repr(u16)]
pub enum TaskPriority {
    Idle,
    User(u16),
    Module(u16),
    Kernel,
}

impl TaskPriority {
    pub fn into_raw(self) -> u16 {
        match self {
            TaskPriority::Idle => 0,
            TaskPriority::User(v) => v,
            TaskPriority::Module(v) => v,
            TaskPriority::Kernel => 31,
        }
    }

    pub fn static_duration(self) -> usize {
        match self {
            TaskPriority::Idle => 50,
            TaskPriority::User(level) => 100 + level as usize,
            TaskPriority::Module(level) => 150 + level as usize,
            TaskPriority::Kernel => 200,
        }
    }
}

impl core::fmt::Display for TaskPriority {
    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
        write!(f, "{self:?}")
    }
}

impl PartialOrd for TaskPriority {
    fn partial_cmp(&self, other: &Self) -> Option<core::cmp::Ordering> {
        Some(self.cmp(other))
    }
}

impl Ord for TaskPriority {
    fn cmp(&self, other: &Self) -> core::cmp::Ordering {
        self.into_raw().cmp(&other.into_raw())
    }
}
