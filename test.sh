#! /usr/bin/env bash

# Always ensure proper path
cd "$(dirname "$0")" || exit

ROOT_DIR="${PWD}" && export ROOT_DIR
TEST_SYS_GCC=false && export TEST_SYS_GCC
# shellcheck source=./scripts/setup.sh
source "$ROOT_DIR/scripts/setup.sh"

MAKE="make -C ${ROOT_DIR}/makes/ M=${BUILD_DIR}"

ARCHIVE_NAME=$(${MAKE} --no-print-directory print-pkg)
if [ ! -f "$ROOT_DIR/output/$ARCHIVE_NAME" ]; then
    echo "[ERR] $ARCHIVE_NAME not found in output directory"
    exit 1
fi

pushd /tmp/
mkdir -p toolchain
pushd toolchain
tar xf "$ROOT_DIR/output/$ARCHIVE_NAME"
cd "${TOOLCHAIN_NAME}"
cat << EOF > hello.c
#include <stdio.h>
int main() {
    puts("Hello World");
    return 0;
}
EOF
cat << EOF > hello.cpp
#include <iostream>
int main() {
    std::cout << "Hello World" << std::endl;
    return 0;
}
EOF
"./bin/${TARGET_PREFIX}gcc" hello.c -o a.out || exit
file a.out
"./bin/${TARGET_PREFIX}g++" hello.cpp -o a.out || exit
file a.out

# Test sanitizer linkage
"./bin/${TARGET_PREFIX}gcc" hello.c -o a.out -fsanitize=undefined || exit

popd
rm -r toolchain
popd
