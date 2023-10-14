#[macro_use]
extern crate rocket;

use nanoid::nanoid;
use rocket::fs::FileServer;
use rocket::response::content::RawHtml;
use rocket::{get, Response, Request, routes};
use std::env;
use std::fs::{create_dir, File, read_dir};
use std::io::Write;
use std::path::Path;
use rocket::fairing::{Fairing, Info, Kind};
use rocket::http::Header;

struct CORS;

#[rocket::async_trait]
impl Fairing for CORS {
    fn info(&self) -> Info {
        Info {
            name: "Add CORS headers to Response",
            kind: Kind::Response,
        }
    }

    async fn on_response<'r>(&self, _request: &'r Request<'_>, response: &mut Response<'r>) {
        response.set_header(Header::new("Access-Control-Allow-Origin", "*"));
        response.set_header(Header::new("Access-Control-Allow-Methods", "POST, GET, PUT, DELETE, PATCH, OPTIONS"));
        response.set_header(Header::new("Access-Control-Allow-Headers", "*"));
        response.set_header(Header::new("Access-Control-Allow-Credentials", "true"));
    }
}

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

#[post("/", data = "<upload>")]
fn store(upload: Vec<u8>) -> String {
    let path_base = env!("MNSTR_STRG");
    let shortcode = nanoid!(6);
    let path = Path::new(path_base)
        .join(format!("{}.png", shortcode));
    let mut f = File::create(path).unwrap();
    f.write_all(upload.as_slice()).unwrap();
    shortcode
}

#[rocket::launch]
fn rocket() -> _ {
    let path_base = env!("MNSTR_STRG");
    match read_dir(path_base) {
        Ok(_dir) => {},
        Err(_err) => {
            create_dir(path_base).unwrap()
        }
    }
    rocket::build()
        .attach(CORS)
        .mount("/", routes![hello, retrieve, store])
        .mount("/assets/", FileServer::from(path_base))
}
