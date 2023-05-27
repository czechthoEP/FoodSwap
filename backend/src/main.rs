use actix_web::{App, HttpServer};

mod routes;
use routes::*;

mod database;
use database::*;

#[tokio::main]
async fn main() -> std::io::Result<()> {

    let database  = database_connection()
    .await
    .expect("Failed to connect to database");

    println!("Database connect is established");

    let server = HttpServer::new(move || {
        App::new()
        .app_data(database.clone())
        .service(home)
        .service(create_new_user)
    })
    .bind(("127.0.0.1", 8000))?
    .run();

    println!("Hello, world!");
    server.await
}
