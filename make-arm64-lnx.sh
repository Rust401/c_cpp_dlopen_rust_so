# remove all
cargo clean

#export RUSTFLAGS="-Z has_thread_local=false -Z tls-model=emulated"

export RUSTFLAGS="-C linker=aarch64-linux-gnu-gcc"

cargo build --verbose --target aarch64-unknown-linux-gnu --release

clang++ -target aarch64-linux-gnu -fno-emulated-tls -o test main.cpp -ldl
