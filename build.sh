#!/bin/sh

SRC_DIR="src"
DATA_DIR="data"
BIN_DIR="bin"
GAME="ninja"

checkDir() {
    if [ ! -d "$1" ]; then
        mkdir "$1"
    fi
}

mv "$DATA_DIR" "$SRC_DIR"
cd "$SRC_DIR"

EXECUTABLE="${GAME}.love"

zip -r "$EXECUTABLE" *

mv "$DATA_DIR" ../

cd ../

checkDir "$BIN_DIR"

mv "${SRC_DIR}/${EXECUTABLE}" "$BIN_DIR"
