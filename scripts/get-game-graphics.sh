#!/bin/bash

# /Users/dmikalova/Library/Application Support/Steam/steamapps/common/Factorio/factorio.app/Contents/data/core/graphics
# /Users/dmikalova/Library/Application Support/Steam/steamapps/common/Factorio/factorio.app/Contents/data/base/graphics

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
REPO_DIR=$( cd -- "$SCRIPT_DIR/.." &> /dev/null && pwd )
BASE_DIR="$HOME/Library/Application Support/Steam/steamapps/common/Factorio/factorio.app/Contents/data/base/graphics"

rm -rf "$REPO_DIR/graphics"

mkdir -p "$REPO_DIR/graphics/icons"
cp "$BASE_DIR/icons/substation.png" "$REPO_DIR/graphics/icons/substation.png"
cp "$BASE_DIR/icons/roboport.png" "$REPO_DIR/graphics/icons/roboport.png"

mkdir -p "$REPO_DIR/graphics/technology"
cp "$BASE_DIR/technology/construction-robotics.png" "$REPO_DIR/graphics/technology/construction-robotics.png"
cp "$BASE_DIR/technology/electric-energy-distribution-2.png" "$REPO_DIR/graphics/technology/electric-energy-distribution-2.png"

