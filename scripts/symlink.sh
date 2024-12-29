#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
REPO_DIR=$( cd -- "$SCRIPT_DIR/.." &> /dev/null && pwd )
MOD_DIR="$HOME/Library/Application Support/factorio/mods"

rm -rf "$MOD_DIR/mklv*"

ln -s "$REPO_DIR/mklv-lib" "$MOD_DIR/mklv-lib"
ln -s "$REPO_DIR/quality-train-wagons" "$MOD_DIR/mklv-quality-train-wagons"
# ln -s "$REPO_DIR/quality-nuclear-cells" "$MOD_DIR/mklv-quality-nuclear-cells"
ln -s "$REPO_DIR/substation-mk2" "$MOD_DIR/mklv-substation-mk2"
