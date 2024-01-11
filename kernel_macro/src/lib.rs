extern crate proc_macro;

use proc_macro::{TokenStream};
use quote::quote;
use syn::{parse_macro_input, ItemFn, Ident};

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
