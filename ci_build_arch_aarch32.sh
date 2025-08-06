#!/bin/bash
set -e

export TARGET=armv7a-linux-androideabi21
export TARGET_JDK=arm

bash ci_build_global.sh

