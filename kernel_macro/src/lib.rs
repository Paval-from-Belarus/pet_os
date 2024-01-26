#![feature(let_chains)]
extern crate proc_macro;
extern crate proc_macro2;


use proc_macro::TokenStream;

use quote::quote;
use syn::{Attribute, Data, DeriveInput, Expr, ExprTuple, Field, Fields, Ident, ItemFn, parse_macro_input, Type};
use crate::ListNodeType::{DoublyLinked, SinglyLinked};

// static entry: kernel_types::drivers::KernelSymbol = kernel_types::drivers::KernelSymbol {offset: }
#[proc_macro_attribute]
pub fn export_symbolic(_: TokenStream, item: TokenStream) -> TokenStream {
    let item = parse_macro_input!(item as ItemFn);
    let name = &item.sig.ident;
    let export_symbol = Ident::new(&format!("SYMTAB_{}", name), name.span());
    let entry_name = Ident::new(&format!("SYMTAB_{}_kernel_entry", name), name.span());
    let output = quote!(
        #[allow(unused, non_upper_case_globals)]
        #[link_section = "symbol_table_strings"]
        static #export_symbol: &str = stringify!(#name);
         #[allow(unused, non_upper_case_globals)]
        #[link_section = "symbol_table"]
        static #entry_name: kernel_types::drivers::KernelSymbol = kernel_types::drivers::KernelSymbol::new(&#name, #export_symbol);
        #[no_mangle]
        #[allow(unused)] //it's possible that kernel api function is not used internally
        #item
    );
    output.into()
}
macro_rules! token_stream_error {
    ($message: expr) => ({
       let span = proc_macro::Span::call_site();
       syn::Error::new(span.into(), $message).to_compile_error().into()
    });
}
#[proc_macro_derive(ListNode, attributes(list_pivots, list_pivot))]
pub fn list_node(input: TokenStream) -> TokenStream {
    let struct_info = parse_macro_input!(input as DeriveInput);
    let fields = match struct_info.data {
        Data::Struct(data) => match data.fields {
            Fields::Named(fields) => fields.named,
            _ => {
                return token_stream_error!("#[derive(ListNode])] can only be used with struct with named fiedls");
            }
        }
        _ => {
            return token_stream_error!("#[derive(ListNode)] should only be used with struct");
        }
    };
    let struct_name = struct_info.ident;
    let mut methods = Vec::new();
    let mut traits = Vec::new();
    for field in fields {
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
    traits: proc_macro2::TokenStream,
}

///There are several marker traits can be implemented:
///All traits are marked as unsafe (to additionally warn the user doesn't implement such traits)
///1. DanglingData
fn extract_node_definition(field: Field, target_ident: &Ident) -> Option<NodeDefinition> {
    let node_attr = field.attrs.iter()
                         .find_map(ListNodeAttribute::try_new)?;
    let method = parse_access_method(field.clone());
    let traits = parse_markers_traits(field.clone(), &node_attr, target_ident);
    Some(NodeDefinition { method, traits })
}

//build the method to access the field
fn parse_access_method(field: Field) -> proc_macro2::TokenStream {
    let field_name = field.ident.expect("The only nammed fields are available in ListNode");
    let field_type = field.ty;
    let method_name = Ident::new(&format!("as_{}", field_name), field_name.span());
    quote! {
        pub fn #method_name(&mut self) -> &mut # field_type {
            &mut self.#field_name
        }
    }
}

fn parse_markers_traits(field: Field, node_attr: &ListNodeAttribute, target_ident: &Ident) -> proc_macro2::TokenStream {
    let markers: ExprTuple = match node_attr.attribyte().parse_args() {
        Ok(array) => array,
        Err(errors) => {
            return token_stream_error!(format!("Parsing errors! {errors}"));
        }
    };
    let marker_ident_option = get_marker_type(&field)
        .and_then(|ty| map_type_to_ident(&ty));
    if marker_ident_option.is_none() {
        return token_stream_error!("Field doesn't have marker type in format ListNode<T>");
    }
    let marker_ident = marker_ident_option.expect("Already checked");
    let mut traits = Vec::new();
    for marker_expr in markers.elems {
        if let Expr::Path(path) = marker_expr {
            if let Some(ident) = path.path.get_ident() {
                let trait_ident = get_trait_name(ident);
                let marker_trait = quote! {
                    unsafe impl kernel_types::collections::#trait_ident for #marker_ident {}
                };
                traits.push(marker_trait);
            } else {
                return token_stream_error!("No identificator found in list_node attribute");
            }
        } else {
            return token_stream_error!("Invalid token in field attribute");
        }
    }
    let list_node_marker = define_node_data_marker(
        &field.ident.expect("Anonimouos field are forbiddent"),
        target_ident,
        &marker_ident,
    );
    quote! {
            #(#traits)*
            #list_node_marker
    }
}

fn define_node_data_marker(field: &Ident, target: &Ident, marker_type: &Ident) -> proc_macro2::TokenStream {
    quote! {
        unsafe impl kernel_types::collections::ListNodeData for #marker_type {

            type Item = #target;
            fn from(node: core::ptr::NonNull<kernel_types::collections::ListNode<Self>>) -> core::ptr::NonNull<Self::Item> {
                let pointer = node.as_ptr();
                let field_offset = core::mem::offset_of!(#target, #field);
                let struct_offset = unsafe { (pointer as *mut u8).sub(field_offset) };
                let value = unsafe { core::mem::transmute::<*mut u8, *mut #target>(struct_offset) };
                unsafe { core::ptr::NonNull::new_unchecked(value) }
            }
        }
    }
}


//all fields that are marked as #[list_node]
fn get_marker_type(field: &Field) -> Option<Type> {
    if let Type::Path(syn::TypePath { path, .. }) = &field.ty
        && let Some(segment) = path.segments.last()
        && segment.ident == "ListNode"
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

enum ListNodeType {
    DoublyLinked,
    SinglyLinked,
}

struct ListNodeAttribute {
    attribyte: Option<syn::Attribute>,
    attr_name: &'static str,
    marker: &'static str,
    ty: ListNodeType,
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
    pub fn attribyte(&self) -> &Attribute {
        self.attribyte.as_ref().expect("The ListNode Attribute should be initialized before use!")
    }
    unsafe fn new(ty: ListNodeType, field: &'static str, marker: &'static str) -> Self {
        Self { ty, attr_name: field, marker, attribyte: None }
    }
    fn values() -> Vec<ListNodeAttribute> {
        unsafe {
            vec![ListNodeAttribute::new(DoublyLinked, "list_pivots", "ListNodeData"),
                 ListNodeAttribute::new(SinglyLinked, "list_pivot", "TinyListNodeData")]
        }
    }
}
