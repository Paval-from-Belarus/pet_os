#[macro_export]
macro_rules! impl_work {
    ($ty: ty,
     req: $req: ident, res: $res: ident, obj_kind: $kind: ident, slab: $slab: expr
     $(,
     args: [ $($field: ident : $field_ty: ty ),+ ]
     )?
     ) => {
        impl $ty {
            pub fn new_boxed(
                request: $req,
                parent: &$crate::object::Handle<$crate::user::queue::Queue<$ty>>,
                $( $($field: $field_ty,)+ )?
            ) -> Result<$crate::memory::SlabBox<Self>, $crate::memory::AllocError>
            {
                use $crate::object::ObjectContainer;

                let object = Self::new_object(parent);

                $crate::memory::slab_alloc(Self {
                    request,
                    response: None,
                    object,
                  $( $($field,)+ )?
                })
            }

            pub fn wait(&self) -> Option<$res> {
                todo!()
            }

            pub fn send_response(self, response: $res) {

                todo!()
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
