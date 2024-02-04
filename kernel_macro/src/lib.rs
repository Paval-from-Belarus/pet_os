#![feature(let_chains)]
#![feature(proc_macro_diagnostic)]
extern crate proc_macro;
extern crate proc_macro2;


use proc_macro::TokenStream;

use proc_macro2::Span;
use quote::quote;
use syn::{Attribute, DeriveInput, Field, Ident, ItemFn, parse_macro_input, Type};

macro_rules! token_stream_error {
    ($pattern: expr $(, $($arg:tt)*)? ) => ({
       let span = proc_macro::Span::call_site();
       let message = format!($pattern, $($($arg)*)?);
       syn::Error::new(span.into(), message).to_compile_error().into()
    });
}
macro_rules! warning {
    ($pattern: expr $(, $($arg:tt)*)? ) => ({
        let message = format!($pattern, $($($arg)*)?);
        proc_macro::Diagnostic::new(proc_macro::Level::Warning, message).emit();
    });
}

// static entry: kernel_types::drivers::KernelSymbol = kernel_types::drivers::KernelSymbol {offset: }
#[proc_macro_attribute]
pub fn export_symbolic(_: TokenStream, item: TokenStream) -> TokenStream {
    let item = parse_macro_input!(item as ItemFn);
    let name = &item.sig.ident;
    let export_symbol = Ident::new(&format!("SYMTAB_{}", name), name.span());
    let entry_name = Ident::new(&format!("SYMTAB_{}_kernel_entry", name), name.span());
    let output = quote!(
        #[allow(
            non_upper_case_globals,
        )]
        const _: () = {
            union Transmute<T: Copy, U: Copy> {
                from: T,
                to: U,
            }
            const TN: &str = stringify!(#name);
            #[used]
            #[link_section = ".symbol_table_strings"]
            static #export_symbol: [u8; TN.as_bytes().len()] = unsafe {
                   *Transmute::<*const [u8; TN.as_bytes().len()], &[u8; TN.as_bytes().len()]> {
                      from: TN.as_ptr() as *const [u8; TN.as_bytes().len()],
                  }
                  .to
              };
            #[used]
            #[link_section = ".symbol_table"]
            static #entry_name: kernel_types::drivers::KernelSymbol = kernel_types::drivers::KernelSymbol::new(&#name, &#export_symbol);
        };
        #[no_mangle]
        #[allow(unused)] //it's possible that kernel api function is not used internally
        #item
    );
    output.into()
}

#[proc_macro_derive(ListNode, attributes(list_pivots, list_pivot))]
pub fn list_node(input: TokenStream) -> TokenStream {
    let struct_ast = parse_macro_input!(input as DeriveInput);
    let struct_info: syn::DataStruct = match struct_ast.data {
        syn::Data::Struct(data) => data,
        _ => return token_stream_error!("#[derive(ListNode)] can be used only under struct")
    };
    let struct_name = struct_ast.ident;
    match &struct_info.fields {
        syn::Fields::Unnamed(_) => warning!("Unnamed types are not supported #[derive(ListNode)] for {}", struct_name),
        syn::Fields::Unit => warning!("Unit types are not supported #[derive(ListNode)] for {}", struct_name ),
        syn::Fields::Named(_) => {} //macro process only named
    }
    let mut methods = Vec::<proc_macro2::TokenStream>::new();
    let mut traits = Vec::<proc_macro2::TokenStream>::new();
    for field in struct_info.fields {
        if let Some(definition) = extract_node_definition(field, &struct_name) {
            methods.push(definition.method);
            traits.push(definition.traits);
        }
    }
    TokenStream::from(quote! {
        #(#traits)*
        impl #struct_name {
            #(#methods)*
        }
    })
}

struct NodeDefinition {
    method: proc_macro2::TokenStream,
    ///additiona traits that should be implemented
    ///There are several marker traits can be implemented:
    ///All traits are marked as unsafe (to additionally warn the user doesn't implement such traits)
    ///1. DanglingData
    traits: proc_macro2::TokenStream,
}

fn extract_node_definition(field: Field, target_ident: &Ident) -> Option<NodeDefinition> {
    let node_attr = field.attrs.iter()
                         .find_map(ListNodeAttribute::try_new)?;
    let method = parse_access_method(field.clone());
    let traits = parse_markers_traits(field.clone(), &node_attr, target_ident);
    Some(NodeDefinition { method, traits })
}

//build the method to access the field
fn parse_access_method(field: Field) -> proc_macro2::TokenStream {
    let field_name = field.ident.expect("Named field expected!");
    let field_type = field.ty;
    let method_name = Ident::new(&format!("as_{}", field_name), field_name.span());
    quote! {
        pub fn #method_name(&mut self) -> &mut # field_type {
            &mut self.#field_name
        }
    }
}

fn parse_markers_traits(field: Field, node_attr: &ListNodeAttribute, target_ident: &Ident) -> proc_macro2::TokenStream {
    let meta_list_result = node_attr.attribute().meta.require_list();
    let mut markers = Vec::<Ident>::new();
    if let Ok(meta_list) = meta_list_result.map(Clone::clone) {
        for token in meta_list.tokens.into_iter() {
            if let proc_macro2::TokenTree::Ident(ident) = token {
                markers.push(ident);
            }
        }
    } else {
        //if meta-list is not specified, try to find pure path
        let path_result = node_attr.attribute().meta.require_path_only();
        if path_result.is_err() {
            return token_stream_error!("Invalid syntax for helper attribute. Should be #[list_pivots(<marker>)].\n There are several markers:\n\t - dangling");
        } //otherwise no markers are specified
    }
    let field_type_option = get_field_type(&field, node_attr)
        .and_then(|ty| map_type_to_ident(&ty));
    if field_type_option.is_none() {
        return token_stream_error!("Field doesn't have wrapper type. For example, ListNode<T> or TinyListNode<T>");
    }
    let field_type_ident = field_type_option.expect("Already checked");
    let mut traits = Vec::<proc_macro2::TokenStream>::new();
    for marker_ident in markers {
        let trait_ident = get_trait_name(&marker_ident);
        let marker_trait = quote! {
                    unsafe impl kernel_types::collections::#trait_ident for #field_type_ident {}
                };
        traits.push(marker_trait);
    }
    let node_data_marker = node_attr.define_marker(
        &field.ident.expect("Anonimouos fields are forbiddent"),
        target_ident,
        &field_type_ident,
    );
    quote! {
            #(#traits)*
            #node_data_marker
    }
}

fn define_node_data_marker(field: &Ident, target: &Ident, marker_type: &Ident) -> proc_macro2::TokenStream {
    let method_name = Ident::new(&format!("from_{}", field), Span::call_site());
    quote! {
        unsafe impl kernel_types::collections::ListNodeData for #marker_type {

            type Item = #target;
            fn from_node(node: &mut kernel_types::collections::ListNode<Self>) -> &mut Self::Item {
                let pointer = node as *mut kernel_types::collections::ListNode<Self>;
                let field_offset = core::mem::offset_of!(#target, #field);
                let struct_offset = unsafe { (pointer as *mut u8).sub(field_offset) };
                let value = unsafe { core::mem::transmute::<*mut u8, *mut #target>(struct_offset) };
                unsafe { &mut *value }
            }
        }
        impl #target {
            #[doc = "Prefer explicit type casting"]
            #[deprecated]
            pub fn #method_name(node: &mut kernel_types::collections::ListNode<#marker_type>) -> &mut Self {
                kernel_types::collections::ListNodeData::from_node(node)
            }
        }
    }
}

fn define_tiny_node_data_marker(field: &Ident, target: &Ident, marker_type: &Ident) -> proc_macro2::TokenStream {
    let method_name = Ident::new(&format!("from_{}", field), Span::call_site());
    quote! {
        unsafe impl kernel_types::collections::TinyListNodeData for #marker_type {
            type Item = #target;
            fn from_node(node: &mut kernel_types::collections::TinyListNode<Self>) -> &mut Self::Item {
                let pointer = node as *mut kernel_types::collections::TinyListNode<Self>;
                let field_offset = core::mem::offset_of!(#target, #field);
                let struct_offset = unsafe { (pointer as *mut u8).sub(field_offset) };
                let value = unsafe { core::mem::transmute::<*mut u8, *mut #target>(struct_offset) };
                unsafe { &mut *value }
            }
        }
        impl #target {
            #[doc = "Prefer explicit type casting"]
            #[deprecated]
            pub fn #method_name(node: &mut kernel_types::collections::TinyListNode<#marker_type>) -> &mut Self {
                kernel_types::collections::TinyListNodeData::from_node(node)
            }
        }
    }
}

//all fields that are marked as #[list_node]
fn get_field_type(field: &Field, node_attr: &ListNodeAttribute) -> Option<Type> {
    if let Type::Path(syn::TypePath { path, .. }) = &field.ty
        && let Some(segment) = path.segments.last()
        && node_attr.verify_wrapper(&segment.ident)
    {
        return parse_generic_type(&segment.arguments);
    }
    None
}

fn parse_generic_type(arguments: &syn::PathArguments) -> Option<Type> {
    if let syn::PathArguments::AngleBracketed(args) = arguments {
        if let Some(inner_type) = args.args.first() && let syn::GenericArgument::Type(inner_type) = inner_type {
            return Some(inner_type.clone());
        }
    }
    None
}

fn map_type_to_ident(ty: &Type) -> Option<Ident> {
    if let Type::Path(syn::TypePath { path, .. }) = ty
        && let Some(segment) = path.segments.last() {
        Some(segment.ident.clone())
    } else {
        None
    }
}

fn get_trait_name(marker_ident: &Ident) -> Option<Ident> {
    // kernel_types::collections::DanglingData
    if marker_ident.eq("dangling") {
        return Ident::new("DanglingData", marker_ident.span()).into();
    }
    None
}


type TokenStreamSupplier = fn(&Ident, &Ident, &Ident) -> proc_macro2::TokenStream;

struct ListNodeAttribute {
    attribyte: Option<syn::Attribute>,
    attr_name: &'static str,
    wrapper_name: &'static str,
    supplier: TokenStreamSupplier,
}

impl ListNodeAttribute {
    pub fn try_new(attr: &syn::Attribute) -> Option<Self> {
        for mut node_attr in Self::values() {
            if attr.path().is_ident(node_attr.attr_name) {
                node_attr.attribyte = Some(attr.clone());
                return Some(node_attr);
            }
        }
        None
    }
    pub fn verify_wrapper(&self, wrapper: &Ident) -> bool {
        wrapper == self.wrapper_name
    }
    pub fn attribute(&self) -> &Attribute {
        self.attribyte.as_ref().expect("The ListNode Attribute should be initialized before use!")
    }
    pub fn define_marker(&self, field: &Ident, target: &Ident, marker_type: &Ident) -> proc_macro2::TokenStream {
        let callable = &self.supplier;
        callable(field, target, marker_type)
    }
    unsafe fn new(attr_name: &'static str, wrapper_name: &'static str, supplier: TokenStreamSupplier) -> Self {
        Self { attr_name, supplier, wrapper_name, attribyte: None }
    }
    fn values() -> Vec<ListNodeAttribute> {
        unsafe {
            vec![ListNodeAttribute::new("list_pivots", "ListNode", define_node_data_marker),
                 ListNodeAttribute::new("list_pivot", "TinyListNode", define_tiny_node_data_marker)]
        }
    }
}
