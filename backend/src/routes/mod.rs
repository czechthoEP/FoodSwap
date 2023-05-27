pub mod user;
pub use user::*;

pub mod home;
pub use home::*;

fn logging(path: &str) {
    println!("{}", path);
}