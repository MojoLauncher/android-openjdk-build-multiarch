#!/bin/bash
set -e

export TARGET=armv7a-linux-androideabi21
export TARGET_JDK=arm
export NDK_PREBUILT_ARCH=/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/arm-linux-androideabi/bin/strip

bash ci_build_global.sh

