#[macro_export]
macro_rules! impl_work {
    ($ty: ty,
     req: $req: ident, res: $res: ident, obj_kind: $kind: ident, slab: $slab: expr
     $(,
     args: [ $($field: ident : $field_ty: ty ),+ ]
     )?
     ) => {
        impl $ty {
            /// You should put object into the parent collections
            /// As droping this object will cause removing object from collection
            pub unsafe fn new_boxed(
                request: $req,
                parent: &$crate::object::Handle<$crate::user::queue::Queue<$ty>>,
                $( $($field: $field_ty,)+ )?
            ) -> Result<$crate::memory::SlabBox<Self>, $crate::memory::AllocError>
            {
                use $crate::object::ObjectContainer;

                let object = Self::new_object(parent);

                $crate::memory::slab_alloc(Self {
                    request: spin::Mutex::new(request.into()),
                    response: spin::Mutex::new(None),
                    object,
                  $( $($field,)+ )?
                })
            }

            pub fn take_request(&self) -> $req {
                self.request.try_lock().unwrap().take().expect("No request")
            }

            pub fn wait(&self) -> Option<$res> {
                use $crate::object::ObjectContainer;

                $crate::object::runtime::critical_section(self.handle(), |work| loop {
                    let mut lock = work.response.try_lock().unwrap();

                    if  let Some(res) = lock.take() {
                        return Some(res);
                    }

                    drop(lock);

                    if  $crate::object::runtime::block_on(work.handle()).is_err() {
                        return None;
                    }
                })
            }

            pub fn send_response(&self, response: $res) {
                use $crate::object::ObjectContainer;

                $crate::object::runtime::critical_section(self.handle(), move |work| {
                    let mut lock = self.response.try_lock().unwrap();
                    assert!(lock.is_none());

                    *lock = Some(response);

                    drop(lock);

                });
            }
        }

        impl $crate::object::ObjectContainer for $ty {
            const KIND: $crate::object::Kind = $crate::object::Kind::$kind;

            fn container_of(object: *mut $crate::object::Object) -> *mut Self {
                kernel_types::container_of!(object, $ty, object)
            }

            fn object(&self) -> &$crate::object::Object {
                &self.object
            }

            fn object_mut(&mut self) -> &mut $crate::object::Object {
                &mut self.object
            }
        }

        impl $crate::memory::Slab for $ty {
            const NAME: &str = $slab;
        }
    };
}

#[macro_export]
macro_rules! impl_container {
    ($ty: ty, obj_kind: $kind: ident, slab: $slab: expr) => {
        impl $crate::memory::Slab for $ty {
            const NAME: &str = $slab;
        }

        impl $crate::object::ObjectContainer for $ty {
            const KIND: $crate::object::Kind = $crate::object::Kind::$kind;

            fn container_of(object: *mut $crate::object::Object) -> *mut Self {
                kernel_types::container_of!(object, $ty, object)
            }

            fn object(&self) -> &$crate::object::Object {
                &self.object
            }

            fn object_mut(&mut self) -> &mut $crate::object::Object {
                &mut self.object
            }
        }
    };
}
