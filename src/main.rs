use std::env::var;
use std::string::String;
use uzers::get_current_uid;
// TODO: 在命令执行前改变环境变量应该可以改变 chezmoi 的逻辑
// 现有的 hook.py 感觉不太优雅（也许应该写 shell 脚本（
fn main() {
    if get_current_uid() == 0 {}
    let _init = String::from("init");
    match var("HOME") {
        _init => println!("1"),
    }
}
