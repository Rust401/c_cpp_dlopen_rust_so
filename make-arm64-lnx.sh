# remove all
cargo clean

#export RUSTFLAGS="-Z has_thread_local=false -Z tls-model=emulated"
# build .a
CC=$(pwd)/arm64-linux-clang.sh
CXX=$(pwd)/arm64-linux-clang++.sh

export RUSTFLAGS="-C linker=aarch64-linux-gnu-gcc"

CC=$CC CXX=$CXX cargo build --verbose --target aarch64-unknown-linux-gnu --release

$CXX -fno-emulated-tls -o test main.cpp -ldl
