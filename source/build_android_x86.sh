#!/bin/bash
export TMPDIR=/tmp
NDK=~/Android/Sdk/ndk-bundle
SYSROOT=$NDK/platforms/android-21/arch-x86/
TOOLCHAIN=$NDK/toolchains/x86-4.9/prebuilt/linux-x86_64

CPU=x86
PREFIX=$(pwd)/android1/$CPU

function build_one
{
./configure \
  --prefix=$PREFIX \
  --enable-shared \
  --disable-static \
  --disable-doc \
  --disable-ffmpeg \
  --disable-ffplay \
  --disable-ffprobe \
  --disable-ffserver \
  --disable-doc \
  --disable-symver \
  --enable-small \
  --disable-yasm \
  --cross-prefix=$TOOLCHAIN/bin/i686-linux-android- \
  --target-os=android \
  --arch=x86 \
  --enable-cross-compile \
  --sysroot=$SYSROOT \
  --extra-cflags="-Os -fpic" \
    $ADDITIONAL_CONFIGURE_FLAG
    make clean
    make -j8
    make install
}

build_one
