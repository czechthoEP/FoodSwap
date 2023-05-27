use sqlx::MySqlPool;

pub async fn database_connection() -> Result<MySqlPool, sqlx::Error> {
    MySqlPool::connect("mysql://root:root_pw@127.0.0.1:3306/food_swap_db").await
}