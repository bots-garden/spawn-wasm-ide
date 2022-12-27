# Rust experiments

## Demo (hello world)

```bash
cargo new --bin demo
cd demo
# rm -rf .git
cargo run
```

## Refs

- 👀 https://blog.ediri.io/learn-rust-in-under-10-mins

## Spin

```bash
spin templates list
spin templates install --git https://github.com/fermyon/spin
spin new
cd <name-of-the-project>
# rustup target add wasm32-wasi
spin build
spin up --listen 192.168.64.48:8888 # use the IP of the VM
```
