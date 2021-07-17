#!/bin/bash

set -e

SRC_DIR=$(readlink -f $(dirname $0)/..)
echo SRC_DIR=$SRC_DIR

#DEBIAN_PKG_NAME=portaudio-mingw
VERSION=${1:-19.600}
BUILD_VERSION=${2:-3.os}

BUILD_DIR=`pwd`/build

mkdir -p $BUILD_DIR
pushd $BUILD_DIR
rm -rf *

cp -r $SRC_DIR/* ./

dch -v $VERSION-$BUILD_VERSION -b "Automatic build"
dpkg-buildpackage -us -uc

popd

