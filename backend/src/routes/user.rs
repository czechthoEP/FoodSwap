use actix_web::HttpResponse;
use actix_web::web::Json;
use actix_web::{web::Data, post, Responder};

use serde::{Serialize, Deserialize};
use sqlx::FromRow;
//use sqlx::Error;
use sqlx::MySqlPool;
/* 
#[derive(Serialize, Deserialize)]
pub struct CreateNewUser {
    title: String,
    desciption: Option<String>,
}
*/

#[derive(Serialize)]
pub struct TypeDbError {
    error: String,
}

#[derive(Serialize, Deserialize, FromRow)]
pub struct CreateNewUser {
    firstName: String,
    lastName: String,
    email: String,
    street: String,
    streetNr: String,
    city: String,
    password: String
}

#[post("/user/create")]
pub async fn create_new_user(db: Data<MySqlPool>, body: Json<CreateNewUser>) -> impl Responder {
    let response= sqlx::query(
        "INSERT INTO User(firstName, lastName, email, street, streetNr, city, password) values (?,?,?,?,?,?,?)"
    ).bind(&body.firstName)
    .bind(&body.lastName)
    .bind(&body.email)
    .bind(&body.street)
    .bind(&body.streetNr)
    .bind(&body.city)
    .bind(&body.password)
    .execute(&**db)
    .await;
match response {
    Ok(_) => HttpResponse::Ok(),
    Err(_) => HttpResponse::InternalServerError(),
}
}



/*
#[post("/todo/title/update")]
pub async fn update_user(body: Json<UserStrukt>, db:Data<MySqlPool>) -> impl Responder {
    let response = sqlx::query("UPDATE todos SET title =? WHERE id =?"
    ).bind(&body.title)
    .bind(&body.id)
    .execute(&**db)
    .await;

    match response {
        Ok(_) => HttpResponse::Ok(),
        Err(_) => HttpResponse::InternalServerError(),
    }
}

#[derive(Deserialize)]
pub struct Id {
    id:i32
}

#[post("/todo/mark/completed")]
pub async fn mark_todo_completed(id: Json<Id>, db:Data<MySqlPool>) -> impl Responder {
    let response = sqlx::query("UPDATE todos SET status =? WHERE id =?"
    ).bind("Completed")
    .bind(&id.id)
    .execute(&**db)
    .await;

match response {
    Ok(_) => HttpResponse::Ok(),
    Err(_) => HttpResponse::InternalServerError(),
}
}


#[get("/todos/all")]
pub async fn get_all_todos(db: Data<MySqlPool>) -> impl Responder {
    let res: Result<Vec<Todo>, Error> = sqlx::query_as(
        "SELECT id, title, description, status 
         FROM todos",
    )
    .fetch_all(&**db)
    .await;
    match res {
        Ok(todos) => HttpResponse::Ok().json(todos),
        Err(_e) => HttpResponse::InternalServerError().json(TypeDbError {
            error: _e.to_string(),
        }),
    }
}

#[delete("/todo/delete")]
pub async fn delete_a_todo(db: Data<MySqlPool>, id: Json<Id>) -> impl Responder {
    let response = sqlx::query("DELETE FROM todos WHERE id =?"
    )
    .bind(&id.id)
    .execute(&**db)
    .await;

    match response {
        Ok(_) => HttpResponse::Ok(),
        Err(_) => HttpResponse::InternalServerError(),
    }
}
 */