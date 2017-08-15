#!/usr/bin/env bash

set -e

CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

[ -z "$(which cmake)" ] && echo "cmake is required to build singa" && exit 1;
[ -z "$(which mkn)" ]   && echo "mkn is required to build singa" && exit 1;

VERSION="master"
if [ ! -d "./protobuf" ]; then
    git clone --depth 1 https://github.com/google/protobuf -b $VERSION protobuf --recursive
    pushd protobuf
    ./autogen.sh
    ./configure --prefix=$CWD/inst
    make -J$THREADS
    make install
fi

echo "finished"
exit 0
