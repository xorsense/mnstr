#[macro_use]
extern crate rocket;

use nanoid::nanoid;
use rocket::fs::FileServer;
use rocket::response::content::RawHtml;
use rocket::{get, routes};
use std::env;
use std::fs::{create_dir, File, read_dir};
use std::io::Write;
use std::path::Path;

#[get("/")]
fn hello() -> String {
    String::from("Hello, fellow mnstr!")
}

#[get("/<shortcode>")]
fn retrieve(shortcode: &str) -> RawHtml<String> {
    RawHtml(format!(
        r#"
    <html>
        <head>
            <title>mnstr {}</title>
        </head>
        <body>
            <h1>Welcome, mnstr!</h1>
            <img alt='mnstr image' src='/assets/{}.png' />
        </body>
    </html>
    "#,
        shortcode, shortcode
    ))
}

#[post("/", data = "<bytes>")]
async fn store(bytes: &[u8]) -> String {
    let path_base = env!("MNSTR_STRG");
    let shortcode = nanoid!(6);
    let path = Path::new(path_base)
        .join(format!("{}.png", shortcode));
    let mut f = File::create(path).unwrap();
    f.write_all(bytes).unwrap();
    shortcode
}

#[shuttle_runtime::main]
async fn main() -> shuttle_rocket::ShuttleRocket {
    let path_base = env!("MNSTR_STRG");
    match read_dir(path_base) {
        Ok(_dir) => {},
        Err(_err) => {
            create_dir(path_base).unwrap()
        }
    }
    let rocket = rocket::build()
        .mount("/", routes![hello, retrieve, store])
        .mount("/assets/", FileServer::from(path_base));

    Ok(rocket.into())
}
