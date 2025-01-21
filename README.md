# rust_cpp_dlopen_crash_bug

### 1. for **android platfrom** (ohos is the same)

download ndk first
[ndk-r25c](https://dl.google.com/android/repository/android-ndk-r25c-linux.zip)

unzip to some path
```
unzip android-ndk-r25c-linux.zip
```

configure path
```
export NDK=/path/to/your/ndk
```
then build
```shell
sh make-android.sh
```
then push `libdylib_hello.so` and `test` to your devices via `adb`

```
adb push libdylib_hello.so /data/local
adb push test /data/local
adb shell "chmod 777 /data/local/test"
```
then run on the device

```
adb shell
/data/local/test
```
