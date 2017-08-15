#!/usr/bin/env bash

set -e

CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

THREADS="$(nproc --all)"
VERSION="master"
GIT_URL="https://github.com/google/protobuf"
DIR="protobuf"

HAS=1
[ ! -d "./$DIR" ] && HAS=0 && git clone $GIT_URL --depth 1 -b $VERSION $DIR --recursive
[ $HAS -eq 1 ] && cd $DIR && git pull origin $VERSION && cd ..

pushd $DIR
./autogen.sh
./configure --prefix=$CWD/inst
make clean
make -j$THREADS
make install
popd

echo "finished"
exit 0
