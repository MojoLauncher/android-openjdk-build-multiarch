#!/bin/bash
set -e

. setdevkitpath.sh

if [[ "TARGET_JDK" == "aarch64" ]]; then

mkdir $NDK/generated-toolchains/android-${TARGET_SHORT}-toolchain
pushd $NDK/generated-toolchains/android-${TARGET_SHORT}-toolchain

wget https://github.com/MojoLauncher/gcc-toolchain/releases/download/prebuilt/gcc-13-arm64-21.tar.xz
tar xf gcc-13-arm64-21.tar.xz
rm gcc-13-arm64-21.tar.xz

popd

else
  
$NDK/build/tools/make-standalone-toolchain.sh \
	--arch=${TARGET_SHORT} \
	--platform=android-21 \
	--install-dir=$NDK/generated-toolchains/android-${TARGET_SHORT}-toolchain

fi
cp devkit.info.${TARGET_SHORT} $NDK/generated-toolchains/android-${TARGET_SHORT}-toolchain/
