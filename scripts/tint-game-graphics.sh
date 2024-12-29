#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
REPO_DIR=$( cd -- "$SCRIPT_DIR/.." &> /dev/null && pwd )

rm -rf "$REPO_DIR/substation-mk2/graphics"

mkdir -p "$REPO_DIR/substation-mk2/graphics/icons"
cp "$REPO_DIR/graphics/icons/substation.png" "$REPO_DIR/substation-mk2/graphics/icons/substation-mk2.png"
