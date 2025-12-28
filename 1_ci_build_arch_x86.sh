#!/bin/bash
set -e

if [[ $TARGET_VERSION -ge 25 ]]; then
   echo "Building on Java 25 or newer isn't supported for x86. Use x86_64"
   exit 0
fi

export TARGET=i686-linux-android
export TARGET_JDK=x86

bash 2_ci_build_global.sh

