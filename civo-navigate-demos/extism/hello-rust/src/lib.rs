#![no_main]

use extism_pdk::*;
use serde::Serialize;

#[derive(Serialize)]
struct Output {
    pub message: String,
    pub input: String,
}

#[plugin_fn]
pub fn hello_world(input: String) -> FnResult<Json<Output>> {
    
    let output = Output { message: "👋 Hello World 🌍 from 🦀".to_string(), input };
    Ok(Json(output))
}
