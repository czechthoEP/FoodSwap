use actix_web::{get, Responder};

use crate::routes::logging;

#[get("/home")]
async fn home() -> impl Responder {
    logging("GET: home");
    let response: &str = "Welcome to Acticx";
    response
}
