

@ECHO off
SET PWD=%CD%
SET VERSION="master"

IF NOT EXIST %PWD%\protobuf (

git clone --depth 1 https://github.com/google/protobuf -b %VERSION% protobuf --recursive || exit 666 /b


)
