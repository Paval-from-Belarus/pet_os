use std::path::PathBuf;

fn main() {
    println!("cargo:rerun-if-changed=../scripts/kernel.ld");
    println!("cargo:rerun-if-changed=../target/drivers");

    let _out_dir = std::env::var("OUT_DIR").unwrap();

    let generated_content = if let Some(drivers) = option_env!("STATIC_DRIVERS")
    {
        let drivers_dir = std::env::var("DRIVERS_OUT")
            .expect("$DRIVERS_OUT path for drivers directory is not provided");

        let mut entries = vec![];
        for driver in drivers.split_whitespace() {
            let mut path = PathBuf::new();
            path.push(&drivers_dir);
            path.push(driver);

            let file_name =
                path.to_str().expect("Failed to use driver path as string");

            let entry = format!(
                r#"
                StaticDriver {{
                    offset: include_bytes!("{file_name}").as_ptr(),
                    len: include_bytes!("{file_name}").len(),
                }},
                "#,
            );

            entries.push(entry);
        }

        format!(
            r#"
            use super::StaticDriver;

            pub const STATIC_DRIVERS: [StaticDriver; {}] = [
            {}
            ];
            "#,
            entries.len(),
            entries.concat()
        )
    } else {
        println!("cargo::warning=Static Drivers are not provided");
        r#"
            use super::StaticDriver;

            pub const STATIC_DRIVERS: [StaticDriver; 0] = [];

        "#
        .to_string()
    };

    std::fs::write("src/drivers/generated.rs", generated_content).unwrap();
}
