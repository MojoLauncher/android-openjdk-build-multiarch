#!/bin/bash
set -e

. setdevkitpath.sh

mkdir -p $NDK/generated-toolchains/android-${TARGET_SHORT}-toolchain
pushd $NDK/generated-toolchains/android-${TARGET_SHORT}-toolchain

wget https://github.com/MojoLauncher/gcc-toolchain/releases/download/prebuilt/gcc-13-${TARGET_SHORT}-21.tar.xz
tar xf gcc-13-${TARGET_SHORT}-21.tar.xz
rm gcc-13-${TARGET_SHORT}-21.tar.xz

popd

cp devkit.info.${TARGET_SHORT} $NDK/generated-toolchains/android-${TARGET_SHORT}-toolchain/
