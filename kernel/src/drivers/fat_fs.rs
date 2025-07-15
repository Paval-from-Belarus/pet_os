#![allow(unused)]
use alloc::{
    boxed::Box, collections::btree_map::BTreeMap, string::String, vec::Vec,
};
use kernel_types::{
    fs::{
        DirEntriesInfo, FileLookupResponse, FileSystem, FileSystemKind,
        FsRequest, FsResponse, SuperBlockInfo,
    },
    object::OpStatus,
};

use crate::{
    current_task,
    error::KernelError,
    fs::{self, FileLookupWork, FsWork, SuperBlock},
    memory::VirtualAddress,
    object::Handle,
    task,
    user::queue::Queue,
};

pub fn spawn_task() -> Result<(), KernelError> {
    let fs_info = FileSystem {
        name: "fat-fs".into(),
        kind: FileSystemKind::NORMAL,
    };

    let fs_id = fs::register_fs(fs_info)?;

    let queue = fs::fs_queue(fs_id).expect("Fs is created");

    let fs_task = task::new_task(
        fs_task,
        unsafe { queue.into_addr() as _ },
        task::TaskPriority::Module(2),
    )
    .expect("Failed to create fat-fs task");

    task::submit_task(fs_task);

    Ok(())
}

#[derive(Debug)]
pub enum Node {
    File(FatFile),
    Directory(BTreeMap<String, Node>), // Directories contain a map of name -> Node
}

pub struct Files {
    pub root: Node,
    pub next_id: usize,
}

impl Files {
    pub fn new() -> Self {
        Self {
            next_id: 0,
            root: Node::Directory(BTreeMap::new()),
        }
    }

    fn split_path<'a>(path: &'a str) -> (&'a str, &'a str) {
        if let Some(last_slash) = path.rfind('/') {
            let (parent, name) = path.split_at(last_slash);
            (parent, name.trim_start_matches('/'))
        } else {
            ("", path)
        }
    }

    fn get_dir_mut<'a>(
        &'a mut self,
        path: &str,
    ) -> Option<&'a mut BTreeMap<String, Node>> {
        if path.is_empty() {
            return match &mut self.root {
                Node::Directory(map) => Some(map),
                _ => None,
            };
        }

        let mut current = match &mut self.root {
            Node::Directory(map) => map,
            _ => return None,
        };

        let components: Vec<&str> =
            path.split('/').filter(|s| !s.is_empty()).collect();

        for (i, component) in components.iter().enumerate() {
            if i == components.len() - 1 {
                return match current.get_mut(*component) {
                    Some(Node::Directory(map)) => Some(map),
                    _ => None,
                };
            }
            current = match current.get_mut(*component) {
                Some(Node::Directory(map)) => map,
                _ => return None,
            };
        }

        None
    }

    pub fn create_file(&mut self, path: &str) -> Result<(), &'static str> {
        let (parent_path, name) = Self::split_path(path);

        if name.is_empty() {
            return Err("Invalid file name");
        }

        let id = self.next_id;
        self.next_id += 1;

        let parent = self
            .get_dir_mut(parent_path)
            .ok_or("Parent directory does not exist")?;

        if parent.contains_key(name) {
            self.next_id -= 1;
            return Err("File or directory already exists");
        }

        parent.insert(
            String::from(name),
            Node::File(FatFile {
                id,
                size: 0,
                data: Vec::new(),
            }),
        );

        Ok(())
    }

    // Create a directory at the given path
    pub fn create_dir(&mut self, path: &str) -> Result<(), &'static str> {
        let (parent_path, name) = Self::split_path(path);
        if name.is_empty() {
            return Err("Invalid directory name");
        }

        let parent = self
            .get_dir_mut(parent_path)
            .ok_or("Parent directory does not exist")?;

        if parent.contains_key(name) {
            return Err("File or directory already exists");
        }

        parent.insert(String::from(name), Node::Directory(BTreeMap::new()));
        Ok(())
    }

    // Delete a file or directory at the given path
    pub fn delete(&mut self, path: &str) -> Result<(), &'static str> {
        let (parent_path, name) = Self::split_path(path);
        if name.is_empty() {
            return Err("Invalid path");
        }

        let parent = self
            .get_dir_mut(parent_path)
            .ok_or("Parent directory does not exist")?;

        if parent.remove(name).is_none() {
            return Err("File or directory does not exist");
        }

        Ok(())
    }

    // List contents of a directory at the given path
    pub fn list_dir(&self, path: &str) -> Result<Vec<&str>, &'static str> {
        let mut current = match &self.root {
            Node::Directory(map) => map,
            _ => return Err("Not a directory"),
        };

        for component in path.split('/').filter(|s| !s.is_empty()) {
            current = match current.get(component) {
                Some(Node::Directory(map)) => map,
                _ => return Err("Not a directory"),
            };
        }

        Ok(current.keys().map(|s| s.as_str()).collect())
    }

    pub fn find<'a>(&'a self, path: &str) -> Option<&'a Node> {
        if path.is_empty() {
            return Some(&self.root);
        }

        // Get the directory map from the root
        let mut current = match &self.root {
            Node::Directory(map) => map,
            _ => return None,
        };

        // Split relative path into components
        let components: alloc::vec::Vec<&str> =
            path.split('/').filter(|s| !s.is_empty()).collect();

        // Traverse components
        for (i, component) in components.iter().enumerate() {
            let node = current.get(*component)?;
            if i == components.len() - 1 {
                // Last component: return the node (file or dir)
                return Some(node);
            }
            // Intermediate component: must be a directory
            current = match &node {
                Node::Directory(map) => map,
                _ => return None,
            };
        }

        None
    }
}

#[derive(Debug)]
pub struct FatFile {
    pub id: usize,
    pub size: usize,
    pub data: Vec<u8>,
}

extern "C" fn fs_task(arg: *const ()) {
    let queue = unsafe {
        Handle::<Queue<FsWork>>::from_addr_unchecked(arg as VirtualAddress)
    };

    log::debug!("fat-fs task#{} started", current_task!().id);

    loop {
        let Some(work) = queue.blocking_pop() else {
            break;
        };

        let request = work.take_request();

        match request {
            FsRequest::Mount { .. } => {
                let mut files = Box::new(Files::new());
                files.create_dir("/kernel").unwrap();
                files.create_dir("/dev").unwrap();
                files.create_file("/test.txt").unwrap();
                files.create_file("/kernel/io.sys").unwrap();

                let sb_info = SuperBlockInfo {
                    block_size: 512,
                    queue_size: 3,
                    context: Box::into_raw(files) as *const (),
                };

                work.send_response(sb_info.into());
            }
            FsRequest::Unmount { .. } => todo!(),
            FsRequest::FsQueue { queue } => {
                let msg = Box::new(InitMessage {
                    work,
                    queue: Handle::from_raw(queue),
                });

                let sb_task = task::new_task(
                    sb_task,
                    Box::into_raw(msg) as *const (),
                    task::TaskPriority::Module(4),
                )
                .expect("Failed to create sb task");

                task::submit_task(sb_task);
            }
        }
    }
}

#[repr(C)]
pub struct InitMessage {
    work: Handle<FsWork>,
    queue: Handle<Queue<FileLookupWork>>,
}

extern "C" fn sb_task(ptr: *const ()) {
    let raw_message = ptr as *mut InitMessage;

    let message: Box<InitMessage> = unsafe { Box::from_raw(raw_message) };

    let message = *message;

    message.work.send_response(FsResponse::Completed);

    log::debug!("fat sb task#{} is started", current_task!().id);

    let queue = message.queue;

    loop {
        let Some(work) = queue.blocking_pop() else {
            break;
        };

        match work.take_request() {
            kernel_types::fs::FileLookupRequest::LookupNode { sb, .. } => {
                let sb = Handle::<SuperBlock>::from_raw(sb);
                // let files = unsafe { &mut *(sb.ctx as *mut Files) };
                // files.find(&name)
                // files.create_file(path)
            }
            kernel_types::fs::FileLookupRequest::CreateFile { sb, name } => {
                let sb = Handle::<SuperBlock>::from_raw(sb);
                let files = unsafe { &mut *(sb.ctx as *mut Files) };
                if files.create_file(&name).is_err() {
                    work.send_response(OpStatus::InvalidResponse.into());
                } else {
                    work.send_response(FileLookupResponse::Completed);
                }
            }
            kernel_types::fs::FileLookupRequest::CreateDirectory {
                sb,
                name,
            } => {
                task::sleep(100_000);

                let sb = Handle::<SuperBlock>::from_raw(sb);
                let files = unsafe { &mut *(sb.ctx as *mut Files) };

                if files.create_dir(&name).is_err() {
                    work.send_response(OpStatus::NotFound.into());
                } else {
                    work.send_response(FileLookupResponse::Completed);
                }
            }
            kernel_types::fs::FileLookupRequest::FlushNode { .. } => {
                work.send_response(FileLookupResponse::Completed);
            }
            kernel_types::fs::FileLookupRequest::DestroyNode { .. } => todo!(),
            kernel_types::fs::FileLookupRequest::DirectoryEnries {
                sb,
                name,
            } => {
                let sb = Handle::<SuperBlock>::from_raw(sb);
                let files = unsafe { &mut *(sb.ctx as *mut Files) };
                if let Some(dir) = files.get_dir_mut(&name) {
                    let entries = dir.keys().cloned().collect();

                    work.send_response(DirEntriesInfo { entries }.into());
                } else {
                    work.send_response(OpStatus::NotFound.into());
                }
            }
        }
    }
}

extern "C" fn file_task(ptr: *const ()) {}
