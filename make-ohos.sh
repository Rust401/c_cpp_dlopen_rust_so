# remove all
cargo clean

# build .a
# cargo build --release
export RUSTFLAGS="-Z has_thread_local=true -Z tls-model=local-dynamic"

CC=$(pwd)/oh_sdk/aarch64-unknown-linux-ohos-clang.sh
CXX=$(pwd)/oh_sdk/aarch64-unknown-linux-ohos-clang++.sh

#export RUSTFLAGS="-C target-feature=-emutls"
#export RUSTFLAGS="-C llvm-args=-disable-emulated-tls"
#export RUSTFLAGS="-C llvm-args=-fno-emulated-tls"
#export RUSTFLAGS="-C link-args=-fno-emulated-tls"
#export RUSTFLAGS="-C link-args=-Wl,-plugin-opt=-emulated-tls=0"

export RUSTFLAGS="-C linker=${CC}"

CC=$CC CXX=$CXX cargo build --verbose --release --target aarch64-unknown-linux-ohos

#cp ./target/aarch64-unknown-linux-ohos/cxxbridge/rust_to_cpp/src/lib.rs.cc rs.cpp

cp ./target/aarch64-unknown-linux-ohos/release/libdylib_hello.so .

# build .bin
$CXX -o test main.cpp -ldl -lpthread
