#!/bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
REPO_DIR=$(cd -- "$SCRIPT_DIR/.." &>/dev/null && pwd)
MOD_DIR="$HOME/Library/Application Support/factorio/mods"

# rm -rf "$MOD_DIR/mklv"*

# ln -s "$REPO_DIR/mklv-lib" "$MOD_DIR/mklv-lib"

# ln -s "$REPO_DIR/radar-mk2" "$MOD_DIR/mklv-radar-mk2"
rm -rf "$MOD_DIR/mklv-roboport-mk2"
ln -s "$REPO_DIR/roboport-mk2" "$MOD_DIR/mklv-roboport-mk2"
# ln -s "$REPO_DIR/substation-mk2" "$MOD_DIR/mklv-substation-mk2"
# ln -s "$REPO_DIR/utility-station-mk2" "$MOD_DIR/mklv-utility-station-mk2"
# ln -s "$REPO_DIR/utility-station" "$MOD_DIR/mklv-utility-station"

# ln -s "$REPO_DIR/modern-art-lib" "$MOD_DIR/mklv-modern-art-lib"
# ln -s "$REPO_DIR/modern-art-mangione" "$MOD_DIR/mklv-modern-art-mangione"
# ln -s "$REPO_DIR/modern-art-potted-plants" "$MOD_DIR/mklv-modern-art-potted-plants"
# ln -s "$REPO_DIR/modern-art-steven-universe" "$MOD_DIR/mklv-modern-art-steven-universe"

rm -rf "$MOD_DIR/mklv-invasive-soils"
ln -s "$REPO_DIR/invasive-soils" "$MOD_DIR/mklv-invasive-soils"
# ln -s "$REPO_DIR/exclusive-soil-placement" "$MOD_DIR/mklv-exclusive-soil-placement"
