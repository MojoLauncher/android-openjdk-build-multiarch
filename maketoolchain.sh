#!/bin/bash
set -e

. setdevkitpath.sh

mkdir -p $NDK/generated-toolchains/android-${TARGET_SHORT}-toolchain
pushd $NDK/generated-toolchains/android-${TARGET_SHORT}-toolchain

wget https://github.com/MojoLauncher/gcc-toolchain/releases/download/prebuilt/gcc-13-${TARGET_SHORT}-21.tar.xz
tar xf gcc-13-${TARGET_SHORT}-21.tar.xz
rm gcc-13-${TARGET_SHORT}-21.tar.xz

set +e
# I didn't pay enough attention :(
# Remove old libstdc++.so for gcc 4.9, to force the compiler into using the fresher one in aarch64-linux-android/lib64/
rm sysroot/usr/lib/libstdc++.a
rm sysroot/usr/lib/libstdc++.so
set -e

popd

cp devkit.info.${TARGET_SHORT} $NDK/generated-toolchains/android-${TARGET_SHORT}-toolchain/
