default:
    @just --list

check:
    cargo check

build:
    cargo build --release

run:
    cargo run --release
