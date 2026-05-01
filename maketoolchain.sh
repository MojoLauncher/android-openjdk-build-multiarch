#!/bin/bash
set -e

. setdevkitpath.sh

mkdir -p $NDK/generated-toolchains/android-${TARGET_SHORT}-toolchain
pushd $NDK/generated-toolchains/android-${TARGET_SHORT}-toolchain

if [[ "$TARGET_SHORT" == "arm" ]]; then
   export TOOLCHAIN_TAR=gcc-13-${TARGET_SHORT}-9.tar.xz
else
   export TOOLCHAIN_TAR=gcc-13-${TARGET_SHORT}-21.tar.xz
fi

wget -nc -nv https://github.com/MojoLauncher/gcc-toolchain/releases/download/prebuilt/$TOOLCHAIN_TAR
tar xf $TOOLCHAIN_TAR
rm $TOOLCHAIN_TAR

set +e
# I didn't pay enough attention :(
# Remove old libstdc++.so for gcc 4.9, to force the compiler into using the fresher one in aarch64-linux-android/lib64/
rm sysroot/usr/lib/libstdc++.a
rm sysroot/usr/lib/libstdc++.so
set -e

popd

cp devkit.info.${TARGET_SHORT} $NDK/generated-toolchains/android-${TARGET_SHORT}-toolchain/
