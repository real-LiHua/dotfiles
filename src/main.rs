use std::env::var;
use std::string::String;
use uzers::get_current_uid;
fn main() {
    if get_current_uid() == 0 {
    }
    let _init = String::from("init");
    match var("HOME") {
        _init => println!("1"),
    }
}

