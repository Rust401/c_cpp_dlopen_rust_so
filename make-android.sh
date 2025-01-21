# remove all
cargo clean

# build .a
# cargo build --release

#export RUSTFLAGS="-Z has_thread_local=true -Z tls-model=global-dynamic"

# Hack NDK to make rust happy
NDK_BIN=$NDK/toolchains/llvm/prebuilt/linux-x86_64/bin
ln -s $NDK_BIN/aarch64-linux-android31-clang $NDK_BIN/aarch64-linux-android-clang || true
ln -s $NDK_BIN/aarch64-linux-android31-clang++ $NDK_BIN/aarch64-linux-android-clang++ || true

export RUSTFLAGS="-C linker=$NDK_BIN/aarch64-linux-android-clang"

PATH=$NDK_BIN:$PATH cargo build --verbose --release --target aarch64-linux-android

cp ./target/aarch64-linux-android/release/libdylib_hello.so .

# build binary
echo "build an bin"
$NDK_BIN/aarch64-linux-android-clang++ -fno-emulated-tls -o test main.cpp -ldl

# Hack NDK to make rust happy
rm $NDK_BIN/aarch64-linux-android-clang $NDK_BIN/aarch64-linux-android-clang++ || true

