#!/bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
REPO_DIR=$(cd -- "$SCRIPT_DIR/.." &>/dev/null && pwd)

rm -rf "$REPO_DIR/roboport-mk2/graphics"
mkdir -p "$REPO_DIR/roboport-mk2/graphics/icons"
cp "$REPO_DIR/graphics/icons/roboport.png" "$REPO_DIR/roboport-mk2/graphics/icons/roboport-mk2.png"
cp "$REPO_DIR/graphics/technology/construction-robotics.png" "$REPO_DIR/substation-mk2/graphics/technology/construction-robotics.png"


rm -rf "$REPO_DIR/substation-mk2/graphics"
mkdir -p "$REPO_DIR/substation-mk2/graphics/icons"
cp "$REPO_DIR/graphics/icons/substation.png" "$REPO_DIR/substation-mk2/graphics/icons/substation-mk2.png"
cp "$REPO_DIR/graphics/technology/electric-energy-distribution-2.png" "$REPO_DIR/substation-mk2/graphics/technology/electric-energy-distribution-2.png"

