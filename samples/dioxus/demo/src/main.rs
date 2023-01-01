// main.rs

use dioxus::prelude::*;

fn main() {
    dioxus::web::launch(app);
}

fn app(cx: Scope) -> Element {
    cx.render(rsx!{
        div { "👋 hello, wasm! 💜" }
    })
}
